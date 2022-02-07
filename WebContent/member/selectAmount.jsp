<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원매출조회</title>
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
		<h2>회원매출조회</h2>
		<table border=1>
			<tr>
				<th width=100>회원번호</th>
				<th width=100>회원성명</th>
				<th width=100>고객등급</th>
				<th width=100>매출</th>
			</tr>
			<%
				try {
					String sql = "select a.custno, a.custname, a.grade, sum(b.price) from member1213 a, money1213 b where a.custno=b.custno group by a.custno, a.custname, a.grade order by sum(b.price) desc";
					pstmt = conn.prepareStatement(sql);
					rs = pstmt.executeQuery();
					while (rs.next()) {
						String custno = rs.getString(1);
						String custname = rs.getString(2);
						String grade = rs.getString(3);
						String sum_price = rs.getString(4);
						System.out.println("매출 조회 성공");

						if (grade.equals("A")) {
							grade = "VIP";
						} else if (grade.equals("B")) {
							grade = "일반";
						} else if (grade.equals("C")) {
							grade = "직원";
						}
			%>
			<tr>
				<td><%=custno%></td>
				<td><%=custname%></td>
				<td><%=grade%></td>
				<td><%=sum_price%></td>
			</tr>
			<%
				}
				} catch (SQLException e) {
					System.out.println("매출 조회 실패");
					e.printStackTrace();
				}
			%>
		</table>
	</section>
	<%@ include file="/footer.jsp"%>
</body>
</html>