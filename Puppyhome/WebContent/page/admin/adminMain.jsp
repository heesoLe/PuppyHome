<%@ page contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous"> <%-- CDN 절대링크 --%>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN" crossorigin="anonymous"></script> <%-- CDN 절대링크 --%>
<script src="https://code.jquery.com/jquery-3.6.3.js"></script> <%-- CDN 절대링크 --%>
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.3/jquery.easing.min.js"></script> <%-- CDN 절대링크 --%>

<script src="https://cdn.jsdelivr.net/npm/chart.js"></script> <%-- 차트 : 매출 Chart --%>

<title>PuppyHome 관리자 Main</title>

<link rel="shortcut icon" href="<%=request.getContextPath()%>/images/favicon.ico" type="image/x-icon"> <%-- 파비콘 --%>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/page/include/css/header.css"> <%-- header.css --%>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/page/include/css/footer.css"> <%-- footer.css --%>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/page/admin/css/admin.css"> <%-- admin 계정.css --%>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/page/admin/css/adminMain.css"> <%-- adminMain.css --%>

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
		width: 100%;
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
	.meau {
	padding-top: 30px;
	padding-left: 800px;
	font-family: 'KIMM_Bold';
	}
	
	.meau a {
		color: white;
		text-decoration: none;
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
				<div class="adminMainpage"> <%-- adminMainpage --%>		
						<%-- admin 계정 --%>
						<h1 class="name" style="color: #fc9300">Admin Page</h1>
						 
						 <div class="profile_img" align="center">
						 <a href="adminMain.shop"><img width="150px" height="190px" align="left" alt="adminImage" src="<%=request.getContextPath() %>/images/admin.png">
						 </a>
						 
						 <div class="meau" align="right" style="color: white;">
							 <a href="mlist.shop">회원 관리</a> | 
							 <a href="csboard.shop">문의 게시판</a> | 
							 <a href="gslist.shop">상품 목록</a> | 
							 <a href="aSales.shop">매출 관리</a>
						 </div>
						 
						  <h3 class="myinfo" align="left"><b>관리자 계정</b> <br></h3>
						  	<div class="myinfo_date" align="left"> 가입일 : 2023.03.15.</div> <br>
						  </div><%-- end profile_img --%>
				</div> <%-- end adminMainpage --%>
				
				<%-- 건수들 확인 테이블 --%>
				<div class="totalMain">	<%-- Main --%>		
					<div class="kong">
						<div class="kong2" >
								<h3>주문/배송</h3>
								<table>
									<tr><th>결제대기</th> <th>&nbsp;</th> <th>2 건</th> </tr>
									<tr><th>신규주문</th><th>&nbsp;</th><th>5 건</th></tr>
									<tr><th>오늘출발</th><th>&nbsp;</th><th>6 건</th></tr>
									<tr><th>예약구매</th><th>&nbsp;</th><th>4 건</th></tr>		
								</table>
						</div>
						<div class="kong2"> 
								<h3>배송</h3>
								<table>
									<tr><th>배송준비</th> <th>&nbsp;</th> <th>5 건</th> </tr>
									<tr><th>배송중</th><th>&nbsp;</th><th>5 건</th></tr>
									<tr><th>배송완료</th><th>&nbsp;</th><th>6 건</th></tr>
									<tr><th>미수령 신고</th><th>&nbsp;</th><th>1 건</th></tr>		
								</table>
							</div>
							<div class="kong2"> 	
								<h3>정산</h3>
								<table>
									<tr><th>구매확정</th> <th>&nbsp;</th> <th>5 건</th> </tr>
									<tr><th>오늘정산</th><th>&nbsp;</th><th>2 건</th></tr>
									<tr><th>정산예정</th><th>&nbsp;</th><th>5 건</th></tr>
									<tr><th>충전금</th><th>&nbsp;</th><th>1 건</th></tr>		
								</table>
							</div>
							<div class="kong2"> 
								<h3>취소신청</h3>
								<table>
									<tr><th>취소신청</th> <th>&nbsp;</th> <th>2 건</th> </tr>
									<tr><th>반품</th><th>&nbsp;</th><th>2 건</th></tr>
									<tr><th>교환신청</th><th>&nbsp;</th><th>7 건</th></tr>		
								</table>
							</div>
							<div class="kong2"> 	
								<h3>미답변문의</h3>
								<table>
									<tr><th>상품문의</th> <th>&nbsp;</th> <th>5 건</th> </tr>
									<tr><th>반품/교환</th><th>&nbsp;</th><th>5 건</th></tr>
									<tr><th>기타</th><th>&nbsp;</th><th>2 건</th></tr>		
								</table>
							</div>
						</div><%-- end kong --%>
			</div><%-- end totalMain --%>
		
			
			<div class="chart"> <%-- chart --%>
				<div class="totalchart">
				<h2>Puppy Home 매출 전체 현황</h2>
				<p></p>
				<%-- 매출 차트 --%>
				<div id="container">
					<canvas id="canvas" style="margin-left: 5px;"></canvas>
				</div>
				
				<script type="text/javascript">
					
					var ChartHelper = {
						chartColors : {
							red : 'rgb(255, 99, 132)',
							orange : 'rgb(255, 159, 64)',
							yellow : 'rgb(255, 205, 86)',
							green : 'rgb(75, 192, 192)',
							blue : 'rgb(54, 162, 235)',
							purple : 'rgb(153, 102, 255)',
							grey : 'rgb(201, 203, 207)'
						}
					};
			
					var color = Chart.helpers.color;
			
					var data1 = null;
					var data2 = null;
					var data3 = null;
					var barChartData = null;
			
					// 그래프 데이터 : 메뉴별
					data1 = [ 
						Math.random()*90000, 
						Math.random()*90000, 
						Math.random()*90000, 
						Math.random()*90000, 
						Math.random()*90000, 
						Math.random()*90000, 
						Math.random()*90000, 
						Math.random()*90000, 
						Math.random()*90000, 
						Math.random()*90000,
						Math.random()*90000, 
						Math.random()*90000 
						]; //사료			
					data2 = [ 
						Math.random()*90000, 
						Math.random()*90000, 
						Math.random()*90000, 
						Math.random()*90000, 
						Math.random()*90000, 
						Math.random()*90000, 
						Math.random()*90000, 
						Math.random()*90000, 
						Math.random()*90000, 
						Math.random()*90000,
						Math.random()*90000, 
						Math.random()*90000  
						]; //간식
					data3 = [ 
						Math.random()*90000, 
						Math.random()*90000, 
						Math.random()*90000, 
						Math.random()*90000, 
						Math.random()*90000, 
						Math.random()*90000, 
						Math.random()*90000, 
						Math.random()*90000, 
						Math.random()*90000, 
						Math.random()*90000,
						Math.random()*90000, 
						Math.random()*90000 
						]; //영양제
			
					barChartData = {
						labels : [ '1월', '2월','3월', '4월','5월','6월','7월', '8월', '9월', '10월', '11월', '12월' ], //x축
						datasets : [ 
								{
									label : '사료',
									backgroundColor : 'rgba(255, 99, 132)',
									borderColor : 'rgb(255, 99, 132,1.5)',
									borderWidth : 1,
									data : data2
								},
								{
									label : '간식',
									backgroundColor : 'rgba(54, 162, 235)',
									borderColor : 'rgba(54, 162, 235, 1.5)',
									borderWidth : 1,
									data : data1
								}, 
								{
									label : '영양제',
									backgroundColor : 'rgba(255, 159, 64)',
									borderColor : 'rgba(255, 159, 64, 1.5)',
									borderWidth : 1,
									data : data2
								}
								]
					};
			
					var ctx = document.getElementById('canvas').getContext('2d');
			
					window.BarChart = new Chart(ctx, {
						type : 'bar', // 막대그래프
						data : barChartData ,
						options : { // 설정 영역
							 
							maintainAspectRatio : false ,
							legend : {
								position : 'top',
								labels: {
									display : true,
									fontSize: 20
								}
							},							
							scales : {
								yAxes : [ {
									ticks : { // Y 축 0부터 시작
										beginAtZero : true,
										// Y 축 정수로 보여주기 
										// 숫자가 작거나 또는 0인 경우 등 자동으로 보여주므로 소숫점으로 나타난다
										callback : function(value) {
											if (0 === value % 1) {
												return value;
											}
										}
									}
								} ]
							}
						}
					});
			
					var colorNames = Object.keys(ChartHelper.chartColors);
				</script> 
				
				</div><%-- end totalchart --%>
			</div> <%-- end chart --%>
			
			</div> <%-- end main --%>
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
	</div>
</body>
</html>