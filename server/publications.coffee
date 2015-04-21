###
# File: publications.js
# Author: @rabbitfighter81
# Purpose: publications for meteor project
# Meteor publications
###

Meteor.publish 'word', ->
  Word.find()
Meteor.publish 'dictionary', ->
  Dictionary.find()
Meteor.publish 'anagrams', ->
  Anagrams.find()
Meteor.publish 'subwords', ->
  Subwords.find()
Meteor.publish 'combinations', ->
  Combinations.find()