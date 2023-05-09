<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
	crossorigin="anonymous">
<%-- CDN 절대링크 --%>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN"
	crossorigin="anonymous"></script>
<%-- CDN 절대링크 --%>
<script src="https://code.jquery.com/jquery-3.6.3.js"></script>
<%-- CDN 절대링크 --%>
<script
	src="http://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.3/jquery.easing.min.js"></script>
<%-- CDN 절대링크 --%>
<title>PuppyHome 상품등록</title>
<link rel="shortcut icon"
	href="<%=request.getContextPath()%>/images/favicon.ico"
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
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/page/product/css/productRegister.css" />
<style type="text/css">
@charset "UTF-8";
/* admin계정 UI */

/* 관리자 메인이미지  */
.adminMainpage {
	width: 1400px;
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
/* 상품 등록 리스트 테두리 */
.productTitle {
	width: 1400px;
	height: 180px;
	padding-top: 100px;
	padding-left: 50px;
	padding-right: 100px;
	font-family: 'KIMM_Bold';
}

.productForm {
	font-family: 'KIMM_Bold';
	width: 1300px;
	height: 1100px;
	border: none;
	border-top: 5px solid #FC5400;
	border-bottom: 5px solid #FC5400;
}

.table_div table {
	border-collapse: collapse;
}

.productForm th, td {
	text-align: centen;
	font-family: 'KIMM_Bold';
}

.input {
	font-family: 'KIMM_Bold';
}

#btn {
	border-color: #FC5400;
	background-color: #FC5400;
	color: #fff;
}
</style>

</head>
<body>
	<%-- 전체 영역 --%>
	<div class="wrap">
		<%-- 본문 영역(ui깨질시 본인이 ui 수정바람..) --%>

		<%-- 헤더 영역 --%>
		<header>
			<%-- header include --%>
			<jsp:include page="/page/include/header.jsp" />
		</header>
		<section>
			<div class="main">
				<%-- main 시작 --%>
				<form name="p" method="post" action="product_register_ok.shop">
					<div class="adminMainpage">
						<%-- adminMainpage --%>


						<%-- admin 계정 --%>
						<h1 class="name" style="color: #fc9300">Admin Page</h1>
						<div class="profile_img" align="center">
							<%-- 이미지 클릭시 관리자 메인화면으로 이동 --%>
							<a href="adminMain.shop"><img width="150px" height="190px"
								align="left" alt="adminImage"
								src="<%=request.getContextPath()%>/images/admin.png"> </a>

							<div class="meau" align="right" style="color: white;">
								<a href="mlist.shop">회원 관리</a> | <a href="csboard.shop">문의
									게시판</a> | <a href="gslist.shop">상품 목록</a> | <a href="aSales.shop">매출
									관리</a>
							</div>

							<h3 class="myinfo" align="left">
								<b>관리자 계정</b> <br>
							</h3>
							<div class="myinfo_date" align="left">가입일 : 2023.03.15.</div>
							<br>
						</div>
						<%-- end profile_img : 이미지 div --%>
					</div>
					<%-- end adminMainpage : 관리자 계정 고정 --%>

					<%-- 상품 등록 form --%>
					<form action="product_register_ok.shop" method="post">
						<div class="productTitle">
							<h3 align="center">상품&nbsp;등록</h3>
							<p>

								<%-- 상품 등록 --%>
							<table class="productForm" align="center">

								<tr>
									<th></th>
								</tr>

								<tr>
									<th>상품명</th>
									<td align="left"><input type="text" class="#"
										name="product_title"></td>
								</tr>
								<p>
								<tr>
									<th></th>
								</tr>

								<tr>
									<th><b>가격</b></th>
									<td align="left"><input type="text" class="#"
										name="product_price" width="1000px">&nbsp;원</td>
								</tr>

								<tr>
									<th></th>
								</tr>

								<tr>
									<th>제조사</th>
									<td align="left"><input type="text" class="#"
										name="product_maker"></td>
								</tr>
								<p>
								<tr>
									<th>카테고리</th>

									<td align="left"><label>분류</label> <select
										name="product_type">
											<option value="">선택</option>
											<optgroup label="사료" id="feed">
												<option value="퍼피">퍼피</option>
												<option value="어덜트">어덜트</option>
												<option value="시니어">시니어</option>
												<optgroup label="간식" id="gansik" value="gansik">
													<option value="껌간식">껌간식</option>
													<option value="일반간식">일반간식</option>
													<optgroup label="영양제" id="medicine" value="medicine">
														<option value="유산균">유산균</option>
														<option value="오메가3">오메가3</option>
									</select>
								</tr>
								<p>
								<tr>
									<th></th>
								</tr>
								<%-- 이미지는 images에만 있는 이미지는 업로드 하기! --%>
								<tr>
									<th>메인<br>이미지
									</th>
									<td align="left"><input id="image01" type="file"
										name="file" onchange="fileCheck01();" />
										<div class="select_img01" style="margin: 10px;">
											<img src="" style="height: 300px; width: auto;">
										</div> <script type="text/javascript">
											$("#image01")
													.change(
															function() {
																if (this.files
																		&& this.files[0]) {
																	var reader = new FileReader;
																	reader.onload = function(
																			data) {
																		$(
																				".select_img01 img")
																				.attr(
																						"src",
																						data.target.result)
																				.width(
																						500);
																	}
																	reader
																			.readAsDataURL(this.files[0]);
																}
															});
											function fileCheck01() {
												var file = document
														.getElementById("image01");
												//파일 경로.
												var filePath = file.files[0].name;
												//전체경로를 \ 나눔.
												var filePathSplit = filePath
														.split('\\');
												console.log(filePath);
												$('#imagesrc01').val(filePath);
											}
										</script> <br> 경로 : <input id="imagesrc01" type="text"
										name="product_cont1" size="60" readonly="readonly"></td>
								<tr>
									<th>상세페이지<br>이미지01
									</th>
									<td align="left"><input id="image02" type="file"
										name="file" onchange="fileCheck02();" />
										<div class="select_img02" style="margin: 10px;">
											<img src="" style="height: 300px; width: auto;">
										</div> <script type="text/javascript">
											$("#image02").change(function() {
												if (this.files&& this.files[0]) {
													var reader = new FileReader;
													reader.onload = function(data) {
														$(".select_img02 img").attr("src",data.target.result).width(500);
													}
													reader.readAsDataURL(this.files[0]);
													}
												});
											function fileCheck02() {
												var file = document.getElementById("image02");
												//파일 경로.
												var filePath = file.files[0].name;
												//전체경로를 \ 나눔.
												var filePathSplit = filePath.split('\\');
												console.log(filePath);
												$('#imagesrc02').val(filePath);
											}
										</script><br> 경로 : <input id="imagesrc02" type="text"
										name="product_cont2" size="60" readonly="readonly"></td>
								</tr>
								<tr>
									<th>상세페이지<br>이미지02
									</th>
									<td align="left"><input id="image03" type="file"
										name="file" onchange="fileCheck03();" />
										<div class="select_img03" style="margin: 10px;">
											<img src="" style="height: 300px; width: auto;">
										</div> <script type="text/javascript">
											$("#image03").change(function() {
												if (this.files&& this.files[0]) {
													var reader = new FileReader;
													reader.onload = function(data) {
														$(".select_img03 img").attr("src",data.target.result).width(500);
														}
													reader.readAsDataURL(this.files[0]);
													}
												});
											function fileCheck03() {
												var file = document.getElementById("image03");
												//파일 경로.
												var filePath = file.files[0].name;
												//전체경로를 \ 나눔.
												var filePathSplit = filePath.split('\\');
												console.log(filePath);
												$('#imagesrc03').val(filePath);
											}
										</script> <br> 경로 : <input id="imagesrc03" type="text"	name="product_cont3" size="60" readonly="readonly"></td>
								</tr>

							</table>
							<p>
							<p>

								<input type="submit" value="등록" /> <input type="reset"
									value="취소" onclick="location='productList.jsp'" />
						</div>
					</form>
					<%-- end product--%>
			</div>
			<%-- adminMainpage 끝--%>

	<%-- top버튼 삭제 X --%>
	<div id="topBtn">
		<span class="fonti um-arrow-circle-up um-3x icon"></span>TOP
	</div>
	</section>


	<%-- 푸터 영역 --%>
	
	<footer>
		<jsp:include page="/page/include/footer.jsp"/>
	</footer>

	</div>
	<%-- end main --%>



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