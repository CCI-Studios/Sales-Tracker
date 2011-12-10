/* make list draggable */
$(function () {
	$('.tabs').tabs();
})

$(function () {
	$('.draggable').draggable({
		//revert: 'invalid',
		helper: 'clone',
		cursor: 'move',
		cursorAt: { left: -20, bottom: 20 }
	});
});


/* Droppable Grid */
$(function() {
	$('.form_grid .cell').droppable({
		//accept: 'draggable',
		hoverClass: 'active',
		drop: function (event, props) {
			$(this).html(props.draggable);
		}
	});	
});