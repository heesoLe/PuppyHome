<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri= "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous"> <%-- CDN 절대링크 --%>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN" crossorigin="anonymous"></script> <%-- CDN 절대링크 --%>
<script src="https://code.jquery.com/jquery-3.6.3.js"></script> <%-- CDN 절대링크 --%>
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.3/jquery.easing.min.js"></script> <%-- CDN 절대링크 --%>
<title>PuppyHome 메인상품페이지</title>
<link rel="shortcut icon" href="<%=request.getContextPath()%>/images/favicon.ico" type="image/x-icon"> <%-- 파비콘 --%>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/page/include/css/header.css"> <%-- header.css --%>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/page/include/css/footer.css"> <%-- footer.css --%>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/fontium/css/fontium.css"/>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/page/product/css/mainProduct.css"/>
<style type="text/css">
#nodot{
	text-decoration: none !important;
}
</style>
<script>
function checkWindowSize() {
    if ( jQuery(window).width() >= 480 ) {
        $('.truncate').succinct({
            size: 100
        }); 
    }
    else if ( jQuery(window).width() >= 320 ) {
        $('.truncate').succinct({
            size: 55
        }); 
    } 
    else {
        $('.truncate').succinct({
            size: 150
        }); 
    }   
}

jQuery(document).ready(function(){
    jQuery(window).resize(checkWindowSize);
    checkWindowSize();
});
</script>

</head>
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
		<section>
			<div class="main">
				<div class="container">
					<%-- main 화면 상단 캐러셀 (캐러셀 필요 없는 페이지는 삭제 바람!)--%>
						<div id="carouselExampleControls" class="carousel slide" data-bs-ride="carousel" data-bs-interval="2500">
						  <div class="carousel-inner">
						    <div class="carousel-item active">
						      <img src="<%=request.getContextPath()%>/images/Carousel_Img1.png" class="d-block w-100" alt="...">
						    </div>
						    <div class="carousel-item">
						      <img src="<%=request.getContextPath()%>/images/Carousel_Img2.png" class="d-block w-100" alt="...">
						    </div>
						    <div class="carousel-item">
						      <img src="<%=request.getContextPath()%>/images/Carousel_Img3.png" class="d-block w-100" alt="...">
						    </div>
						    <div class="carousel-item">
						      <img src="<%=request.getContextPath()%>/images/Carousel_Img4.png" class="d-block w-100" alt="...">
						    </div>
						    <div class="carousel-item">
						      <img src="<%=request.getContextPath()%>/images/Carousel_Img5.png" class="d-block w-100" alt="...">
						    </div>
						  </div>
						  <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleControls" data-bs-slide="prev">
						    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
						    <span class="visually-hidden">Previous</span>
						  </button>
						  <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleControls" data-bs-slide="next">
						    <span class="carousel-control-next-icon" aria-hidden="true"></span>
						    <span class="visually-hidden">Next</span>
						  </button>
						</div>
					<%-- 캐러셀 끝 이 밑으로 작성!--%>
					
<%-- 본문시작 --%>



<div class="product_grid">
  <ul class="product_list list">
  
  
  
  	<li>
  		<h3>
			<span class="txt" style="font-family: 'KIMM_Bold';">퍼피</span>
			<br>
			<button class="btn-more" id="goodsList_153" onclick="location='puppy_product.shop'"  style="font-family: 'KIMM_Bold'; margin-left: 1200px; font-size: 15px; border: none; font-weight: bold; background-color: white;">더보기></button>
		</h3>
  	</li>
	  
  	<%-- 첫번째 상품 --%>
  	<c:forEach begin="0" end="4" step="1" var = "p" items="${plist}">
    <li class="product_item" onclick="location='product_dsc.shop?product_title=${p.product_title}'">
      <div class="product_image">
        <a href="product_dsc.shop"><img src="<%=request.getContextPath()%>/images/${fn:split(p.product_cont,',')[0]}"  alt="상품 사진" style="max-width:100%; max-height:auto;"></a>
          <div class="product_buttons">
            <button class="product_heart">♥<i class="heart"></i></button>
          </div>
      </div>
      <div class="product_values">
        <div class="product_title">
          <a href="product_dsc.shop"><span class="goods_title"><h5>${p.product_title}</h5></span></a>
        </div>
        <div class="product_price">
          <a href="#"><span class="price_new">${p.product_price}원</span></a>
            <br>
          <span class="product_rating"></span>
          <%-- 별점 --%>
        </div>
        <div class="product_buttons">
          <button class="product_heart"><i class="heart"></i></button>
        </div>
      </div>
    </li>
    
    </c:forEach>

    
  
  	<li>
  		<h3>
			<span class="txt" style="font-family: 'KIMM_Bold';">껌간식</span>
			<br>
			<button class="btn-more" id="goodsList_153" onclick="location='gum_product.shop'" style="font-family: 'KIMM_Bold'; margin-left: 1200px; font-size: 15px; border: none; font-weight: bold; background-color: white;">더보기></button>
		</h3>
  	</li>
	  
  	  	<%-- 첫번째 상품 --%>
  	<c:forEach begin="0" end="4" step="1" var = "p" items="${glist}">
    <li class="product_item" onclick="location='product_dsc.shop?product_title=${p.product_title}'">
      <div class="product_image">
        <a href="product_dsc.shop">
        <img src="<%=request.getContextPath()%>/images/${fn:split(p.product_cont,',')[0]}" alt="상품 사진" style="max-width:100%; max-height:auto;"></a>
          <div class="product_buttons">
            <button class="product_heart">♥<i class="heart"></i></button>
          </div>
      </div>
      <div class="product_values">
        <div class="product_title">
          <a href="product_dsc.shop"><span class="goods_title"><h5>${p.product_title}</h5></span></a>
        </div>
        <div class="product_price">
          <a href="#"><span class="price_new">${p.product_price}원</span></a>
            <br>
          <span class="product_rating"></span>
          <%-- 별점 --%>
        </div>
        <div class="product_buttons">
          <button class="product_heart"><i class="heart"></i></button>
        </div>
      </div>
    </li>
    
    </c:forEach>
    
  	<li id="nodot">
  		<h3>
			<span class="txt" style="font-family: 'KIMM_Bold'; text-decoration: none;">유산균</span>
			<br>
			<button class="btn-more" id="goodsList_153" onclick="location='probio_product.shop'" style="font-family: 'KIMM_Bold'; margin-left: 1200px; font-size: 15px; border: none; font-weight: bold; background-color: white;">더보기></button>
		</h3>
  	</li>
	  
  	  	<%-- 첫번째 상품 --%>
  	<c:forEach begin="0" end="4" step="1" var = "p" items="${prlist}">
    <li class="product_item" onclick="location='product_dsc.shop?product_title=${p.product_title}'">
      <div class="product_image">
        <a href="product_dsc.shop"><img src="<%=request.getContextPath()%>/images/${fn:split(p.product_cont,',')[0]}"  alt="상품 사진" style="max-width:100%; max-height:auto;"></a>
          <div class="product_buttons">
            <button class="product_heart">♥<i class="heart"></i></button>
          </div>
      </div>
      <div class="product_values">
        <div class="product_title">
          <a href="product_dsc.shop"><span class="goods_title"><h5>${p.product_title}</h5></span></a>
        </div>
        <div class="product_price">
          <a href="#"><span class="price_new">${p.product_price}원</span></a>
            <br>
          <span class="product_rating"></span>
          <%-- 별점 --%>
        </div>
        <div class="product_buttons">
          <button class="product_heart"><i class="heart"></i></button>
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
		<jsp:include page="/page/include/footer.jsp"/>
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