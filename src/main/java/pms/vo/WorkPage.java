package pms.vo;

import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

public class WorkPage {
	// 리스트
	private int mid;
	private int pid;
	private int jid;
	private int jmid;
	private int empno;
	private int cnt;
	private String iprogress;
	private String name;
	private int progress;
	private String jmstatus;
	private String jname;
	private Date jstart;
	private Date jend;
	private Date juptdate;
	private int iid;
	// 상세화면
	private String pname;
	private String content;
	// 파일내용
	private MultipartFile report;
	private String fname;
	private Date fregdate;
	private String path;
	private int fid;
	public WorkPage() {
		// TODO Auto-generated constructor stub
	}
	public WorkPage(int mid, int pid, int jid, String name, int progress, String jmstatus, String jname, Date jstart,
			Date jend, Date juptdate, String pname, String content, MultipartFile report, String fname, Date fregdate,
			String path, int fid,int jmid,int empno,int cnt,String iprogress,int iid) {
		this.mid = mid;
		this.pid = pid;
		this.jid = jid;
		this.name = name;
		this.progress = progress;
		this.jmstatus = jmstatus;
		this.jname = jname;
		this.jstart = jstart;
		this.jend = jend;
		this.juptdate = juptdate;
		this.pname = pname;
		this.content = content;
		this.report = report;
		this.fname = fname;
		this.fregdate = fregdate;
		this.path = path;
		this.fid = fid;
		this.jmid = jmid;
		this.empno = empno;
		this.cnt = cnt;
		this.iprogress = iprogress;
		this.iid = iid;
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
	public int getJid() {
		return jid;
	}
	public void setJid(int jid) {
		this.jid = jid;
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
	public Date getFregdate() {
		return fregdate;
	}
	public void setFregdate(Date fregdate) {
		this.fregdate = fregdate;
	}
	public String getPath() {
		return path;
	}
	public void setPath(String path) {
		this.path = path;
	}
	public int getFid() {
		return fid;
	}
	public void setFid(int fid) {
		this.fid = fid;
	}
	public int getJmid() {
		return jmid;
	}
	public void setJmid(int jmid) {
		this.jmid = jmid;
	}
	public int getEmpno() {
		return empno;
	}
	public void setEmpno(int empno) {
		this.empno = empno;
	}
	public int getCnt() {
		return cnt;
	}
	public void setCnt(int cnt) {
		this.cnt = cnt;
	}
	public String getIprogress() {
		return iprogress;
	}
	public void setIprogress(String iprogress) {
		this.iprogress = iprogress;
	}
	public int getIid() {
		return iid;
	}
	public void setIid(int iid) {
		this.iid = iid;
	}
	
	
}
