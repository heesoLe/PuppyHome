<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous"> <%-- CDN 절대링크 --%>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN" crossorigin="anonymous"></script> <%-- CDN 절대링크 --%>
<script src="https://code.jquery.com/jquery-3.6.3.js" integrity="sha256-nQLuAZGRRcILA+6dMBOvcRh5Pe310sBpanc6+QBmyVM=" crossorigin="anonymous"></script> <%-- CDN 절대링크 --%>
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.3/jquery.easing.min.js"></script> <%-- CDN 절대링크 --%>
<title>PuppyHome 사료</title>
<link rel="shortcut icon" href="<%=request.getContextPath()%>/images/favicon.ico" type="image/x-icon"> <%-- 파비콘 --%>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/page/include/css/header.css"><%-- header.css --%>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/page/include/css/footer.css"><%-- footer.css --%>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/fontium/css/fontium.css" />
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/page/product/css/adultList.css" />


<script>
	function checkWindowSize() {
		if (jQuery(window).width() >= 480) {
			$('.truncate').succinct({
				size : 100
			});
		} else if (jQuery(window).width() >= 320) {
			$('.truncate').succinct({
				size : 55
			});
		} else {
			$('.truncate').succinct({
				size : 150
			});
		}
	}

	jQuery(document).ready(function() {
		jQuery(window).resize(checkWindowSize);
		checkWindowSize();
	});
</script>
<style type="text/css">
.menuCategory li:nth-child(2) a {
	border-bottom: 5px solid black;
}
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
		<section>
			<div class="main">
				<div class="container">


			<%-- 본문시작 --%>
			<div class="product_kind">

				<div class="xans-element- xans-product xans-product-headcategory title ">
					<h2>
						<span class="menuImg"> 
						<a href="#" onclick="location='puppy_product.shop'"> 
						<img src="<%=request.getContextPath()%>/images/Feed.png"width="200px">
						</a> <br> 사료
						</span>
					</h2>
				</div>
			</div>

			<%-- 버튼 --%>
			<div class="product_kind_button">
				<ul class="menuCategory">
					<li style="display:;" class="xans-element- xans-product xans-product-displaycategory selected xans-record-">
						<a href="#" onclick="location='puppy_product.shop'">퍼피 <span class="count displaynone">()</span></a>
					</li>
					<li style="display:;" class="xans-element- xans-product xans-product-displaycategory  xans-record-">
						<a href="#" onclick="location='adult_product.shop'">어덜트 <span class="count displaynone">()</span></a>
					</li>
					<li style="display:;" class="xans-element- xans-product xans-product-displaycategory  xans-record-">
						<a href="#" onclick="location='senior_product.shop'">시니어 <span class="count displaynone">()</span></a>
					</li>
				</ul>
			</div>

			<div class="xans-element- xans-product xans-product-normalmenu ">
				
				<div class="function" id="Product_ListMenu">
					<p class="prdCount">등록 제품 : <strong>224</strong>개</p>
					<ul id="type" class="xans-element- xans-product xans-product-orderby">
						<li class="xans-record-">
							<a href="?cate_no=97&amp;sort_method=5#Product_ListMenu">신상품</a>
						</li>
						<li class="xans-record-">
							<a href="?cate_no=97&amp;sort_method=3#Product_ListMenu">낮은가격</a>
						</li>
						<li class="xans-record-"> 
							<a href="?cate_no=97&amp;sort_method=4#Product_ListMenu">높은가격</a>
						</li>
						<li class="xans-record-">
							<a href="?cate_no=97&amp;sort_method=6#Product_ListMenu">인기상품</a>
						</li>
						<li class="xans-record-">
							<a href="?cate_no=97&amp;sort_method=7#Product_ListMenu">할인률</a>
						</li>
					</ul>
				</div>
			</div>
			<div class="product_grid">
				<ul class="product_list list">

				<%-- 상품 --%>
				<c:forEach var="p" items="${plist}">
				<li class="product_item" onclick="location='product_dsc.shop?product_title=${p.product_title}'">

					<div class="product_image">
						<a href="#">
						<img src="<%=request.getContextPath()%>/images/${fn:split(p.product_cont,',')[0]}" alt="상품 사진"></a>
						<div class="product_buttons">
							<button class="product_heart">♥<i class="heart"></i></button>
						</div>
					</div>
					<div class="product_values">
						<div class="product_title">
							<a href="#"><span class="goods_title"><h5>${p.product_title}</h5></span></a>
						</div>
						<div class="product_price">
							<a href="#"><span class="price_new">${p.product_price}원</span></a>
							<br> <span class="product_rating"></span> <%-- 별점 --%>
						</div>
						<div class="product_buttons">
							<button class="product_heart">
								<i class="heart"></i>
							</button>
						</div>
					</div>
				</li>
				</c:forEach>
			</ul>
			</div>
			
			</div>
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
	</script>
</body>
</html>