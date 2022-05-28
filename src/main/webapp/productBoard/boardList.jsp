<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- CSS -->
<!--     <link rel="stylesheet" href="./css/basic.css" /> -->
<!--     <link rel="stylesheet" href="./css/responsive.css" /> -->
<!--     <link rel="stylesheet" href="./css/freeBoardList.css" /> -->
    <!-- 부트스트랩 CDN_CSS -->
    <link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
      rel="stylesheet"
      integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
      crossorigin="anonymous"
    />
    <!-- 구글 아이콘 -->
    <link
      rel="stylesheet"
      href="https://fonts.sandbox.google.com/css2?family=Material+Symbols+Rounded:opsz,wght,FILL,GRAD@48,400,0,0"
    />
    <!--  부트스트랩 CDN_JS  -->
    <script
      src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
      integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
      crossorigin="anonymous"
    ></script>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
</head>
<style>

	a{
		text-decoration:none;
		color:black;
	}

	a:hover{
		cursor:pointer;
		text-decoration:underline;
		color:dodgerblue;
	}
	
	.thread {
  		background-color: rgba(0, 0, 0, 0.05);
	}
	.boardSeq {
  		width: 10%;
	}
	.thTitle,
	.title {
  		width: 50%;
	}
	tr {
  		border-bottom: 1px solid rgba(0, 0, 0, 0.05);
	}
	.boardDate,
	.boardViewCount {
  		color: gray;
	}
	
	@media (max-width: 996px) {
  		.boardTitle {
    	width: 100%;
    	display: block;
  	}
  	.boardSeq,
  	.thWriter,
  	.thDate,
  	.thViewCount {
    	display: none;
  	}
  	.m-inline {
    	display: inline;
  	}
  	.boardDate,
  	.boardViewCount {
    	font-size: 14px;
  	}
	
</style>
<body>

	<div class="container containerSetting">
	
	<div class="row">
	
	<div class="col-11 col-lg-8 m-auto">

	<table class="table table-borderless">
	
        <thead>
          <tr class="text-center thread">
            <th class="boardSeq"></th>
            <th class="thTitle">제목</th>
            <th class="thWriter">작성자</th>
            <th class="thDate">날짜</th>
            <th class="thViewCount">조회수</th>
          </tr>
        </thead>
        
        <tbody>
        
        	<c:forEach var="i" items="${boardList }">
        
        	<tr>
            	<th scope="row" class="text-center boardSeq">${i.seq }</th>
            	<td class="title boardTitle"><a href="/detail.productBoard?seq=${i.seq }">${i.title }</a></td>
            	<td class="text-center m-inline boardWriter">${i.writer }</td>
            	<td class="text-center m-inline boardDate">${i.formedDate }</td>
            	<td class="text-center m-inline boardViewCount">${i.viewCount }</td>
        	</tr>
        
        	</c:forEach>
        	
        </tbody>
        	
    
    
        <tr style="border:0;">
            <td colspan="5" align="center">
            	<a href="/list.productBoard?currPage=1" id=toStart>[처음]&nbsp;</a>
        		<a href="/list.productBoard?currPage=${currPage-11 - (currPage-11)%10 + 1 }" id=prev>[이전]&nbsp;</a>
        		<a href="/list.productBoard?currPage=${currPage+9 - (currPage+9)%10 + 1 }" id=next>[다음]&nbsp;</a>
        		<a href="/list.productBoard?currPage=${totalPage }" id=toEnd>[마지막]</a>
            </td>
        </tr>
        <tr style="border:0;">
            <td colspan="5" align="right">
            	<a href="/index.jsp"><button>메인으로</button></a>
            	<a href="/write.productBoard"><button>작성하기</button></a>
            	<input type=text id=searchInput><button id=searchBtn>검색</button>
        </tr>
        
    </table>
    
    </div></div></div>
    
    
    
    <script>
    
    	let startNavi = ${currPage-1 }-(${currPage-1 }%10)+1
    
    	// totalPage 10 이하 - 처음 이전 다음 마지막 모두 없음
    	if(${totalPage } <= 10) {
    		$("#prev").css("display", "none")
    		$("#next").css("display", "none")
    		$("#toStart").css("display", "none")
    		$("#toEnd").css("display", "none")
    		
    		for(let i=1; i<=${totalPage }; i++) {
    			let seq = $("<a href=/list.productBoard?currPage=" + i + " id=a" + i + ">" + i + "</a>")
    			$("#next").before(seq)
    			$("#next").before("\u00a0\u00a0")
    		}
    		
    	// totalPage 10 초과, 현재페이지 10페이지 이하 - 처음 이전 없음
    	} else if(${currPage } <= 10) {
    		$("#prev").css("display", "none")
    		$("#toStart").css("display", "none")
    		
    		for(let i=startNavi; i<=startNavi+9; i++) {
    			let seq = $("<a href=/list.productBoard?currPage=" + i + " id=a" + i + ">" + i + "</a>")
    			$("#next").before(seq)
    			$("#next").before("\u00a0\u00a0")
    		}
    		
    	// 현재 페이지가 10페이지씩 끊었을때 마지막일때 ex) 31~35 페이지 (totalPage 35) - 다음 마지막 없음
    	} else if(${currPage - (currPage-1)%10 } == ${totalPage - (totalPage-1)%10 }) {
    		$("#next").css("display", "none")
    		$("#toEnd").css("display", "none")
    		
    		for(let i=startNavi; i<=${totalPage }; i++) {
    			let seq = $("<a href=/list.productBoard?currPage=" + i + " id=a" + i + ">" + i + "</a>")
    			$("#next").before(seq)
    			$("#next").before("\u00a0\u00a0")
    		}
    		
    	// 그 외 일반적인 경우 - 처음 이전 다음 마지막 모두 있음
    	} else {
    		for(let i=startNavi; i<=startNavi+9; i++) {
    			let seq = $("<a href=/list.productBoard?currPage=" + i + " id=a" + i + ">" + i + "</a>")
    			$("#next").before(seq)
    			$("#next").before("\u00a0\u00a0")
    		}
    	}
    	
    	// 현재 페이지에 색깔과 밑줄
    	$("#a" + ${currPage }).css({"color":"dodgerblue", "text-decoration":"underline"})
    	
    	
    	
    	// 검색기능
    	
    	$("#searchBtn").on("click", function(){
    		let keyWord = $("#searchInput").val()
    		location.href = "/search.productBoard?currPage=1&keyWord=" + keyWord
    	})
    	
    </script>

</body>
</html>