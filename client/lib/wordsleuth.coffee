if Meteor.isClient
  
  Meteor.startup ->
    getTime()
    return
  
  # Update every 10 seconds.
  Meteor.setInterval (->
    getTime()
    return
  ), 10000
  

  ###
  # Session variable defaults
  ###

  Session.setDefault 'dictionaryIndex', 0
  Session.setDefault 'dictionaryName', "Scrabble(TM) Condensed (8-letter max)"

  ###********* Events *********###

  Template.dictArea.events 'click button': ->
    input = document.getElementById('input')
    word = input.value.replace(/[^A-Za-z]/g, '').toLowerCase()

    if word.length > 16
      msg = 
        "Although '" + word + "' may be a word, or make one, it's unlikely that there's an anagram, and probably a lot more words that you can make, therefore, for our server's sake, we limit searches to 16 characters. \n\n-Admin :)"
      alert msg
      Session.set 'userInput', ""
    else
      Session.set 'userInput', word
      
    Session.set 'inputString', String('Your word is "' + word + '"')
    Meteor.call 'findAnagrams', word, Session.get('dictionaryIndex')
    Meteor.call 'findSubwords', word, Session.get('dictionaryIndex')
    return



  ###********* Functions *********###

  getTime = ->
    d = moment().format('MMM Do YYYY h:mm A')
    Session.set 'dateval', d
    console.log Session.get('dateval')
    return

# EOF