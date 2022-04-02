package db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Vector;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

//����Ŭ ������ ���̽��� �����ϰ�
//select, insert, update, delete �۾��� �������ִ� Ŭ����
public class MemberDAO {

	Connection con;
	PreparedStatement pstmt;
	ResultSet rs;
	Vector<GameListBean> v = null;

	
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

	// ������ ���̽��� �� ����� ȸ�� ������ �������ִ� �޼ҵ�
	public void insertMember(MemberBean bean) {
		try {
			getCon();
			String sql = "insert into member values(?,?,?,?,?,?)";
			PreparedStatement pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, bean.getId());
			pstmt.setString(2, bean.getPass1());
			pstmt.setString(3, bean.getPass2());
			pstmt.setString(4, bean.getEmail());
			pstmt.setString(5, bean.getTel());
			pstmt.setString(6, bean.getAddress());

			pstmt.executeUpdate(); // insert, update, delete �� ����ϴ� �޼ҵ�.
			con.close();
		} catch (Exception e) {
			e.printStackTrace();		
		}
	}

	// �� ȸ���� ���� ���
	public MemberBean oneSelectMember(String id) {
		getCon();
		// �� ����� ���� ������ �����ϱ⿡ bean Ŭ���� ��ü ����
		MemberBean bean = new MemberBean();
		try {
			String sql = "select * from member where id=?"; // ����
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id); // 1�� ����ǥ�� id�� ����

			rs = pstmt.executeQuery();

			if (rs.next()) {
				bean.setId(rs.getString(1));
				bean.setPass1(rs.getString(2));
				bean.setPass2(rs.getString(3));
				bean.setEmail(rs.getString(4));
				bean.setTel(rs.getString(5));
				bean.setAddress(rs.getString(6));
			}
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return bean;
	}

	// �� ȸ���� ������ �����ϴ� �޼ҵ�
	public void updateMember(MemberBean bean) {
		getCon();
		
		try {
			String sql = "update member set email=?, tel=?, address=? where id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, bean.getEmail());
			pstmt.setString(2, bean.getTel());
			pstmt.setString(3, bean.getAddress());
			pstmt.setString(4, bean.getId());
			pstmt.executeUpdate();
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	// �� ȸ���� ������ �����ϴ� �޼ҵ�
	public void deleteMember(String id) {

		getCon();

		try {
			String sql = "delete from member where id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.executeUpdate();
			con.close();
		} catch (Exception e) {
			e.printStackTrace();

		}
	}

	//password�� ��� ��
	public String getPass(String id) {
		String pass = "";
		try {
			getCon();
			String sql = "select pass1 from member where id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				pass = rs.getString(1); // �н����� ���� ����� Į�� �ε����� 1����.
			}
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return pass;
	}
	
	// ȸ�� ������ �����ϴ��� ��
	public int getMember(String id, String pass) {
		int result = 0; // 0�̸� ȸ��X
		getCon();

		try {
			String sql = "select count(*) from member where id=? and pass1=?";
			pstmt = con.prepareStatement(sql);

			pstmt.setString(1, id);
			pstmt.setString(2, pass);

			rs = pstmt.executeQuery();

			if (rs.next()) {
				result = rs.getInt(1);
			}
			con.close();
		} catch (Exception e) {
			e.getStackTrace();
		}
		return result;
	}
}
