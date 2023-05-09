<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> <%-- JSTL 태그립 추가 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.6.3.js"></script> <%-- CDN 절대링크 --%>
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.3/jquery.easing.min.js"></script> <%-- CDN 절대링크 --%>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css"> <%-- CDN 절대링크 --%>
<title>PuppyHome 찜 목록</title>
<link rel="shortcut icon" href="<%=request.getContextPath()%>/images/favicon.ico" type="image/x-icon"> <%-- 파비콘 --%>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/page/include/css/header.css"> <%-- header.css --%>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/page/include/css/footer.css"> <%-- footer.css --%>
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
		width: 1800px;
		height: 1200px; /* UI 개발할 때 각 페이지에 맡게 해당 영역 px수치 수정해야함 / section이랑 px 맞춰야함 */
		position : relative;
		top: 105px;
		left: 50%;
        transform: translateX( -50% );
		/* background-color: rgb(179, 255, 213); */ /* 영역 보기 편하라고 배경색 지정함 : 연초록 */
	}
	section {
		height: 1200px; /* UI 개발할 때 각 페이지에 맡게 해당 영역 px수치 수정해야함 / .main이랑 px 맞춰야함 */
		/* background-color: rgb(236, 226, 202); */ /* 영역 보기 편하라고 배경색 지정함 : 연주황 */
	}
	/* 클리어 */
	.clear {
		clear: both;
	}
	/* 밑의 영역부터 css시작 */
	.container {
		width: 100%;
	}
	
	/******************/

p {
  margin: 0.75rem 0 0;
}

input,
button {
  border: 0 none;
  outline: 0 none;
}

.summary-checkout button {
  background-color: #666;
  color: #fff;
}

.summary-checkout button:hover,
.summary-checkout button:focus {
  background-color: #555;
}

.product-image img,
.basket-labels,
.basket-product {
  width: 100%;
}

input,
.summary-checkout button,
.basket,
.basket-module,
.basket-labels,
.item,
.price,
.quantity,
.subtotal,
.basket-product,
.product-image,
.product-details {
  float: left;
}

.hide {
  display: none;
}

main {
  clear: both;
  font-size: 0.75rem;
  margin: 0 auto;
  overflow: hidden;
  padding: 1rem 0;
  width: 960px;
}

.basket,
.aside_right {
  padding: 0 1rem;
  -webkit-box-sizing: border-box;
  -moz-box-sizing: border-box;
  box-sizing: border-box;
}

.basket {
  width: 100%;
  padding-bottom: 20px;
  height: 900px;
}

.basket-module {
  color: #111;
}

label {
  display: block;
  margin-bottom: 0.3125rem;
}

.promo-code-field {
  border: 1px solid #ccc;
  padding: 0.5rem;
  text-transform: uppercase;
  transition: all 0.2s linear;
  width: 48%;
  -webkit-box-shadow: inset 0 1px 1px rgba(0, 0, 0, .075);
  -moz-box-shadow: inset 0 1px 1px rgba(0, 0, 0, .075);
  -o-box-shadow: inset 0 1px 1px rgba(0, 0, 0, .075);
  box-shadow: inset 0 1px 1px rgba(0, 0, 0, .075);
}

.promo-code-field:hover,
.promo-code-field:focus {
  border: 1px solid #999;
}

.promo-code-cta {
  border-radius: 4px;
  font-size: 0.625rem;
  margin-left: 0.625rem;
  padding: 0.6875rem 1.25rem 0.625rem;
}

.basket-labels {
  border-top: 1px solid #ccc;
  border-bottom: 1px solid #ccc;
  margin-top: 1.625rem;
}

.basket-labels ul {
  list-style: none;
  margin: 0;
  padding: 0;
}

.basket-labels li {
  color: #111;
  display: inline-block;
  padding: 0.625rem 0;
}

.basket-labels li.price:before,
.basket-labels li.subtotal:before {
  content: '';
}

.item {
  width: 75%;
}

.price,
.quantity,
.subtotal {
  width: 15%;
}

.subtotal {
  text-align: right;
}

.btnAdd{
    /* color: #2f348f; */
    margin-left: 50px;
    font-size: 22px;
    /* border: 1px solid black; */
}
/* 삭제 버튼 */
.removeCart{
	bottom: 1.125rem;
	float: right;
	position: absolute;
	right: 0;
	text-align: right;
	width: 10%;
	height: 30%;
	margin-right: 8px;
	background-color: white;
	border-radius: 5px;
	border: 1px solid black;
	font-size: 22px;
	text-align: center;
}
.removeCart:hover{
    cursor: pointer;
}
.removeText{
    font-size: 15px;
    /* color: #2f348f; */
	position: relative;
	top: -5%;
	left: 10%
}
	
/* 담기 버튼 */
.addCart{
	bottom: 1.125rem;
	float: right;
	position: absolute;
	right: 11%;
	text-align: right;
	width: 10%;
	height: 30%;
	margin-right: 8px;
	background-color: white;
	border-radius: 5px;
    border: 1px solid rgb(217, 217, 217);
    font-size: 22px;
    text-align: center;
}
.addCart:hover{
    cursor: pointer;
}

.addText{
    font-size: 15px;
    /* color: #2f348f; */
	position: relative;
	top: -35%;
}
#shopping_cartImg {
	width: 25px;
	height: 25px;
	margin: 8px 10px 10px 15px;
}
#shopping_deleteImg {
	width: 25px;
	height: 25px;
	position: relative;
	top: 8%;
}

.remove button {
  background-color: transparent;
  float: none;
  text-decoration: none;
  text-transform: uppercase;
}

.item-heading {
  padding-left: 4.375rem;
  -webkit-box-sizing: border-box;
  -moz-box-sizing: border-box;
  box-sizing: border-box;
  text-align: left;
  width: 25px;
}
.item-heading2 {
	position: relative;
	left: -44.5%;
}
.basket-product {
  border-bottom: 1px solid #ccc;
  padding: 1rem 0;
  position: relative;
}

.product-image {
  width: 90px;
}
.product-frame {
  border: 1px solid #aaa;
}

.product-details {
  padding: 0 1.5rem;
  -webkit-box-sizing: border-box;
  -moz-box-sizing: border-box;
  box-sizing: border-box;
  width: 75%;
  padding-left: 5px;
  text-align: left;
  margin: 5px 0px 0px 8px;
}

.quantity-field {
  background-color: #ccc;
  border: 1px solid #aaa;
  border-radius: 4px;
  font-size: 0.625rem;
  padding: 2px;
  width: 3.75rem;
  margin-left: 30px;
}

.aside_right {
  float: right;
  position: relative;
  width: 30%;
}

.summary {
  background-color: #eee;
  border: 1px solid #aaa;
  padding: 1rem;
  position: fixed;
  width: 250px;
  -webkit-box-sizing: border-box;
  -moz-box-sizing: border-box;
  box-sizing: border-box;
  margin-top: 25px;
}

.summary-total-items {
  color: #666;
  font-size: 0.875rem;
  text-align: center;
}

.summary-subtotal,
.summary-total {
  border-top: 1px solid #ccc;
  border-bottom: 1px solid #ccc;
  clear: both;
  margin: 1rem 0;
  overflow: hidden;
  padding: 0.5rem 0;
}

.subtotal-title,
.subtotal-value,
.total-title,
.total-value,
.promo-title,
.promo-value {
  color: #111;
  float: left;
  width: 50%;
}

.summary-promo {
  -webkit-transition: all .3s ease;
  -moz-transition: all .3s ease;
  -o-transition: all .3s ease;
  transition: all .3s ease;
}

.promo-title {
  float: left;
  width: 70%;
}

.promo-value {
  color: #8B0000;
  float: left;
  text-align: right;
  width: 30%;
}

.summary-delivery {
  padding-bottom: 3rem;
}

.subtotal-value,
.total-value {
  text-align: right;
}

.total-title {
  font-weight: bold;
  text-transform: uppercase;
}

.summary-checkout {
  display: block;
}

.checkout-cta {
  display: block;
  float: none;
  font-size: 0.75rem;
  text-align: center;
  text-transform: uppercase;
  padding: 0.625rem 0;
  width: 100%;
}

.summary-delivery-selection {
  background-color: #ccc;
  border: 1px solid #aaa;
  border-radius: 4px;
  display: block;
  font-size: 0.625rem;
  height: 34px;
  width: 100%;
}
.total-title {
	text-align: left;
}
.aside_left {
	margin-top: 29px;
	margin-left: 90px;
	width: 188px;
	min-height: 700px;
	float: left;
	text-align: left;
	/*border: solid 2px #000000;
	background-color: #c267ff;*/
}

.aside_left nav {
	min-height: 600px;
	margin-bottom: 50px;
	/*border: solid 2px #000000;
	background-color: #67a9ff;*/
}

.aside_left li {
	padding-top: 11px;
	padding-bottom: 2px;
	list-style: none;
}

#subspan {
	color: #808080;
}
.memBasicInfo1 {
	height: 120px;
	width: 120px;
	padding: 20px;
	float: left;
	margin-right: 200px;
	margin-top: 0px;
}
.memBasicInfo2 {
	height: 80px;
	width: 130px;
	position: relative;
	top: -40%;
	left: 50%;
	
}
.innerWrap {
	width: 300px;
	height: 220px;
	padding: 20px;
	float: left;
	margin-left: 60px;
	overflow: hidden;
}
#mypageTitle {
	font-size: 28px;
	font-weight: 700;
}
.mypageTitlebox {
	float: left;
	margin: 20px 0px 0px 5px;
}
#user_id {
	font-size: 20px;
	font-weight: 700;
}
/* 찜 목록 */
.wishBox {
    /* margin-top: 50px; */
    margin-left: 0;
    width: 1200px;
    position : relative;
	left: 40%;
	top: 4%;
    transform: translateX( -50% );
    overflow: hidden;
    border-bottom: 2px solid rgb(217, 217, 217);
    /* margin-top: 50px; */
}
/* 찜한 상품 */
#listTitle {
    font-size: 1.8em;
    font-weight: bold;
    margin-left: 15px;
}
.listTitleBox {
	width: 100%;
	height: 60px;
	border-bottom: 2px solid rgb(217, 217, 217);
	text-align: left;
}
/* 체크박스 */
/*input 은 숨겨주기*/
input#chk_all{
  display:none;
  }
/*input 바로 다음의 label*/
input#chk_all + label{
  cursor:pointer;
 }

/*input 바로 다음의 label:before 에 체크하기 전 CSS 설정*/
input#chk_all + label:before{
  content:"";
  display:inline-block;
  width:18px;
  height:18px;
  line-height:18px;
  border:1px solid #cbcbcb;
  vertical-align:middle;/*체크 전과 체크 후 높이 차이 때문에 설정*/
  }
  
/*checked된 input 바로 다음의 label:before 에 체크 후 CSS 설정*/  
input#chk_all:checked + label:before{
  content:"\f00c";/*폰트어썸 유니코드*/
  font-family:"Font Awesome 5 free"; /*폰트어썸 아이콘 사용*/
  font-weight:900;/*폰트어썸 설정*/
  color: blue;
  background-color: white;
  border-color:#000;
  font-size:13px;
  text-align:center;
  }
  input#chk_select{
  display:none;
  }
/*input 바로 다음의 label*/
input#chk_select + label{
  cursor:pointer;
 }

/*input 바로 다음의 label:before 에 체크하기 전 CSS 설정*/
input#chk_select + label:before{
  content:"";
  display:inline-block;
  width:18px;
  height:18px;
  line-height:18px;
  border:1px solid #cbcbcb;
  vertical-align:middle;/*체크 전과 체크 후 높이 차이 때문에 설정*/
  }
  
/*checked된 input 바로 다음의 label:before 에 체크 후 CSS 설정*/  
input#chk_select:checked + label:before{
  content:"\f00c";/*폰트어썸 유니코드*/
  font-family:"Font Awesome 5 free"; /*폰트어썸 아이콘 사용*/
  font-weight:900;/*폰트어썸 설정*/
  color: blue;
  background-color: white;
  border-color:#000;
  font-size:13px;
  text-align:center;
  }
 /*checked된 input 바로 다음의 label:before 에 체크 후 CSS 설정*/  
input#chk_all:checked + label:before{
  content:"\f00c";/*폰트어썸 유니코드*/
  font-family:"Font Awesome 5 free"; /*폰트어썸 아이콘 사용*/
  font-weight:900;/*폰트어썸 설정*/
  color: blue;
  background-color: white;
  border-color:#000;
  font-size:13px;
  text-align:center;
  }
  #chk_selectLabel {
  float: left;
  margin-right: 10px;
  }
  .product-details a {
  	text-decoration: none;
  	color: black;
  }
   .product-details a:hover {
   text-decoration: underline;
  	color: black;
  }
/*a링크 효과*/
a:link.liList {
	text-decoration: none;
	color: #808080;
}

a:visited.liList {
	text-decoration: none;
	color: #808080;
}

a:hover.liList{
	text-decoration: underline;
	color: #FC5400;
}

a:active.liList {
	text-decoration: none;
	color: #FC5400;
}
/* 페이징 */
.pagination a {
	text-decoration: none;
	color: #FC5400;
}
#allDelete {
	background-color: white;
	font-size: 15px;
	font-weight: 600;
}
#allDelete:hover {
	cursor: pointer;
}
.likeBox {
	margin-top: 90px;
}
</style>
</head>
<body>
	<%-- 전체 영역 --%>
	<div class="wrap">
		<%-- 헤더 영역 --%>
		<header>
			<%-- header include --%>
			<jsp:include page="../include/header.jsp"/>
		</header>
		<%-- 본문 영역(ui깨질시 본인이 ui 수정바람..) --%>
		<section>
			<div class="main">
				<%-- main 화면 상단 캐러셀 (캐러셀 필요 없는 페이지는 삭제 바람!) --%>
				<aside class="aside_left">
					<nav>
						<ul>
							<li style="font-weight: bold; font-size: 20px; border-bottom-width: 3px; border-bottom-style: solid; border-bottom-color: black;"> 나의 쇼핑</li>
							<li><a href="mypagemain.shop" class="liList">주문ㆍ배송</a></li>
							<li><a href="ordercancel.shop" class="liList">주문취소</a></li>
							<li><a href="#" class="liList">교환/반품하기</a></li>
							<li><a href="like.shop" class="liList" style="color: #FC5400; font-weight: bold;">찜 목록</a></li>
							<li style="margin-bottom: 30px;"><a href="basket.shop" class="liList">장바구니</a></li>

							<li style="font-weight: bold; font-size: 20px; border-bottom-width: 3px; border-bottom-style: solid; border-bottom-color: black;"> 회원 정보</li>
							<li><a href="updateinfo.shop" class="liList">회원정보 변경</a></li>
							<li><a href="changepwd.shop" class="liList">비밀번호 변경</a></li>
							<li><a href="user_withdrawal.shop" class="liList">회원탈퇴</a></li>
							<li style="margin-bottom: 30px;"><a href="#" class="liList">배송지 관리</a></li>

							<li style="font-weight: bold; font-size: 20px; border-bottom-width: 3px; border-bottom-style: solid; border-bottom-color: black;"> 나의 상품후기</li>
							<li><a href="review.shop" class="liList">나의 상품후기</a></li>
						</ul>
					</nav>
				</aside>
				<%-- 본문 영역(ui깨질시 본인이 ui 수정바람..) --%>
				<div class="wishBox">
					<div class="listTitleBox">
						<span id="listTitle">찜 목록</span>
					</div>
					<div class="basketcontentBox">
						<div class="basket">
							<div class="basket-labels">
								<ul>
									<li class="item item-heading">
										<%-- 체크 박스 --%>
										<input type="checkbox" name="chk_all" id="chk_all" /><label for="chk_all" style="width: 20px;"></label>
										<script>
											$("#chk_all").click(function(){
											 var chk = $("#chk_all").prop("checked");
											 if(chk) {
											  $(".chBox").prop("checked", true);
											 } else {
											  $(".chBox").prop("checked", false);
											 }
											});
										</script>
									</li>
									<li class="item-heading2">
										<button id="allDelete">선택 항목 삭제</button>
										<script>
											$("#allDelete").click(function(){
												var confirm_val = confirm("정말 삭제하시겠습니까?");
											 
												if(confirm_val) {
													var checkArr = new Array();
											  
													$("input[class='chBox']:checked").each(function(){
														checkArr.push($(this).attr("data-cartNum"));
													});
											   
													$.ajax({
														url : "deleteOK.shop", // deleteOK?
														type : "post",
														data : { chbox : checkArr },
														success : function(){
															location.href = "like.shop"; // 현재 페이지로 새로고침
														}
													});
												} 
											});
										</script>
									</li>
								</ul>
							</div>
							<%-- 기능 구현 끝나면 위아래 비교값 바꿔야함 --%>
							 <c:if test="${likelist == null }"> <%-- 찜한 상품이 없는 상태 <c:if test="${id != null && likelist == null }"> <%-- 찜한 상품이 없는 상태 --%>
							 	<div class="likeBox">
							 		<h3>찜한 상품이 없습니다!</h3>
							 	</div>
 							</c:if>
							<c:if test="${likelist != null}"> <%-- 찜한 상품이 있는 상태 <c:if test="${id == null && likelist == null}"> --%>
								<div class="basket-product">
									<%-- 체크 박스 --%>
									<input type="checkbox" id="chk_select" name="chBox" class="chBox" data-cartNum="${cartList.cartNum}"/><label for="chk_select" id="chk_selectLabel"></label>
									<%-- 체크 박스 끝 --%>
									<div class="item">
										<div class="product-image">
											<img src="https://img-cf.kurly.com/cdn-cgi/image/width=676,format=auto/shop/data/goods/1637924624422l0.jpeg" alt="상품 이미지" class="product-frame">
										</div>
										<div class="product-details">
											<span id="productTitle">2023.03.29</span> <%-- 구매 날짜 받아와야함 --%>
										</div>
										<div class="product-details">
											<span id="productTitle"><strong><a href="#">${pvo.product_title}</a></strong></span> <%-- 상품 제목 --%>
										</div>
										<div class="product-details">
											<span id="productTitle"><strong style="font-size: 20px;">8900원</strong></span> <%-- 상품 가격 --%>
										</div>
									</div>
									<button class="addCart" onclick="addOk()">
										<img id="shopping_cartImg" src="<%=request.getContextPath()%>/images/shopping_cart.png" alt="쇼핑 카트"> <span class="addText">담기</span>
									</button>
									<div class="remove">
										<button class="removeCart" onclick="deleteOk()">
											<img id="shopping_deleteImg" src="<%=request.getContextPath()%>/images/recycle_bin.png" alt="휴지통"> <span class="removeText">삭제</span>
										</button>
									</div>
									<script>
										 $(".chBox").click(function(){
										 	$("#chk_all").prop("checked", false);
										 });
									</script>
								</div>
							</c:if>
						</div>
						<%-- 페이징 처리 --%>
						<%-- 검색전후 페이징(쪽 나누기) --%>
						<div id="bList_paging">
							<%-- 검색 전 페이징 --%>
							<c:if test="${(empty find_field) && (empty find_name)}"> <%-- 검색필드와 검색어가 없는 경우 --%>
								<c:if test="${page <= 1}">
									[이전]&nbsp;
								</c:if>
								
								<c:if test="${page > 1}">
									<a href="like2.shop?page=${page-1}">[이전]</a>&nbsp; <%-- 페이지 링크 --%>
								</c:if>
								
								<%-- 현재 쪽번호 출력 --%>
							 	<c:forEach var="a" begin="${startpage}" end="${endpage}" step="1">
							 		<c:if test="${a == page}"> <%-- 현재 페이지가 선택된 경우 --%>
							 			<${a}>
							 		</c:if>
							 		
							 		<c:if test="${a != page}"> <%-- 현재 쪽번호가 선택 안 된 경우 --%>
							 			<a href="like2.shop?page=${a}">[${a}]</a> <%-- 페이지 링크 --%>
							 		</c:if>
								</c:forEach>
							
								<c:if test="${page >= maxpage}">
									[다음]
								</c:if>
								
								<c:if test="${page < maxpage}">
									<a href="like2.shop?page=${page+1}">[다음]</a> <%-- 페이지 링크 --%>
								</c:if>
							</c:if>
						</div>
						<%-- 페이징처리 끝 --%>
					</div>
				</div>
			</div>
			<%-- top버튼 삭제 X --%>
			<div id="topBtn">
				<span class="fonti um-arrow-circle-up um-3x icon"></span>TOP
			</div>
		</section>
		<div class="clear"></div>
		<%-- 푸터 영역 --%>
		<footer>
			<!-- footer -->
			<jsp:include page="../include/footer.jsp"/>
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
		
		<%-- 장바구니 부분 --%>
		/* Set values + misc */
		var promoCode;
		var promoPrice;
		var fadeTime = 300;

		/* Assign actions */
		$('.quantity input').change(function() {
			updateQuantity(this);
		});

		$('.remove button').click(function() {
			removeItem(this);
		});
		
		<%-- $('#allDelete').click(function() {
			removeItem(this);
		}); --%>

		$(document).ready(function() {
			updateSumItems();
		});

		$('.promo-code-cta').click(function() {

			promoCode = $('#promo-code').val();

			if (promoCode == '10off' || promoCode == '10OFF') {
				//If promoPrice has no value, set it as 10 for the 10OFF promocode
				if (!promoPrice) {
					promoPrice = 10;
				} else if (promoCode) {
					promoPrice = promoPrice * 1;
				}
			} else if (promoCode != '') {
				alert("Invalid Promo Code");
				promoPrice = 0;
			}
			//If there is a promoPrice that has been set (it means there is a valid promoCode input) show promo
			if (promoPrice) {
				$('.summary-promo').removeClass('hide');
				$('.promo-value').text(promoPrice.toFixed(0) + "원");
				recalculateCart(true);
			}
		});

		/* Recalculate cart */
		function recalculateCart(onlyTotal) {
			var subtotal = 0;

			/* Sum up row totals */
			$('.basket-product').each(function() {
				subtotal += parseFloat($(this).children('.subtotal').text());
			});

			/* Calculate totals */
			var total = subtotal;

			//If there is a valid promoCode, and subtotal < 10 subtract from total
			var promoPrice = parseFloat($('.promo-value').text());
			if (promoPrice) {
				if (subtotal >= 10) {
					total -= promoPrice;
				} else {
					alert('Order must be more than £10 for Promo code to apply.');
					$('.summary-promo').addClass('hide');
				}
			}

			/*If switch for update only total, update only total display*/
			if (onlyTotal) {
				/* Update total display */
				$('.total-value').fadeOut(fadeTime, function() {
					$('#basket-total').html(total.toFixed(0) + "원");
					$('.total-value').fadeIn(fadeTime);
				});
			} else {
				/* Update summary display. */
				$('.final-value').fadeOut(fadeTime, function() {
					$('#basket-subtotal').html(subtotal.toFixed(0) + "원");
					$('#basket-total').html(total.toFixed(0) + "원");
					if (total == 0) {
						$('.checkout-cta').fadeOut(fadeTime);
					} else {
						$('.checkout-cta').fadeIn(fadeTime);
					}
					$('.final-value').fadeIn(fadeTime);
				});
			}
		}

		/* Update quantity */
		function updateQuantity(quantityInput) {
			/* Calculate line price */
			var productRow = $(quantityInput).parent().parent();
			var price = parseFloat(productRow.children('.price').text());
			var quantity = $(quantityInput).val();
			var linePrice = price * quantity;

			/* Update line price display and recalc cart totals */
			productRow.children('.subtotal').each(function() {
				$(this).fadeOut(fadeTime, function() {
					$(this).text(linePrice.toFixed(0) + "원");
					recalculateCart();
					$(this).fadeIn(fadeTime);
				});
			});

			productRow.find('.item-quantity').text(quantity);
			updateSumItems();
		}

		function updateSumItems() {
			var sumItems = 0;
			$('.quantity input').each(function() {
				sumItems += parseInt($(this).val());
			});
			$('.total-items').text(sumItems);
		}

		/* Remove item from cart */
		function removeItem(removeButton) {
			/* Remove row from DOM and recalc cart total */
			var productRow = $(removeButton).parent().parent();
			productRow.slideUp(fadeTime, function() {
				productRow.remove();
				recalculateCart();
				updateSumItems();
			});
		}
		
		<%-- 삭제 버튼 클릭 시 confirm창 띄우기 --%>
		function deleteOk() {
			var result = confirm('찜 목록에서 삭제하시겠습니까?');
			
			if(result == true) {
				alert("찜 목록에서 삭제되었습니다.");
			} else {
				alert("삭제가 취소되었습니다.");
			}
		}
		
		<%-- 담기 버튼 클릭 시 confirm창 띄우기 --%>
		function addOk() {
			var result = confirm('장바구니에 추가하시겠습니까?');
			
			if(result == true) {
				alert("장바구니에 추가되었습니다.");
			} else {
				alert("추가가 취소되었습니다.");
			}
		}
		
		<%-- 리뷰 작성 페이지 부분 --%>
		// 왼쪽 사이드바의 '나의 후기' 텍스트 클릭시 새창 열기
		function openPopup_review_write() {
	        var page_width = '490';
	        var page_height = '900';
	    
	        // 팝업을 가운데 위치시키기 위해 아래와 같이 값 구하기
	        var page_left = Math.ceil((window.screen.width - page_width)/2);
	        var page_top = Math.ceil((window.screen.height - page_height)/2);
	
	    window.open("http://localhost:8046/MVC/page/mypage2/review_write.jsp", "review_write",'width='+ page_width +', height='+ page_height +', left=' + page_left + ', top='+ page_top);
	    
	    }
		
	</script>
</body>
</html>