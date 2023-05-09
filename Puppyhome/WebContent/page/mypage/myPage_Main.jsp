<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%--
<script src="https://code.jquery.com/jquery-3.6.3.js"></script>
<script
	src="http://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.3/jquery.easing.min.js"></script>
<%-- CDN 절대링크 --%>
<script type="text/javascript" src="./js/jquery.js"></script>
<title>PuppyHome 마이페이지</title>
<link rel="shortcut icon"
	href="<%=request.getContextPath()%>/images/favicon.ico?ver1"
	type="image/x-icon">
<%-- 파비콘 --%>
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/page/include/css/header.css">
<%-- header.css --%>
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/page/include/css/footer.css">
<%-- footer.css --%>
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/fontium/css/fontium.css" />
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/page/mypage/css/mypage.css?ver=1">
<%-- <link rel="stylesheet" href="./shop/puppyhome/controller_mypage/css/mypage.css">--%>
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
	font-family: 'KIMM_Bold';
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
	font-family: 'KIMM_Bold';
	margin-top: -110px;
	min-height: 100%;
	position: relative;
}

.main {
	font-family: 'KIMM_Bold';
	width: 1400px;
	height: 2000px;
	/* UI 개발할 때 각 페이지에 맡게 해당 영역 px수치 수정해야함 / section이랑 px 맞춰야함 */
	position: relative;
	top: 105px;
	left: 50%;
	transform: translateX(-50%);
	background-color: rgb(179, 255, 213); /* 영역 보기 편하라고 배경색 지정함 : 연초록 */
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
	position: relative;
	left: 50%;
	transform: translateX(-50%);
}

/** {
	border: 1px solid black;
}*/

/*a링크 효과*/



</style>

</head>
<body>
	<%-- 전체 영역 --%>
	<div class="wrap">
		<%-- 헤더 영역 --%>
		<header>
			<%-- header include --%>
			<jsp:include page="/page/include/header.jsp" />
		</header>
		<%-- 본문 영역(ui깨질시 본인이 ui 수정바람..) --%>


		<aside>
			<nav>
				<ul>
					<li
						style="font-weight: bold; font-size: 20px; border-bottom-width: 3px; border-bottom-style: solid; border-bottom-color: black;">
						나의 쇼핑</li>
					<li><a href="mypagemain.shop" class="liList"
						style="color: #FC5400; font-weight: bold;">주문ㆍ배송</a></li>
					<li><a href="order_cancel.shop" class="liList">주문취소</a></li>
					<li><a href="javascript:void(0);" onclick="openPopup_company_introduce();" class="liList">교환/반품하기</a></li>
					<li><a href="like.shop" class="liList">찜 목록</a></li>
					<li style="margin-bottom: 30px;"><a href="basket.shop"
						class="liList">장바구니</a></li>

					<li
						style="font-weight: bold; font-size: 20px; border-bottom-width: 3px; border-bottom-style: solid; border-bottom-color: black;">
						회원 정보</li>
					<li><a href="updateinfo.shop" class="liList">회원정보 변경</a></li>
					<li><a href="changepwd.shop" class="liList">비밀번호 변경</a></li>
					<li><a href="user_withdrawal.shop" class="liList">회원탈퇴</a></li>
					<li style="margin-bottom: 30px;"><a href="updateaddr.shop"
						class="liList">배송지 관리</a></li>

					<li
						style="font-weight: bold; font-size: 20px; border-bottom-width: 3px; border-bottom-style: solid; border-bottom-color: black;">
						나의 상품후기</li>
					<li><a href="review.shop" class="liList">나의 상품후기</a></li>
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
					<img src="<%=request.getContextPath()%>/images/profile.png"
						alt="강쥐" style="width: 80px; height: 80px;">
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
									<th scope="col" class="th-date1">주문번호</th>
									<th scope="col" class="th-title">제품명</th>
									<th scope="col" class="th-date">주문일자</th>
									<th scope="col" class="th-date">주문수량</th>
									<th scope="col" class="th-date">제품당 가격</th>
									<th scope="col" class="th-date">총 주문금액</th>
									<th scope="col" class="th-date2">주문상태</th>
								</tr>
							</thead>
							<tbody>
								<c:if test="${!empty olist }">
									<c:forEach var="o" items="${olist}">
										<tr>
											<td>${o.order_no}</td>
											<th><a class="orderList" onclick="location='product_dsc.shop?product_title=${o.product_title}'">${o.product_title}</a></th>
											<td>${o.order_date}</td>
											<td>${o.order_cnt}개</td>
											<td>${o.product_price}원</td>
											<td>${o.total_price}원</td>
											<td><input type="button"
												onclick="window.open('https://www.hanjin.com/kor/CMS/DeliveryMgr/WaybillSch.do?mCode=MN038');"
												value="배송조회">&nbsp;&nbsp;&nbsp;<input type="button"
												value="후기작성" onclick="openPopup_review_write()"></td>
										</tr>
										</c:forEach>
										</c:if>
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
			<jsp:include page="../include/footer.jsp" />
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