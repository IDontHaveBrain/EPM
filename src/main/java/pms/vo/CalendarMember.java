package pms.vo;

import java.util.Date;

// springweb.a02_mvc.a04_vo.Calendar
public class CalendarMember {
	private int mcid;
	private int mid;
	private String title;
	private Date cstart;
	private Date cend;
	private String content;
	private String bordercolor;
	private String backgroundcolor;
	private String textcolor;
	private int allday;

	public CalendarMember() {
	}

	public CalendarMember(int mcid, int mid, String title, Date cstart, Date cend, String content, String bordercolor, String backgroundcolor, String textcolor, int allday) {
		this.mcid = mcid;
		this.mid = mid;
		this.title = title;
		this.cstart = cstart;
		this.cend = cend;
		this.content = content;
		this.bordercolor = bordercolor;
		this.backgroundcolor = backgroundcolor;
		this.textcolor = textcolor;
		this.allday = allday;
	}

	public int getMcid() {
		return mcid;
	}

	public void setMcid(int mcid) {
		this.mcid = mcid;
	}

	public int getMid() {
		return mid;
	}

	public void setMid(int mid) {
		this.mid = mid;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public Date getCstart() {
		return cstart;
	}

	public void setCstart(Date cstart) {
		this.cstart = cstart;
	}

	public Date getCend() {
		return cend;
	}

	public void setCend(Date cend) {
		this.cend = cend;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getBordercolor() {
		return bordercolor;
	}

	public void setBordercolor(String bordercolor) {
		this.bordercolor = bordercolor;
	}

	public String getBackgroundcolor() {
		return backgroundcolor;
	}

	public void setBackgroundcolor(String backgroundcolor) {
		this.backgroundcolor = backgroundcolor;
	}

	public String getTextcolor() {
		return textcolor;
	}

	public void setTextcolor(String textcolor) {
		this.textcolor = textcolor;
	}

	public int getAllday() {
		return allday;
	}

	public void setAllday(int allday) {
		this.allday = allday;
	}
}
