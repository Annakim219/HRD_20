<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>강사 조회</title>
<style>
.cnt {
	display: table; 
	width: 700px; 
	height: 25px;
	margin: 0 auto; 
}

#tab5 {
	margin: 0 auto;
}

th {
	background: lightgrey;
	height: 30px;
}

td{
	height:25px;
}
</style>
<script>
function delOK(){
	if(!confirm('정말로 삭제하시겠습니까?')){
		return false;
	}
}
</script>
</head>
<body>
	<%@ include file="header.jsp"%>
	<%@ include file="nav.jsp"%>
	<%@ include file="DBconn.jsp"%>
	<%
		request.setCharacterEncoding("utf-8");
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int cnt = 0;

		try {
			String sql = " select count(*) from teach0124";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				cnt = rs.getInt(1);
			} else {
				cnt = 0;
			}
		} catch (SQLException e) {
			System.out.println("강사 인원 수 조회 실패");
			e.printStackTrace();
		}
	%>

	<section>
	<h2>강사 목록</h2>
	<div class="cnt" align=left>
		<p>총 <b><%=cnt%>명</b>의 강사가 있습니다.</p>
	</div>
	<table id="tab5" border=1>
	<tr>
		<th width="80">강사코드</th>
		<th width="100">강사명</th>
		<th width="200">전공</th>
		<th width="200">세부전공</th>
		<th width="120">관리</th>
	</tr>
	
	<%
		try{
			String sql = "select * from teach0124 order by idx";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()){
				String idx = rs.getString("idx");
				String name = rs.getString("name");
				String major = rs.getString("major");
				String field = rs.getString("field");
				System.out.println("강사 조회 성공");
	%>
	
	<tr>
		<td align=center><%=idx%></td>
		<td align=center><%=name%></td>
		<td><%=major%></td>
		<td><%=field%></td>
		<td align=center><a href="update_lecturer.jsp?idx=<%=idx %>">수정</a>
		<span>/</span>
		<a href="delete_lecturer.jsp?idx=<%=idx %>" onclick="delOK()">삭제</a></td>
	</tr>
	<%
			}
		}catch(SQLException e){
			System.out.println("강사 조회 실패");
			e.printStackTrace();
		}
	%>
	</table>
	<div class = "btn_group" align=center>
		<button type="button" onclick="location.href='insert_lecturer.jsp'">작 성</button>
	</div>
	</section>
</body>
</html>