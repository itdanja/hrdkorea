function voteReset(){
	alert("정보를 지우고 처음부터 다시 입력합니다!");
	document.voteForm.reset();
}
function vote(){
	var f = document.voteForm;	
	
	var v_jumin = f.v_jumin.value;
	if(v_jumin == ""){
		alert("주민번호가 입력되지 않았습니다!");
		f.v_jumin.focus(); return false;
	}
	var v_name = f.v_name.value;
	if(v_name == ""){
		alert("성명이 입력되지 않았습니다!");
		f.v_name.focus(); return false;
	}
	if(f.m_no.value == ""){
		alert("후보번호가 선택되지 않았습니다!");
		f.m_no.focus(); return false;
	}
	if(f.v_time.value == ""){
		alert("투표시간이 입력되지 않았습니다!");
		f.v_time.focus(); return false;
	}
	if(f.v_area.value == ""){
		alert("투표장소가 입력되지 않았습니다!");
		f.v_area.focus(); return false;
	}	
	if(f.v_confirm.value == ""){
		alert("유권자확인이 선택되지 않았습니다!");
		return false;
	}
	f.submit();
	alert('투표하기 정보가 정상적으로 등록 되었습니다.');
}