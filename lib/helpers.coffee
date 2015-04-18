### 
# File: helpers.js
# Author: @rabbitfighter81
# Purpose: helpers for templates (handlebars stuff and otherwise that
# are used often). 
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
  * Helpers for subwords
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
      Subwords.find().count()

  ###
  * Helpers for anagrams
  ###

  Template.anagrams.helpers
    
    userInput: ->
      Session.get 'userInput'
    
    all_anagram_items: ->
      Anagrams.find().fetch()

    anagramCount: ->
      Anagrams.find().count()

  ###
  * Helpers for header
  ###

  Template.header.helpers time: ->
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
      y = moment().format('YYYY')
      copyright = 'Copyright © ' + y + ' rabbitfighter.net'
      console.log 'Copyright string was querried'
      copyright

