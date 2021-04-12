package updateBean;

public class Update {
	private String s_name;
	private String s_addr;
	private String s_pwd;
	private String s_college;
	private String s_major;

	public Update() {
		s_name = null;
		s_addr= null;
		s_pwd= null;
		s_college= null;
		s_major= null;
	}

	public void setS_name(String s_name) {
		this.s_name = s_name;
	}

	public void setS_addr(String s_addr) {
		this.s_addr = s_addr;
	}

	public void setS_pwd(String s_pwd) {
		this.s_pwd = s_pwd;
	}
	
	public void setS_major(String s_major) {
		this.s_major = s_major;
	}
	
	public void setS_college(String s_college) {
		this.s_college = s_college;
	}
	
	public String getS_name() {
		return s_name;
	}

	public String getS_addr() {
		return s_addr;
	}

	public String getS_pwd() {
		return s_pwd;
	}

	public String getS_major() {
		return s_major;
	}

	public String getS_college() {
		return s_college;
	}
}
