<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
 <style type="text/css">
body {
	font-family: '���׷� �޷γ�ü';
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

table {
	border-collapse: collapse;
}

.table{
	border-left: hidden;
	border-right: hidden;
	border-bottom: hidden;
}
</style>
</head>
<body>
	<center><h2>ȸ�� ����</h2></center>

	<form action="MemberJoinProc.jsp" method="post">
		<table border="1" align="center">
			<tr height="50">
				<td width="150" align="center">���̵�</td>
				<td width="350" align="center"><input type="text" name="id"
					size="40" placeholder="ID�� �Է����ּ���."></td>
			</tr>
			<tr height="50">
				<td width="150" align="center">�н�����</td>
				<td width="350" align="center"><input type="password"
					name="pass1" size="40" placeholder="������ ���ڸ� �Է����ּ���."></td>
			</tr>
			<tr height="50">
				<td width="150" align="center">�н����� Ȯ��</td>
				<td width="350" align="center"><input type="password"
					name="pass2" size="40"></td>
			</tr>
			<tr height="50">
				<td width="150" align="center">�̸���</td>
				<td width="350" align="center"><input type="email" name="email"
					size="40"></td>
			</tr>
			<tr height="50">
				<td width="150" align="center">��ȭ��ȣ</td>
				<td width="350" align="center"><input type="tel" name="tel"
					size="40"></td>
			</tr>
			<tr height="50">
				<td width="150" align="center">�ּ�</td>
				<td width="350" align="center"><input type="text"
					name="address" size="40"></td>
			</tr>
			<tr height="50" >
				<td align="center" colspan="2"  class="table">
				<br>
					<input type="submit" value="ȸ�� ����" class="myButton2" ></td>
			</tr>
		</table>
	</form>
</body>
</html>