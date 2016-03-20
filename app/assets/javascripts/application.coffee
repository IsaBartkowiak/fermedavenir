#= require jquery
#= require jquery_ujs
#= require bootstrap
#= require_tree .

Animation = 
  init: ->
    $('.btn_back-top').click @scrollTop
    return
  scrollTop: ->
    $('html, body').animate { scrollTop: 0 }, 'slow'
    return

ChangeView = 
  init: ->
    $(document).on 'click', '.change-view', @animate
    return
  animate: ->
    $('.list-paniers').toggleClass 'overview'
    return

Panier = 
  qte: 0
  url: ''

  init: ->
    $(document).on 'change', '.paniers-qty', @updateQty
    return

  updateQty: ->
    Panier.qte = $(this).val()
    Panier.url = $(this).data('url')
    Panier.update()
    return
    
  update: ->
    $.ajax
      url: @url
      method: 'PATCH'
      data: panier: quantity: @qte
      dataType: 'script'
    return

$(document).ready ->
  Animation.init()
  ChangeView.init()
  Panier.init()
  return
