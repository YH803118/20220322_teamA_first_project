$(document).ready(function() {
	let oritxt;
	$("[name='replyMod']").click(function() {
		var parents = $(this).parents("table").find("[name='replyContent']");
		parents.removeAttr('readonly');

		$(this).hide();
		$(this).siblings("[name='replyModCancle']").show();
		$(this).siblings("[name='replyUpdate']").show();
		$(this).parents("table").find("[name='replyDel']").hide();
		oritxt = $(this).parents("table").find("[name='replyContent']").val();
	});

	$("[name='replyUpdate']").click(function() {
		var contentTag = $(this).parents("table").find("[name='replyContent']");
		contentTag.change();
		var replyContent = contentTag.val();
		var replyNo = $(this).parents("table").find("[name='replyNo']").attr("value");
		if (replyContent == "" || replyContent.length == 0) {
			alert("댓글 내용이 비었습니다.");
			return false;
		}
		
		var replyDTO = {
			replyNo: replyNo,
			replyContent: replyContent
		}
		contentTag.attr("readonly", "readonly");
		$.ajax({
			type: "post",
			url: "/pro_A/board/replyMod.do/",
			contentType: "application/json",
			data: JSON.stringify(replyDTO),
			success: function(data, textStatus) {
				alert("수정되었습니다.");
			},
			error: function(data, textStatus) {
				alert("오류가 발생했습니다.");
			},
			complete: function(data, textStatus) {
				
			}
		});
		$(this).hide();
		$(this).siblings("[name='replyMod']").show();
		$(this).siblings("[name='replyDel']").show();
		$(this).siblings("[name='replyModCancle']").hide();
	});

	$("[name='replyModCancle']").click(function() {
		$(this).hide();
		$(this).parents("table").find("[name='replyUpdate']").hide();
		$(this).parents("table").find("[name='replyMod']").show();
		$(this).parents("table").find("[name='replyDel']").show();
		$(this).parents("table").find("[name='replyContent']").val(oritxt);
		$(this).parents("table").find("[name='replyContent']").attr("readonly", "readonly");
	});

/*	$("[name='replyDel']").click(function() {
		var obj = $(this).parents("table").find("[name='replyNo']");
		var replyNo = obj.attr("value");
		var replyDTO = { replyNo: replyNo };
		$.ajax({
			type: "post",
			url: "/pro_A/board/replyDel.do/",
			contentType: "application/json",
			data: JSON.stringify(replyDTO),
			success: function(data, textStatus) {
				$(this).parents("table").remove();
				alert("삭제되었습니다.");
					
			},
			error: function(data, textStatus) {
				alert("오류가 발생했습니다.");
			},
			complete: function(data, textStatus) {
				
			}
		});
	});*/
	
	
});

// 공지,커뮤니티 게시글 작성시 내용, 제목에 대한 무결성 확인
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

// 댓글 작성시 내용에 대한 무결성
function replyCheck(name) {
	let form = document.forms[name];
	let content = form['replyContent'].value;
	if (content == "" || content.length == 0) {
		alert("내용을 입력하세요.");
		return false;
	} else {
		alert("댓글이 작성되었습니다.");
		return true;
	}
}

// 파일 업로드, 수정, 삭제 관련 함수들
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

function rp_view() {
	var a = $("[name='replyVbtn']");
	if (a.text() == '댓글 보기') {
		a.text("댓글 숨기기");
		$(".replyList").show();
	} else if (a.text() == '댓글 숨기기') {
		a.text("댓글 보기");
		$(".replyList").hide();
	}
}
