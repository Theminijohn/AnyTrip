$(document).ready(function () { 
	// Datepicker
	$('.datepicker').datepicker({
	  format: "dd-mm-yyyy",
	  autoclose: true,
	  todayHighlight: true
	})

	$(".chosen-select").chosen({
		allow_single_deselect: true,
    no_results_text: 'No Airline matched',
    placeholder_text_single: 'Select an Airline',
    width: '100%'
	});
})