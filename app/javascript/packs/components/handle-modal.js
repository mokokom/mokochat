const handleModal = () => {
	$('.modal-create-btn').on("click", ()=> {$('.ui.basic.modal.create').modal('show')})
	$('.modal-edit-btn').on("click", ()=> {$('.ui.basic.modal.edit').modal('show')})
}

export { handleModal }