<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous"> <%-- CDN 절대링크 --%>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN" crossorigin="anonymous"></script> <%-- CDN 절대링크 --%>
<script src="https://code.jquery.com/jquery-3.6.3.js" integrity="sha256-nQLuAZGRRcILA+6dMBOvcRh5Pe310sBpanc6+QBmyVM=" crossorigin="anonymous"></script> <%-- CDN 절대링크 --%>
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.3/jquery.easing.min.js"></script> <%-- CDN 절대링크 --%>

<title>PuppyHome 관리자 문의게시판</title>

<link rel="shortcut icon" href="<%=request.getContextPath()%>/images/favicon.ico" type="image/x-icon"> <%-- 파비콘 --%>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/page/include/css/header.css"> <%-- header.css --%>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/page/include/css/footer.css"> <%-- footer.css --%>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/page/admin/css/admin.css"> <%-- admin 계정.css --%>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/page/admin/css/aCSBoard.css"> <%-- adminMemBoard.css --%>

<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/fontium/css/fontium.css"/>

<style type="text/css">
	/* 폰트 CSS */
	@font-face {
		font-family: 'KIMM_Bold';
		src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2212@1.0/KIMM_Bold.woff2') format('woff2'); /* CDN 절대링크  */
		font-weight: 700;
		font-style: normal;
	}
	/* 되도록 안건드리는 영역 */
	* {
		box-sizing: border-box;
		-webkit-box-sizing: border-box;
		-moz-box-sizing: border-box;
	}
	html {
		height: 100%;
	}
	body {
		margin: 0px;
		height: 100%;
		padding: 0px;
	}
	header {
		width: 100%;
	    position: fixed;
		z-index: 2;
	}
	footer { 
		bottom: 0;
		z-index: 5;
		position: relative;
	}
	.wrap {
		margin-top: -110px;
		min-height: 100%;
	    position: relative;
	}
	.main { 
		width: 1400px;
		height: 2000px; /* UI 개발할 때 각 페이지에 맡게 해당 영역 px수치 수정해야함 */
		position : relative;
		top: 105px;
		left: 50%;
	       transform: translateX( -50% );
		background-color: white;  /* 영역 보기 편하라고 배경색 지정함 : 하얀색 */
	}
	section {
		height: 2000px; /* UI 개발할 때 각 페이지에 맡게 해당 영역 px수치 수정해야함 */
		/* background-color: rgb(236, 226, 202);  영역 보기 편하라고 배경색 지정함 : 연주황 */
	}
	/* 클리어 */ 
	.clear {
		clear: both;
	}
	/* 밑의 영역부터 css시작 */
	.container {
		width: 100%;
	}
	/* 페이징 처리 */
	/* 페이징 전체 틀 */
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
	.MemList {
		border: none;
		width: 1300px;
		height: 250px;
		border-top: 2px solid #FC5400;
		border-bottom: 2px solid #FC5400;
		font-family: 'KIMM_Bold';
	}
	
	.MemList tr {
		border-bottom: 1px solid #f5ad56;
	}
	#btn {
		border-color: #FC5400; 
		background-color: #FC5400; 
		color: #fff;
	}
	.meau {
		padding-top: 30px;
		padding-left: 800px;
		font-family: 'KIMM_Bold';
	}
	
	.meau a {
		color: white;
		text-decoration: none;
	} 
	select {
		padding : 5px 5px;
	}
</style>
</head>
<body>
	<%-- 전체 영역 --%>
	<div class="wrap">
	<%-- 헤더 영역 --%>
	<header><%-- header include --%>
		<jsp:include page="/page/include/header.jsp" />
	</header>
	<%-- 본문 영역(ui깨질시 본인이 ui 수정바람..) --%>
	<section>
		<div class="main">
		
		<div class="adminMainpage">	<%-- adminMainpage --%>
			<%-- admin 계정 --%>
			<h1 class="name" style="color: #fc9300">Admin Page</h1>
			<div class="profile_img" align="center">
			<%-- 이미지 클릭시 관리자 메인화면으로 이동 --%>
			<a href="adminMain.shop"><img width="150px" height="190px" align="left" alt="adminImage" src="<%=request.getContextPath()%>/images/admin.png"> </a>

				<div class="meau" align="right" style="color: white;">
					 <a href="mlist.shop">회원 관리</a> | 
					 <a href="csboard.shop">문의 게시판</a> | 
					 <a href="gslist.shop">상품 목록</a> | 
					 <a href="aSales.shop">매출 관리</a>
				 </div>

				<h3 class="myinfo" align="left"><b>관리자 계정</b> <br>
				</h3> <div class="myinfo_date" align="left">가입일 : 2023.03.15.</div>	<br>
			</div> <%-- end profile_img : 이미지 div --%>
			</div> <%-- end adminMainpage : 관리자 계정 고정 --%>
				
			<%-- 전체 문의 게시판 --%>
			<div class="board">
				<h3 align="center">&nbsp;문의&nbsp;게시판</h3>
					
			<%--검색 테이블 --%>
			<form method="post" action="csboard.shop">
				<table align="center">
					<tr>
					<td align="center">
							<select name="find_field">
								<option value="client_title" 
								<c:if test="${find_field == 'client_title' }">${'selected' }</c:if>>제목</option>
								<option value="user_id" 
								<c:if test="${find_field == 'user_id' }">${'selected' }</c:if>>작성자</option>
							</select>
							<input type="search" name="find_name" value="${find_name }" />
							<input id="btn" name="search" type="submit" value="검색" />
						</td>
					</tr>
					</table></form><p> <%-- end 검색 테이블 --%>
					
					<div align="right">총 게시물 : ${listcountC } 개</div><p>
					<%--문의 목록 게시판(boardMember) --%>
					<table class="MemList" width="1300px;">
						<tr>
							<th width="100;" height="50">No</th> 
							<th width="100">답변 유무</th>
							<th width="200;">문의 유형</th> 
							<th width="500;">제목</th> 
							<th width="200">작성자</th> 
							<th width="200;">작성일</th> 
						</tr> 
						
						<c:if test="${!empty clist }"> <%-- 검색 전후 목록이 있는 경우 실행 --%>
						 <c:forEach var="cv" items="${clist }">
						 <tr height="100" method="post" onclick= "location.href ='csboard_cont.shop?client_no=${cv.client_no }&page=${page}&state=cont&user_id=${cv.user_id}';">
						 	<%-- No --%>
						 	<td>
						 		<c:if test="${cv.client_no !=0 }" > <%-- 원본글일 때만 글 그룹 번호를 출력 --%> 
						 			${cv.client_no }
						 		</c:if>
						 	</td>
						 	<%-- 답변 유무 --%>
						 	<c:if test="${cv.client_cont_reply!=' ' }">
				               <td>답변완료</td>
				               </c:if>
				               <c:if test="${cv.client_cont_reply == ' ' }">
				               <td>대기</td>
				               </c:if>						 	
						 	<%-- 문의 유형 --%>
						 	<td>${cv.client_category }</td>
						 	
						 	<%-- 제목 --%>
						 	<td align="left" style="padding-left: 30px;">
						 	<a >${cv.client_title }</a>
						 	</td>
						 	<%-- *.shop?client_no=번호&page=쪽번호&state=cont 구분값까지 3개의 파라미터 값이 주소창에 노출되는 get방식(쿼리스트링 방식)으로 &기호로 구분해서 전달됨. --%> 
						 	
						 	<%-- 작성자 --%>
						 	<td align="center">${cv.user_id }</td> 
						 	
						 	<%-- 작성날짜 --%>
						 	<td align="center">${cv.client_date }</td> 
						 </tr>
						 </c:forEach>
						</c:if > 
						
						<%-- 작성글이 있을경우 --%>
						<c:if test="${empty clist }">
						<tr>
						<td colspan="5">작성 글이 없습니다.</td>
						</tr>
						</c:if>
					</table> <p>
					<%-- end boardMember --%>
					
					<%-- 페이징 처리 --%>
					<div id="pagination">
					<!-- 검색 칸 공백 시 페이징 사라지지 않게 -->
	               <c:if test="${find_name == ''}"> <%--검색필드와 검색어가 없는 경우 --%>
	                 <c:if test="${page <= 1}">
	                  PREV&nbsp;
	                 </c:if>
	                 <c:if test="${page>1}">
	                  <a href="csboard.shop?page=${page-1}">PREV</a>&nbsp;
	                 </c:if>
	                 
	                 <%--현재 쪽번호 출력 --%>
	                 <c:forEach var="a" begin="${startpage}" end="${endpage}" step="1">
	                   <c:if test="${a == page}"> <%-- 현재 페이지가 선택된 경우 --%>
	                      [&nbsp;${a}&nbsp;]
	                   </c:if>
	                   <c:if test="${a != page}"> <%--현재 쪽번호가 선택 안 된 경우--%>
	                    <a href="csboard.shop?page=${a}">[&nbsp;${a}&nbsp;]</a>&nbsp;
	                   </c:if>
	                 </c:forEach>
	                   
	                
	                <c:if test="${page >= maxpage}">
	                  &nbsp;NEXT
	                </c:if>
	                <c:if test="${page < maxpage}">
	                 <a href="csboard.shop?page=${page+1}">NEXT</a>
	                </c:if>
	               </c:if>
               		<!-- end 검색 칸 공백 시 페이징 사라지지 않게 -->
				    <%--검색 전 페이징 --%>
				    <c:if test="${(empty find_field) && (empty find_name)}"> <%--검색필드와 검색어가 없는 경우 --%>
				     <c:if test="${page <= 1}">
				      PREV&nbsp;
				     </c:if>
				     <c:if test="${page>1}">
				      <a href="csboard.shop?page=${page-1}">PREV</a>&nbsp;
				     </c:if>
				     
				     <%--현재 쪽번호 출력 --%>
				     <c:forEach var="a" begin="${startpage}" end="${endpage}" step="1">
				       <c:if test="${a == page}"> <%-- 현재 페이지가 선택된 경우 --%>
				       	[&nbsp;${a}&nbsp;]
				       </c:if>
				       <c:if test="${a != page}"> <%--현재 쪽번호가 선택 안 된 경우--%>
				        <a href="csboard.shop?page=${a}">[&nbsp;${a}&nbsp;]</a>&nbsp;
				       </c:if>
				     </c:forEach>
				       
				    
				    <c:if test="${page >= maxpage}">
				      &nbsp;NEXT
				    </c:if>
				    <c:if test="${page < maxpage}">
				     <a href="csboard.shop?page=${page+1}">NEXT</a>
				    </c:if>
				   </c:if>
				    
				    <%--검색이후 페이징(쪽나누기) --%>
				    <c:if test="${(!empty find_field) && (!empty find_name)}"> <%--검색필드와 검색어가 있는 경우 --%>
				     <c:if test="${page <= 1}">
				      PREV&nbsp;
				     </c:if>
				     <c:if test="${page>1}">
				      <a href="csboard.shop?page=${page-1}&find_field=${find_field}&find_name=${find_name}">PREV</a>&nbsp;
				      <%-- &(엠퍼센트) 구분기호로 구분하면서 find_field=검색필드&find_name= 검색어를 get방식으로 전달해야 검색 이후 페이징 목록을 유지한다.그렇지 않으면 검색전 전체 페이징 목록으로 이동해서 검색 효과가 사라진다. --%>
				     </c:if>
				     
				     <%--현재 쪽번호 출력 --%>
				     <c:forEach var="a" begin="${startpage}" end="${endpage}" step="1">
				       <c:if test="${a == page}"> <%-- 현재 페이지가 선택된 경우 --%>
				        [&nbsp;${a}&nbsp;]
				       </c:if>
				       <c:if test="${a != page}"> <%--현재 쪽번호가 선택 안 된 경우--%>
				        <a href="csboard.shop?page=${a}&find_field=${find_field}&find_name=${find_name}">[&nbsp;${a}&nbsp;]</a>&nbsp;
				       </c:if>
				     </c:forEach>      
				    
				    <c:if test="${page >= maxpage}">
				      &nbsp;NEXT
				    </c:if>
				    <c:if test="${page < maxpage}">
				     <a href="csboard.shop?page=${page+1}&find_field=${find_field}&find_name=${find_name}">NEXT</a>
				    </c:if>
				   </c:if> 
				   </div>
				<%-- 페이징처리 끝 --%>
					
				</div> <%-- end board --%>
				
			</div><%-- main 끝 --%>
			<%-- top버튼 삭제 X --%>
			<div id="topBtn">
				<span class="fonti um-arrow-circle-up um-3x icon"></span>TOP
			</div>
		</section>
	<%-- 푸터 영역 --%>
	<footer>
	<!-- footer -->
	<jsp:include page="/page/include/footer.jsp" />
	<!-- footer 끝 -->
	</footer>
	</div> <%-- end wrap --%>
	<script type="text/javascript">
	
		<%-- top버튼 부분 --%>
		// 클릭 이벤트 핸들러
		$("#topBtn").click(function(e) {
			e.stopPropagation();
			$("html, body").animate({
				scrollTop : 0
			}, 'fast', 'easeOutCubic');
		});

		// 스크롤 이벤트 핸들러
		$(window).scroll(function() {
			if ($(window).scrollTop() == 0) {
				$("#topBtn").css("opacity", 0); // TOP 버튼 숨기기
			} else {
				$("#topBtn").css("opacity", 1); // TOP 버튼 나타내기
			}
		});
	</script>
</body>
</html>