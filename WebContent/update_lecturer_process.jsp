<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>update_lecturer_process</title>
</head>
<body>
<%@ include file="DBconn.jsp" %>
<%
	String idx = request.getParameter("idx");
	String name = request.getParameter("name");
	String major = request.getParameter("major");
	String field = request.getParameter("field");
	
	PreparedStatement pstmt = null;
	
	try{
		String sql = "update teach0124 set name=?, major=?, field=? where idx=?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, name);
		pstmt.setString(2, major);
		pstmt.setString(3, field);
		pstmt.setString(4, idx);
		pstmt.executeUpdate();
		System.out.println("강사 정보 수정 성공");
%>
	
	<script>
		alert("수정이 완료되었습니다.");
		location.href="select_lecturer.jsp";
	</script>

<%		
	}catch(SQLException e){
		System.out.println("강사 정보 수정 실패");
		e.printStackTrace();
	}
%>
</body>
</html>