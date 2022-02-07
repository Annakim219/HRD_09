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
		String sql = "insert into member1213 values(?,?,?,?,?,?,?)";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, custno);
		pstmt.setString(2, custname);
		pstmt.setString(3, phone);
		pstmt.setString(4, address);
		pstmt.setString(5, joindate);
		pstmt.setString(6, grade);
		pstmt.setString(7, city);
		pstmt.executeUpdate();
		System.out.println("회원 등록 성공");
		%>
			<script>
				alert("회원등록이 완료 되었습니다!");
				location.href="selectMember.jsp";
			</script>
		<%
	}catch(SQLException e){
		System.out.println("회원 등록 실패");
		%>
			<script>
				alert("회원 등록 실패!");
				history.back(-1);
			</script>
		<%
		e.printStackTrace();
	}
%>

</body>
</html>