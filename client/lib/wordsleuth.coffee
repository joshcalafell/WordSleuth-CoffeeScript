###
* File: wordsleuth.coffee
* Author: @rabbitfighter81
* Purpose: Client side code. This is where the spice flows...
###

if Meteor.isClient
  
  # Startup stuff
  Meteor.startup ->
    getTime()
    return
  
  # Update every 10 seconds.
  Meteor.setInterval (->
    getTime()
    return
  ), 10000
  
  ###******** Session variable defaults ********###

  Session.setDefault 'dictionaryIndex', 0
  Session.setDefault 'dictionaryName', "Scrabble(TM) Condensed (8-letter max)"
  Session.setDefault 'combo_not_swapped', true;

  ###********* Events *********###

  Template.dictArea.events 'click button': ->
    
    input = document.getElementById('input')
    word = input.value.replace(/[^A-Za-z]/g, '').toLowerCase()

    msg = 
        "Although '" + word + "' may be a word, or make one, it's unlikely that there's an anagram, and probably a lot more words that you can make, therefore, for our server's sake, we limit searches to 16 characters. \n\n-Admin :)"

    if word.length > 16
      alert msg
      Session.set 'userInput', ""
    else
      Session.set 'userInput', word
      
    Session.set 'inputString', String('Your word is "' + word + '"')
    Meteor.call 'findAnagrams', word, Session.get('dictionaryIndex')
    Meteor.call 'findSubwords', word, Session.get('dictionaryIndex')
    Meteor.call 'findCombinations'

    return

  ###********* Functions *********###

  getTime = ->
    d = moment().format('MMM Do YYYY h:mm A')
    Session.set 'dateval', d
    console.log Session.get('dateval')
    return

  resetPage = ->
    Meteor.call 'resetPage'
    console.log "resetPage called"
    return

# EOF