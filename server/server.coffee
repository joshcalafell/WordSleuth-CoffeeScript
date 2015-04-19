if Meteor.isServer
  
  Meteor.startup ->
    Anagrams.remove {}
    Subwords.remove {}
    return
  
  # Get a handle for the dictionaries in an array form
  dictionaries = [
    Assets.getText('dictionaries/scrabble_condensed.txt')
    Assets.getText('dictionaries/scrabble_full.txt')
    Assets.getText('dictionaries/merriam_single_words.txt')
    Assets.getText('dictionaries/merriam_compound_words.txt')
    Assets.getText('dictionaries/unix_words.txt')
    Assets.getText('dictionaries/carnegie_melon_words.txt')
  ]

  ###
    Server side methods, called by the Meteor.call(), or Meteor.apply()
    methods from the client.
  ###

  Meteor.methods
    
    findAnagrams: (word, dictionaryIndex) ->
      
      Anagrams.remove {}
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
      
      Subwords.remove {}
      
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
            match_count++
        
        i++

      return

    resetPage: ->
      console.log "resetPage called - received on server side..."
      Anagrams.remove {}
      Subwords.remove {}
      return

#EOF
