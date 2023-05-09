<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous"> <%-- CDN 절대링크 --%>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN" crossorigin="anonymous"></script> <%-- CDN 절대링크 --%>
<script src="https://code.jquery.com/jquery-3.6.3.js"></script> <%-- CDN 절대링크 --%>
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.3/jquery.easing.min.js"></script> <%-- CDN 절대링크 --%>
<title>PuppyHome 영양제</title>
<link rel="shortcut icon" href="<%=request.getContextPath()%>/images/favicon.ico" type="image/x-icon"> <%-- 파비콘 --%>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/page/include/css/header.css"> <%-- header.css --%>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/page/include/css/footer.css"> <%-- footer.css --%>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/fontium/css/fontium.css"/>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/page/product/css/medicineList.css"/>


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

					
<%-- 본문시작 --%>
					<div class="product_kind">

						<div
							class="xans-element- xans-product xans-product-headcategory title ">
							<h2>
								<span class="menuImg">
									<a href="#">
									<img src="<%=request.getContextPath()%>/images/Medicine.png" width="200px">
									</a>
									<br>
									영양제
								</span>
							</h2>
						</div>
					</div>

						<%-- 버튼 --%>
						<div class="product_kind_button">
							<ul class="menuCategory">
								
								
								<li style="display:;" class="xans-element- xans-product xans-product-displaycategory selected xans-record-">
								<a href="#">유산균
								<span class="count displaynone">()</span></a>
									
								</li>
								
								
								
								
								<li style="display:;"
									class="xans-element- xans-product xans-product-displaycategory  xans-record-"><a
									href="/category/연령별/26/">오메가3 <span
										class="count displaynone">()</span></a>
									
								</li>
								
								
							</ul>
						</div>
					
					




<div class="xans-element- xans-product xans-product-normalmenu "><!--
            $compare_page = /product/compare.html
        -->
<div class="function" id="Product_ListMenu">
            <p class="prdCount">등록 제품 : <strong>224</strong>개</p>
            <ul id="type" class="xans-element- xans-product xans-product-orderby">
<li class="xans-record-"><a href="?cate_no=97&amp;sort_method=5#Product_ListMenu">신상품</a></li>
<li class="xans-record-"><a href="?cate_no=97&amp;sort_method=3#Product_ListMenu">낮은가격</a></li>
<li class="xans-record-"><a href="?cate_no=97&amp;sort_method=4#Product_ListMenu">높은가격</a></li>
<li class="xans-record-"><a href="?cate_no=97&amp;sort_method=6#Product_ListMenu">인기상품</a></li>
<li class="xans-record-"><a href="?cate_no=97&amp;sort_method=7#Product_ListMenu">할인률</a></li>
</ul>
</div>

</div>














<div class="product_grid">
  <ul class="product_list list">
  	<%-- 첫번째 상품 --%>
    <li class="product_item">
      <div class="product_sale">
        <p>20%</p>
      </div>
      <div class="product_image">
        <a href="#"><img src="https://search.pstatic.net/common/?src=http%3A%2F%2Fshop1.phinf.naver.net%2F20210730_134%2F1627627649541acadd_PNG%2F28763538245462198_1164728166.png&type=sc960_832"  alt="상품 사진"></a>
          <div class="product_buttons">
            <button class="product_heart">♥<i class="heart"></i></button>
          </div>
      </div>
      <div class="product_values">
        <div class="product_title">
          <a href="#"><span class="goods_title"><h5>오리젠 오리지널 독 11.4kg</h5></span></a>
        </div>
        <div class="product_price">
          <a href="#"><span class="price_old">\144,000</span> <span class="price_new">\115,200</span></a>
          <br>
          <span class="product_rating"></span>
          <%-- 별점 --%>
        </div>
        <div class="product_buttons">
          <button class="product_heart"><i class="heart"></i></button>
        </div>
      </div>
    </li>
    
    
    <%-- 두번째 상품 --%>
    <li class="product_item">
      <div class="product_image">
         <a href="#"><img src="https://search.pstatic.net/common/?src=http%3A%2F%2Fshop1.phinf.naver.net%2F20230225_30%2F1677284682916mrVBy_JPEG%2F38245582912854976_850835554.jpg&type=sc960_832	"  alt="상품 사진"></a>
          <div class="product_buttons">
            <button class="product_heart">♥<i class="heart"></i></button>
          </div>
      </div>
      <div class="product_values">
        <div class="product_title">
          <a href="#"><span class="goods_title"><h5>오리젠 오리지널 독 11.4kg</h5></span></a>
        </div>
        <div class="product_price">
          <a href="#"><span class="price_new">\144,000</span></a>
          <br>
          <span class="product_rating"></span>
          <%-- 별점 --%>
        </div>
        <div class="product_buttons">
          <button class="product_heart"><i class="heart"></i></button>
        </div>
      </div>
    </li>
    
    
    <%-- 세번째 상품 --%>
    <li class="product_item">
      <div class="product_sale">
        <p>20%</p>
      </div>
      <div class="product_image">
        <a href="#"><img src="https://search.pstatic.net/common/?src=http%3A%2F%2Fshop1.phinf.naver.net%2F20230223_7%2F1677124517532sCe5l_JPEG%2F78260360248721655_1024265989.jpg&type=sc960_832"  alt="상품 사진"></a>
          <div class="product_buttons">
            <button class="product_heart">♥<i class="heart"></i></button>
          </div>
      </div>
      <div class="product_values">
        <div class="product_title">
          <a href="#"><span class="goods_title"><h5>오리젠 오리지널 독 11.4kg</h5></span></a>
        </div>
        <div class="product_price">
          <a href="#"><span class="price_old">\144,000</span> <span class="price_new">\115,200</span></a>
          <br>
          <span class="product_rating"></span>
          <%-- 별점 --%>
        </div>
        <div class="product_buttons">
          <button class="product_heart"><i class="heart"></i></button>
        </div>
      </div>
    </li>
    
    
    <%-- 네번째 상품 --%>
    <li class="product_item">
      <div class="product_image">
         <a href="#"><img src="<%=request.getContextPath()%>/images/Orijen_Original.jpg"  alt="상품 사진"></a>
          <div class="product_buttons">
            <button class="product_heart">♥<i class="heart"></i></button>
          </div>
      </div>
      <div class="product_values">
        <div class="product_title">
          <a href="#"><span class="goods_title"><h5>오리젠 오리지널 독 11.4kg</h5></span></a>
        </div>
        <div class="product_price">
          <a href="#"><span class="price_new">\144,000</span></a>
          <br>
          <span class="product_rating"></span>
          <%-- 별점 --%>
        </div>
        <div class="product_buttons">
          <button class="product_heart"><i class="heart"></i></button>
        </div>
      </div>
    </li>
    
    
   <%-- 다섯번째 상품 --%>
    <li class="product_item">
      <div class="product_sale">
        <p>20%</p>
      </div>
      <div class="product_image">
         <a href="#"><img src="<%=request.getContextPath()%>/images/Orijen_Original.jpg"  alt="상품 사진"></a>
          <div class="product_buttons">
            <button class="product_heart">♥<i class="heart"></i></button>
          </div>
      </div>
      <div class="product_values">
        <div class="product_title">
          <a href="#"><span class="goods_title"><h5>오리젠 오리지널 독 11.4kg</h5></span></a>
        </div>
        <div class="product_price">
          <a href="#"><span class="price_old">\144,000</span> <span class="price_new">\115,200</span></a>
          <br>
          <span class="product_rating"></span>
          <%-- 별점 --%>
        </div>
        <div class="product_buttons">
          <button class="product_heart"><i class="heart"></i></button>
        </div>
      </div>
    </li>
    
    
    
    <%-- 6번째 상품 --%>
    <li class="product_item">
      <div class="product_image">
         <a href="#"><img src="<%=request.getContextPath()%>/images/Orijen_Original.jpg"  alt="상품 사진"></a>
          <div class="product_buttons">
            <button class="product_heart">♥<i class="heart"></i></button>
          </div>
      </div>
      <div class="product_values">
        <div class="product_title">
          <a href="#"><span class="goods_title"><h5>오리젠 오리지널 독 11.4kg</h5></span></a>
        </div>
        <div class="product_price">
          <a href="#"><span class="price_new">\144,000</span></a>
          <br>
          <span class="product_rating"></span>
          <%-- 별점 --%>
        </div>
        <div class="product_buttons">
          <button class="product_heart"><i class="heart"></i></button>
        </div>
      </div>
    </li>
    
    
    <%-- 7번째 상품 --%>
    <li class="product_item">
      <div class="product_image">
         <a href="#"><img src="<%=request.getContextPath()%>/images/Orijen_Original.jpg"  alt="상품 사진"></a>
          <div class="product_buttons">
            <button class="product_heart">♥<i class="heart"></i></button>
          </div>
      </div>
      <div class="product_values">
        <div class="product_title">
          <a href="#"><span class="goods_title"><h5>오리젠 오리지널 독 11.4kg</h5></span></a>
        </div>
        <div class="product_price">
          <a href="#"><span class="price_new">\144,000</span></a>
          <br>
          <span class="product_rating"></span>
          <%-- 별점 --%>
        </div>
        <div class="product_buttons">
          <button class="product_heart"><i class="heart"></i></button>
        </div>
      </div>
    </li>
    
    
    
    
    
    
    
    <%-- 8번째 상품 --%>
    <li class="product_item">
      <div class="product_image">
         <a href="#"><img src="<%=request.getContextPath()%>/images/Orijen_Original.jpg"  alt="상품 사진"></a>
          <div class="product_buttons">
            <button class="product_heart">♥<i class="heart"></i></button>
          </div>
      </div>
      <div class="product_values">
        <div class="product_title">
          <a href="#"><span class="goods_title"><h5>오리젠 오리지널 독 11.4kg</h5></span></a>
        </div>
        <div class="product_price">
          <a href="#"><span class="price_new">\144,000</span></a>
          <br>
          <span class="product_rating"></span>
          <%-- 별점 --%>
        </div>
        <div class="product_buttons">
          <button class="product_heart"><i class="heart"></i></button>
        </div>
      </div>
    </li>
    
    
    
    
    
    
    
    <%-- 9번째 상품 --%>
    <li class="product_item">
      <div class="product_image">
         <a href="#"><img src="<%=request.getContextPath()%>/images/Orijen_Original.jpg"  alt="상품 사진"></a>
          <div class="product_buttons">
            <button class="product_heart">♥<i class="heart"></i></button>
          </div>
      </div>
      <div class="product_values">
        <div class="product_title">
          <a href="#"><span class="goods_title"><h5>오리젠 오리지널 독 11.4kg</h5></span></a>
        </div>
        <div class="product_price">
          <a href="#"><span class="price_new">\144,000</span></a>
          <br>
          <span class="product_rating"></span>
          <%-- 별점 --%>
        </div>
        <div class="product_buttons">
          <button class="product_heart"><i class="heart"></i></button>
        </div>
      </div>
    </li>
    
    
    
    
    
    
    <%-- 10번째 상품 --%>
    <li class="product_item">
      <div class="product_image">
         <a href="#"><img src="<%=request.getContextPath()%>/images/Orijen_Original.jpg"  alt="상품 사진"></a>
          <div class="product_buttons">
            <button class="product_heart">♥<i class="heart"></i></button>
          </div>
      </div>
      <div class="product_values">
        <div class="product_title">
          <a href="#"><span class="goods_title"><h5>오리젠 오리지널 독 11.4kg</h5></span></a>
        </div>
        <div class="product_price">
          <a href="#"><span class="price_new">\144,000</span></a>
          <br>
          <span class="product_rating"></span>
          <%-- 별점 --%>
        </div>
        <div class="product_buttons">
          <button class="product_heart"><i class="heart"></i></button>
        </div>
      </div>
    </li>
    
    
       
  </ul>
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