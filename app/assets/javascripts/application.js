// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require bootstrap
//= require_tree .
var Animation = {
	init: function() {
		$('.btn_back-top').click(this.scrollTop);
	},

	scrollTop: function() {
		$("html, body").animate({ scrollTop: 0 }, "slow");
	}
}

var ChangeView = {
	init: function(){
		$(document).on('click', ".change-view", this.animate);
	},
	animate: function(){
		$('.list-paniers').toggleClass('overview');
	}
}

var Panier = {
	qte: 0,
	url: '',

	init: function() {
		$(document).on('change','.paniers-qty', this.updateQty);
	},

	updateQty: function() {
		Panier.qte = $(this).val();
		Panier.url = $(this).data('url');

		Panier.update();
	},

	update: function() {
		$.ajax({
		  url: this.url,
		  method: "PATCH",
		  data: { panier: {quantity : this.qte} },
		  dataType: "script"
		});
	}
}

$(document).ready(function() {
	Animation.init();
	ChangeView.init();
	Panier.init();
})