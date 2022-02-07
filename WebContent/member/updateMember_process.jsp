<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ include file="/DBconn.jsp" %>
<%
	String custno = request.getParameter("custno");
	String custname = request.getParameter("custname");
	String phone = request.getParameter("phone");
	String address = request.getParameter("address");
	String joindate = request.getParameter("joindate");
	String grade = request.getParameter("grade");
	String city = request.getParameter("city");
	
	try{
		String sql = "update member1213 set custname=?, phone=?, address=?, joindate=?, grade=?, city=? where custno=?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, custname);
		pstmt.setString(2, phone);
		pstmt.setString(3, address);
		pstmt.setString(4, joindate);
		pstmt.setString(5, grade);
		pstmt.setString(6, city);
		pstmt.setString(7, custno);
		pstmt.executeUpdate();
		System.out.println("회원 정보 수정 성공");
		%>
			<script>
				alert("회원정보수정이 완료 되었습니다!");
				location.href="selectMember.jsp";
			</script>
		<%
	}catch(SQLException e){
		System.out.println("회원 정보 수정 실패");
		%>
			<script>
				alert("회원 정보 수정 실패!");
				history.back(-1);
			</script>
		<%
		e.printStackTrace();
	}
%>

</body>
</html>