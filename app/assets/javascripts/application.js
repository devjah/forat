// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require foundation
//= require_tree .


$(document).ready( function() {

	// $('.vote').on('mouseenter', function() {
	// 	$(this).text('Votează!')
	// });

	// $('.vote').on('mouseleave', function() {
	// 	$(this).text("Voturi: " + $(this).data('votes'))
	// });

	// $('.vote').on('click', function() {
	// 	$(this).data('votes', $(this).data('votes') + 1)
	// 	$(this).text("VOTAT (" + $(this).data('votes') + ")")
	// 	$(this).removeClass('btn-default')
	// 	$(this).addClass('')
	// 	$(this).addClass('disabled')
	// });


	// $('.unvote').on('mouseenter', function() {
	// 	$(this).text('Renunta la vot!')
	// });

	// $('.unvote').on('mouseleave', function() {
	// 	$(this).text("Voturi: " + $(this).data('votes'))
	// });


	// $('.del').on('click', function(){
	// 	$(this).closest('.voter').fadeTo("slow" , 0.3)
	// })

	$('.vote').one('click', function() {
		$(this).addClass('voted').removeClass('vote').html('<i class="fa fa-thumbs-up"></i> Liked!')
		$(this).parent().find('.counter').text(parseInt($(this).parent().find('.counter').text()) + 1)
	});

});



$(function(){ $(document).foundation(); });
