<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@page import="db.MemberDAO"%>
<!DOCTYPE html>
<html>
<body>
	<%
		request.setCharacterEncoding("euc-kr");

	String id = request.getParameter("id");
	String pass = request.getParameter("pass");

	MemberDAO mdao = new MemberDAO();

	int result = mdao.getMember(id, pass);
	if (result == 0) {
	%>
	<script>
		alert("ȸ�� ���̵� �Ǵ� �н����尡 Ʋ���ϴ�.");
		location.href = "Login.jsp";
	</script>
	<%
		} else {
	//�α��� ó���� �Ǿ��ٸ�,
	session.setAttribute("id", id);
	response.sendRedirect("MainPage.jsp");
	}
	%>
</body>
</html>