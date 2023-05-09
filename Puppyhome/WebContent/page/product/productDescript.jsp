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
<title>PuppyHome 상품설명</title>
<link rel="shortcut icon" href="<%=request.getContextPath()%>/images/favicon.ico" type="image/x-icon"> <%-- 파비콘 --%>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/page/include/css/header.css"> <%-- header.css --%>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/page/include/css/footer.css"> <%-- footer.css --%>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/fontium/css/fontium.css"/>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/page/product/css/productDescript.css"/>


<style type="text/css">

#gume {
	    background: #FC5400;
	    color: white;
	    font-size: 22px;
	    /* margin-left: 26px; */
	    display: table;
	    table-layout: fixed;
	    width: 100%;
	    height: 60px;
	    border: 3px solid black;
	    border-bottom: 1px solid black;
	    text-align: center;
	    -webkit-font-smoothing: subpixel-antialiased;
	    -webkit-text-size-adjust: none;
	    -webkit-tap-highlight-color: rgba(0,0,0,0);
}

</style>


<script>
/*
var plus = document.querySelector(".plus");
var minus = document.querySelector(".minur");
var result = document.querySelector("#num");
var totalcost = document.querySelector(".totalcost");
var i = 1;
plus.addEventListener("click",() => {
	i++;
	result.textContent = i;
	var totalcostNum = i * 13000;
	totalcost.textContent = totalcostNum.toLocaleString();
	
	
});

minus.addEventListener("click",() => {
	if(i > 0){
		i--;
		result.textContent = i;
		var totalcostNum = i * 13000;
		totalcost.textContent = totalcostNum.toLocaleString();
	} else {
		totalcost.textContent = 0;
	}
	
});
*/

var init = 1;
document.querySelector("#num").innerText = init;
var totalcost;

function plus() {
var	price = ${p.product_price};

  init += 1;
  document.querySelector("#num").innerText = init;
  totalcost = price * init;
  document.querySelector(".totalcost").innerText = totalcost;
  //document.querySelector(".totalcost").innerText = init * price;
  
  //${totalcost}=totalcost;
  //alert(${totalcost});
  
}

function minus() {
	var	price = ${p.product_price};
	
  init < 1 ? (init = 0) : (init -= 1);
  document.querySelector("#num").innerText = init;
  totalcost = price * init;
  document.querySelector(".totalcost").innerText = totalcost;
  //document.querySelector(".totalcost").innerText = init * price;
}

function sendPost(action) {
	if(init == 1){
		action = action + "&product_cnt=" + init + "&total_price=${p.product_price}";
	}else{
		action = action + "&product_cnt=" + init + "&total_price=" + totalcost;
	}
	
    location=action;
	/*

	var form = document.createElement('form');

	form.setAttribute('method', 'post');

	form.setAttribute('action', action);

	document.charset = "utf-8";

	for ( var key in params) {

		var hiddenField = document.createElement('input');

		hiddenField.setAttribute('type', 'hidden');

		hiddenField.setAttribute('name', key);

		hiddenField.setAttribute('value', params[key]);

		form.appendChild(hiddenField);

	}

	document.body.appendChild(form);

	form.submit();
*/
}




/*
function price_sum(){
	var i = document.querySelector("#num");
	var price = document.querySelector(".sale-price");
	document.querySelector(".totalcost").innerText = i * price;
}*/
   // 탭 변경 부분 - 완
	$('.contentNav li').click(function(e){
		e.preventDefault();
 		var idx = $(this).index();
 		$('.contentNav li').removeClass('active').eq(idx).addClass('active');
 		$('table').removeClass('active').eq(idx).addClass('active');
 		});

   // 상품 후기 부분 - 임시 완
   $('.tproduct-review tbody tr .tcontent').click(function(){
   //전체 글자의 변수를 2번 잡아서 . 한번은 위쪽 내용. 한번은 아래쪽 내용 출력
   //위쪽 내용
    var text = $(this).children('span').html(); //전체 html또는 text를 가져와서
    var full = $(this).closest('tr').next('tr').children('td').eq(1).text(text).css('text-align','left'); // tr 출력후 나머지 글자 출력 및 정렬
    // var cut = $(this).closest('tr').next('tr').children('td').eq(1).text();
   $(this).closest('tr').next('tr').toggleClass('display'); //자세한 이용후기 tr 출력하기
  });



function Click1() {
	alert("구매하기");
}

function Click2() {
	alert("찜하기");
}

function Click3() {
	alert("장바구니");
}
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
	<div class="shCMSshop">
		<div class="shopView">
			<div class="viewHeader">
				<!-- 상품이미지 -->
				<%--<form action="location='" method="get"> --%>
				<div class="productImg">
					<div class="mainImg">
						<img src="<%=request.getContextPath()%>/images/${fn:split(p.product_cont,',')[0]}" 
						width="500px;" alt="">
					</div>
					<%-- 
					<ul>
						<li class="subImg"><img src="https://search.pstatic.net/common/?src=http%3A%2F%2Fshop1.phinf.naver.net%2F20210730_134%2F1627627649541acadd_PNG%2F28763538245462198_1164728166.png&type=sc960_832" width="85" height="85" 
    cursor="pointer"
    margin-left="30px"
						alt="서브 이미지1"></li>
						<li><img src="https://search.pstatic.net/common/?src=http%3A%2F%2Fshop1.phinf.naver.net%2F20210730_134%2F1627627649541acadd_PNG%2F28763538245462198_1164728166.png&type=sc960_832" width="85" height="85" 
    cursor="pointer"
    margin-left="30px" alt="서브 이미지2"></li>
						<li><img src="sub01.jpg" alt="서브 이미지3"></li>
						<li><img src="sub01.jpg" alt="서브 이미지4"></li>
					</ul>
					--%>
				</div>
				<!-- 상품 설명 -->
				<div class="productInfo">
					<h1>${p.product_title}</h1>
					<div class="price">
						<span class="sale-price" style="margin-left: 10px;" id="cost">${p.product_price}원</span>
					</div>
					
					
					<div class="star-ratings">별점       	<span style="margin-left:20px; color:#fda50d;">${p.product_star}</span>&nbsp;<span style="color:#fda50d;">★</span><span style="color:#fda50d;">★</span><span style="color:#fda50d;">★</span><span style="color:#fda50d;">★</span><span>★</span></div>
					<div class="manufact">제조사       <span>${p.product_maker}</span></div>
					<div class="categori">분류           <span>${p.product_type}</span></div>
					<div class="origin">원산지       <span>각 재료 별 원산지는 상세설명 참조</span></div>
					<div class="item">
						<span class="it">
							<%--<a href="" class="minur" style="border: none; background: white;" onclick="minus()">-</a>--%>
							<input type="button" value="-" onclick="minus()" style="background: white; border: none;">
							<span id="num">1</span>
							<input type="button" value="+" onclick="plus()" style="background: white; border: none;">
							<%-- <a href="" class="plus" style="border: none; background: white;" onclick="plus()">+</a>--%>
						</span>
					</div>
					<div class="all-price">총 상품금액        <span class="totalcost">${p.product_price}</span>원</div>

					<div class="btn">
						<div class="first">
							<%--<a href="#" class="psbtn"  onclick="sendPost('payment.shop?product_title=${p.product_title}&product_price=${p.product_price}');">구매하기</a> --%>
							<input type="button" id="gume" class="psbtn" value="구매하기"  onclick="sendPost('payment.shop?product_title=${p.product_title}&product_price=${p.product_price}');">
						</div>
						
						<div class="second">
							<a href="#" role="button" class="fbbtn" onclick="Click2();">찜하기</a>
							<a href="#" role="button" class="ctbtn" onclick="Click3();">장바구니</a>
						</div>
					</div>
			
			</div>
			<%--</form> --%>
			
<!-- 하단의 탭부분 시작 -->
			<div class="viewBody">
				<ul class="contentNav">
					<li class="active"><a href="">상품 정보</a></li>
					<li><a href="">상품 후기<span>(<span class="count">20</span>)</span></a></li>
					<li><a href="">Q & A <span></span></a></li>
					<li><a href="">반품 / 교환</a></li>
				</ul>
				<!-- 탭부분 끝 -->
				<!-- 상품정보 -->
				<%--
				<table class="tproduct-info active">
					<tr>
						<td>제품명</td>
						<td>오리젠 오리지널</td>
						<td>식품의 유형</td>
						<td>사료/어덜트</td>
					</tr>
					<tr>
						<td>용량</td>
						<td>1kg ,3kg, 11.7kg</td>
						<td>제조사</td>
						<td>오리젠</td>
					</tr>
					<tr>
						<td>제조년월일</td>
						<td>제조일로부터 일주일이내 포장된 제품으로 발송됩니다.</td>
						<td>품질유지기한</td>
						<td>제조일로부터 1년</td>
					</tr>
					<tr>
						<td>보관방법</td>
						<td colspan="3">습기가 없는 상온보관 하십시오. 개봉후에는 반드시 빛이 닿지 않는 서늘한 장소에 밀봉하여 보관하여 주십시오</td>
					</tr>
					<tr>
						<td>원재료명 및 함량</td>
						<td colspan="3">신선한 닭고기(25%), 신선한 칠면조 고기(8%), 신선한 닭 내장육(간, 심장)(7%), 신선한 통 청어(6&), 신선한 통 대구(5%), 신선한 달걀(5%), 신선한 칠면조간(5%), 건조닭고기(4%), 건조 칠면조고기(4%), 건조 고등어(4%), 건조 정어리(4%), 건조 청어(4%)</td>
					</tr>
				</table>
				 --%>
				
				<%--상품 메인 설명 --%>
				<div class="product_main_dsc">
					<ul>
						<li><h2></h2></li>
					 	<li><img src="<%=request.getContextPath()%>/images/${fn:split(p.product_cont,',')[1]}" style="height: 1000px; width: 800px;"></li>
						<li><img src="<%=request.getContextPath()%>/images/${fn:split(p.product_cont,',')[2]}" style="height: 1000px; width: 800px;"></li>
						<%--<li><img src="http://localhost:8046/Shopping_Mall/images/상품3.png"></li>
						<li><img src="http://localhost:8046/Shopping_Mall/images/상품4.png"></li>
						<li><img src="http://localhost:8046/Shopping_Mall/images/상품5.png"></li>
						<li><img src="http://localhost:8046/Shopping_Mall/images/상품6.png"></li>
						<li><img src="http://localhost:8046/Shopping_Mall/images/상품7.png"></li>
						<li><img src="http://localhost:8046/Shopping_Mall/images/상품8.png"></li>
						<li><img src="http://localhost:8046/Shopping_Mall/images/상품9.png"></li>
						<li><img src="http://localhost:8046/Shopping_Mall/images/상품10.png"></li>
						  --%>
						  
					
					</ul>
				</div>
				
				
				<!-- 상품 후기 -->
				<table class="tproduct-review">
					<thead>
						<tr>
							<td>평점</td>
							<td>내용</td>
							<td>작성자</td>
							<td>작성일</td>
						</tr>
					</thead>
					<tr>
						<td>별점</td>
						<td class="tcontent"><img src="" alt=""><span>내용 - 짧은 내용(동해물과 백두산이 마르고 닳도록 하느님이 보우하사 우리나라만세</span></td>
						<td>rud***</td>
						<td>2017-09-26 10:20</td>
					</tr>
					<tr class="detail-content">
						<td></td>
						<td></td>
						<td></td>
						<td></td>
					</tr>
					<tr>
						<td>별점</td>
						<td class="tcontent"><img src="" alt=""><span>내용 - 짧ㅁㄴㅇㄻㄴㅇㄻㄴ은 내용(동해물과 백두산이 마르고 닳도록 블라불라블라 </span></td>
						<td>rud***</td>
						<td>2017-09-26 10:20</td>
					</tr>
					<tr class="detail-content">
						<td></td>
						<td></td>
						<td></td>
						<td></td>
					</tr><tr>
						<td>별점</td>
						<td class="tcontent"><img src="" alt=""><span>내용 - 짧은 내용(동해물과 백두산이 마르고 닳도록 </span></td>
						<td>rud***</td>
						<td>2017-09-26 10:20</td>
					</tr>
					<tr class="detail-content">
						<td></td>
						<td></td>
						<td></td>
						<td></td>
					</tr>
				</table>
				<!-- Q & A  -->
					<table class="tquestion">
						<thead>
							<tr>
								<td>번호</td>
								<td colspan="2">내용</td>
								<td>작성자</td>
								<td>작성일
								<a href="">문의 하기</a>
								</td>
							</tr>
					</thead>
						<tr>
							<td>글번호</td>
							<td class="answer-no">미완료</td>
							<td class="tcontent">내용 - 문의</td>
							<td>rud***</td>
							<td>2017-09-26 10:20</td>
						</tr>
						<tr>
							<td>글번호</td>
							<td class="answer-ok">답변완료</td>
							<td class="tcontent">내용 - 문의</td>
							<td>rud***</td>
							<td>2017-09-26 10:20</td>
						</tr>
					</table>
			</div>
		</div>
	</div>

</div>
</div>
		</section>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<%-- top버튼 삭제 X --%>
	<div id="topBtn">
		<span class="fonti um-arrow-circle-up um-3x icon"></span>TOP
	</div>
	<%-- 푸터 영역 --%>
	<footer>
		<jsp:include page="/page/include/footer.jsp"/>
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