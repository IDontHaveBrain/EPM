package pms.vo;

import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

public class WorkPage {
	// 리스트
	private int mid;
	private int pid;
	private String name;
	private int progress;
	private String jmstatus;
	private String jname;
	private Date jstart;
	private Date jend;
	private Date juptdate;
	// 상세화면
	private String pname;
	private String content;
	// 파일내용
	private MultipartFile report;
	private String fname;
	private Date fregdate;
	public WorkPage() {
		// TODO Auto-generated constructor stub
	}

	public WorkPage(int mid, int pid, String name, int progress, String jmstatus, String jname, Date jstart, Date jend,
			MultipartFile report, String fname,Date juptdate,String pname,String content,Date fregdate) {
		this.mid = mid;
		this.pid = pid;
		this.name = name;
		this.progress = progress;
		this.jmstatus = jmstatus;
		this.jname = jname;
		this.jstart = jstart;
		this.jend = jend;
		this.report = report;
		this.fname = fname;
		this.fregdate = fregdate;
		this.juptdate = juptdate;
		this.pname = pname;
		this.content = content;
	}

	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getProgress() {
		return progress;
	}
	public void setProgress(int progress) {
		this.progress = progress;
	}
	public String getJmstatus() {
		return jmstatus;
	}
	public void setJmstatus(String jmstatus) {
		this.jmstatus = jmstatus;
	}
	public String getJname() {
		return jname;
	}
	public void setJname(String jname) {
		this.jname = jname;
	}
	public Date getJstart() {
		return jstart;
	}
	public void setJstart(Date jstart) {
		this.jstart = jstart;
	}
	public Date getJend() {
		return jend;
	}
	public void setJend(Date jend) {
		this.jend = jend;
	}
	public MultipartFile getReport() {
		return report;
	}
	public void setReport(MultipartFile report) {
		this.report = report;
	}
	public String getFname() {
		return fname;
	}
	public void setFname(String fname) {
		this.fname = fname;
	}

	public int getMid() {
		return mid;
	}

	public void setMid(int mid) {
		this.mid = mid;
	}

	public int getPid() {
		return pid;
	}

	public void setPid(int pid) {
		this.pid = pid;
	}

	public Date getJuptdate() {
		return juptdate;
	}

	public void setJuptdate(Date juptdate) {
		this.juptdate = juptdate;
	}

	public String getPname() {
		return pname;
	}

	public void setPname(String pname) {
		this.pname = pname;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Date getFregdate() {
		return fregdate;
	}

	public void setFregdate(Date fregdate) {
		this.fregdate = fregdate;
	}
	
	
	
}
