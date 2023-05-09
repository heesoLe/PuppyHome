<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"	rel="stylesheet"	integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"	crossorigin="anonymous"><%-- CDN 절대링크 --%>
<script	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"	integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN"	crossorigin="anonymous"></script><%-- CDN 절대링크 --%>
<script src="https://code.jquery.com/jquery-3.6.3.js"	integrity="sha256-nQLuAZGRRcILA+6dMBOvcRh5Pe310sBpanc6+QBmyVM="	crossorigin="anonymous"></script><%-- CDN 절대링크 --%>
<script	src="http://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.3/jquery.easing.min.js"></script><%-- CDN 절대링크 --%>

<title>PuppyHome 관리자 회원관리 Page</title>

<link rel="shortcut icon"	href="<%=request.getContextPath()%>/images/favicon.ico"	type="image/x-icon"><%-- 파비콘 --%>
<link rel="stylesheet" type="text/css"	href="<%=request.getContextPath()%>/page/include/css/header.css"><%-- header.css --%>
<link rel="stylesheet" type="text/css"	href="<%=request.getContextPath()%>/page/include/css/footer.css"><%-- footer.css --%>
<link rel="stylesheet" type="text/css"	href="<%=request.getContextPath()%>/page/admin/css/admin.css"><%-- admin 계정.css --%>
<link rel="stylesheet" type="text/css"	href="<%=request.getContextPath()%>/page/admin/css/aMlist.css"><%-- adminMemList.css --%>
<link rel="stylesheet" type="text/css"	href="<%=request.getContextPath()%>/fontium/css/fontium.css" />

<style type="text/css">
	/* 폰트 CSS */
	@font-face {
		font-family: 'KIMM_Bold';
		src:
			url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2212@1.0/KIMM_Bold.woff2')
			format('woff2'); /* CDN 절대링크  */
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
		position: relative;
		top: 105px;
		left: 50%;
		transform: translateX(-50%);
		background-color: white; /* 영역 보기 편하라고 배경색 지정함 : 하얀색 */
	}
	
	section {
		height: 2000px; /* UI 개발할 때 각 페이지에 맡게 해당 영역 px수치 수정해야함 */
		/* background-color: rgb(236, 226, 202); 영역 보기 편하라고 배경색 지정함 : 연주황 */
	}
	/* 클리어 */
	.clear {
		clear: both;
	}
	/* 밑의 영역부터 css시작 */
	.container {
		width: 100%;
	}
	
	#btn {
		border-color: #FC5400;
		background-color: #FC5400;
		color: #fff;
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
		background-color: #FC5400;
	}
	
	#pagination #pagination-active {
		color: #fff;
		background-color: #FC5400;
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
	
	.boardList tr {
		border-bottom: 1px solid #f5ad56;
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

			<%-- 전체 틀 회원관리 테이블 --%>
			<div class="list">
				<h3 align="center">&nbsp;회원&nbsp;관리</h3>

				<%-- 검색 테이블 --%>
				<form method="post" action="mlist.shop">
					<table align="center">
						<tr>
							<td align="center">
								<select name="find_field">
									<option value="user_name"
										<c:if test="${find_field == 'user_name'}">${'selected'}</c:if>>회원이름</option>
									<option value="user_id"
										<c:if test="${find_field == 'user_id'}">${'selected'}</c:if>>회원아이디</option>
									<option value="user_birth"
										<c:if test="${find_field == 'user_birth'}">${'selected'}</c:if>>회원생년월일</option>
								</select> 
								<input type="search" name="find_name" value="${find_name }" />
								<input id="btn" name="search" type="submit" value="검색"  />
						</tr>
					</table>
				</form>
				<p>
				<div align="right">회원 수 : ${listcountB } 명</div>
				<p>
					<%--회원 관리 게시판 --%>
				<table class="boardList" width="1300px;">
					<tr>
						<th width="50" height="50">&nbsp;</th>
						<th width="100">No</th>
						<th width="200">이름</th>
						<th width="200">아이디</th>
						<th width="200">생년월일</th>
						<th width="200">가입날짜</th>
						<th width="100">비고</th>
						<%-- 수정 버튼 --%>
					</tr>

					<c:if test="${!empty mlist }">
						<c:forEach var="m" items="${mlist }">
							<tr height="100">
								<td align="center"><input type="checkbox" value="check">
								</td>
								<td align="center">${m.user_no}</td> <%-- 게시물번호 --%>
								<%-- 회원정보 출력 --%>
								<td align="center">${m.user_name }</td>	<%-- 회원이름 --%>
								<td align="center">${m.user_id }</td> <%-- 회원아이디 --%>
								<td align="center">${m.user_birth }</td> <%-- 생년월일 --%>
								<td align="center">${m.user_date }</td> 	<%--가입날짜 --%>
								<td align="center">
								<input id="btn" type="button" value="수정" onclick="location.href = 'mlist_cont.shop?user_id=${m.user_id}';"> 
								</td>
							</tr>
						</c:forEach>
					</c:if>

					<%-- 회원정보 출력 끝 --%>
					<c:if test="${empty mlist}">
						<tr>
							<th>
							<td colspan="6">게시물 목록이 없습니다</td>
							</th>
						</tr>
					</c:if>
				</table>
				<%--회원 관리 게시판 끝 --%>
				<%-- 회원 체크(블랙리스트) 버튼 --%>
				<p><p>
				<input id="btn" type="button" value="블랙리스트 등록" onclick="return list_btn()" />
				<script type="text/javascript">
					function list_btn() {
						var answer = confirm('블랙리스트로 등록하시겠습니까?');
						if (answer == true) {
							location = "#";
						} else {
						}
					}
				</script>
				<p>

				<%-- 페이징 처리 --%>
				<div id="pagination">
						<!-- 검색 칸 공백 시 페이징 사라지지 않게 -->
	               <c:if test="${find_name == ''}"> <%--검색필드와 검색어가 없는 경우 --%>
	                 <c:if test="${page <= 1}">
	                  PREV&nbsp;
	                 </c:if>
	                 <c:if test="${page>1}">
	                  <a href="mlist.shop.shop?page=${page-1}">PREV</a>&nbsp;
	                 </c:if>
	                 
	                 <%--현재 쪽번호 출력 --%>
	                 <c:forEach var="a" begin="${startpage}" end="${endpage}" step="1">
	                   <c:if test="${a == page}"> <%-- 현재 페이지가 선택된 경우 --%>
	                      [&nbsp;${a}&nbsp;]
	                   </c:if>
	                   <c:if test="${a != page}"> <%--현재 쪽번호가 선택 안 된 경우--%>
	                    <a href="mlist.shop.shop?page=${a}">[&nbsp;${a}&nbsp;]</a>&nbsp;
	                   </c:if>
	                 </c:forEach>
	                   
	                
	                <c:if test="${page >= maxpage}">
	                  &nbsp;NEXT
	                </c:if>
	                <c:if test="${page < maxpage}">
	                 <a href="mlist.shop.shop?page=${page+1}">NEXT</a>
	                </c:if>
	               </c:if>
	               <!-- 검색 칸 공백 시 페이징 사라지지 않게 -->
					<%--검색 전 페이징 --%>
					<c:if test="${(empty find_field) && (empty find_name)}">
						<%--검색필드와 검색어가 없는 경우 --%>
						<c:if test="${page <= 1}">
			      PREV&nbsp;
			     </c:if>
						<c:if test="${page>1}">
							<a href="mlist.shop?page=${page-1}">PREV</a>&nbsp;
			     </c:if>

						<%--현재 쪽번호 출력 --%>
						<c:forEach var="a" begin="${startpage}" end="${endpage}" step="1">
							<c:if test="${a == page}">
								<%-- 현재 페이지가 선택된 경우 --%>
			       	[&nbsp;${a}&nbsp;]
			       </c:if>
							<c:if test="${a != page}">
								<%--현재 쪽번호가 선택 안 된 경우--%>
								<a href="mlist.shop?page=${a}">[&nbsp;${a}&nbsp;]</a>&nbsp;
			       </c:if>
						</c:forEach>


						<c:if test="${page >= maxpage}">
			      &nbsp;NEXT
			    </c:if>
						<c:if test="${page < maxpage}">
							<a href="mlist.shop?page=${page+1}">NEXT</a>
						</c:if>
					</c:if>

					<%--검색이후 페이징(쪽나누기) --%>
					<c:if test="${(!empty find_field) && (!empty find_name)}">
						<%--검색필드와 검색어가 있는 경우 --%>
						<c:if test="${page <= 1}">
			      PREV&nbsp;
			     </c:if>
						<c:if test="${page>1}">
							<a
								href="mlist.shop?page=${page-1}&find_field=${find_field}&find_name=${find_name}">PREV</a>&nbsp;
			      <%-- &(엠퍼센트) 구분기호로 구분하면서 find_field=검색필드&find_name= 검색어를 get방식으로 전달해야 검색 이후 페이징 목록을 유지한다.그렇지 않으면 검색전 전체 페이징 목록으로 이동해서 검색 효과가 사라진다. --%>
						</c:if>

						<%--현재 쪽번호 출력 --%>
						<c:forEach var="a" begin="${startpage}" end="${endpage}" step="1">
							<c:if test="${a == page}">
								<%-- 현재 페이지가 선택된 경우 --%>
			        [&nbsp;${a}&nbsp;]
			       </c:if>
							<c:if test="${a != page}">
								<%--현재 쪽번호가 선택 안 된 경우--%>
								<a
									href="mlist.shop?page=${a}&find_field=${find_field}&find_name=${find_name}">[&nbsp;${a}&nbsp;]</a>&nbsp;
			       </c:if>
						</c:forEach>

						<c:if test="${page >= maxpage}">
			      &nbsp;NEXT
			    </c:if>
						<c:if test="${page < maxpage}">
							<a
								href="mlist.shop?page=${page+1}&find_field=${find_field}&find_name=${find_name}">NEXT</a>
						</c:if>
					</c:if>
				</div>
				<%-- end 페이징처리  --%>

			</div> <%-- 회원 테이블 끝 --%>

		</div>
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
	</div> <%-- end wrap --%>
</body>
</html>