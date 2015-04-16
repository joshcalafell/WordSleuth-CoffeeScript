###
* File: dictionaries.js
* Author: @rabbitfighter81
* Purpose: Javascrit for dictionary templates
###

if Meteor.isClient
  # Dictionary array
  dictionaryNames = [
    'Scrabble(TM) Condensed (8-letter max)'
    'Scrabble(TM) Full'
    'Merriam Webster\'s (single word)'
    'Merriam Webster\'s (compund word)'
    'Unix words'
    'Carnegie Melon Words'
  ]

  dictionaries = [
    'merriam_single_word'
    'merriam_compound_words'
    'scrabble_condensed'
    'scrabble_full'
    'unix_words'
    'carnegie_melon_words'
  ]

  ###
  * Dictionary template helpers
  ###

  Template.scrabbleCondensed.events 'click #button-scrabble-condensed': ->
    Session.set 'dictionaryIndex', 0
    Session.set 'dictionaryName', dictionaryNames[0]
    Meteor.call 'resetPage'
    # Set a timeout to make it transition better
    setTimeout 'Router.go(\'/\')', 1000
    return

  Template.scrabbleFull.events 'click #button-scrabble-full': ->
    Session.set 'dictionaryIndex', 1
    Session.set 'dictionaryName', dictionaryNames[1]
    Meteor.call 'resetPage'
    # Set a ti/dictionaries/merriamSinglemeout to make it transition better
    setTimeout 'Router.go(\'/\')', 1000
    return

  Template.merriamSingle.events 'click #button-merriam-single': ->
    Session.set 'dictionaryIndex', 2
    Session.set 'dictionaryName', dictionaryNames[2]
    Meteor.call 'resetPage'
    # Set a timeout to make it transition better
    setTimeout 'Router.go(\'/\')', 1000
    return

  Template.merriamCompound.events 'click #button-merriam-compound': ->
    Session.set 'dictionaryIndex', 3
    Session.set 'dictionaryName', dictionaryNames[3]
    Meteor.call 'resetPage'
    # Set a timeout to make it transition better
    setTimeout 'Router.go(\'/\')', 1000
    return

  Template.unixWords.events 'click #button-unix-words': ->
    Session.set 'dictionaryIndex', 4
    Session.set 'dictionaryName', dictionaryNames[4]
    Meteor.call 'resetPage'
    # Set a timeout to make it transition better
    setTimeout 'Router.go(\'/\')', 1000
    return

  Template.carnegieWords.events 'click #button-carnegie-words': ->
    Session.set 'dictionaryIndex', 5
    Session.set 'dictionaryName', dictionaryNames[5]
    Meteor.call 'resetPage'
    # Set a timeout to make it transition better
    setTimeout 'Router.go(\'/\')', 1000
    return

#EOF