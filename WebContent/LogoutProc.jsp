<%@page import="db.GEMDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<body>
	<%
		session.invalidate(); // ��� ���� ���� ����
		
		//�α׾ƿ� �� ��ٱ��� ������ ���̽� �ʱ�ȭ
		GEMDAO gdao=new GEMDAO();
		gdao.BasketALLClean(); 
		gdao.MyGameALLClean(); 
	%>
	<script>
		alert("�α׾ƿ� �Ǿ����ϴ�.");
		location.href = "MainPage.jsp";
	</script>
</body>
</html>