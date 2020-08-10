const scrollDown = () => {
	if($("#messages")[0] != undefined){
		$("#messages").scrollTop($("#messages")[0].scrollHeight)
	}
	// if($("#messages").length > 0) {
	// }
}

export { scrollDown }