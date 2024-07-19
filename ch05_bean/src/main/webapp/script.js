function inputCheck() {
	if(regForm.id.value == "") {
		alert("아이디를 입력하세요");
		regForm.id.focus();
		return;
	}
		if(regForm.pwd.value == "") {
		alert("비밀번호를 입력하세요");
		regForm.pwd.focus();
		return;
	}
		if(regForm.pwd.value != regForm.repwd.value) {
		alert("비밀번호가 일치하지 않습니다");
		regForm.repwd.focus();
		return;
	}
		if(regForm.name.value == "") {
		alert("이름를 입력하세요");
		regForm.name.focus();
		return;
	}
	regForm.submit();
}
