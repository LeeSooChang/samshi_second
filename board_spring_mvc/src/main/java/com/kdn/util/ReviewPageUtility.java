package com.kdn.util;

import javax.print.attribute.standard.PageRanges;

/**
 * JSP에서 데이터를 page navigation 형식으로 구성하기 위해 사용되는 클래스이다.
 */
public class ReviewPageUtility {
    int reviewfirstpagecount=0;
    int reviewlastpagecount=0;

    int reviewnextpagecount=0;				//다음 페이지
    int reviewbeforepagecount=0;			    //이전 페이지
    int reviewcurrentpagecount=0;			    //현재 페이지
	
    int reviewbeforetenpage=0;				//이전 페이지
    int reivewnexttenpage=0;					//다음 페이지

    int reivewtotalrowcount=0;				//총 row 개수
    int reviewtotalpagecount=0;				//총 페이지 수
    int reviewdisplayrowcount=0;				//한 페이지당 보여줄 개수
    int reviewpagePercount = 5;
    String reviewimagepath;
    String reviewsearch;
    /**
     * 현재페이지와 경로 한번에 보여줄 열의 갯수를 세팅하는 생성자
     * @param reviewdisplayrowcount 한 페이지에 보여줄 게시글 수
     * @param reivewtotalrowcount   조회해온 데이터의 전체 row수
     * @param reviewcurrentpagecount 현재 페이지 
     * @param reviewimagepath        이미지 경로 
     * @exception java.lang.Exception
     */
    public ReviewPageUtility(int reviewdisplayrowcount, int reivewtotalrowcount, int reviewcurrentpagecount, String reviewimagepath)
    {
        this.reviewdisplayrowcount = reviewdisplayrowcount;
        this.reivewtotalrowcount = reivewtotalrowcount;
        this.reviewcurrentpagecount = reviewcurrentpagecount;
        this.reviewimagepath = reviewimagepath	;
        this.reviewtotalpagecount=reivewtotalrowcount/reviewdisplayrowcount;
        if(reivewtotalrowcount%reviewdisplayrowcount!=0){
          this.reviewtotalpagecount++;
        }
        
    }
   
    public String getCurrentPageCount()
    {
        return String.valueOf(reviewcurrentpagecount);
    }
    /**
     * 목록에 출력할 page link를 구성한다.
     * @return 구성한 page 링크를 리턴
     */
    public String getPageBar()    {
  		
        StringBuffer sb=new StringBuffer();
        reviewfirstpagecount=((reviewcurrentpagecount-1)/reviewpagePercount*reviewpagePercount)+1;
        reviewlastpagecount=reviewfirstpagecount+reviewpagePercount;

        reviewbeforetenpage=reviewfirstpagecount-reviewpagePercount;
        reviewbeforetenpage= reviewbeforetenpage<1?1:reviewbeforetenpage;
        reivewnexttenpage=reviewlastpagecount;
        
        if(reviewbeforetenpage<1)     reviewbeforetenpage=1;
        if(reivewnexttenpage>reviewtotalpagecount)
            reivewnexttenpage=(((reviewtotalpagecount-1)/reviewpagePercount)+1)*reviewpagePercount;
        if(reviewlastpagecount>reviewtotalpagecount)
            reviewlastpagecount = reviewtotalpagecount+1;
		
        if(reviewfirstpagecount>reviewpagePercount)
            sb.append(" <a href='javascript:reviewPagelist("+reviewbeforetenpage+")' class='glyphicon glyphicon-chevron-left'></a>&nbsp;&nbsp;");
        else
            sb.append("<a href='#about' class='glyphicon glyphicon-chevron-left' border='0'  align=absmiddle></a>&nbsp;&nbsp;");

        if(((reviewcurrentpagecount-1)/reviewpagePercount*reviewpagePercount)+1>reviewbeforetenpage)
            sb.append("<a href='javascript:reviewPagelist("+ reviewbeforetenpage+")' class='glyphicon glyphicon-triangle-left'></a>&nbsp;&nbsp;");
        else
            sb.append("<a href='#about' class='glyphicon glyphicon-triangle-left' border='0'   align=absmiddle></a>&nbsp;&nbsp;");

        for (int i = reviewfirstpagecount; i < reviewlastpagecount; i++)
        {
            if(i<=reviewtotalpagecount)
            {
                if (i == reviewcurrentpagecount)
                    sb.append("<b>" + i + "</b>");
                else
                    sb.append("<a href='javascript:reviewPagelist("+i+")'>" + i + "</a>");
                if( i !=reviewlastpagecount-1)
                    sb.append(" . ");
            }
        }

        if(reivewnexttenpage<((reviewtotalpagecount-1)/reviewpagePercount+1)*reviewpagePercount)
            sb.append("&nbsp;&nbsp;<a href='javascript:reviewPagelist("+ (reivewnexttenpage)+ ")' class='glyphicon glyphicon-triangle-right'></a>");
        else
            sb.append("&nbsp;&nbsp;<a href='#about' border='0' hspace='3' align=absmiddle class='glyphicon glyphicon-triangle-right'></a>");

        if((((reviewcurrentpagecount-1)/reviewpagePercount)+1)*reviewpagePercount < reivewnexttenpage)
            sb.append("&nbsp;&nbsp;<a href='javascript:reviewPagelist("+ (reivewnexttenpage)+")' class='glyphicon glyphicon-chevron-right'></a>");
        else
            sb.append("&nbsp;&nbsp;<a href='#about border='0' align=absmiddle class='glyphicon glyphicon-chevron-right'></a>");
        return sb.toString();
    }
    public String getTotalpagecount() {       
    	return String.valueOf(reviewtotalpagecount);
    }
}