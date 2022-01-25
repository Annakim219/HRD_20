<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html	>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>강사 추가</title>
<style>
#tab4{
	width:500px;
	margin: 0 auto;
}

tr{
	height:30px;
}

th{
	width:30%;
	background:lightgrey;
	text-align:center;
}

#in1{
	width:50%;
	height:25px;	
}

#in2{
	width:90%;
	height:25px;	
}

span{
	font-size:0.8em;
}
</style>
<script>
function check(){
	if(document.form.name.value==""){
		alert("강사명이 입력되지 않았습니다.");
		document.form.name.focus;
	}else if(document.form.major.value==""){
		alert("전공이 입력되지 않았습니다.");
		document.form.major.focus;
	}else if(document.form.field.value==""){
		alert("세부전공이 입력되지 않았습니다.");
		document.form.fieldd.focus;
	}else{
		document.form.submit();
	}
}

function goList(){	
	location.href="select_lecturer.jsp";
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
		String idx = request.getParameter("idx");
				
		try{
			String sql = " select * from teach0124 where idx=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, idx);
			rs = pstmt.executeQuery();
			while(rs.next()){
				String name = rs.getString("name");
				String major = rs.getString("major");
				String field = rs.getString("field");
				System.out.println("강사 정보 수정 조회 성공");
		%>
		
	
	<section>
		<h2>강사 정보 수정</h2>
		<form name="form" method="post" action="update_lecturer_process.jsp">
			<table id="tab4" border=1>
			<tr>
				<th>강사 ID</th>
				<td><input id="in1" type="text" name="idx" value="<%=idx %>" readonly>				
			</tr>
			<tr>
				<th>강 사 명</th>
				<td><input id="in1" type="text" name="name" value="<%=name %>"></td>
			</tr>
			<tr>
				<th>전 공</th>
				<td><input id="in2" type="text" name="major" value="<%=major %>"></td>
			</tr>
			<tr>
				<th>연구분야</th>
				<td><input id="in2" type="text" name="field" value="<%=field %>"></td>
			</tr>
			<tr>
				<td colspan=2 align=center>
				<input id="btn1" type="button" value="목록" onclick="goList()">
				<input id="btn1" type="button" value="등록" onclick="check()"></td>
			</tr>							
			</table>			
		</form>
		
			<%
			}
		
		}catch(SQLException e){
			System.out.println("강사 정보 수정 조회 실패");
			e.printStackTrace();
		}		
		%>
			
			
	</section>
</body>
</html>