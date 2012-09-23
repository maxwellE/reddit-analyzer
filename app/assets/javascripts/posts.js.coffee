# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$ ->
  $('.expandable').jTruncate
    length: 65,  
    minTrail: 0,  
    moreText: "[see all]",  
    lessText: "[hide extra]",  
    ellipsisText: " ...",  
    moreAni: "fast",  
    lessAni: 50  
