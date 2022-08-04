package pms.vo;

import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

public class WorkPage {
	private int jid;
	private String jname;
	private Date jstart;
	private Date jend;
	private Date realstart;
	private Date realend;
	private String content;
	private String jprogress;
	private Date jregdate;
	private Date juptdate;
	private int required;
	private int pid;
	// 파일내용
	private MultipartFile report;
	private String fname;
	public WorkPage() {
		// TODO Auto-generated constructor stub
	}
	public WorkPage(int jid, String jname, Date jstart, Date jend, Date realstart, Date realend, String content,
			String jprogress, Date jregdate, Date juptdate, int required, int pid) {
		this.jid = jid;
		this.jname = jname;
		this.jstart = jstart;
		this.jend = jend;
		this.realstart = realstart;
		this.realend = realend;
		this.content = content;
		this.jprogress = jprogress;
		this.jregdate = jregdate;
		this.juptdate = juptdate;
		this.required = required;
		this.pid = pid;
	}
	public int getJid() {
		return jid;
	}
	public void setJid(int jid) {
		this.jid = jid;
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
	public Date getRealstart() {
		return realstart;
	}
	public void setRealstart(Date realstart) {
		this.realstart = realstart;
	}
	public Date getRealend() {
		return realend;
	}
	public void setRealend(Date realend) {
		this.realend = realend;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getJprogress() {
		return jprogress;
	}
	public void setJprogress(String jprogress) {
		this.jprogress = jprogress;
	}
	public Date getJregdate() {
		return jregdate;
	}
	public void setJregdate(Date jregdate) {
		this.jregdate = jregdate;
	}
	public Date getJuptdate() {
		return juptdate;
	}
	public void setJuptdate(Date juptdate) {
		this.juptdate = juptdate;
	}
	public int getRequired() {
		return required;
	}
	public void setRequired(int required) {
		this.required = required;
	}
	public int getPid() {
		return pid;
	}
	public void setPid(int pid) {
		this.pid = pid;
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
	
	
}
