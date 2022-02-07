<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원목록조회/수정</title>
<style>
th {
	text-weight: bold;
	height: 35px;
}

td {
	text-align: center;
}
</style>
</head>
<body>
	<%@ include file="/header.jsp"%>
	<%@ include file="/nav.jsp"%>
	<%@ include file="/DBconn.jsp"%>
	<section>
		<br>
		<h2>회원목록조회/수정</h2>
		<table border=1>
			<tr>
				<th width=100>회원번호</th>
				<th width=100>회원성명</th>
				<th width=150>전화번호</th>
				<th width=250>주소</th>
				<th width=150>가입일자</th>
				<th width=80>고객등급</th>
				<th width=80>거주지역</th>
			</tr>
			<%
				try {
					String sql = "select custno, custname, phone, address, to_char(joindate,'yyyy-mm-dd'), grade, city from member1213 order by custno";
					pstmt = conn.prepareStatement(sql);
					rs = pstmt.executeQuery();
					while (rs.next()) {
						String custno = rs.getString(1);
						String custname = rs.getString(2);
						String phone = rs.getString(3);
						String address = rs.getString(4);
						String joindate = rs.getString(5);
						String grade = rs.getString(6);
						String city = rs.getString(7);
						System.out.println("회원 목록 조회 성공");

						if (grade.equals("A")) {
							grade = "VIP";
						} else if (grade.equals("B")) {
							grade = "일반";
						} else if (grade.equals("C")) {
							grade = "직원";
						}
			%>
			<tr>
				<td><a href="/HRD1213/member/updateMember.jsp?custno=<%=custno%>"><%=custno%></a></td>
				<td><%=custname%></td>
				<td><%=phone%></td>
				<td><%=address%></td>
				<td><%=joindate%></td>
				<td><%=grade%></td>
				<td><%=city%></td>
			</tr>
			<%
				}
				} catch (SQLException e) {
					System.out.println("회원 목록 조회 실패");
					e.printStackTrace();
				}
			%>
		</table>
	</section>
	<%@ include file="/footer.jsp"%>
</body>
</html>