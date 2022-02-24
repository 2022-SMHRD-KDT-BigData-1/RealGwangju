package model;

public class Paging {
	 private int page =1; //���� ������ (get)
	    private int totalCount; //row ��ü�� �� (get)
	    private int beginPage;  //��� ����
	    private int endPage;    //��� ��
	    private int displayRow =9;  //�� �������� �� ���� �ο� (���� set)
	    private int displayPage =10;  //�� �������� �� ���� ������ (���� set)
	    boolean prev; //prev ��ư�� ���ϰ��� �Ⱥ��ϰ���
	    boolean next; //next ��ư�� ���ϰ��� �Ⱥ��ϰ���
	    
	    private int startNum = (page-1)*displayRow+1;
	    private int endNum =page*displayRow;
	    
	    
	    
	    public int getStartNum() {
	    	return startNum;
	    }
	    public int getEndNum() {
	    	return endNum;
	    }
	    public int getPage() {
	        return page;
	    }
	    public void setPage(int page) {
	        this.page = page;
	    }
	    public int getTotalCount() {
	        return totalCount;
	    }
	    public void setTotalCount(int totalCount) {
	        this.totalCount = totalCount;
	        paging();
	    }
	    public int getDisplayRow() {
	        return displayRow;
	    }
	    public void setDisplayRow(int displayRow) {
	        this.displayRow = displayRow;
	    }
	    public int getDisplayPage() {
	        return displayPage;
	    }
	    public void setDisplayPage(int displayPage) {
	        this.displayPage = displayPage;
	    }
	    public int getBeginPage() {
	        return beginPage;
	    }
	    public int getEndPage() {
	        return endPage;
	    }
	    public boolean isPrev() {
	        return prev;
	    }
	    public boolean isNext() {
	        return next;
	    }
	    private void paging(){
	        endPage = ((int)Math.ceil(page/(double)displayPage))*displayPage;
//	    or  endPage = (((page + (displayPage -1)) / displayPage) * displayPage;
	        beginPage = endPage - (displayPage - 1);
	        int totalPage = (int)Math.ceil(totalCount/(double)displayRow);
	        
	        if(totalPage < endPage){
	            endPage = totalPage;
	            next = false;
	        }else{
	            next = true;
	        }
	        prev = (beginPage==1)?false:true;//page�� 11�̻󿡸� ���´�.
//	        System.out.println("paging ��ü���� ---- ");
//	        System.out.println("endPage : " + endPage);
//	        System.out.println("beginPage : " + beginPage);
//	        System.out.println("endPage : " + endPage);
//	        System.out.println("totalPage : " + totalPage);
//	        System.out.println("---------------------");
	        
	    }
	}
	 


