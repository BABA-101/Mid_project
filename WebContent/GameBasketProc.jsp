<%@page import="db.GameListBean"%>
<%@page import="java.util.Vector"%>
<%@page import="db.GEMDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<body>
	<%
	request.setCharacterEncoding("euc-kr");
	String gameName = request.getParameter("gameName");

	GEMDAO gdao = new GEMDAO();

	//�������� �ϳ� ������
	GameListBean bean = gdao.getOneGame(gameName);
	
	//��ٱ��Ͽ� �־�
	gdao.setBasketInsert(bean);
	%>
	<script>
		alert("������ ��ٱ��Ͽ� �־����ϴ�.");
		location.href = "MainPage.jsp?center=Store.jsp";
	</script>
</body>
</html>