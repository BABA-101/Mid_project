<%@page import="db.GameListBean"%>
<%@page import="java.util.Vector"%>
<%@page import="db.GEMDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<body>
	<%
		String type = request.getParameter("gameType");
	%>
	
	<h1> <%=type %> ���� ��� </h1> 
	<!-- ������ ����� ��. �ݺ��� ���鼭 3���� 3���� ��µǸ� �ٽ� tr���� ���Ӱ� ������ ����������. -->
	<table width="1000" align="center">
		<%
			// ī�װ�(Ÿ��) �з� ���� �����´�.
		type = request.getParameter("gameType");
		GEMDAO gdao = new GEMDAO();

		// ������ � ���� ��Ȯ�� �� �� ����. ���� ���.
		Vector<GameListBean> v = gdao.getTypeGame(type);

		//td�� 3���� �����ְ� �ٽ� tr�� ������ �� �ֵ��� �ϴ� ���� ����
		int j = 0;
		for (int i = 0; i < v.size(); i++) {
			//���Ϳ� ����Ǿ��ִ� bean Ŭ������ ����
			GameListBean bean = v.get(i);
			if (j % 3 == 0) {
		%>
		<tr height="220">
		<%
			}
		%>
			<td width="333" align="center">
				<a href="MainPage.jsp?center=GameInfo.jsp?gameName=<%=bean.getGameName()%>">
					<img alt="" src="img/<%=bean.getImg()%>" width="300" height="200">
			</a>
				<p>
					<font size="3"><center><b>���Ӹ�: <%=bean.getGameName()%></b><p></center></font></td>
		<%
				j = j + 1; //j���� �������� �ϳ��� �࿡ 3���� ���������� �����ֱ� ���� ����
			}
		%>
		
	</table>
</body>
</html>