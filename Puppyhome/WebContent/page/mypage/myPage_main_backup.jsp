<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous"> <%-- CDN 절대링크 --%>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN" crossorigin="anonymous"></script> <%-- CDN 절대링크 --%>
<script src="https://code.jquery.com/jquery-3.6.3.js" integrity="sha256-nQLuAZGRRcILA+6dMBOvcRh5Pe310sBpanc6+QBmyVM=" crossorigin="anonymous"></script> <%-- CDN 절대링크 --%>
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.3/jquery.easing.min.js"></script> <%-- CDN 절대링크 --%>
<title>PuppyHome 메인</title>
<link rel="stylesheet" type="text/css" href="./css/footer.css"> <%-- footer.css --%>
<link rel="stylesheet" type="text/css" href="./fontium/css/fontium.css"/>
<link rel="stylesheet" href="./css/mypage.css">
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
      height: 2000px; /* UI 개발할 때 각 페이지에 맡게 해당 영역 px수치 수정해야함 / section이랑 px 맞춰야함 */
      position : relative;
      top: 105px;
      left: 50%;
        transform: translateX( -50% );
      background-color: rgb(179, 255, 213);  /* 영역 보기 편하라고 배경색 지정함 : 연초록 */
   }
/*   section {
      height: 2000px;  UI 개발할 때 각 페이지에 맡게 해당 영역 px수치 수정해야함 / .main이랑 px 맞춰야함 
      background-color: rgb(236, 226, 202);  영역 보기 편하라고 배경색 지정함 : 연주황 
   }
      */ 
   /* 클리어 */

   .clear {
      clear: both;
   }
   /* 밑의 영역부터 css시작 */
   .container {
      width: 100%;
   }
   /* 캐러셀 */
   #carouselExampleControls {
      width: 1100px;
      position : relative;
      left: 50%;
        transform: translateX( -50% );
   }
   
/** {
	border: 1px solid black;
}*/
</style>
</head>
<body>
   <%-- 전체 영역 --%>
   <div class="wrap">
      <%-- 헤더 영역 --%>
      <header>
         <%-- header include --%>
         <jsp:include page="/page/include/header.jsp"/>
      </header>
      <%-- 본문 영역(ui깨질시 본인이 ui 수정바람..) --%>
 

<aside>
	<nav>
		<ul>
			<li
				style="font-weight: bold; font-size: 20px; border-bottom-width: 3px; border-bottom-style: solid; border-bottom-color: black;">
				나의 쇼핑</li>
			<li id="subspan">주문ㆍ배송</li>
			<li id="subspan">주문취소</li>
			<li id="subspan">교환/반품하기</li>
			<li id="subspan">찜 목록</li>
			<li id="subspan" style="margin-bottom: 30px;">장바구니</li>
			
			<li
				style="font-weight: bold; font-size: 20px; border-bottom-width: 3px; border-bottom-style: solid; border-bottom-color: black;">
				회원 정보</li>
			<li id="subspan">회원정보 변경</li>
			<li id="subspan">회원탈퇴</li>
			<li id="subspan" style="margin-bottom: 30px;">배송지 관리</li>
			
			<li 	style="font-weight: bold; font-size: 20px; border-bottom-width: 3px; border-bottom-style: solid; border-bottom-color: black;">
				나의 상품문의</li>
			<li id="subspan" style="margin-bottom: 30px;">나의 상품문의</li>

			<li 	style="font-weight: bold; font-size: 20px; border-bottom-width: 3px; border-bottom-style: solid; border-bottom-color: black;">
				나의 상품후기</li>
			<li id="subspan">나의 상품후기</li>
		</ul>
	</nav>
</aside>

<%-- 본문 영역(ui깨질시 본인이 ui 수정바람..) --%>
<div class="innerWrap">
	<section class="notice">
	<div class="page-title">
			<h3>
				<b>My Page</b>
			</h3>
			</div>
			<!--계정 -->
			<div class="memBasicInfo">
				<img src="<%=request.getContextPath()%>/images/profile.png" alt="강쥐"
					style="width: 80px; height: 80px;">
			</div>

			<div class="memBasicInfo" style="width: 750px; text-align: left;">
				<b style="font-size: 20px;">실험용계정</b>
			</div>

		<%-- 	<div class="memBasicInfo"
				style="width: 200px; text-align: right; font-size: 5px;">
				<b>찜목록 ㅣ 장바구니 ㅣ 상품후기</b>
			</div>
--%>

			</section>

		<div class="clear"></div>

		<!-- board seach area -->
	<section class="notice">
			<div class="page-title">
				<b style="text-align: left; font-size: 20px;">주문내역</b><br>
			</div>
		<!-- board list area -->
		<div id="board-list">
			<div class="container">
				<table class="board-table">
					<thead>
						<tr>
							<th scope="col" class="th-title">주문일자</th>
							<th scope="col" class="th-date">주문번호</th>
							<th scope="col" class="th-date">주문금액(수량)</th>
							<th scope="col" class="th-date">배송상태</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<th><a href="#!">개쩌는 개껌입니다</a></th>
							<td>20230325</td>
							<td>20,000원(1개)</td>
							<td><input type="button" value="배송조회"></td>
						</tr>

						<tr>
							<th><a href="#!">주식회사 메디팜의 달콤쌉싸름 영양제</a></th>
							<td>20230324</td>
							<td>25,000원(2개)</td>
							<td><input type="button" value="배송조회"></td>
						</tr>

						<tr>							
						<th><a href="#!">둘이먹다가 하나 죽어도 모를 소고기 간식</a></th>
							<td>20230323</td>
							<td>15,000원(1개)</td>
							<td><input type="button" value="배송조회"></td>
						</tr>
					</tbody>
				</table>	
			</div>
		</div>
         <%-- top버튼 삭제 X --%>
         <div id="topBtn">
            <span class="fonti um-arrow-circle-up um-3x icon"></span>TOP
         </div>
				</section>
			</div>
<div class="clear"></div>
   <%-- 푸터 영역 --%>
   <footer>
   <!-- footer -->
   <div id="footerbox">
      <div id="innerbox">
            <div id="categorybox">
                <ul>
                    <li><a href="javascript:void(0);" onclick="openPopup_service();">서비스 이용약관</a></li>
                    <li><a href="javascript:void(0);" onclick="openPopup_privacy();">개인정보 처리방침</a></li>
                    <li><a href="javascript:void(0);" onclick="openPopup_inquiry();">입점/제휴 문의</a></li>
                    <li><a href="http://localhost:8046/Shopping_Mall/util/company_introduce.jsp" target="_blank">회사소개</a></li>
                </ul>
            </div>
            <div id="infobox">
                <br>주식회사 퍼피홈 &nbsp;&nbsp; | &nbsp;&nbsp; 대표자명 : 이용현 &nbsp;&nbsp; | &nbsp;&nbsp; 사업자 등록번호 : 120-87-00000 &nbsp;&nbsp; | &nbsp;&nbsp; 통신판매업신고번호 : 제 2023-서울강남-00000호 &nbsp;&nbsp; | &nbsp;&nbsp; 개인정보관리자 : 이용현 leeyoung0919@naver.com &nbsp;&nbsp; | &nbsp;&nbsp; TEL : 1644-0000
                <br>서울특별시 강남구 강남대로84길 16, 11층 &nbsp;&nbsp; | &nbsp;&nbsp; 구매안전(에스크로)서비스
                <br><br>© copyright (c) www.puppyhome.co.kr all rights reserved.
            </div>
            <div id="checkbox">
            <input type="button" id="checkIcon" onclick="openPopup_certificate()" value="" alt="인증 마크 클릭 이동">
            </div>
        </div>
   </div>
   <!-- footer 끝 -->
   </footer>
   </div>
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
      
      <%-- footer 부분 --%>
      // 서비스 이용약관 텍스트 클릭시 새창 열기
      function openPopup_service() {
           var page_width = '560';
           var page_height = '650';
       
           // 팝업을 가운데 위치시키기 위해 아래와 같이 값 구하기
           var page_left = Math.ceil((window.screen.width - page_width)/2);
           var page_top = Math.ceil((window.screen.height - page_height)/2);
   
       window.open("http://localhost:8046/Shopping_Mall/util/service.jsp", "service",'width='+ page_width +', height='+ page_height +', left=' + page_left + ', top='+ page_top);
       
       }
       
      // 개인정보 처리 텍스트 클릭시 새창 열기
      function openPopup_privacy() {
           var page_width = '590';
           var page_height = '555';
       
           // 팝업을 가운데 위치시키기 위해 아래와 같이 값 구하기
           var page_left = Math.ceil((window.screen.width - page_width)/2);
           var page_top = Math.ceil((window.screen.height - page_height)/2);
   
       window.open("http://localhost:8046/Shopping_Mall/util/privacy.jsp", "privacy",'width='+ page_width +', height='+ page_height +', left=' + page_left + ', top='+ page_top);
       
       }
      
      // 입점/제휴 문의 텍스트 클릭시 새창 열기
      function openPopup_inquiry() {
           var page_width = '580';
           var page_height = '555';
       
           // 팝업을 가운데 위치시키기 위해 아래와 같이 값 구하기
           var page_left = Math.ceil((window.screen.width - page_width)/2);
           var page_top = Math.ceil((window.screen.height - page_height)/2);
   
       window.open("http://localhost:8046/Shopping_Mall/util/inquiry.jsp", "inquiry",'width='+ page_width +', height='+ page_height +', left=' + page_left + ', top='+ page_top);
       
       }
      
      // 인증 마크 클릭시 새창 열기
       function openPopup_certificate() {
           var page_width = '510';
           var page_height = '430';
       
           // 팝업을 가운데 위치시키기 위해 아래와 같이 값 구하기
           var page_left = Math.ceil((window.screen.width - page_width)/2);
           var page_top = Math.ceil((window.screen.height - page_height)/2);
   
       window.open("http://localhost:8046/Shopping_Mall/util/certificate.jsp", "certificate",'width='+ page_width +', height='+ page_height +', left=' + page_left + ', top='+ page_top);
       
       }
   </script>
</body>
</html>