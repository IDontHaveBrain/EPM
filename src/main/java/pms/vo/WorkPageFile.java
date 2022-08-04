package pms.vo;

import java.util.Date;

public class WorkPageFile {
	private int fid;
	private String path;
	private String fname;
	private Date fregdate;
	private int jmid;
	public WorkPageFile() {
		// TODO Auto-generated constructor stub
	}
	
	public WorkPageFile(String path, String fname) {
		this.path = path;
		this.fname = fname;
	}

	public WorkPageFile(int fid, String path, String fname, Date fregdate, int jmid) {
		this.fid = fid;
		this.path = path;
		this.fname = fname;
		this.fregdate = fregdate;
		this.jmid = jmid;
	}
	public int getFid() {
		return fid;
	}
	public void setFid(int fid) {
		this.fid = fid;
	}
	public String getPath() {
		return path;
	}
	public void setPath(String path) {
		this.path = path;
	}
	public String getFname() {
		return fname;
	}
	public void setFname(String fname) {
		this.fname = fname;
	}
	public Date getFregdate() {
		return fregdate;
	}
	public void setFregdate(Date fregdate) {
		this.fregdate = fregdate;
	}
	public int getJmid() {
		return jmid;
	}
	public void setJmid(int jmid) {
		this.jmid = jmid;
	}

	
}