<%@page import="db.MemberDAO"%>

<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<body>
	<%
		request.setCharacterEncoding("euc-kr");

	String pass1 = request.getParameter("pass1");
	String pass2 = request.getParameter("pass2");
	%>

	<!-- useBean�� �̿��Ͽ� �ѹ��� ������ �޾ƿ��� -->
	<jsp:useBean id="mbean" class="db.MemberBean">
		<jsp:setProperty name="mbean" property="*" />
		<!-- ��� ���� -->
	</jsp:useBean>

	<%
		if (pass1.equals(pass2)) {
		//������ ���̽� Ŭ���� ��ü ����
		//��� �����ؾ� �� �ȿ� �ִ� �޼ҵ带 ����� �� ������ �����ϴ� ��.
		MemberDAO mdao = new MemberDAO();
		mdao.insertMember(mbean);
	} else {
	%>
	<script type="text/javascript">
		alert("��й�ȣ�� Ʋ���ϴ�."); // ���â
		history.go(-1); //���� �������� �̵�
	</script>
	<%
		}
	%>
	<!-- ȸ�� ������ �Ǿ��ٸ� �α���â����. -->
	<script>
		alert("ȸ������ �Ϸ�");
		location.href = "Login.jsp";
	</script>
</body>
</html>