
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
		String id = request.getParameter("id");

	MemberDAO mdao = new MemberDAO();
	// String Ÿ������ ����Ǿ� �ִ� �н����带 ������. (DB���� ������ pass���� ����)
	String pass = mdao.getPass(id);

	// ���� �ϱ� ���ؼ� �ۼ��� �н����尪�� ���� DB���� ������ �н����� ���� ��
	if (mbean.getPass1().equals(pass)) { 	//���� �н������ DB �н����尡 ���ٸ� member ���̺� ���� ����
		//MemberDAO Ŭ������ ȸ�� ���� �޼ҵ带 ȣ��
		mdao.updateMember(mbean); 
	%>
	<script type="text/javascript">
		alert("�����Ǿ����ϴ�.");
		location.href = "MainPage.jsp?center=MyPage.jsp";
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