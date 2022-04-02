package db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Vector;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class GEMDAO {

	Connection con;
	PreparedStatement pstmt;
	ResultSet rs;
	Vector<GameListBean> v = null;

	// Ŀ�ؼ� Ǯ�� �̿��� db ����
	public void getCon() {
		try {
			Context initctx = new InitialContext();
			Context envctx = (Context) initctx.lookup("java:comp/env");
			DataSource ds = (DataSource) envctx.lookup("jdbc/pool");
			con = ds.getConnection();
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("�����ͺ��̽��� ���� ����");
		}

	}

	// �ֽż� ������ �����ϴ� �޼ҵ�
	public Vector<GameListBean> SelectGame() {
		getCon();
		Vector<GameListBean> v = new Vector<>();

		try {
			String sql = "select * from game order by release desc";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			int count = 0;

			while (rs.next()) {
				GameListBean bean = new GameListBean();
				bean.setGameName(rs.getString(1));
				bean.setPrice(rs.getInt(2));
				bean.setGameInfo(rs.getString(3));
				bean.setGameType(rs.getString(4));
				bean.setRelease(rs.getInt(5));
				bean.setDeveloper(rs.getString(6));
				bean.setEvaluation(rs.getString(7));
				bean.setImg(rs.getString(8));

				v.add(bean);
				count++;
				if (count > 2)
					break;
			}
			con.close();
		} catch (Exception e) {
			e.getStackTrace();
		}
		return v;
	}

	// ī�װ��� ���� ����Ʈ �����ϴ� �޼ҵ�
	public Vector<GameListBean> getTypeGame(String type) {
		getCon();
		Vector<GameListBean> v = new Vector<>();
		GameListBean bean = null;

		try {
			String sql = "select *from game where gameType=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, type);
			rs = pstmt.executeQuery();

			// �ݺ��� ���鼭 ������ ����
			while (rs.next()) {
				bean = new GameListBean();
				bean.setGameName(rs.getString(1));
				bean.setPrice(rs.getInt(2));
				bean.setGameInfo(rs.getString(3));
				bean.setGameType(rs.getString(4));
				bean.setRelease(rs.getInt(5));
				bean.setDeveloper(rs.getString(6));
				bean.setEvaluation(rs.getString(7));
				bean.setImg(rs.getString(8));
				// ���Ϳ� beanŬ���� ����
				v.add(bean);
			}
			con.close();
		} catch (Exception e) {
			e.getStackTrace();
		}

		return v;
	}
	


	// ��� ������ �˻��ϴ� �޼ҵ�
	public Vector<GameListBean> getAllGame() {
		Vector<GameListBean> v = new Vector<>();
		// ������ ������ bean Ŭ���� ����
		// ���������� null�� �ʱ�ȭ
		GameListBean bean = null;
		getCon();

		try {
			String sql = "select *from game";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();

			// �ݺ��� ���鼭 ������ ����
			while (rs.next()) {
				bean = new GameListBean();
				bean.setGameName(rs.getString(1));
				bean.setPrice(rs.getInt(2));
				bean.setGameInfo(rs.getString(3));
				bean.setGameType(rs.getString(4));
				bean.setRelease(rs.getInt(5));
				bean.setDeveloper(rs.getString(6));
				bean.setEvaluation(rs.getString(7));
				bean.setImg(rs.getString(8));
				// ���Ϳ� beanŬ���� ����
				v.add(bean);
			}
			con.close();
		} catch (Exception e) {
			e.getStackTrace();
		}

		return v;
	}

	// �ϳ��� ���� ������ �����ϴ� �޼ҵ�
	public GameListBean getOneGame(String gameName) {
		GameListBean bean = new GameListBean();
		getCon();

		try {
			String sql = "select *from game where gameName=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, gameName);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				bean.setGameName(rs.getString(1));
				bean.setPrice(rs.getInt(2));
				bean.setGameInfo(rs.getString(3));
				bean.setGameType(rs.getString(4));
				bean.setRelease(rs.getInt(5));
				bean.setDeveloper(rs.getString(6));
				bean.setEvaluation(rs.getString(7));
				bean.setImg(rs.getString(8));
			}
			con.close();
		} catch (Exception e) {
			e.getStackTrace();
		}

		return bean;
	}

	// ��ٱ��Ͽ� �ϳ��� ���� �߰�
	public void setBasketInsert(GameListBean bean) {

		try {
			getCon();
			String sql = "insert into basket values(?,?,?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, bean.getGameName());
			pstmt.setInt(2, bean.getPrice());
			pstmt.setString(3, bean.getImg());
			pstmt.executeUpdate();

			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	// ��ٱ��� ��� ���
	public Vector<BasketBean> BasketAllList() {
		Vector<BasketBean> v = new Vector<>();
		BasketBean bean = null;
		getCon();

		try {
			String sql = "select *from basket";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				bean = new BasketBean();
				bean.setGameName(rs.getString(1));
				bean.setPrice(rs.getInt(2));
				bean.setImg(rs.getString(3));
				v.add(bean);
			}
			con.close();
		} catch (Exception e) {
			e.getStackTrace();
		}
		return v;
	}

	// ��ٱ��� �ʱ�ȭ
	public void BasketALLClean() {
		getCon();
		try {
			String sql = "truncate table basket";
			pstmt = con.prepareStatement(sql);
			pstmt.executeUpdate();

			con.close();
		} catch (Exception e) {
			e.getStackTrace();
		}
	}

	// ������ ������ �� ���� ������ ���̽��� ����.
	public void setMyGameInsert(GameListBean bean) {

		try {
			getCon();
			String sql = "insert into Mygame values(?,?,?,?,?,?,?,?)";
			pstmt = con.prepareStatement(sql);

			pstmt.setString(1, bean.getGameName());
			pstmt.setInt(2, bean.getPrice());
			pstmt.setString(3, bean.getGameInfo());
			pstmt.setString(4, bean.getGameType());
			pstmt.setInt(5, bean.getRelease());
			pstmt.setString(6, bean.getDeveloper());
			pstmt.setString(7, bean.getEvaluation());
			pstmt.setString(8, bean.getImg());

			pstmt.executeUpdate();

			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	// �� ���� ��� ���
	public Vector<GameListBean> MyGameAllList() {
		Vector<GameListBean> v = new Vector<>();
		GameListBean bean = null;
		getCon();

		try {
			String sql = "select *from mygame";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				bean = new GameListBean();
				bean.setGameName(rs.getString(1));
				bean.setPrice(rs.getInt(2));
				bean.setGameInfo(rs.getString(3));
				bean.setGameType(rs.getString(4));
				bean.setRelease(rs.getInt(5));
				bean.setDeveloper(rs.getString(6));
				bean.setEvaluation(rs.getString(7));
				bean.setImg(rs.getString(8));
				v.add(bean);
			}
			con.close();
		} catch (Exception e) {
			e.getStackTrace();
		}
		return v;
	}

	// �α׾ƿ��ϸ� ���� �� ��������
	public void MyGameALLClean() {
		getCon();
		try {
			String sql = "truncate table MyGame";
			pstmt = con.prepareStatement(sql);
			pstmt.executeUpdate();

			con.close();
		} catch (Exception e) {
			e.getStackTrace();
		}
	}

	// ��ٱ��� �׸� ���� �޼ҵ�
	public void BasketRemove(String gameName) {
		getCon();
		try {
			
			String sql = "delete from basket where gameName=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, gameName);
			pstmt.executeUpdate();
			
			con.close();
		} catch (Exception e) {
			e.getStackTrace();
		}
		}
}
