package pms.dto;

import java.util.Date;

public class IssueDashDto {
    private int iid;
    private String jname;
    private String ititle;
    private String iprogress;
    private String name;
    private Date iuptdate;

    // 페이징 처리
    private int count; // 총데이터 건수
    private int pageSize; // 한번에 보여줄 페이지 크기
    private int pageCount; // 총 페이지 수
    private int curPage; // 클릭한 현재 페이지 번호
    private int start; // 시작번호(현재페이지)
    private int end; // 마지막 번호(현재페이지)
    private int blockSize; // 한번에 보여줄 block의 크기
    private int startBlock; // block의 시작번호
    private int endBlock; // block의 마지막번호

    public IssueDashDto() {
    }

    public IssueDashDto(int iid, String jname, String ititle, String iprogress, String name, Date iuptdate) {
        this.iid = iid;
        this.jname = jname;
        this.ititle = ititle;
        this.iprogress = iprogress;
        this.name = name;
        this.iuptdate = iuptdate;
    }

    public int getCount() {
        return count;
    }

    public void setCount(int count) {
        this.count = count;
    }

    public int getPageSize() {
        return pageSize;
    }

    public void setPageSize(int pageSize) {
        this.pageSize = pageSize;
    }

    public int getPageCount() {
        return pageCount;
    }

    public void setPageCount(int pageCount) {
        this.pageCount = pageCount;
    }

    public int getCurPage() {
        return curPage;
    }

    public void setCurPage(int curPage) {
        this.curPage = curPage;
    }

    public int getStart() {
        return start;
    }

    public void setStart(int start) {
        this.start = start;
    }

    public int getEnd() {
        return end;
    }

    public void setEnd(int end) {
        this.end = end;
    }

    public int getBlockSize() {
        return blockSize;
    }

    public void setBlockSize(int blockSize) {
        this.blockSize = blockSize;
    }

    public int getStartBlock() {
        return startBlock;
    }

    public void setStartBlock(int startBlock) {
        this.startBlock = startBlock;
    }

    public int getEndBlock() {
        return endBlock;
    }

    public void setEndBlock(int endBlock) {
        this.endBlock = endBlock;
    }

    public int getIid() {
        return iid;
    }

    public void setIid(int iid) {
        this.iid = iid;
    }

    public String getJname() {
        return jname;
    }

    public void setJname(String jname) {
        this.jname = jname;
    }

    public String getItitle() {
        return ititle;
    }

    public void setItitle(String ititle) {
        this.ititle = ititle;
    }

    public String getIprogress() {
        return iprogress;
    }

    public void setIprogress(String iprogress) {
        this.iprogress = iprogress;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Date getIuptdate() {
        return iuptdate;
    }

    public void setIuptdate(Date iuptdate) {
        this.iuptdate = iuptdate;
    }
}
