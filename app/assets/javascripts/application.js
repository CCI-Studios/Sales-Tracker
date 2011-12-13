/*
 *= require jquery
 *= require jquery_ujs
 *= require_self
 *= require_tree .
 */

jQuery.ajaxSetup({
	'beforeSend': function (xhr) { xhr.setRequestHeader('Accept', 'text/javascript'); }
});

jQuery.fn.submitWithAjax = function () {
	this.submit(function () {
		$.post(this.action, $(this).serialize(), null, 'script');
		return false;
	});
	
	return this;
};

$(document).ready(function () {
	$('#new_sale_item').submitWithAjax();
});