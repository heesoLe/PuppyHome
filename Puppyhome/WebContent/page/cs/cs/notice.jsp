<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/page/include/header.jsp"/>
<link rel="shortcut icon" href="<%=request.getContextPath()%>/images/favicon.ico" type="image/x-icon"> <%-- 파비콘 --%>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/page/include/css/header.css"> <%-- header.css --%>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/page/include/css/footer.css"> <%-- footer.css --%>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/page/cs/css/customer_center.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/fontium/css/fontium.css"/>

<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery.js"></script>
<script src="<%=request.getContextPath()%>/js/cs.js"></script>

<style>
@charset "UTF-8";

#cs_faq_list {
	list-style: none;
	position: relative;
	padding: 0px 0px 0px 10%;
	font-family: 'KIMM_Bold';
	color: #FC5400;
}

#cs_faq_list li {
	display: inline;
	padding: 10px 10px;
}

#cs_faq_list li a {
	color: inherit;
	text-decoration: none;
	font-size: 25px;
	font-family: 'KIMM_Bold';
}

#label {
	list-style: none;
	position: relative;
	padding: 0px 0px 0px 10%;
	font-family: 'KIMM_Bold';
}

#inquire_notice_list {
	display: inline;
}

#label li {
	display: inline;
	padding: 10px 10px;
	color: gray;
	font-size: 15px;
}

#cs_faq_list li a:hover {
	text-decoration: none;
	color: black;
	cursor: pointer;
}

table {
	border-collapse: collapse;
	border-spacing: 0;
}

div .select {
	padding: 80px 0;
}

section.notice {
	padding: 120px 0px 20px 0px;
}

/* .page-title {
  margin-bottom: 60px;
}
.page-title h3 {
  font-size: 28px;
  color: #333333;
  font-weight: 400;
  text-align: center;
} */

/*  
.board-table tbody .hidden {
  선택된 행에 스타일 적용
  display: none;
}
 */
#board-search {
	margin: auto;
}

#board-search .search-window {
	padding: 15px 0;
	background-color: #f9f7f9;
}

#board-search .search-window .search-wrap {
	position: relative;
	/*   padding-right: 124px; */
	margin: 0 auto;
	width: 80%;
	max-width: 564px;
}

#board-search .search-window .search-wrap input {
	height: 40px;
	width: 100%;
	font-size: 14px;
	padding: 7px 14px;
	border: 1px solid #ccc;
	font-family: 'KIMM_Bold';
}

#board-search .search-window .search-wrap input:focus {
	border-color: #333;
	outline: 0;
	border-width: 1px;
}

#board-search .search-window .search-wrap .btn {
	position: absolute;
	right: 0;
	top: 0;
	bottom: 0;
	width: 108px;
	padding: 0;
	font-size: 16px;
	font-family: 'KIMM_Bold';
	color: white;
	background: #f5ad56;
}

.board-table {
	font-size: 13px;
	width: 100%;
	border-top: 1px solid #ccc;
	border-bottom: 1px solid #ccc;
	font-family: 'KIMM_Bold';
}

.board-table a {
	color: #333;
	display: inline-block;
	line-height: 1.4;
	word-break: break-all;
	vertical-align: middle;
}

.board-table a:hover {
	text-decoration: underline;
}

.board-table th {
	text-align: center;
}

.board-table .th-num {
	width: 100px;
	text-align: center;
	font-size: 15px;
	background-color: #f5ad56;
}

.board-table .th-title {
	background-color: #f5ad56;
	font-size: 15px;
}

.board-table .th-date {
	background-color: #f5ad56;
	width: 200px;
	font-size: 15px;
}

.board-table .th-name {
	background-color: #f5ad56;
	width: 200px;
	font-size: 15px;
}

.board-table th, .board-table td {
	padding: 14px 0;
}

.board-table tbody td {
	border-top: 1px solid #e7e7e7;
	text-align: center;
	font-size: larger;
    color: #FC5400;
}

.board-table tbody th {
	padding-left: 28px;
	padding-right: 14px;
	border-top: 1px solid #e7e7e7;
	text-align: center;
}

.board-table tbody th p {
	display: none;
}

.board-table tbody tr.hidden {
	display: none;
}

.board-table tbody tr:nth-child(even) {
	background-color: #f1f1f1;
}

.btn {
	display: inline-block;
	padding: 0 30px;
	font-size: 15px;
	font-weight: 400;
	background: transparent;
	text-align: center;
	white-space: nowrap;
	vertical-align: middle;
	-ms-touch-action: manipulation;
	touch-action: manipulation;
	cursor: pointer;
	-webkit-user-select: none;
	-moz-user-select: none;
	-ms-user-select: none;
	user-select: none;
	border: 1px solid transparent;
	text-transform: uppercase;
	-webkit-border-radius: 0;
	-moz-border-radius: 0;
	border-radius: 0;
	-webkit-transition: all 0.3s;
	-moz-transition: all 0.3s;
	-ms-transition: all 0.3s;
	-o-transition: all 0.3s;
	transition: all 0.3s;
}

.btn-dark {
	background: #555;
	color: #fff;
}

.btn-dark:hover, .btn-dark:focus {
	background: #373737;
	border-color: #373737;
	color: #fff;
}

.btn-dark {
	background: #555;
	color: #fff;
}

.btn-dark:hover, .btn-dark:focus {
	background: #373737;
	border-color: #373737;
	color: #fff;
}

.btn_contact {
	height: 80px;
	width: 100%;
	margin: auto;
	padding: 0px 0px 20px 0px;
	display: inline-block;
	font-size: 15px;
	font-weight: 400;
	background: transparent;
	text-align: center;
	white-space: nowrap;
}

.btn_1 {
	height: 40px;
	width: 100px;
	background: #FC5400;
	color: #fff;
	font-family: 'KIMM_Bold';
}

.btn_1:hover, .btn_1:focus {
	background: #FC5400;
	border-color: #FC5400;
	color: #fff;
}

.btn_1 {
	background: #FC5400;
	color: #fff;
}

.btn_1:hover, .btn_1:focus {
	background: #FC5400;
	border-color: #FC5400;
	color: #fff;
}

/* reset */
* {
	list-style: none;
	text-decoration: none;
	padding: 0;
	margin: 0;
	box-sizing: border-box;
}

.clearfix:after {
	content: '';
	display: block;
	clear: both;
}

.container {
	width: 1100px;
	margin: 0 auto;
}

.blind {
	position: absolute;
	overflow: hidden;
	clip: rect(0, 0, 0, 0);
	margin: -1px;
	width: 1px;
	height: 1px;
}

#label_hr {
	border: 0;
	height: 4px; /* hr 높이 설정 */
	background-color: #f5ad56; /* hr 색상 설정 */
	margin: 10px 0px; /* hr 위아래 간격 설정 */
}

p {
	font-size: medium;
	background-color: white;
}

   .pagination-container {
      margin: 10px auto;
      display: flex;
       justify-content: center;
   }
   
  .pagination {
      position: relative;
   }
   /* 'PREV' 전체 틀 */
   #pagination a {
      position: relative;
      display: inline-block;
      color: #FC5400; /* 글자색상 */
      text-decoration: none;
      font-size: 1.2rem;
      padding: 8px 16px 10px;
   }
   /* 'PREV' 부분 */
   #pagination a:before {
      z-index: -1;
      position: absolute;
      height: 100%;
      width: 100%;
      content: "";
      top: 0;
      left: 0;
      background-color: #FC5400;
      border-radius: 24px;
      -webkit-transform: scale(0);
      transform: scale(0);
      transition: all 0.2s;
   }
   #pagination a:hover, #pagination a #pagination-active {
      color: #fff;
   }
   
   #pagination a:hover:before, #pagination a #pagination-active:before {
      -webkit-transform: scale(1);
      transform: scale(1);
   }
   
   #pagination #pagination-active {
      color: #fff;
   }
   
   #pagination #pagination-active:before {
      -webkit-transform: scale(1);
      transform: scale(1);
   }
   /*'NEXT' 전체 틀 */
   #pagination-newer {
      margin-right: 50px;
   }
   
   #pagination-older {
      margin-left: 50px;
   }
   .productList tr{
      border-bottom: 1px solid #f5ad56;
   }
   
   .pl{
   border: 1px solid #9B51E0;
   border-radius: 3px;
    height: 35px; 
}

.pl:focus{
    border: 1px solid #9B51E0;
    box-sizing: border-box;
    border-radius: 10px;
    outline: 3px solid #F8E4FF;
    border-radius: 3px;
}
</style>
<%String user_id = (String)session.getAttribute("id");
request.setAttribute("user_id", user_id);
System.out.println(user_id);
%>
<section class="notice">

<div>
 <ul id="cs_faq_list">
  <li><a href="cs_notice.shop">공지사항</a></li>
  <li><a href="cs_FAQ.shop">FAQ</a></li>
  <li><a href="cs_contact.shop">1:1문의</a></li>
 </ul>
 <hr id="label_hr">
</div>
    <!-- board seach area -->
    <div id="board-search">
        <div class="container">
            <div class="search-window">
                <form action="cs_notice.shop" method="post">
                    <div class="search-wrap">
                        <label for="search" class="blind">공지사항 내용 검색</label>
                        <!-- <input id="search" type="search" name="" placeholder="검색어를 입력해주세요." value="">
                        <button type="submit" class="btn btn-dark">검색</button> -->
                        <select name="find_field" id="" class="pl">
								<option value="notice_title" 
								<c:if test="${find_field == 'notice_title' }">${'selected' }</c:if>>제목</option>
								<option value="notice_cont" 
								<c:if test="${find_field == 'notice_cont' }">${'selected' }</c:if>>내용</option>
							</select>
							<input type="search" name="find_name" placeholder="검색어를 입력해주세요." value="${find_name }"
							 style="width:500px;" />
							<input id="btn" name="search" class="btn btn-dark" type="submit" value="검색" />
                    </div>
                </form>
            </div>
        </div>
    </div>
   
  <!-- board list area -->
    <div id="board-list">
        <div class="container">
            <table class="board-table">
                <thead>
                <tr>
                    <th scope="col" class="th-num">번호</th>
                    <th scope="col" class="th-title">제목</th>
                  	<th scope="col" class="th-date">등록일</th> 
                </tr>
                 <tr></tr>
                </thead>
                <tbody>
                <c:if test="${!empty clist }"> <%-- 검색 전후 목록이 있는 경우 실행 --%>
				<c:forEach var="c" items="${clist }">
				<tr onclick="toggleContent(this)">
                    <td>${c.notice_no }</td>
                    <th><a href="#">${c.notice_title }</a></th>
                    <td>${c.notice_date }</td>
               	</tr>
                <tr class="hidden">
                	<td></td>
                	<td>${c.notice_cont}</td>
                	<td></td>
                </tr>
				</c:forEach>	
						</c:if > 
						
						<%-- 작성글이 있을경우 --%>
						<c:if test="${empty clist }">
						<tr>
						<td colspan="5">작성 글이 없습니다.</td>
						</tr>
						</c:if>
                
                </tbody>
            </table>
        </div>
    </div>
    </section>
<%-- 페이징 처리 --%>
					<div id="pagination" align="center">
				    <%--검색 전 페이징 --%>
				    <c:if test="${(empty find_field) && (empty find_name)}"> <%--검색필드와 검색어가 없는 경우 --%>
				     <c:if test="${page <= 1}">
				      PREV&nbsp;
				     </c:if>
				     <c:if test="${page>1}">
				      <a href="cs_notice.shop?page=${page-1}">PREV</a>&nbsp;
				     </c:if>
				     
				     <%--현재 쪽번호 출력 --%>
				     <c:forEach var="a" begin="${startpage}" end="${endpage}" step="1">
				       <c:if test="${a == page}"> <%-- 현재 페이지가 선택된 경우 --%>
				       	[&nbsp;${a}&nbsp;]
				       </c:if>
				       <c:if test="${a != page}"> <%--현재 쪽번호가 선택 안 된 경우--%>
				        <a href="cs_notice.shop?page=${a}">[&nbsp;${a}&nbsp;]</a>&nbsp;
				       </c:if>
				     </c:forEach>
				       
				    
				    <c:if test="${page >= maxpage}">
				      &nbsp;NEXT
				    </c:if>
				    <c:if test="${page < maxpage}">
				     <a href="cs_notice.shop?page=${page+1}">NEXT</a>
				    </c:if>
				   </c:if>
				   
				   <!--  -->
				   <c:if test="${find_name == ''}"> <%--검색필드와 검색어가 없는 경우 --%>
				     <c:if test="${page <= 1}">
				      PREV&nbsp;
				     </c:if>
				     <c:if test="${page>1}">
				      <a href="cs_notice.shop?page=${page-1}">PREV</a>&nbsp;
				     </c:if>
				     
				     <%--현재 쪽번호 출력 --%>
				     <c:forEach var="a" begin="${startpage}" end="${endpage}" step="1">
				       <c:if test="${a == page}"> <%-- 현재 페이지가 선택된 경우 --%>
				       	[&nbsp;${a}&nbsp;]
				       </c:if>
				       <c:if test="${a != page}"> <%--현재 쪽번호가 선택 안 된 경우--%>
				        <a href="cs_notice.shop?page=${a}">[&nbsp;${a}&nbsp;]</a>&nbsp;
				       </c:if>
				     </c:forEach>
				       
				    
				    <c:if test="${page >= maxpage}">
				      &nbsp;NEXT
				    </c:if>
				    <c:if test="${page < maxpage}">
				     <a href="cs_notice.shop?page=${page+1}">NEXT</a>
				    </c:if>
				   </c:if>
				   <!--  -->
				    
				    <%--검색이후 페이징(쪽나누기) --%>
				    <c:if test="${(!empty find_field) && (!empty find_name)}"> <%--검색필드와 검색어가 있는 경우 --%>
				     <c:if test="${page <= 1}">
				      PREV&nbsp;
				     </c:if>
				     <c:if test="${page>1}">
				      <a href="cs_notice.shop?page=${page-1}&find_field=${find_field}&find_name=${find_name}">PREV</a>&nbsp;
				      <%-- &(엠퍼센트) 구분기호로 구분하면서 find_field=검색필드&find_name= 검색어를 get방식으로 전달해야 검색 이후 페이징 목록을 유지한다.그렇지 않으면 검색전 전체 페이징 목록으로 이동해서 검색 효과가 사라진다. --%>
				     </c:if>
				     
				     <%--현재 쪽번호 출력 --%>
				     <c:forEach var="a" begin="${startpage}" end="${endpage}" step="1">
				       <c:if test="${a == page}"> <%-- 현재 페이지가 선택된 경우 --%>
				        [&nbsp;${a}&nbsp;]
				       </c:if>
				       <c:if test="${a != page}"> <%--현재 쪽번호가 선택 안 된 경우--%>
				        <a href="cs_notice.shop?page=${a}&find_field=${find_field}&find_name=${find_name}">[&nbsp;${a}&nbsp;]</a>&nbsp;
				       </c:if>
				     </c:forEach>      
				    
				    <c:if test="${page >= maxpage}">
				      &nbsp;NEXT
				    </c:if>
				    <c:if test="${page < maxpage}">
				     <a href="cs_notice.shop?page=${page+1}&find_field=${find_field}&find_name=${find_name}">NEXT</a>
				    </c:if>
				   </c:if> 
				   </div>
<c:if test="${user_id=='admin' }">
 <div class="btn_contact">
 <form action="">
   <button type="button" class="btn_1" onclick="location='cs_addCSNotice.shop';">공지사항 추가</button>
 </form>
</div>
</c:if>
	<%-- 푸터 영역 --%>
	<footer>
	<!-- footer -->
	<jsp:include page="/page/include/footer.jsp"/>
	</footer>