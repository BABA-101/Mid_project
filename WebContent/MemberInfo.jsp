
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
	MemberBean mbean = mdao.oneSelectMember(id); //�ش��ϴ� id�� ȸ�� ������ ���� �޾ƾ� ��
	%>
	<br><br><br><br><br>
	<center>
		<h2><%=id %>���� ȸ�� ����</h2>
	</center>
	<table width="400" border="1" align="center">
		<tr height="50" align="center">
			<td align="center" width="150">���̵�</td>
			<td width="250"><%=mbean.getId()%></td>
		</tr>
		<tr height="50" align="center">
			<td align="center" width="150">�̸���</td>
			<td width="250"><%=mbean.getEmail()%></td>
		</tr>
		<tr height="50" align="center">
			<td align="center" width="150">��ȭ</td>
			<td width="250"><%=mbean.getTel()%></td>
		</tr>
		<tr height="50" align="center">
			<td align="center" width="150">�ּ�</td>
			<td width="250"><%=mbean.getAddress()%></td>
		</tr>
		<tr height="50" align="center">
			<td align="center" colspan="2">
				<button onclick="location.href='MainPage.jsp?center=MemberUpdateForm.jsp?'">
					ȸ������</button>
				<button onclick="location.href='MainPage.jsp?center=MyPageProc.jsp'">
					��Ϻ���</button>
			</td>
		</tr>
	</table>
	<br><br><br><br><br><br>
</body>
</html>