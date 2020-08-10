const toggleActive = () => {
	$(".item").on("click", function(){
		$('.item.active').removeClass('active');
		$(this).addClass('active');
	})
}

export { toggleActive }