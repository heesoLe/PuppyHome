<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/page/include/header.jsp"/>
<link rel="shortcut icon" href="<%=request.getContextPath()%>/images/favicon.ico" type="image/x-icon"> <%-- 파비콘 --%>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/page/cs/css/customer_center.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/page/include/css/header.css"> <%-- header.css --%>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/page/include/css/footer.css"> <%-- footer.css --%>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery.js"></script>
<script src="<%=request.getContextPath()%>/js/cs.js"></script>

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
 <!--    <div id="board-search">
        <div class="container">
            <div class="search-window">
                <form action="">
                    <div class="search-wrap">
                        <label for="search" class="blind">공지사항 내용 검색</label>
                        <input id="search" type="search" name="" placeholder="검색어를 입력해주세요." value="">
                        <button type="submit" class="btn btn-dark">검색</button>
                    </div>
                </form>
            </div>
        </div>
    </div> -->
   
  <!-- board list area -->
    <div id="board-list">
        <div class="container">
            <table class="board-table">
                <thead>
                <tr>
                	<th scope="col" class="th-num">답변 여부</th>
                    <th scope="col" class="th-num" width="200px;">구분</th>
                    <th scope="col" class="th-title">제목</th>
                    <th scope="col" class="th-name">작성자</th>
                    <th scope="col" class="th-date">등록일</th>
                </tr>
                </thead>
                <tbody>
                <%-- 작성글이 있을경우 --%>
                <c:if test="${!empty clist }"> 
				<c:forEach var="c" items="${clist }">
				<tr onclick="toggleContent(this)">
				
				<%-- 답변여부 확인 --%>
					 
					<c:if test="${c.client_cont_reply!=' ' }">
					<td>답변완료</td>
					</c:if>
					<c:if test="${c.client_cont_reply == ' ' }">
					<td>대기</td>
					</c:if>
				
					
                    <td width="200px;">${c.client_category }</td>
                    <th><a href="#">${c.client_title }</a></th>
                    <td>${c.user_id }</td>
                    <td>${c.client_date }</td>
               	</tr>
                <tr class="hidden">
                	<td></td>
                	<td colspan = "3">${c.client_cont}</td>
                	<td></td>
                </tr>
				</c:forEach>
				</c:if > 
						
						<%-- 작성글이 없을경우 --%>
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

<div class="btn_contact">
 <form action="">
   <button type="button" class="btn_1" onclick="location='cs_inquire.shop';">1:1 문의하기</button>
 </form>
</div>


<footer>
	<!-- footer -->
<jsp:include page="/page/include/footer.jsp"/>
	<!-- footer 끝 -->
	</footer>
	
