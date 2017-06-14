package com.kdn.util;

import javax.print.attribute.standard.PageRanges;

/**
 * JSP에서 데이터를 page navigation 형식으로 구성하기 위해 사용되는 클래스이다.
 */
public class AnonymityPageUtility {
    int anonymityfirstpagecount=0;
    int anonymitylastpagecount=0;

    int anonymitynextpagecount=0;				//다음 페이지
    int anonymitybeforepagecount=0;			    //이전 페이지
    int anonymitycurrentpagecount=0;			    //현재 페이지
	
    int anonymitybeforetenpage=0;				//이전 페이지
    int anonymitynexttenpage=0;					//다음 페이지

    int anonymitytotalrowcount=0;				//총 row 개수
    int anonymitytotalpagecount=0;				//총 페이지 수
    int anonymitydisplayrowcount=0;				//한 페이지당 보여줄 개수
    int anonymitypagePercount = 5;
    String imagepath;
    String anonymitysearch;
    /**
     * 현재페이지와 경로 한번에 보여줄 열의 갯수를 세팅하는 생성자
     * @param anonymitydisplayrowcount 한 페이지에 보여줄 게시글 수
     * @param anonymitytotalrowcount   조회해온 데이터의 전체 row수
     * @param anonymitycurrentpagecount 현재 페이지 
     * @param imagepath        이미지 경로 
     * @exception java.lang.Exception
     */
    public AnonymityPageUtility(int anonymitydisplayrowcount, int anonymitytotalrowcount, int anonymitycurrentpagecount, String imagepath)
    {
        this.anonymitydisplayrowcount = anonymitydisplayrowcount;
        this.anonymitytotalrowcount = anonymitytotalrowcount;
        this.anonymitycurrentpagecount = anonymitycurrentpagecount;
        this.imagepath = imagepath	;
        this.anonymitytotalpagecount=anonymitytotalrowcount/anonymitydisplayrowcount;
        if(anonymitytotalrowcount%anonymitydisplayrowcount!=0){
          this.anonymitytotalpagecount++;
        }
        
    }
   
    public String getCurrentPageCount()
    {
        return String.valueOf(anonymitycurrentpagecount);
    }
    /**
     * 목록에 출력할 page link를 구성한다.
     * @return 구성한 page 링크를 리턴
     */
    public String getPageBar()    {
  		
        StringBuffer sb=new StringBuffer();
        anonymityfirstpagecount=((anonymitycurrentpagecount-1)/anonymitypagePercount*anonymitypagePercount)+1;
        anonymitylastpagecount=anonymityfirstpagecount+anonymitypagePercount;

        anonymitybeforetenpage=anonymityfirstpagecount-anonymitypagePercount;
        anonymitybeforetenpage= anonymitybeforetenpage<1?1:anonymitybeforetenpage;
        anonymitynexttenpage=anonymitylastpagecount;
        
        if(anonymitybeforetenpage<1)     anonymitybeforetenpage=1;
        if(anonymitynexttenpage>anonymitytotalpagecount)
            anonymitynexttenpage=(((anonymitytotalpagecount-1)/anonymitypagePercount)+1)*anonymitypagePercount;
        if(anonymitylastpagecount>anonymitytotalpagecount)
            anonymitylastpagecount = anonymitytotalpagecount+1;
		
        if(anonymityfirstpagecount>anonymitypagePercount)
            sb.append(" <a href='javascript:anonymityPagelist("+anonymitybeforetenpage+")' class='glyphicon glyphicon-chevron-left'></a>&nbsp;&nbsp;");
        else
            sb.append("<a href='#dishes' border='0' class='glyphicon glyphicon-chevron-left' align=absmiddle></a>&nbsp;&nbsp;");

        if(((anonymitycurrentpagecount-1)/anonymitypagePercount*anonymitypagePercount)+1>anonymitybeforetenpage)
            sb.append("<a href='javascript:anonymityPagelist("+ anonymitybeforetenpage+")' class='glyphicon glyphicon-triangle-left' ></a>&nbsp;&nbsp;");
        else
            sb.append("<a href='#dishes' border='0' class='glyphicon glyphicon-triangle-left' align=absmiddle></a>&nbsp;&nbsp; ");

        for (int i = anonymityfirstpagecount; i < anonymitylastpagecount; i++)
        {
            if(i<=anonymitytotalpagecount)
            {
                if (i == anonymitycurrentpagecount)
                    sb.append("<b>" + i + "</b>");
                else
                    sb.append("<a href='javascript:anonymityPagelist("+i+")'>" + i + "</a>");
                if( i !=anonymitylastpagecount-1)
                    sb.append(" . ");
            }
        }

        if(anonymitynexttenpage<((anonymitytotalpagecount-1)/anonymitypagePercount+1)*anonymitypagePercount)
            sb.append("&nbsp;&nbsp;<a href='javascript:anonymityPagelist("+ (anonymitynexttenpage)+ ")' class='glyphicon glyphicon-triangle-right'></a>");
        else
            sb.append("&nbsp;&nbsp;<a href='#dishes' border='0' hspace='3' align=absmiddle class='glyphicon glyphicon-triangle-right'></a>");

        if((((anonymitycurrentpagecount-1)/anonymitypagePercount)+1)*anonymitypagePercount < anonymitynexttenpage)
            sb.append("&nbsp;&nbsp;<a href='javascript:anonymityPagelist("+ (anonymitynexttenpage)+")' class='glyphicon glyphicon-chevron-right'></a>");
        else
            sb.append("&nbsp;&nbsp;<a href='#dishes' border='0' align=absmiddle class='glyphicon glyphicon-chevron-right'></a>");
        return sb.toString();
    }
    public String getTotalpagecount() {       
    	return String.valueOf(anonymitytotalpagecount);
    }
}