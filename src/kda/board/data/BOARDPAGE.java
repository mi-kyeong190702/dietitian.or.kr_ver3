package kda.board.data;


public class BOARDPAGE 
{
	private int pageLimit = 10;
	private int totalBoardCnt =0;
	
	private int firstPage= 1;
	private int startPage= 0;
	private int prevPage = 0;
	private int curPage  = 0;
	private int endPage  = 0;
	private int nextPage = 0;
	private int lastPage = 0;
	
	public BOARDPAGE(int curPage, int totalBoardCnt) {
		initBoard(curPage, totalBoardCnt, this.pageLimit);
	}
	
	public BOARDPAGE(int curPage, int totalBoardCnt, int pageLimit){
		initBoard(curPage, totalBoardCnt, pageLimit);
	}
	
	public void initBoard(int curPage, int totalBoardCnt, int pageLimit) {
		this.curPage = curPage;
		this.totalBoardCnt = totalBoardCnt;
		this.pageLimit = pageLimit;
		
		if(totalBoardCnt%this.pageLimit == 0) 
			this.lastPage = totalBoardCnt/this.pageLimit;
		else 
			this.lastPage = totalBoardCnt/this.pageLimit + 1;
		
		this.startPage = ((curPage-1)/this.pageLimit)*this.pageLimit+1;
		this.endPage = startPage + this.pageLimit - 1;
		
		if (this.curPage - this.pageLimit < 0)
			this.prevPage = 1;
		else
			this.prevPage = this.curPage - this.pageLimit;
		
		if ( this.nextPage + this.pageLimit > this.lastPage)
			this.nextPage = this.lastPage;
		else
			this.nextPage = this.curPage + this.pageLimit;
		
		if(endPage > this.lastPage) 
			this.endPage = this.lastPage;
	}

	public int getPageLimit() {
		return pageLimit;
	}

	public void setPageLimit(int pageLimit) {
		this.pageLimit = pageLimit;
	}
	
	public int getTotalBoardCnt() {
		return totalBoardCnt;
	}

	public void setTotalBoardCnt(int totalBoardCnt) {
		this.totalBoardCnt = totalBoardCnt;
	}
	
	public int getFirstPage() {
		return firstPage;
	}

	public void setFirstPage(int firstPage) {
		this.firstPage = firstPage;
	}	
	
	public int getStartPage() {
		return startPage;
	}

	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}
	
	public int getPrevPage() {
		return prevPage;
	}

	public void setPrevPage(int prevPage) {
		this.prevPage = prevPage;
	}
	
	public int getCurPage() {
		return curPage;
	}

	public void setCurPage(int curPage) {
		this.curPage = curPage;
	}

	public int getEndPage() {
		return endPage;
	}

	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}
	
	public int getNextPage() {
		return nextPage;
	}

	public void setNextPage(int nextPage) {
		this.nextPage = nextPage;
	}
	
	public int getLastPage() {
		return lastPage;
	}
	
	public void setLastPage(int lastPage) {
		this.lastPage = lastPage;
	}
}
