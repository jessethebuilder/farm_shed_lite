function addAssociatedFields(selector, association, content){
	var new_id = new Date().getTime();
	var regex = new RegExp("new_" + association, "g");
	$(selector).prepend(content.replace(regex, new_id));
}

function updateSelectFromSelect(primary_select, secondary_select, data_attribute){
	// data_attribute is the data attribute that you associate with the values in the primary select
	$(primary_select).on('change', function(){
		$(secondary_select).html('').append($('option[data-' + data_attribute + '="' + $(this).val() + '"]').clone());
	});
	
	$(secondary_select).html('').append($('option[data-' + data_attribute + '="' + $(primary_select).val() + '"]').clone());
}




