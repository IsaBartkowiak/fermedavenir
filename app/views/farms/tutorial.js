<% notice = @farm.tutorial ? "activés" : "désactivés" %>
$('.toggle-carrot').toggleClass('disabled');
if( $('.toggle-carrot').hasClass('disabled')){
	$('.toggle-carrot p').html('Aide désactivée<br/><i>Cliquez pour l\'activer</i>');
} else {
	$('.toggle-carrot p').html('Aide activée<br/><i>Cliquez pour la désactiver</i>');
}