<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<style>
body {
	font-family: '���׷� �޷γ�ü';
}
</style>
<meta charset="EUC-KR">
<title>GEM</title>
</head>
<body>
	<%
	request.setCharacterEncoding("euc-kr");
	String center = request.getParameter("center");
	//ó�� ���� �ÿ��� center���� �Ѿ���� �ʱ⿡ nulló��
	if (center == null) {
		center = "Center.jsp"; //����Ʈ center�� �ο�
	}
	%>

	<table width="600" align="center">
		<!-- Top -->
		<tr height="150">
			<td align="center" colspan="2"><jsp:include page="Top.jsp" /></td>
		</tr>
		<!-- Center -->
		<td align="center" width="1000"><jsp:include page="<%=center%>" /></td>
		</tr>
		<!-- Bottom -->
		<tr height="100">
			<td align="center" colspan="2"><jsp:include page="Bottom.jsp" /></td>
		</tr>
	</table>
</body>
</html>