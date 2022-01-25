<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>delete_student_process</title>
</head>
<body>
<%@ include file = "DBconn.jsp" %>
<%
	PreparedStatement pstmt = null;
	String studno = request.getParameter("studno");
	
	try{
		String sql = "delete from stud0124 where studno=?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1,studno);
		pstmt.executeUpdate();
		System.out.println("학사 정보 삭제 성공");
		%>
		<script>
			alert("삭제가 완료되었습니다.");
			location.href="select_student.jsp";
		</script>
		
		<%
		
	}catch(SQLException e){
		System.out.println("학사 정보 삭제 실패");
		e.printStackTrace();
	}

%>

</body>
</html>