<%@page import="db.GameListBean"%>
<%@page import="db.GEMDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<body>

	<%
		String gameName = request.getParameter("gameName");

	//�����ͺ��̽��� ����
	GEMDAO gdao = new GEMDAO();
	//���� �ϳ��� ���� ������ ����
	GameListBean bean = gdao.getOneGame(gameName);
	%>

	<center>
		<h1>
			<%=bean.getGameName()%>
			���� ����
		</h1>
	</center>
	<form action="YouMustLogin.jsp">
		<table align=center width="1000">
			<tr height="50" align=center>
				<td rowspan="6"><img src="img/<%=bean.getImg()%>" width="450"></td>
				<td width="250">���� �̸�</td>
				<td width="250"><%=bean.getGameName()%></td>
			</tr>
			<tr height="50" align=center>
				<td width="250">ī�װ�</td>
				<td width="250"><%=bean.getGameType()%></td>
			</tr>
			<tr height="50" align=center>
				<td width="250">����� ��</td>
				<td width="250"><%=bean.getEvaluation() %></td>
			</tr>
			<tr height="50" align=center>
				<td width="250">�����</td>
				<td width="250"><%=bean.getRelease() %></td>
			</tr>
			<tr height="50" align=center>
				<td width="250">���߻�</td>
				<td width="250"><%=bean.getDeveloper() %></td>
			</tr>
			<tr height="50" align=center>
				<td width="250">����</td>
				<td width="250"><%=bean.getPrice() %> ��</td>
			</tr>
			<tr height="50" align=center>
				<td colspan="3" height="50"><input type="hidden"
					name="gameName" value="<%=bean.getGameName() %>"> <input
					type="submit" value="��ٱ��Ͽ� ���"></td>
			</tr>
		</table>
		<br> <br> <font size="6">�� ���� ���� ��</font>
		<p>
			<%
		String info = bean.getGameInfo();
			for(int i=0;i <info.length();i++){
				char ch=info.charAt(i);
				out.print(ch);
				if(ch=='.'){%>
					<br>
			<%}
				}%>

		<p>
	</form>
</body>
</html>