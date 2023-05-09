<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous"> <%-- CDN 절대링크 --%>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN" crossorigin="anonymous"></script> <%-- CDN 절대링크 --%>
<script src="https://code.jquery.com/jquery-3.6.3.js"></script> <%-- CDN 절대링크 --%>
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.3/jquery.easing.min.js"></script> <%-- CDN 절대링크 --%>
<script type="text/javascript" src = "./js/jquery.js"></script>
<title>PuppyHome 마이페이지</title>
<link rel="shortcut icon" href="<%=request.getContextPath()%>/images/favicon.ico" type="image/x-icon"> <%-- 파비콘 --%>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/page/include/css/header.css"> <%-- header.css --%>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/page/include/css/footer.css"> <%-- footer.css --%>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/fontium/css/fontium.css"/>
<link rel="stylesheet" href="<%=request.getContextPath()%>/page/mypage/css/mypage.css">
<%-- <link rel="stylesheet" href="./shop/puppyhome/controller_mypage/css/mypage.css">--%>
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
			<li><a href="mypagemain.shop" class="liList">주문ㆍ배송</a></li>
			<li><a href="ordercancel.shop" class="liList">주문취소</a></li>
			<li><a href="#" class="liList">교환/반품하기</a></li>
			<li><a href="like.shop" class="liList">찜 목록</a></li>
			<li style="margin-bottom: 30px;"><a href="basket.shop" class="liList">장바구니</a></li>
			
			<li 
				style="font-weight: bold; font-size: 20px; border-bottom-width: 3px; border-bottom-style: solid; border-bottom-color: black;">
				회원 정보</li>
			<li><a href="updateinfo.shop" class="liList" style="color: #FC5400; font-weight: bold;">회원정보 변경</a></li>
			<li><a href="changepwd.shop" class="liList">비밀번호 변경</a></li>
			<li><a href="user_withdrawal.shop" class="liList">회원탈퇴</a></li>
			<li style="margin-bottom: 30px;"><a href="#" class="liList">배송지 관리</a></li>

			<li 	style="font-weight: bold; font-size: 20px; border-bottom-width: 3px; border-bottom-style: solid; border-bottom-color: black;">
				나의 상품후기</li>
			<li><a href="review.shop" class="liList">나의 상품후기</a></li>
		</ul>
	</nav>
</aside>

<%-- 본문 영역(ui깨질시 본인이 ui 수정바람..) --%>
<div class="innerWrap">
		<section class="notice">
			<!-- board list area -->
			<div class="page-title">
			<b style="text-align: left; font-size: 20px; margin-left:50px;">기본정보</b>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<b style="font-size: 13px;">* 필수 입력사항</b>
			</div>
			<div class="page-title" style="margin-left: 50px;">
			<form method="post" action="#">
				<table>
					<!--아이디 -->
					<tr>
						<th rowspan="2" class="th-list" width="170px"
							style="border-top-color: black; border-top-style: solid; border-top-width: 3px;">
							* 아이디</th>
						<td class="td-inputInfo"
							style="border-top-color: black; border-top-style: solid; border-top-width: 3px;">
							<input type="text" name="id" size="70">
						</td>
					</tr>

					<tr>
						<td class="td-infoPs">* 영문소문자/숫자, 4~16자</td>
					</tr>

					<!--이름-->
					<tr>
						<th rowspan="2" class="th-list">이름 *</th>
						<td class="td-inputInfo"><input type="text" name="userName"
							size="70"></td>
					</tr>
										
					<tr>
						<td class="td-infoPs"></td>
					</tr>

					<!--주소-->
					<tr>
						<th rowspan="4" class="th-list">주소 *</th>
						<td class="td-inputInfo"><input type="text" name="adrr"
							size="20" />&nbsp;&nbsp;<input type="button" value="주소검색" style="font-weight: bold; padding: 2px;"/></td>
					</tr>

					<tr>
						<td class="td-inputInfo"><input type="text" name="adrr"
							size="70"></td>
					</tr>

					<tr>
						<td class="td-inputInfo"><input type="text" name="adrr"
							size="70"></td>
					</tr>
					
					<tr>
						<td class="td-infoPs"></td>
					</tr>
					
					<!--휴대전화-->
					<tr>
						<th rowspan="2" class="th-list">휴대전화 *</th>
						<td class="td-inputInfo">
								<select name="selectPhone">
								<option value="010">010</option>
								<option value="011">011</option>
								<option value="016">016</option>
								<option value="017">017</option>
								<option value="018">018</option>
								<option value="019">019</option>
								</select>&nbsp;&nbsp;
								-&nbsp;&nbsp;
								<input type="text" name="phone" size="10">&nbsp;&nbsp;
								-&nbsp;&nbsp;
								<input type="text" name="phone" size="10">
								&nbsp;&nbsp;
								<input type="button" value="인증번호받기" style="font-weight: bold; padding: 2px;"/>
						</td>
							
					</tr>
					
					<tr>
						<td class="td-infoPs"></td>
					</tr>
					
					<!--SMS 수신여부-->
					<tr>
						<th rowspan="2" class="th-list">SMS 수신여부 *</th>
						<td class="td-inputInfo">  
						<input type='radio' name='SMS' value='SMS_OK'/>&nbsp;&nbsp;수신함
  						<input type='radio' name='SMS' value='SMS_NO'/>&nbsp;&nbsp;수신안함
  						</td>
					</tr>

					<tr>
						<td class="td-infoPs">* 쇼핑몰에서 제공하는 유익한 이벤트 소식을 SMS로 받으실 수 있습니다</td>
					</tr>
					
					<!--이메일-->
					<tr>
						<th class="th-list" rowspan="2">이메일 *</th>
						<td class="td-inputInfo"><input type="email" name="email"
							size="70"></td>
					</tr>
					
					<tr>
						<td class="td-infoPs"></td>
					</tr>
				</table>
				
			<br><br><br>
				<div class="page-title" style="margin-bottom: 20px;">
				<b style="text-align: left; font-size: 20px; margin-left: -10px; ">추가정보</b>
				</div>
				<table>
					<!--생년월일-->
					<tr>
						<th rowspan="2" class="th-list" width="170px" style="border-top-color: black; border-top-style: solid; border-top-width: 3px;">
						생년월일 *</th>
						<td class="td-inputInfo" style="border-top-color: black; border-top-style: solid; border-top-width: 3px;">
								<input type="text" name="birth" size="10">&nbsp;년&nbsp;&nbsp; &nbsp;&nbsp;
								<input type="text" name="birth" size="10">&nbsp;월&nbsp;&nbsp; &nbsp;&nbsp;
								<input type="text" name="birth" size="10">&nbsp;일&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;
						</td>
					
					<tr>
						<td class="td-infoPs"></td>
					</tr>
				</table>
				<br>
				<div class="submitBtn">
				<input id="updateBtn" type="submit" value="회원정보수정">
				<input id="resetBtn" type="reset" value="취소">
				</div>
				</form>
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