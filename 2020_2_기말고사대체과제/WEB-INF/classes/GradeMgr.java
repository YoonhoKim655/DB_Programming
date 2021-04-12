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
			ocpds.setUser("아이디");  // 본인 아이디(ex.FE0000000000)
			ocpds.setPassword("패스워드");  // 본인 패스워드(ex.FE0000000000)

			pool = ocpds.getPooledConnection();
		} catch(Exception e) {
			System.out.println("Error : Connection Failed");
		}
	}
	
	// 현재 년도/학기에 담당하고 있는 강의과목의 학생 성적 조회
	public Vector getScoreList(String p_id, int nYear, int nSemester) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Vector vecList = new Vector();

		try {
			
			//【5-⑤】
			
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
	
	// 성적등록
	public String setScore(String score, String sid, String cid, int cidno, int year, int semester) {
		String sMessage = null;
		Connection conn = null;
		CallableStatement cstmt = null;

		try {
			
			//【5-⑥】
						
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
	
	// 현재 년도 조회
	public int getCurrentYear() {
		int nYear = 0;
		Connection conn = null;
		CallableStatement cstmt = null;
		
		try {
			
			//【5-⑦】
			
		} catch (Exception ex) {
			System.out.println("Exception" + ex);
		}
		return nYear;
	}
	
	// 현재 학기 조회
	public int getCurrentSemester() {
		int nSemester=0;
		Connection conn = null;
		CallableStatement cstmt = null;

		try {
			
			//【5-⑧】
						
		} catch (Exception ex) {
			System.out.println("Exception" + ex);
		}

		return nSemester;
	}
}
