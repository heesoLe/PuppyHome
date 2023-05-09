<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous"> <%-- CDN 절대링크 --%>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN" crossorigin="anonymous"></script> <%-- CDN 절대링크 --%>
<title>PuppyHome 서비스 준비중</title>
<link rel="shortcut icon" href="<%=request.getContextPath()%>/images/favicon.ico" type="image/x-icon"> <%-- 파비콘 --%>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/page/util/css/company_introduce.css"> <%-- company_introduce.css --%>
</head>
<body>
	<div id="wrap">
		<div class="container">
			<div class="header">
				<div class="textBox">
					<span id=service_text>서비스 준비중</span><span id=service_text2>입니다.</span>
				</div>
				<div class="imgBox">
					<img src="<%=request.getContextPath()%>/images/crying_lion.png" id="crying_lionImg" alt="우는 라이언">
				</div>
			</div>
			<div class="content">
				<p>보다 나은 서비스 제공을 위하여 페이지 준비중에 있습니다.<br>
				빠른 시일내에 준비하여 찾아뵙겠습니다.</p>
			</div>
		</div>
	</div>
</body>
</html>