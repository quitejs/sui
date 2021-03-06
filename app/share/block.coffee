json = JSON
require 'quite'
require './Hash'
window.Ls = 
  setItem: (name, item) ->
    item = json.stringify item
    localStorage.setItem name, item
  getItem: (name) ->
    item = localStorage.getItem name
    json.parse item
require './bus'
require './lit'
Ls = localStorage
blocks = [
  'links'
]

shows = P.div('shows')
for block in blocks
  show = require "pages/#{block}/show"
  funcs = _.functions show
  for func in funcs
    piece = show[func]()
    piece.addClass 'clear'
    shows.C piece
# headbar = require 'pages/common/headbar/show'
# page = require 'pages/common/page/show'
#
# show = P.div('show').C(
#   headbar
#   page
# )
window.onload = ->
  $('body').append shows.elmt
