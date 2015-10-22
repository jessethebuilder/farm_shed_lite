function addAssociatedFields(selector, association, content){
	var new_id = new Date().getTime();
	var regex = new RegExp("new_" + association, "g");
	$(selector).prepend(content.replace(regex, new_id));
}






