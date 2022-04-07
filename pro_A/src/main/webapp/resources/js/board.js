

function formCheck(name, boardtype) {
	let form = document.forms[name];
	let title = form[boardtype + "Title"].value;
	let content = form[boardtype + "Content"].value;
	if (title == "" || title.length == 0) {
		alert("제목이 비어있습니다.");
		return false;
	} else if (content == "" || content.length == 0) {
		alert("내용이 비어있습니다.");
		return false;
	} else {
		alert("게시글이 작성되었습니다.");
		return true;
	}
}

function replyCheck(name){
	let form = document.forms[name];
	let content = form['replyContent'].value;
	if(content=="" || content.length==0){
		alert("내용을 입력하세요.");
		return false;
	} else {
		alert("댓글이 작성되었습니다.");
		return true;
	}
}

//
var wcnt = 1;
function w_addFile() {
	$("#d_file").append("<br><input type='file' name='file" + wcnt + "' />");
	wcnt++;
}
//modform에서 사용
var addCnt = 1;
function mod_addFile() {
	let tagChk = $(".fileList").length;
	if (tagChk == 0) {
		$(".fileT").text("");
		$(".fileT").append("<ul class='fileList'></ul>");
	}
	$(".fileList").append("<li><input type='file' name='addFile" + addCnt + "'></li>");
	addCnt++;
}

//
var delCnt = 1;
function fn_delFile() {
	let delPos = $("[name='btn" + delCnt + "']");
	let delNo = $("input").filter("[name='delCnt']");
	delPos.parent().remove();

	delNo.attr('value', delCnt);

	delCnt++;
}