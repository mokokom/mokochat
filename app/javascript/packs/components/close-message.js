const closeMessage = () => {
	$('.message .close')
  .on('click', function() {
    $(this)
      .closest('.message')
      .transition('fade')
    ;
  });
}

export { closeMessage }