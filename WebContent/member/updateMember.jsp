<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원등록</title>
<style>
th{
	width:250px;
}

td{
	width:250px;
}

#in1{
	width:50%;
	height:22px;
}

#in2{
	width:70%;
	height:22px;
}

#in3{
	width:99%;
	height:22px;
}
</style>
<script>
	function check(){
		if(document.form.custname.value==""){
			alert("회원성명이 입력되지 않았습니다.");
			document.form.custname.focus();
		}else if(document.form.phone.value==""){
			alert("회원전화가 입력되지 않았습니다.");
			document.form.phone.focus();
		}else if(document.form.address.value==""){
			alert("회원주소가 입력되지 않았습니다.");
			document.form.address.focus();
		}else if(document.form.joindate.value==""){
			alert("가입일자가 입력되지 않았습니다.");
			document.form.joindate.focus();
		}else if(document.form.grade.value==""){
			alert("고객등급이 입력되지 않았습니다.");
			document.form.grade.focus();
		}else if(document.form.city.value==""){
			alert("도시코드가 입력되지 않았습니다.");
			document.form.city.focus();
		}else{
			document.form.submit();
		}
	}
</script>
</head>
<body>
	<%@ include file="/header.jsp"%>
	<%@ include file="/nav.jsp"%>
	<%@ include file="/DBconn.jsp"%>
	<%
		String send_custno = request.getParameter("custno");
	
		try{
			String sql = "select custno, custname, phone, address, to_char(joindate,'yyyy-mm-dd'), grade, city from member1213 where custno=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, send_custno);
			rs = pstmt.executeQuery();
			if(rs.next()){
				String custno = rs.getString(1);
				String custname = rs.getString(2);
				String phone = rs.getString(3);
				String address = rs.getString(4);
				String joindate = rs.getString(5);
				String grade = rs.getString(6);
				String city = rs.getString(7);
				System.out.println("테이블 조회 성공");
				%>

	<section>
		<br>
		<h2>홈쇼핑 회원 등록</h2>
		<form name="form" method="post" action="updateMember_process.jsp">
			<table border=1>
				<tr>
					<th>회원번호(자동발생)</th>
					<td><input id="in1" type="text" name="custno" value="<%=custno %>" readonly></td>
				</tr>
				<tr>
					<th>회원성명</th>
					<td><input id="in1" type="text" name="custname"  value="<%=custname %>"></td>
				</tr>
				<tr>
					<th>회원전화</th>
					<td><input id="in2" type="text" name="phone"  value="<%=phone %>"></td>
				</tr>
				<tr>
					<th>회원주소</th>
					<td><input id="in3" type="text" name="address"  value="<%=address %>"></td>
				</tr>
				<tr>
					<th>가입일자</th>
					<td><input id="in1" type="text" name="joindate"  value="<%=joindate %>"></td>
				</tr>
				<tr>
					<th>고객등급 [A:VIP, B:일반, C:직원]</th>
					<td><input id="in1" type="text" name="grade"  value="<%=grade %>"></td>
				</tr>
				<tr>
					<th>도시코드</th>
					<td><input id="in1" type="text" name="city"  value="<%=city %>"></td>
				</tr>
				<tr id="tr_btn">
					<td colspan=2 align=center>
					<input id="btn1" type="button" value="수정" onclick="check()">
					<input id="btn1" type="button" value="조회" onclick="loaction.href='selectMember.jsp'">
					</td>
				</tr>
			</table>
		</form>
						<%
			}
			
		}catch(SQLException e){
			System.out.println("테이블 조회 실패");
			e.printStackTrace();
		}
	%>
	</section>
	<%@ include file="/footer.jsp"%>
</body>
</html>