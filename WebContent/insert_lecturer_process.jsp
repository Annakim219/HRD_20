<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>insert_lecturer_process</title>
</head>
<body>
<%@ include file="DBconn.jsp" %>
<%
	String idx = request.getParameter("idx");
	String name = request.getParameter("name");
	String major = request.getParameter("major");
	String filed = request.getParameter("field");
	
	PreparedStatement pstmt = null;
	
	try{
		String sql = "insert into teach0124 values(?,?,?,?)";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, idx);
		pstmt.setString(2, name);
		pstmt.setString(3, major);
		pstmt.setString(4, filed);
		pstmt.executeUpdate();
		System.out.println("강사 저장 성공");
	%>
		<script>
			alert("등록이 완료되었습니다.");
			location.href="select_lecturer.jsp";
		</script>
		
	<%	
	}catch(SQLException e){
		System.out.println("강사 저장 실패");
		e.printStackTrace();
	}

%>

</body>
</html>