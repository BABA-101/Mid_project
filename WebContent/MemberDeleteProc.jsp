<%@page import="db.GEMDAO"%>
<%@page import="db.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<body>
	<%
		request.setCharacterEncoding("euc-kr");
	%>

	<jsp:useBean id="mbean" class="db.MemberBean">
		<jsp:setProperty name="mbean" property="*" />
	</jsp:useBean>

	<%
		MemberDAO mdao = new MemberDAO();
	// String Ÿ������ ����Ǿ� �ִ� �н����带 ������. (DB���� ������ pass���� ����)
	String pass = mdao.getPass(mbean.getId());

	// �����ϱ� ���ؼ� �ۼ��� �н����尪�� ���� DB���� ������ �н����� ���� ��
	if (mbean.getPass1().equals(pass)) { //���� �н������ DB �н����尡 ���ٸ� member ���̺� ���� ����
		//MemberDAO Ŭ������ ȸ�� ���� �޼ҵ带 ȣ��
		mdao.deleteMember(mbean.getId());

		//�α׾ƿ� ó��
		session.invalidate(); // ��缼������ ����

		//��ٱ��� ������ ���̽� �ʱ�ȭ
		GEMDAO gdao = new GEMDAO();
		gdao.BasketALLClean();
		gdao.MyGameALLClean();
		
	%>
	<script type="text/javascript">
		alert("ȸ�� Ż�� ó���Ǿ����ϴ�.");
		location.href = "MainPage.jsp";
	</script>
	<%
		} else {
	%>
	<script type="text/javascript">
		alert("�н����尡 ���� �ʽ��ϴ�. �ٽ� Ȯ�� �� �ּ���.");
		history.go(-1);
	</script>
	<%
		}
	%>
</body>
</html>