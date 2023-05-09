<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous"> <%-- CDN 절대링크 --%>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN" crossorigin="anonymous"></script> <%-- CDN 절대링크 --%>
<title>PuppyHome 입점/제휴 문의</title>
<link rel="shortcut icon" href="<%=request.getContextPath()%>/images/favicon.ico" type="image/x-icon"> <%-- 파비콘 --%>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/page/util/css/inquiry.css"> <%-- inquiry.css --%>
</head>
<body style="overflow-x:hidden; overflow-y:hidden;">
	<div class="wrap">
		<div class="inquiry_content">
	      <div class="inquiry_header">
	      	<div class="inquiry_titleBox">
	      		<span id="inquiry_title">입점 제휴 문의 안내</span><br>
	      		<div class="inquiry_dateBox">
	      			<span id="inquiry_date">&nbsp;&nbsp;2023.04.21</span>
	      		</div>
	      		<div class="inquiry_downloadBox">
	      			<div class="inquiry_downloadBox2">
	      				<img src="<%=request.getContextPath()%>/images/attach.png" id="attachIcon" alt="첨부 파일">
	      				<div class="inquiry_downloadBox3">
	      				<a id="inquiry_xlsx" href="<%=request.getContextPath()%>/file/(제휴종류)입점 및 제휴 제안서_업체명.xlsx" download>[제휴종류]입점 및 제휴 제안서_업체명.xlsx</a>
	      				</div>
	      			</div>
	      		</div>
	      	</div>
	      </div>
	      <div class="inquiry_body">
	        &nbsp;&nbsp;&nbsp;입점 및 제휴 문의는 온라인 접수를 통해서만 가능합니다.<br>
			&nbsp;&nbsp;&nbsp;입점, 마케팅 등 파트너십 관련 문의는 아래 메일을 통해 연락주세요.<br><br>
			&nbsp;&nbsp;&nbsp;입점 제휴 신청은 아래의 과정으로 진행됩니다.<br><br>
			&nbsp;&nbsp;&nbsp;<strong>1. 제휴 신청서 접수</strong><br>
			&nbsp;&nbsp;&nbsp;입점 및 제휴 제안서를 작성하신 후 아래 메일로 보내주세요.​
			<ul>
				<li>상품 입점 문의 : md@puppyhome.co.kr</li>
				<li>마케팅 제휴 문의 : marketing@puppyhome.co.kr</li>
				<li>오픈팜 도매 및 B2B 사업자 전용 쇼핑몰 가입 문의 : bizsales@puppyhome.co.kr</li>
			</ul>
			&nbsp;&nbsp;&nbsp;메일 제목은 아래와 같이 통일해주시면 보다 빠른 처리가 가능합니다.<br>
			&nbsp;&nbsp;&nbsp;<strong>[제휴종류]입점 및 제휴 제안서_업체명</strong><br><br>
			&nbsp;&nbsp;&nbsp;<strong>2. 제휴 신청서 검토</strong><br>
			&nbsp;&nbsp;&nbsp;담당자가 접수된 신청서를 검토하고 연락드립니다.<br><br>
			&nbsp;&nbsp;&nbsp;<strong>3. 계약 체결 및 판매</strong><br>
			&nbsp;&nbsp;&nbsp;상품 진행이 확정되면 계약을 체결하고 상품 판매가 가능합니다.
	      </div>
	    </div>
	</div>
</body>
</html>