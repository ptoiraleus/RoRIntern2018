$(function() {
	$('.new-comment').on('ajax:send', function() {
		$('.comments').append('<img class="loader" style="height: 50px;" src="https://i.redd.it/ounq1mw5kdxy.gif"/>');
	})
	.on('ajax:complete', function() {
		$('.loader').remove();
	});
});
