<%@page import="db.BasketBean"%>
<%@page import="java.util.Vector"%>
<%@page import="db.GameListBean"%>
<%@page import="db.GEMDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<body>

	<%
		request.setCharacterEncoding("euc-kr");
	GameListBean bean = null;
	GEMDAO gdao = new GEMDAO();

	//��ٱ��Ͽ��� �����ϱ� ��ư ������ �� �Ŵϱ� ��ٱ��� DB�� MyGame DB�� �ű� ��.
	Vector<BasketBean> v = gdao.BasketAllList();

	for (int i = 0; i < v.size(); i++) {
		//��ٱ��� v���� ���� �̸��� ����
		String gameName = v.get(i).getGameName();
		bean = gdao.getOneGame(gameName);
		//��ٱ��� DB�� ����
		gdao.setMyGameInsert(bean);
	}
	%>
	<script>
		alert("���� �Ϸ�");
		location.href = "MainPage.jsp?center=MyGameList.jsp";
	</script>
</body>
</html>