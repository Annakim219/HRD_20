<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>update_student_process</title>
</head>
<body>
<%@ include file="DBconn.jsp" %>
<%
	String studno = request.getParameter("studno");
	String name = request.getParameter("name");
	String dept = request.getParameter("dept");
	String position = request.getParameter("position");
	String hobby[] = request.getParameterValues("hobby");
	String chk="";
	for(int i=0;i<hobby.length;i++){
		if((i+1)==hobby.length){
			chk=chk+hobby[i];
		}else{
		chk=chk+hobby[i]+",";
		}
	}
	System.out.println("체크:"+chk);
	String address = request.getParameter("address");
	String phone = request.getParameter("phone");

	PreparedStatement pstmt = null;
	try{
		String sql = "update stud0124 set name=?,dept=?,position=?,address=?,phone=?,hobby=? where studno=?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(7, studno);
		pstmt.setString(1, name);
		pstmt.setString(2, dept);
		pstmt.setString(3, position);
		pstmt.setString(4, address);
		pstmt.setString(5, phone);
		pstmt.setString(6, chk);
		pstmt.executeUpdate();
		System.out.println("학사 정보 수정 성공");
		%>
		<script>
			alert("수정이 완료되었습니다.");
			location.href="select_student.jsp";
		</script>
		
		<%
	}catch(SQLException e){
		System.out.println("학사 정보 수정 실패");
		e.printStackTrace();
	}
%>

</body>
</html>