### 
# File: helpers.js
# Author: @rabbitfighter81
# Purpose: helpers for templates (handlebars stuff and otherwise 
# stuff that's used often). 
###

if Meteor.isClient

  ###
  # Helpers for wordlseuth template
  ###

  Template.wordsleuth.helpers
    dictionaryName: ->
      Session.get 'dictionaryName'
    dictionaryIndex: ->
      Session.get 'dictionaryIndex'
    userInput: ->
      Session.get 'userInput'

  Template.dictArea.helpers
    dictionaryName: ->
      Session.get 'dictionaryName'
    dictionaryIndex: ->
      Session.get 'dictionaryIndex'
    userInput: ->
      Session.get 'userInput'
    

  ###
  * Helpers for subwords template
  ###

  Template.subwords.helpers
    
    userInput: ->
      Session.get 'userInput'
    
    all_subword_items_length_1: ->
      Subwords.find(length: 1).fetch()
    
    all_subword_items_length_2: ->
      Subwords.find(length: 2).fetch()
    
    all_subword_items_length_3: ->
      Subwords.find(length: 3).fetch()
    
    all_subword_items_length_4: ->
      Subwords.find(length: 4).fetch()
    
    all_subword_items_length_5: ->
      Subwords.find(length: 5).fetch()
    
    all_subword_items_length_6: ->
      Subwords.find(length: 6).fetch()
    
    all_subword_items_length_7: ->
      Subwords.find(length: 7).fetch()
    
    all_subword_items_length_8_up: ->
      Subwords.find( length: $gte: 8 ).fetch()

    subwordCount: ->
      console.log "Subwords count querried." 
      Subwords.find().count()

  ###
  * Helpers for anagrams template
  ###

  Template.anagrams.helpers
    
    userInput: ->
      console.log "User input querried."
      Session.get 'userInput'
    
    all_anagram_items: ->
      console.log "Anagram database querried."
      Anagrams.find().fetch()

    anagramCount: ->
      console.log "Anagram count querried."
      Anagrams.find().count()

  ###
  * Helpers for combinations template
  ###

  Template.combinations.helpers

    userInput: ->
      console.log "User input querried."
      Session.get 'userInput'


    all_combo_items: ->
      console.log "Combination database querried."
      Combos.find().fetch()

    combosCount: ->
      console.log "Combinations count querried."
      Combos.find().count()



  ###
  # Helpers for header template
  ###

  Template.header.helpers 

    time: ->
      console.log "Time querried"
      Session.get 'dateval'

  ###
  # Helpers for footer template
  ###

  Template.footer.helpers
    
    date: ->
      console.log 'Date function was querried'
      'Today is ' + moment().format('MMM Do YYYY') + '...'
    
    copyright: ->
      # From 'moment' package. See 'smart.json'
      console.log "Copyright was querried."
      y = moment().format('YYYY')
      copyright = 'Copyright © ' + y + ' rabbitfighter.net'
      console.log 'Copyright string was querried'
      copyright

