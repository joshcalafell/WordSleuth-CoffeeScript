if Meteor.isServer
  
  Meteor.startup ->
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

  ###
    Server side methods, called by the Meteor.call(), or Meteor.apply()
    methods from the client.
  ###

  Meteor.methods
    
    # Find anagrams
    findAnagrams: (word, dictionaryIndex) ->
  
      console.log "find combinations called."
      
      Anagrams.remove {}
      Combos.remove {}

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

    findSubwords: (word, dictionaryIndex) ->
      
      console.log "Find sub-words called."

      Subwords.remove {}
      
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
        
        #console.log "First word: " + first_word

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

          #console.log "Second word: " + second_word

          whole_word = "" +first_word + second_word + ""
            .replace(/[^A-Za-z]/g, '')
            .split('')
            .sort()
            .join('')

          #console.log "Whole word is \"" + whole_word + "\""

          # Two arrays
          word_array = whole_word.split('').sort().join('')
          #console.log "\"word_array\": " + word_array

          user_word = word.toLowerCase().split('').sort().join('')
          #console.log "\"user_word\": " + user_word


          if word_array == user_word
            console.log "match found, now what???"
            console.log "\" potential_combos[i] " + potential_combos[i]
            console.log "\" potential_combos[j] " + potential_combos[j]
            Combos.insert
              word_1: potential_combos[i]
              word_2: potential_combos[j]
              swapped: false
          else
            #console.log "match not found, now what???"


          #console.log "Got to here... j++ ->"
          j++
        
        #console.log "Got to here... i++ ->"
        i++
      return

    findCombinations: (word) ->

      return
     

    resetPage: ->
      console.log "resetPage called - received on server side..."
      Anagrams.remove {}
      Subwords.remove {}
      Combos.remove {}
      console.log "Anagrams, Subwords, and Combinations db items removed"
      return

#EOF
