<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>학사 정보 조회</title>
<style>
.cnt {
	display: table; 
	width: 1050px; 
	height: 25px;
	margin: 0 auto; 
}

#tab2 {
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
			String sql = "select count(*) from stud0124";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				cnt = rs.getInt(1);
			} else {
				cnt = 0;
			}
		} catch (SQLException e) {
			System.out.println("학사정보 개수 조회 실패");
			e.printStackTrace();
		}
	%>
	
	<section>
		<h2>학사 정보 목록</h2>
		<div class="cnt" align=left>
			<p>총 <b><%=cnt%>명</b>의 학사정보가 있습니다.</p>
		</div>
		<table id="tab2" border=1>
			<tr>
				<th width="100">학번</th>
				<th width="70">성명</th>
				<th width="40">학과</th>
				<th width="40">학년</th>
				<th width="250">주소</th>
				<th width="130">연락처</th>
				<th width="300">취미</th>
				<th width="100">관리</th>
			</tr>
			<%
				try {
					String sql = "select * from stud0124 order by studno";
					pstmt = conn.prepareStatement(sql);
					rs = pstmt.executeQuery();
					while (rs.next()) {
						String studno = rs.getString("studno");
						String name = rs.getString("name");
						String dept = rs.getString("dept");
						String position = rs.getString("position");
						String address = rs.getString("address");
						String phone = rs.getString("phone");
						String hobby = rs.getString("hobby");
						System.out.println("학사 정보 조회 성공 ");
			%>

			<tr>
				<td align=center><%=studno %></td>
				<td align=center><%=name %></td>
				<td align=center><%=dept %></td>
				<td align=center><%=position %></td>
				<td><%=address %></td>
				<td align=center><%=phone %></td>
				<td><%=hobby %></td>
				<td align=center><a href="update_student.jsp?studno=<%=studno %>">수정</a>
				<span>/</span>
				<a href="delete_student.jsp?studno=<%=studno %>" onclick="delOK()">삭제</a>
				</td>
			</tr>
			
			<%
					}

				} catch (SQLException e) {
					System.out.println("학사 정보 조회 실패");
					e.printStackTrace();
				}
			%>
		</table>
		<div class = "btn_group" align=center>
			<button type="button" onclick="location.href='insert_student.jsp'">학사정보 추가</button>
		</div>
	</section>
	<%@ include file="footer.jsp"%>
</body>
</html>