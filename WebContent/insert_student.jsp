<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>학사 정보 추가</title>
<style>
#tab1 {
	width: 670px;
	margin: 0 auto;
	align: center;
}

tr {
	height: 30px;
}

th {
	width: 20%;
	text-align: center;
	text-height: bold;
	background: lightgrey;
}

td {
	width: 80%;
}

#in1 {
	width: 50%;
	height: 25px;
}

#in2 {
	width: 90%;
	height: 25px;
}

#sel1 {
	width: 40%;
	height: 25px;
}
</style>
<script>
	function check(){
		if(document.form.studno.value==""){
			alert("학번이 입력되지 않았습니다.");
			document.form.studno.focus;
		}else if(document.form.name.value==""){
			alert("이름이 입력되지 않았습니다.");
			document.form.name.focus;
		}else if(document.form.dept.value==""){
			alert("학과가 입력되지 않았습니다.");
			document.form.dept.focus;
		}else if(document.form.position.value==""){
			alert("학년이 입력되지 않았습니다.");
			document.form.position.focus;
		}else{
			document.form.submit();
		}
	}
</script>
</head>
<body>
	<%@ include file="header.jsp"%>
	<%@ include file="nav.jsp"%>
	<section>
		<h2>학사 정보 등록 화면</h2>
		<form name="form" method="post" action="insert_student_process.jsp">
			<table id="tab1" border=1>
				<tr>
					<th>학번</th>
					<td><input id="in1" type="text" name="studno"></td>
				</tr>
				<tr>
					<th>성명</th>
					<td><input id="in1" type="text" name="name"></td>
				</tr>
				<tr>
					<th>학과</th>
					<td><select id="sel1" name="dept">
							<option value="1" selected>컴퓨터공학과</option>
							<option value="2">기계공학과</option>
							<option value="3">전자과</option>
							<option value="4">영문학과</option>
							<option value="5">일어과</option>
							<option value="6">경영학과</option>
							<option value="7">무역학과</option>
							<option value="8">교육학과</option>
					</select></td>
				</tr>
				<tr>
					<th>학년</th>
					<td><input type="radio" name="position" value="1" checked>1학년
						<input type="radio" name="position" value="2">2학년
						<input type="radio" name="position" value="3">3학년 
						<input type="radio" name="position" value="4">4학년</td>
				</tr>
				<tr>
					<th>취미</th>
					<td><input type="checkbox" name="hobby" value="프로그램">프로그램
						<input type="checkbox" name="hobby" value="독서">독서 
						<input type="checkbox" name="hobby" value="등산">등산 
						<input type="checkbox" name="hobby" value="여행">여행 
						<input type="checkbox" name="hobby" value="낚시">낚시 
						<input type="checkbox" name="hobby" value="영화보기">영화보기 
						<input type="checkbox" name="hobby" value="잠자기">잠자기 
						<input type="checkbox" name="hobby" value="멍때리기">멍때리기</td>
				</tr>
				<tr>
					<th>주소</th>
					<td><input id="in2" type="text" name="address"></td>
				</tr>
				<tr>
					<th>연락처</th>
					<td><input id="in2" type="text" name="phone"></td>
				</tr>
				<tr>
					<td colspan=2 align=center>
					<input id="btn1" type="button" value="등록" onclick="check()"> 
					<input id="btn1" type="reset" value="취소">
			</table>
		</form>
	</section>
	<%@ include file="footer.jsp"%>
</body>
</html>