
<%@page import="db.BasketBean"%>
<%@page import="db.GEMDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<body>

	<%
	String gameName = request.getParameter("gameName");
	GEMDAO gdao = new GEMDAO();
	gdao.BasketRemove(gameName);
	%>
	
	<script>
		alert("��ٱ��Ͽ��� �����Ǿ����ϴ�.");
		location.href = "MainPage.jsp?center=GameBasketList.jsp";
	</script>
</body>
</html>