<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%
	request.setCharacterEncoding("euc-kr");
	String id=(String) session.getAttribute("id");

	if(id==null){
	%>
	<script>
		alert("�α��� �� �̿� �����մϴ�.");
		location.href="Login.jsp";
	</script>
	<%
	}else{
		%>
		<script>
			location.href="MainPage.jsp?center=MyPage.jsp";
		</script>
		<%
	}
	%>

</body>
</html>