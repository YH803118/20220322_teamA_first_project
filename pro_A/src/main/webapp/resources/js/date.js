/**
 * 
 */
$(document).ready(function(){
	const today = new Date();
	var year = today.getFullYear();
	var month = convert(today.getMonth()+1);
	var date = convert(today.getDate());
	
	var fullDate = year+"-"+month+"-"+date;
	
	function convert(num){
		if(num <10){
			return '0'+num;
		}
		return num;
	}
	
	$("#regDate").append(fullDate);
});