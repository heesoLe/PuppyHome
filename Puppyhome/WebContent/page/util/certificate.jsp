<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous"> <%-- CDN 절대링크 --%>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN" crossorigin="anonymous"></script> <%-- CDN 절대링크 --%>
<title>PuppyHome NICEPAY</title>
<link rel="shortcut icon" href="<%=request.getContextPath()%>/images/favicon.ico" type="image/x-icon"> <%-- 파비콘 --%>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/page/util/css/certificate.css"> <%-- certificate.css --%> 
</head>
<body>
	<div id="wrap">
		<div id="headerBox">
			<img src="<%=request.getContextPath()%>/images/nicepay.png" id="checkIcon" width="50px" height="55px" alt="인증 마크">
            <img src="<%=request.getContextPath()%>/images/nicepayTitle.png" id="checkTitle" width="450" height="55px" alt="인증 제목">
		</div>
		<div id="tableBox">
            <table border="1" id="table">
            		<tr>
                		<th id="textBlue">&nbsp; 상호명</th>
                		<th>&nbsp; 주식회사 퍼피홈&nbsp;</th>
                </tr>
                <tr>
                    <td id="textBlue">&nbsp; 사업자등록번호</td>
                    <td>&nbsp; 120-87-00000</td>
                </tr>
                <tr>
                    <td id="textBlue">&nbsp; URL</td>
                    <td>&nbsp; https://puppyhome.co.kr</td>
                </tr>
                <tr>
                    <td id="textBlue">&nbsp; 에스크로 가입여부</td>
                    <td>&nbsp; 사용</td>
                </tr>
                <tr>
                    <td id="textBlue">&nbsp; 서비스 등록번호</td>
                    <td>&nbsp; 제 A07-20230226-0000 호&nbsp;</td>
                </tr>
            </table>
            <div id="innertextBox">
                <img src="<%=request.getContextPath()%>/images/arrow.png" id="arrowICon" width="15px" height="15px" alt="화살표">
                위 업체는 나이스페이먼츠의 에스크로 서비스에 가입된 업체입니다.
                <img src="<%=request.getContextPath()%>/images/usecheck.png" id="usecheckIcon" width="230px" height="45px" alt="사용 확인증">
            </div>
            <div id="footerbox">
                <img src="<%=request.getContextPath()%>/images/nicepay2.png" id="checkIcon2" width="65px" height="25px" alt="인증 마크2">
                결제 대금예치업 등록번호 02-006-00000
            </div>
		</div>
	</div>
</body>
</html>