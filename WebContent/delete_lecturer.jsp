<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>delete_lecturer_process</title>
</head>
<body>
<%@ include file="DBconn.jsp" %>
<%
	PreparedStatement pstmt = null;
	String idx = request.getParameter("idx");
	
	try{
		String sql = "delete from teach0124 where idx=?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, idx);
		pstmt.executeUpdate();
		System.out.println("강사 삭제 성공");
%>
		<script>
			alert("삭제가 완료되었습니다.");
			location.href="select_lecturer.jsp";
		</script>
		
		<%	
	}catch(SQLException e){
		System.out.println("강사 삭제 실패");
		e.printStackTrace();
	}

%>

</body>
</html>