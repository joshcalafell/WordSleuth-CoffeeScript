if Meteor.isServer

  TESTING = true;

  Meteor.settings.contactForm = emailTo: 'rabbitfighter81@gmail.com'
  
  Meteor.startup ->
    
    # This is my mailgun info. 
    # Mailgun is a free email server (10,000 limit)
    process.env.MAIL_URL = 'smtp://postmaster%40wordsleuth.meteor.com:be3362b85c64212d4fc016cf7eab8bb3@smtp.mailgun.org:587'

    console.log "Meteor server started"
    Anagrams.remove {}
    Subwords.remove {}
    Combos.remove {}
    console.log "Anagrams, Subwords, and Combinations db items removed"
    return
  
  # Get a handle for the dictionaries in an array form
  dictionaries = [
    Assets.getText('dictionaries/scrabble_condensed.txt')
    Assets.getText('dictionaries/scrabble_full.txt')
    Assets.getText('dictionaries/merriam_single_words.txt')
    Assets.getText('dictionaries/merriam_compound_words.txt')
  ]

  ### Meteor server-side methods ###
  Meteor.methods
    
    #-- Find anagrams --#
    findAnagrams: (word, dictionaryIndex) ->
  
      if TESTING
        console.log "findAnagrams() called from client."
      
      Anagrams.remove {}
      if TESTING
        console.log "Anagrams collection removed from Mongo DB"

      dict = dictionaries[dictionaryIndex].toString().split('\n')
      word = word.toLowerCase()
      sortedWord = word.split('').sort().join('')

      i = 0
      while i < dict.length
        dictWord = dict[i].toLowerCase()
        sortedDictWord = dictWord.split('').sort().join('')
       
        if sortedWord == sortedDictWord and word != dictWord
          if i > 0
            lastWord = dict[i - 1].toLowerCase()
            if lastWord != dictWord
              Anagrams.insert anagram: dictWord
        
        # At this point, all anagrams are found...
        i++
      return

    #-- Find Subwords --#
    findSubwords: (word, dictionaryIndex) ->
      
      if TESTING
        console.log "findSubwords() called from client."

      Subwords.remove {}
      Combos.remove {}

      if TESTING
        console.log "Subwords, Combos collections removed from Mongo DB"

      # For the potential combinations, for later...
      potential_combos = []

      match_count = 0
      dict = dictionaries[dictionaryIndex].toString().split('\n')

      i = 0
      while i < dict.length
       
        if dict[i].toString().match(/\d+/g)
          i++ #break the loop and continue...
       
        user_word = word.toLowerCase().split('').sort()
        
        dict_word = dict[i].toString()
          .replace(/[^A-Za-z]/g, '')
          .toLowerCase().split('')
          .sort()
       
        temp_word = []
       
        j = 0
        while j < dict_word.length
          k = 0
          while k < user_word.length
            if dict_word[j] == user_word[k]
              temp_word.push dict_word[j]
              user_word[k] = '?'
              j++
              # This took ages to realize...	
            k++
          j++

        match = false
        
        if temp_word.length == dict_word.length
          j = 0
          while j < temp_word.length
            if temp_word[j] == dict_word[j]
              match = true
            else
              match = false
            j++

        
        # If match then insert the item into the database
        if match
          if i > 0
            lastWord = dict[i - 1].toLowerCase()
            if lastWord != dict[i].toLowerCase()
              Subwords.insert
                index: match_count
                subword: dict[i]
                length: dict[i].length
              
              # Add to potential combos
              potential_combos.push dict[i]
              if TESTING
                console.log "\"" + dict[i] + "\" added to potential combos."
            match_count++
        
        i++

      first_word = ""
      second_word = ""
      whole_word = ""
      i = 0
      while i < potential_combos.length
        first_word = potential_combos[i]
          .toString()
          .replace(/[^A-Za-z]/g, '')
          .toLowerCase().split('')
          .sort()
          .join('')

        #At this point, we have a sorted array of letters for the dict word.
        j = 0
        while j < potential_combos.length
          second_word = potential_combos[j]
            .toString()
            .replace(/[^A-Za-z]/g, '')
            .toLowerCase()
            .split('')
            .sort()
            .join('')

          whole_word = "" +first_word + second_word + ""
            .replace(/[^A-Za-z]/g, '')
            .split('')
            .sort()
            .join('')

          # Two arrays
          word_array = whole_word.split('').sort().join('')
          user_word = word.toLowerCase().split('').sort().join('')

          if word_array == user_word
            if TESTING
              console.log "match found:"
              console.log "potential_combos[" + i + "] " + potential_combos[i]
              console.log "potential_combos[" + j + "] " + potential_combos[j]
            Combos.insert
              word_1: potential_combos[i]
              word_2: potential_combos[j]
              swapped: false
          else
            if TESTING
              console.log "match not found, now what???"

          j++
        
        i++
      return

    #-- Reset page --#
    resetPage: ->
      if TESTING
        console.log "resetPage called from client -> received on server side..."
      Anagrams.remove {}
      Subwords.remove {}
      Combos.remove {}
      if TESTING
        console.log "All MongoDB items removed"
      return

#EOF
