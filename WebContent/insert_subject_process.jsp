<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>insert_subject_process</title>
</head>
<body>
<%@ include file="DBconn.jsp" %>
<%System.out.println("교과목");
	String id = request.getParameter("id");
	String subject_name = request.getParameter("subject_name");
	String credit = request.getParameter("credit");
	String lecturer = request.getParameter("lecturer");
	String week = request.getParameter("week");
	String start_hour = request.getParameter("start_hour");
	String end_hour = request.getParameter("end_hour");
	
	PreparedStatement pstmt = null;
	try{
		String sql = "insert into sub0124 values(?,?,?,?,?,?,?)";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, id);
		pstmt.setString(2, subject_name);
		pstmt.setString(3, credit);
		pstmt.setString(4, lecturer);
		pstmt.setString(5, week);
		pstmt.setString(6, start_hour);
		pstmt.setString(7, end_hour);
		pstmt.executeUpdate();
		System.out.println("교과목 저장 성공");
		%>
		<script>
			alert("등록이 완료되었습니다.");
			location.href="select_subject.jsp";
		</script>
		
		<%
	}catch(SQLException e){
		System.out.println("교과목 저장 실패");
		e.printStackTrace();
	}
%>

</body>
</html>