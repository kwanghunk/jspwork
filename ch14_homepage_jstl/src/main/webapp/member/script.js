function inputIdChk() {
	frm.idBtnCheck.value = "idUncheck";
}

function idCheck(id) {
	if(id == "") {
		alert("아이디를 입력하세요");
		frm.id.focus();
		return;
	}
	frm.idBtnCheck.value = "idCheck";
	url = "idCheck.jsp?id=" + id;	/*쌍따옴표 안에는 띄어쓰기 넣어서쓰면 안됨*/
	window.open(url, "IDCheck", "width=300, height=150");
} 

function inputCheck() {		/* 유효성검사 */
	if(frm.idBtnCheck.value != "idCheck") {
		alert("아이디 중복확인 해주세요");
	}
	if(frm.pwd.value == "") {
		alert("비밀번호를 입력하세요");
		frm.pwd.focus();
		return;
	}
	if(frm.pwd.value != frm.rePwd.value) {
		alert("비밀번호가 일치하지 않습니다");
		frm.rePwd.focus();
		return;
	}
	if(frm.name.value == "") {
		alert("이름을 입력하세요");
		frm.name.focus();
		return;
	}
	frm.submit();
	
}