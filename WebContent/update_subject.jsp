<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>교과목 추가</title>
<style>
#tab1 {
	width: 500px;
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
	width: 90%;
	height: 25px;
}

#sel1 {
	width: 60%;
	height: 25px;
}
</style>
<script>
	function check() {
		if (document.form.id.value == "") {
			alert("교과목 코드가 입력되지 않았습니다.");
			document.form.id.focus;
		} else if (document.form.subject_name.value == "") {
			alert("교과목명이 입력되지 않았습니다.");
			document.form.subject_name.focus;
		} else if (document.form.credit.value == "") {
			alert("학점이 입력되지 않았습니다.");
			document.form.credit.focus;
		} else if (document.form.lecturer.value == "") {
			alert("담당강사가 입력되지 않았습니다.");
			document.form.lecturer.focus;
		} else if (document.form.start_hour.value == "") {
			alert("시작시간이 입력되지 않았습니다.");
			document.form.start_hour.focus;
		} else if (document.form.end_hour.value == "") {
			alert("종료시간이 입력되지 않았습니다.");
			document.form.end_hour.focus;
		} else {
			alert("종료");
			document.form.submit();
		}
	}
	function goList() {
		location.href = "select_subject.jsp";
	}
</script>
</head>
<body>
	<%@ include file="header.jsp"%>
	<%@ include file="nav.jsp"%>
	<%@ include file="DBconn.jsp"%>
	<%
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String id = request.getParameter("id");

		try {
			String sql = "select * from sub0124 where id=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				String subject_name = rs.getString("subject_name");
				String credit = rs.getString("credit");
				String lecturer = rs.getString("lecturer");
				String week = rs.getString("week");
				String start_hour = rs.getString("start_hour");
				String end_hour = rs.getString("end_hour");
				System.out.println("교과목 정보 수정 조회 성공");

	%>

	<section>
		<h2>교과목 수정</h2>
		<form name="form" method="post" action="update_subject_process.jsp">
			<table id="tab1" border=1>
				<tr>
					<th>교과목 코드</th>
					<td><input id="in1" type="text" name="id" value="<%=id%>" readonly></td>
				</tr>
				<tr>
					<th>과 목 명</th>
					<td><input id="in1" type="text" name="subject_name" value="<%=subject_name%>"></td>
				</tr>
				<tr>
					<th>학 점</th>
					<td><input id="in1" type="text" name="credit" value="<%=credit%>"></td>
				</tr>
				<tr>
					<th>담 담 강 사</th>
					<td><select id="sel1" name="lecturer">
							<option value="" selected>담당강사 선택</option>
							<option value="1" <%if (lecturer.equals("1")) {%> selected <%}%>>김교수</option>
							<option value="2" <%if (lecturer.equals("2")) {%> selected <%}%>>이교수</option>
							<option value="3" <%if (lecturer.equals("3")) {%> selected <%}%>>박교수</option>
							<option value="4" <%if (lecturer.equals("4")) {%> selected <%}%>>우교수</option>
							<option value="5" <%if (lecturer.equals("5")) {%> selected <%}%>>최교수</option>
							<option value="6" <%if (lecturer.equals("6")) {%> selected <%}%>>강교수</option>
							<option value="7" <%if (lecturer.equals("7")) {%> selected <%}%>>황교수</option>
					</select></td>
				</tr>
				<tr>
					<th>요 일</th>
					<td><input type="radio" name="week" value="1"<%if (week.equals("1")) {%> checked <%}%>>월 
						<input type="radio" name="week" value="2"<%if (week.equals("2")) {%> checked <%}%>>화 
						<input type="radio" name="week" value="3"<%if (week.equals("3")) {%> checked <%}%>>수 
						<input type="radio" name="week" value="4"<%if (week.equals("4")) {%> checked <%}%>>목 
						<input type="radio" name="week" value="5"<%if (week.equals("5")) {%> checked <%}%>>금 
						<input type="radio" name="week" value="6"<%if (week.equals("6")) {%> checked <%}%>>토</td>
				</tr>
				<tr>
					<th>시 작</th>
					<td><input id="in1" type="text" name="start_hour" value="<%=start_hour%>"></td>
				</tr>
				<tr>
					<th>종 료</th>
					<td><input id="in1" type="text" name="end_hour" value="<%=end_hour%>"></td>
				</tr>
				<tr>
					<td colspan=2 align=center>
					<input id="btn1" type="button" value="목록" onclick="goList()"> 
					<input id="btn1" type="button" value="등록" onclick="check()"></td>
			</table>
		</form>
		<%
			}
			} catch (SQLException e) {
				System.out.println("교과목 정보 수정 조회 실패");
				e.printStackTrace();
			}
		%>
	</section>
	<%@ include file="footer.jsp"%>
</body>
</html>