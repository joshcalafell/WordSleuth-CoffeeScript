###
# File: router.js
# Author: @rabbitfighter81
# Purpose: Router configuration
###

# Router config template
Router.configure layoutTemplate: 'layout'

# Routes
Router.map ->
  @route 'wordsleuth', path: '/'
  @route 'about', path: 'about'
  @route 'merriamSingle', path: 'dictionaries/merriamSingle'
  @route 'merriamCompound', path: 'dictionaries/merriamCompound'
  @route 'scrabbleCondensed', path: 'dictionaries/scrabbleCondensed'
  @route 'scrabbleFull', path: 'dictionaries/scrabbleFull'
  @route 'unixWords', path: 'dictionaries/unixWords'
  @route 'carnegieWords', path: 'dictionaries/carnegieWords'
  return

