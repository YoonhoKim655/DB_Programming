package updateBean;
import java.sql.*;
import java.util.*;
import javax.sql.*;
import oracle.jdbc.driver.*;
import oracle.jdbc.pool.*;
import updateBean.*;

public class UpdateMgr {

	private OracleConnectionPoolDataSource ocpds = null;
	private PooledConnection pool = null;

	public UpdateMgr() {
		try {

			ocpds = new OracleConnectionPoolDataSource();

			ocpds.setURL("jdbc:oracle:thin:@210.94.199.20:1521:dblab");
			ocpds.setUser("ST2016112166");
			ocpds.setPassword("ST2016112166");

			pool = ocpds.getPooledConnection();
		} catch (Exception e) {
			System.out.println("Error : Connection Failed");
		}
	}

	public Vector getUpdateList(String s_id) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Vector vecList = new Vector();

		try {
			conn = pool.getConnection();

			String mySQL = "select s_name s_name, s_addr s_addr, s_pwd s_pwd, s_college s_college, s_major s_major from student where s_id=?" ;
			pstmt = conn.prepareStatement(mySQL);
			pstmt.setString(1, s_id);
			
			rs = pstmt.executeQuery();

			while (rs.next()) {
				Update up = new Update();
				up.setS_name(rs.getString("s_name"));
				up.setS_addr(rs.getString("s_addr"));
				up.setS_pwd(rs.getString("s_pwd"));
				up.setS_college(rs.getString("s_college"));
				up.setS_major(rs.getString("s_major"));
				vecList.add(up);
			}
			pstmt.close();
			conn.close();

		} catch (Exception ex) {
			System.out.println("Exception" + ex);
		}

		return vecList;
	}
}