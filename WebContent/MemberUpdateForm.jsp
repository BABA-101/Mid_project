<%@page import="db.MemberBean"%>
<%@page import="db.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<style>
table {
	border-collapse: collapse;
}
</style>
</head>
<body>

	<%
		String id = (String) session.getAttribute("id");
	MemberDAO mdao = new MemberDAO();
	MemberBean bean = mdao.oneSelectMember(id); //�ش��ϴ� id�� ȸ�� ������ ���� �޾ƾ� ��
	%>
<br><br><br><br><br>
	<center>
		<h2>ȸ�� ���� ����</h2>
	</center>

	<table width="400" border="1" align="center">
		<form action="MemberUpdateProc.jsp" method="post">

			<tr height="50" align="center">
				<td align="center" width="150">���̵�</td>
				<td width="250"><%=bean.getId()%></td>
			</tr>

			<tr height="50" align="center">
				<td align="center" width="150">�̸���</td>
				<td width="250"><input type="email" name="email"
					value="<%=bean.getEmail()%>"></td>
			</tr>

			<tr height="50" align="center">
				<td align="center" width="150">��ȭ</td>
				<td width="250"><input type="tel" name="tel"
					value="<%=bean.getTel()%>"></td>
			</tr>

			<tr height="50" align="center">
				<td align="center" width="150">�ּ�</td>
				<td width="250"><input type="text" name="address"
					value="<%=bean.getAddress()%>"></td>
			</tr>

			<tr height="50" align="center">
				<td align="center" width="150">�н�����</td>
				<td width="250"><input type="password" name="pass1"></td>
			</tr>

			<tr height="50" align="center">
				<td align="center" width="150" colspan="2"><input type="hidden"
					name="id" value="<%=bean.getId()%>"> <input type="submit"
					value="ȸ�� �����ϱ�"></td>
			</tr>
		</form>
	</table>

<br><br><br><br><br><br>


</body>
</html>