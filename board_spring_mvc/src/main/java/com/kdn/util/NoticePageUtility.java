package com.kdn.util;

import javax.print.attribute.standard.PageRanges;

/**
 * JSP에서 데이터를 page navigation 형식으로 구성하기 위해 사용되는 클래스이다.
 */
public class NoticePageUtility {
    int noticefirstpagecount=0;
    int noticelastpagecount=0;

    int noticenextpagecount=0;				//다음 페이지
    int noticebeforepagecount=0;			    //이전 페이지
    int noticecurrentpagecount=0;			    //현재 페이지
	
    int noticebeforetenpage=0;				//이전 페이지
    int noticenexttenpage=0;					//다음 페이지

    int noticetotalrowcount=0;				//총 row 개수
    int noticetotalpagecount=0;				//총 페이지 수
    int noticedisplayrowcount=0;				//한 페이지당 보여줄 개수
    int noticepagePercount = 5;
    String noticeimagepath;
    String noticesearch;
    /**
     * 현재페이지와 경로 한번에 보여줄 열의 갯수를 세팅하는 생성자
     * @param noticedisplayrowcount  한 페이지에 보여줄 게시글 수
     * @param noticetotalrowcount    조회해온 데이터의 전체 row수
     * @param noticecurrentpagecount 현재 페이지 
     * @param noticeimagepath        이미지 경로 
     * @exception java.lang.Exception
     */
    public NoticePageUtility(int noticedisplayrowcount, int noticetotalrowcount, int noticecurrentpagecount, String noticeimagepath)
    {
        this.noticedisplayrowcount = noticedisplayrowcount;
        this.noticetotalrowcount = noticetotalrowcount;
        this.noticecurrentpagecount = noticecurrentpagecount;
        this.noticeimagepath = noticeimagepath	;
        this.noticetotalpagecount=noticetotalrowcount/noticedisplayrowcount;
        if(noticetotalrowcount%noticedisplayrowcount!=0){
          this.noticetotalpagecount++;
        }
        
    }
   
    public String getCurrentPageCount()
    {
        return String.valueOf(noticecurrentpagecount);
    }
    /**
     * 목록에 출력할 page link를 구성한다.
     * @return 구성한 page 링크를 리턴
     */
    public String getPageBar()    {
  		
        StringBuffer sb=new StringBuffer();
        noticefirstpagecount=((noticecurrentpagecount-1)/noticepagePercount*noticepagePercount)+1;
        noticelastpagecount=noticefirstpagecount+noticepagePercount;

        noticebeforetenpage=noticefirstpagecount-noticepagePercount;
        noticebeforetenpage= noticebeforetenpage<1?1:noticebeforetenpage;
        noticenexttenpage=noticelastpagecount;
        
        if(noticebeforetenpage<1)     noticebeforetenpage=1;
        if(noticenexttenpage>noticetotalpagecount)
            noticenexttenpage=(((noticetotalpagecount-1)/noticepagePercount)+1)*noticepagePercount;
        if(noticelastpagecount>noticetotalpagecount)
            noticelastpagecount = noticetotalpagecount+1;
		
        if(noticefirstpagecount>noticepagePercount)
            sb.append(" <a href='javascript:noticePagelist("+noticebeforetenpage+")' class='glyphicon glyphicon-chevron-left'></a>&nbsp;&nbsp;");
        else
            sb.append("<a href='#news' border='0'  align=absmiddle class='glyphicon glyphicon-chevron-left'></a>&nbsp;&nbsp;");

        if(((noticecurrentpagecount-1)/noticepagePercount*noticepagePercount)+1>noticebeforetenpage)
            sb.append("<a href='javascript:noticePagelist("+ noticebeforetenpage+")' class='glyphicon glyphicon-triangle-left'></a>&nbsp;&nbsp;");
        else
            sb.append("<a href='#news' border='0'   align=absmiddle class='glyphicon glyphicon-triangle-left'></a>&nbsp;&nbsp;");

        for (int i = noticefirstpagecount; i < noticelastpagecount; i++)
        {
            if(i<=noticetotalpagecount)
            {
                if (i == noticecurrentpagecount)
                    sb.append("<b>" + i + "</b>");
                else
                    sb.append("<a href='javascript:noticePagelist("+i+")'>" + i + "</a>");
                if( i !=noticelastpagecount-1)
                    sb.append(" . ");
            }
        }

        if(noticenexttenpage<((noticetotalpagecount-1)/noticepagePercount+1)*noticepagePercount)
            sb.append("&nbsp;&nbsp;<a href='javascript:noticePagelist("+ (noticenexttenpage)+ ")' class='glyphicon glyphicon-triangle-right'></a>");
        else
            sb.append("&nbsp;&nbsp;<a href='#news' border='0' hspace='3' align=absmiddle class='glyphicon glyphicon-triangle-right'></a>");

        if((((noticecurrentpagecount-1)/noticepagePercount)+1)*noticepagePercount < noticenexttenpage)
            sb.append("&nbsp;&nbsp;<a href='javascript:noticePagelist("+ (noticenexttenpage)+")' class='glyphicon glyphicon-chevron-right'></a>");
        else
            sb.append("&nbsp;&nbsp;<a href='#news' border='0' align=absmiddle class='glyphicon glyphicon-chevron-right'></a>");
        return sb.toString();
    }
    public String getTotalPageCount() {       
    	return String.valueOf(noticetotalpagecount);
    }
}