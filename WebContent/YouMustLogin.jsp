<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<body>
	<%
		request.setCharacterEncoding("euc-kr");
	String id=(String) session.getAttribute("id");
	
	if(id==null){
	%>
	<script>
		alert("�α��� �� ���Ű� �����մϴ�.");
		location.href="Login.jsp";
	</script>
	<%
	}else{
		response.sendRedirect("GameBasketProc.jsp?gameName="+request.getParameter("gameName"));
	}
	%>
</body>
</html>