<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous"> <%-- CDN 절대링크 --%>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN" crossorigin="anonymous"></script> <%-- CDN 절대링크 --%>
<script src="https://code.jquery.com/jquery-3.6.3.js" integrity="sha256-nQLuAZGRRcILA+6dMBOvcRh5Pe310sBpanc6+QBmyVM=" crossorigin="anonymous"></script> <%-- CDN 절대링크 --%>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script> <%-- 차트 : 매출 Chart --%>

<title>PuppyHome 관리자 매출현황</title>

<link rel="shortcut icon" href="<%=request.getContextPath()%>/images/favicon.ico" type="image/x-icon"> <%-- 파비콘 --%>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/page/include/css/header.css"> <%-- header.css --%>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/page/include/css/footer.css"> <%-- footer.css --%>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/page/admin/css/admin.css"> <%-- admin 계정.css --%>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/page/admin/css/aSales.css"> <%-- adminSalesManagement.css --%>

<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/fontium/css/fontium.css"/> <%-- 폰트 css --%>

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
	.adminMainpage {
		width: 1100x;
		height: 300px;
		position: relative;
		left: 50%;
		transform: translateX(-50%);
	}
	
	.profile_img {
		width: 1400px;
		height: 200px;
		padding-left: 50px;
		padding-right: 100px;
		background-color: #fc9300;
	}
	/*Admin Page 지정*/
	.name {
		padding-top: 30px;
		padding-left: 10px;
		padding-right: 1000px;
		font-family: 'KIMM_Bold';
	}
	
	.myinfo {
		padding-left: 170px;
		padding-right: 100px;
		font-family: 'KIMM_Bold';
		color: white;
	}
	
	.myinfo_date {
		padding-left: 170px;
		padding-right: 100px;
		font-family: 'KIMM_Bold';
		color: white;
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
	/* 전체 현황 틀 */
	.chart {
		font-family: 'KIMM_Bold';
	}
	
	.table_chart {
		width: 1350px;
		margin-left: 30px;
		margin-right: 30px;
	}
	
	.chart_dnt01 {
		width: 1000px;
		height: 300px;
		display: inline-block;
		align: center;
	}
	
	.chart_dnt04, .chart_dnt05 {
		width: 450px;
		height: 300px;
		display: inline-block;
		align: center;
	}
	
	.chart_dnt06, .chart_dnt07 {
		width: 450px;
		height: 300px;
		display: inline-block;
		align: center;
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
				
				<div class="chart">				
					<h2>[ 매출 현황 ]</h2><p>
						<h3>상품별 현황</h3><p><p>					
					<div class="table_chart">
					<br>					
					
					<h3 style="color: #fc9300">1. 사료</h3><p>
						<div class="meun_chart01" style="width: 1350px; height: 300px;">
							<canvas id="chart01"></canvas>
						</div>
					<script type="text/javascript"> 
						var barChartData01 = {        
						        labels: ["1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월"],
						        datasets: [{
						            label: '퍼피',
						            backgroundColor: "rgb(255, 99, 132)",
						            data: [
						            	Math.random()*90000, Math.random()*90000, Math.random()*90000, 
										Math.random()*90000, Math.random()*90000, Math.random()*90000, 
										Math.random()*90000, Math.random()*90000, Math.random()*90000, 
										Math.random()*90000, Math.random()*90000, Math.random()*90000 
						           ]
						        }, {
						            label: '어덜트',
						            backgroundColor: "rgb(255, 159, 64)",
						            data: [
						            	Math.random()*90000, Math.random()*90000, Math.random()*90000, 
										Math.random()*90000, Math.random()*90000, Math.random()*90000, 
										Math.random()*90000, Math.random()*90000, Math.random()*90000, 
										Math.random()*90000, Math.random()*90000, Math.random()*90000
						            ]
						        }, {
						        	label: '시니어',
						        backgroundColor: "rgb(255, 205, 86)",
						        data: [
						        	Math.random()*90000, Math.random()*90000, Math.random()*90000, 
									Math.random()*90000, Math.random()*90000, Math.random()*90000, 
									Math.random()*90000, Math.random()*90000, Math.random()*90000, 
									Math.random()*90000, Math.random()*90000, Math.random()*90000
						       ]
						    } ]
						    }; // end barChartData01
							var barChartData02 = {        
							        labels: ["1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월"],
							        datasets: [{
							            label: '개껌',
							            backgroundColor: "rgb(255, 99, 132)",
							            dataB01: [
							            	Math.random()*90000, Math.random()*90000, Math.random()*90000, 
											Math.random()*90000, Math.random()*90000, Math.random()*90000, 
											Math.random()*90000, Math.random()*90000, Math.random()*90000, 
											Math.random()*90000, Math.random()*90000, Math.random()*90000 
							           ]
							        }, {
							            label: '일반간식',
							            backgroundColor: "rgb(255, 159, 64)",
							            dataB02: [
							            	Math.random()*90000, Math.random()*90000, Math.random()*90000, 
											Math.random()*90000, Math.random()*90000, Math.random()*90000, 
											Math.random()*90000, Math.random()*90000, Math.random()*90000, 
											Math.random()*90000, Math.random()*90000, Math.random()*90000
							            ]
							        }]
							    }; // end barChartData02
						function createBarChart() {
							var ctx = document.getElementById(canvasId).getContext("2d");
							var chart = new Chart(ctx, {
								type: "bar",
								data: data,
								options: {
									responsive: false,
									scales: {
										yAxes: [{
											ticks: {
												beginAtZero: true}
										}]
									}
								}
							});
						}
						createBarChart("chart01", barChartData01);
						createBarChart("chart02", barChartData02);
						</script>
						<br>												
					<h3 style="color: #fc9300">2. 간식</h3><br>	
						<div class="chart02" style="width: 1350px; height: 300px;">
							<canvas id="chart02"></canvas>
						</div>
<!-- 					<script type="text/javascript"> 
						var barChartData02 = {        
						        labels: ["1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월"],
						        datasets: [{
						            label: '개껌',
						            backgroundColor: "rgb(255, 99, 132)",
						            dataB01: [
						            	Math.random()*90000, Math.random()*90000, Math.random()*90000, 
										Math.random()*90000, Math.random()*90000, Math.random()*90000, 
										Math.random()*90000, Math.random()*90000, Math.random()*90000, 
										Math.random()*90000, Math.random()*90000, Math.random()*90000 
						           ]
						        }, {
						            label: '일반간식',
						            backgroundColor: "rgb(255, 159, 64)",
						            dataB02: [
						            	Math.random()*90000, Math.random()*90000, Math.random()*90000, 
										Math.random()*90000, Math.random()*90000, Math.random()*90000, 
										Math.random()*90000, Math.random()*90000, Math.random()*90000, 
										Math.random()*90000, Math.random()*90000, Math.random()*90000
						            ]
						        }]
						    };
						 
						window.onload = function() {
						    var ctx = $('#chart02').get(0).getContext("2d"); 
						    window.theChart = new Chart(ctx, {
						         type: 'bar',
						         data: barChartData02,
						         options: {
						        	 maintainAspectRatio :false
						         }
						 });
						}
						</script> -->
						<br>
					<h3 style="color: #fc9300">3. 영양제</h3><br>
						<div class="chart03" style="width: 1350px; height: 300px;">
							<canvas id="chart03"></canvas>					
						</div>
					 <!--script type="text/javascript"> 
						var barChartData = {        
						        labels: ["1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월"],
						        datasets03: [{
						            label: '유산균',
						            backgroundColor: "rgb(255, 99, 132)",
						            dataC01: [
						            	Math.random()*90000, Math.random()*90000, Math.random()*90000, 
										Math.random()*90000, Math.random()*90000, Math.random()*90000, 
										Math.random()*90000, Math.random()*90000, Math.random()*90000, 
										Math.random()*90000, Math.random()*90000, Math.random()*90000 
						           ]
						        }, {
						            label: '오메가3',
						            backgroundColor: "rgb(255, 159, 64)",
						            dataC01: [
						            	Math.random()*90000, Math.random()*90000, Math.random()*90000, 
										Math.random()*90000, Math.random()*90000, Math.random()*90000, 
										Math.random()*90000, Math.random()*90000, Math.random()*90000, 
										Math.random()*90000, Math.random()*90000, Math.random()*90000
						            ]
						        }]
						    };
						 
						window.onload = function() {
						    var ctx = $('#chart03').get(0).getContext("2d"); 
						    window.theChart = new Chart(ctx, {
						         type: 'bar',
						         data: barChartData,
						         options: {
						        	 maintainAspectRatio :false
						         }
						 });
						}
						</script-->
					
					</div>	
				
				</div> <%-- end chart --%>
				
			
			</div> <%-- end main --%>
			<%-- top버튼 삭제 X --%>
			<div id="topBtn">
				<span class="fonti um-arrow-circle-up um-3x icon"></span>TOP
			</div>
		</section>
	<%-- 푸터 영역 --%>
	<footer>
	<%-- footer --%>
	<jsp:include page="/page/include/footer.jsp" />
	<%-- end footer --%>
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