#= require jquery
#= require jquery_ujs
#= require bootstrap
#= require_tree .

Animation = 
  init: ->
    $('.btn_back-top').click @scrollTop
    $('.helper-close').click @hideHelper
    return
  scrollTop: ->
    $('html, body').animate { scrollTop: 0 }, 'slow'
    return
  hideHelper: ->
    $('.helper').addClass('is-hidden')
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

Portion=  
  init: ->
    for item, i in $('.panier-item')
      id = item.data('portion')
      console.log id
    
    #$('.panier-dispo--add').click @groupPortion
    return

 groupPortion: ->
    console.log 'test'
    return

Table =
  init: ->
    if $('.fixed-table-header').length 
      $(document).scroll @checkTableHeaderScroll
      $('.fixed-table-header').scroll @checkFixedHeaderScrollLeft
      $('.fixed-table-wrapper table tr th:first-child').css('min-width', $('.main-table tr th:first-child').outerWidth())
      $('.fixed-table-wrapper .dynamic-width').css('min-width', $('.main-table .dynamic-width').outerWidth())
    return

  checkTableHeaderScroll: ->
    if $(window).scrollTop() > $('.fixed-table-header').offset().top
      $('.fixed-table-wrapper').fadeIn()
    else
      $('.fixed-table-wrapper').fadeOut()
    return

  checkFixedHeaderScrollLeft: ->
    $('.fixed-table-wrapper').scrollLeft( $('.fixed-table-header').scrollLeft() )
    return

FooterPosition = 
  init: ->
    if $('body').outerHeight() < window.innerHeight
      $('body').css('height', window.innerHeight)
      $('footer.footer').addClass('fixed-bottom')
    return

$(document).ready ->
  Animation.init()
  ChangeView.init()
  Panier.init()
  Table.init()
  Portion.init()
  FooterPosition.init()
  return
