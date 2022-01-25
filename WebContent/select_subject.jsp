<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>교과목 조회</title>
<style>
.cnt {
	display: table; 
	width: 700px; 
	height: 25px;
	margin: 0 auto; 
}

#tab3 {
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
	<section>
		<h2>교과목 목록</h2>

		<%
			request.getParameter("utf-8");
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			int cnt = 0;

			try {
				String sql = "select count(*) from sub0124";
				pstmt = conn.prepareStatement(sql);
				rs = pstmt.executeQuery();
				if (rs.next()) {
					cnt = rs.getInt(1);
				} else {
					cnt = 0;
				}
			} catch (SQLException e) {
				System.out.println("교과목 개수 조회 실패");
				e.printStackTrace();
			}
		%>
		<div class="cnt">
			<span>총 <b><%=cnt%>개</b>의 교과목이 있습니다.</span>
		</div>
		<table id="tab3" border=1>
			<tr>
				<th width="70">과목코드</th>
				<th width="200">과목명</th>
				<th width="50">학점</th>
				<th width="70">담당강사</th>
				<th width="50">요일</th>
				<th width="70">시작시간</th>
				<th width="70">종료시간</th>
				<th width="120">관리</th>
			</tr>
		<%
			String sql = "select a.id, a.subject_name, a.credit, b.name, a.week, a.start_hour, a.end_hour from sub0124 a, teach0124 b where a.lecturer=b.idx order by a.id";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			try{
				while(rs.next()){
				String id = rs.getString(1);
				String subject_name = rs.getString(2);
				String credit = rs.getString(3);
				String lecturer = rs.getString(4);
				String week = rs.getString(5);
				String start_hour = rs.getString(6);
				String end_hour = rs.getString(7);
				System.out.println("교과목 조회 성공");
				
				if(week.equals("1")){week="월";}
				if(week.equals("2")){week="화";}
				if(week.equals("3")){week="수";}
				if(week.equals("4")){week="목";}
				if(week.equals("5")){week="금";}
				if(week.equals("6")){week="토";}				
			%>
			
			<tr>
				<td align=center><%=id %></td>
				<td><%=subject_name %></td>
				<td align=center><%=credit %></td>
				<td align=center><%=lecturer %></td>
				<td align=center><%=week %></td>
				<td align=center><%=start_hour %></td>
				<td align=center><%=end_hour %></td>
				<td align=center>
				<a href="update_subject.jsp?id=<%=id %>">수정</a>
				<span>/</span>
				<a href="delete_subject.jsp?id=<%=id %>" onclick="delOK()">삭제</a>
				</td>
			<tr>
			
			<%
			}
			}catch(SQLException e){
				System.out.println("교과목 조회 실패");
				e.printStackTrace();
			}
		
		%>
		</table>
		<div class = "btn_group" align=center>
			<button type="button" onclick="location.href='insert_subject.jsp'">작 성</button>
		</div>
	</section>
	<%@ include file="footer.jsp"%>
</body>
</html>