package eduBean;

import java.sql.*;
import java.util.*;
import javax.sql.*;
import oracle.jdbc.driver.*;
import oracle.jdbc.pool.*;
import eduBean.*;

public class GradeMgr {

	private OracleConnectionPoolDataSource ocpds = null;
	private PooledConnection pool = null;

	public GradeMgr() {
		try{
			ocpds = new OracleConnectionPoolDataSource();

			ocpds.setURL("jdbc:oracle:thin:@210.94.199.20:1521:DBLAB");
			ocpds.setUser("���̵�");  // ���� ���̵�(ex.FE0000000000)
			ocpds.setPassword("�н�����");  // ���� �н�����(ex.FE0000000000)

			pool = ocpds.getPooledConnection();
		} catch(Exception e) {
			System.out.println("Error : Connection Failed");
		}
	}
	
	// ���� �⵵/�б⿡ ����ϰ� �ִ� ���ǰ����� �л� ���� ��ȸ
	public Vector getScoreList(String p_id, int nYear, int nSemester) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Vector vecList = new Vector();

		try {
			
			//��5-�롽
			
			while(rs.next()){
				Grade tr = new Grade();
				tr.setCId(rs.getString("cid"));
				tr.setCIdNo(rs.getInt("cid_no"));
				tr.setCName(rs.getString("cname"));
				tr.setSId(rs.getString("sid"));
				tr.setSName(rs.getString("sname"));
				tr.setEScore(rs.getInt("escore"));
				tr.setEGrade(rs.getString("egrade"));
				vecList.add(tr);
			}
			pstmt.close();
			conn.close();
		} catch(Exception ex) {
			System.out.println("Exception" + ex);
		}
		return vecList;
	}
	
	// �������
	public String setScore(String score, String sid, String cid, int cidno, int year, int semester) {
		String sMessage = null;
		Connection conn = null;
		CallableStatement cstmt = null;

		try {
			
			//��5-�졽
						
		} catch(SQLException ex) {
			if(ex.getErrorCode() == 20002) {
				sMessage = Integer.toString(ex.getErrorCode());
			}else if(ex.getErrorCode() == 20003) {
				sMessage = Integer.toString(ex.getErrorCode());
			}			
			System.out.println("Exception" + ex);
		} 
		return sMessage;		
	}
	
	// ���� �⵵ ��ȸ
	public int getCurrentYear() {
		int nYear = 0;
		Connection conn = null;
		CallableStatement cstmt = null;
		
		try {
			
			//��5-��
			
		} catch (Exception ex) {
			System.out.println("Exception" + ex);
		}
		return nYear;
	}
	
	// ���� �б� ��ȸ
	public int getCurrentSemester() {
		int nSemester=0;
		Connection conn = null;
		CallableStatement cstmt = null;

		try {
			
			//��5-�
						
		} catch (Exception ex) {
			System.out.println("Exception" + ex);
		}

		return nSemester;
	}
}
