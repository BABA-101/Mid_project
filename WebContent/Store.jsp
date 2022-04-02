<%@page import="db.GameListBean"%>
<%@page import="java.util.Vector"%>
<%@page import="db.GEMDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<style>
.myButton1 {
	box-shadow: 4px -2px 0px 0px #050505;
	background-color: #000000;
	border-radius: 8px;
	border: 2px solid #474747;
	display: inline-block;
	cursor: pointer;
	color: #ffffff;
	font-family: ���׷� �޷γ�ü;
	font-size: 12px;
	padding: 10px 10px;
	text-decoration: none;
	text-shadow: 0px 0px 0px #000000;
}

.myButton1:hover {
	background-color: #6b6b6b;
}

.myButton1:active {
	position: relative;
	top: 1px;
}

.myButton2 {
	box-shadow: 4px -2px 0px 0px #050505;
	background-color: #000000;
	border-radius: 8px;
	border: 2px solid #474747;
	display: inline-block;
	cursor: pointer;
	color: #ffffff;
	font-family: ���׷� �޷γ�ü;
	font-size: 12px;
	padding: 10px 60px;
	text-decoration: none;
	text-shadow: 0px 0px 0px #000000;
}

.myButton2:hover {
	background-color: #6b6b6b;
}

.myButton2:active {
	position: relative;
	top: 1px;
}

select {
	width: 200px;
	padding: .8em .5em;
	border: 1px solid #999;
	font-family: inherit;
	background: url('img/arrow.jpg') no-repeat 95% 50%;
	border-radius: 0px;
	-webkit-appearance: none;
	-moz-appearance: none;
	appearance: none;
}
</style>
<body>
	<!--  ������ ���̽��� �����Ͽ� �ֽż� ���� �ѷ��ִ� ������ ������. -->
	<%
		GEMDAO gdao = new GEMDAO();
	//���͸� �̿��Ͽ� ������ ����
	Vector<GameListBean> v = gdao.SelectGame();
	%>

	<h1>�ű� �α� ���� Top3</h1>
	<table width="1000" align="center">
		<tr height="240">
			<%
				for (int i = 0; i < v.size(); i++) {
				GameListBean bean = v.get(i);
			%>
			<td with="330" align="center"><a
				href="MainPage.jsp?center=GameInfo.jsp?gameName=<%=bean.getGameName()%>">
					<img alt="" src="img/<%=bean.getImg()%>" width="300" height="220">
			</a>
				<p>
					<font> ���Ӹ�: <%=bean.getGameName()%>
					</font></td>

			<%
				}
			%>
		</tr>
	</table>

	<p>
	<center>
		<font size="4" color="#FFFFFF"> ���� �˻� �ϱ�</font>
		<form action="MainPage.jsp?center=GameTypeList.jsp" method="post">
			<font size="3"><b>���� �˻� �ϱ�</b></font> &nbsp;&nbsp; <select
				name="gameType">
				<option value="">ī�װ��� �����ϼ���</option>
				<option value="ĳ�־�">ĳ�־�</option>
				<option value="����">����</option>
				<option value="�ε�">�ε�</option>
				<option value="��庥ó">��庥ó</option>
				<option value="�׼�">�׼�</option>
				<option value="������">������</option>
				<option value="���÷���">���÷���</option>
			</select>&nbsp;&nbsp;

			<!-- ������ ���� ���� ����� -->
			<input type="submit" value="�˻�" class="myButton1">
			&nbsp;&nbsp;
		</form>
		<!-- ��ư�� ���� ���Խ�Ű�� �ʴ� ������, ��ư ������ �� form action ������� �ʰ� �ϱ� ���� -->
		<p>
			<button onclick="location.href='MainPage.jsp?center=GameAllList.jsp'"
				class="myButton2">��ü����</button>
	</center>
	<p>
</body>
</html>

