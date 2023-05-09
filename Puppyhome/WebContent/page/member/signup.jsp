<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous"> <%-- CDN 절대링크 --%>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN" crossorigin="anonymous"></script> <%-- CDN 절대링크 --%>
<script src="https://code.jquery.com/jquery-3.6.3.js" integrity="sha256-nQLuAZGRRcILA+6dMBOvcRh5Pe310sBpanc6+QBmyVM=" crossorigin="anonymous"></script> <%-- CDN 절대링크 --%>
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.3/jquery.easing.min.js"></script> <%-- CDN 절대링크 --%>
<script defer src="<%=request.getContextPath()%>/js/post.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="<%=request.getContextPath()%>/js/jquery.js"></script>
<script src="<%=request.getContextPath()%>/js/join.js"></script>
<script src="<%=request.getContextPath()%>/js/post2.js"></script>
<title>PuppyHome 메인</title>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/page/include/css/header.css"> <%-- header.css --%>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/page/include/css/footer.css"> <%-- footer.css --%>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/fontium/css/fontium.css"/>
<link rel="shortcut icon" href="<%=request.getContextPath()%>/images/favicon.ico" type="image/x-icon"> <%-- 파비콘 --%>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/page/member/css/signup.css"> <%-- signup.css --%>
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
	body1 {
		margin: 0px;
		height: 100%;
		padding: 0px;
	}
	header {
		width: 100%;
	    position: fixed;
		z-index: 2;
	}
	.wrap {
		margin-top: -110px;
	}
	.main { 
		width: 1400px;
		position : relative;
		top: 105px;
		left: 50%;
        transform: translateX( -50% );
		background-color: rgb(179, 255, 213);  /* 영역 보기 편하라고 배경색 지정함 : 연초록 */
		margin: 0px;
	}
	section {
		height: 100%;
		background-color: rgb(236, 226, 202); /* 영역 보기 편하라고 배경색 지정함 : 연주황 */
	}
	/* 클리어 */
	.clear {
		clear: both;
	}
	/* 밑의 영역부터 css시작 */
	.container {
		width: 100%;
		height: 935px;
	}
	/* 캐러셀 */
	#carouselExampleControls {
		width: 1100px;
		position : relative;
		left: 50%;
        transform: translateX( -50% );
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
<div class="member" >
<form name="m" method="post" action="member_join_ok.shop" 
    onsubmit="return join_check();">
        <!-- 1. 로고 -->
        <div class="signup-form">
        <h1>회원가입</h1>

        <!-- 2. 필드 -->
        <div class="field_id">
            <b>아이디</b>
            <div>
            	<input type="text" placeholder="" name="user_id" id="user_id">
            	
                <input type="button" value="아이디 중복검사" onclick="id_check();" >
            </div>
            <div>
            <span id="idcheck"></span>
            </div>
        </div>
        <div class="field">
            <b>비밀번호</b>
            <input class="userpw" type="password" name="user_pwd" id="user_pwd">
        </div>
        <div class="field">
            <b>비밀번호 재확인</b>
            <input class="userpw-confirm" type="password" name="user_pwd2" id="user_pwd2"  >
        </div>
        <div class="field">
            <b>이름</b>
            <input type="text" name="user_name" id="user_name">
        </div>

        <!-- 3. 필드(생년월일) -->
        <div class="field birth" >
            <b>생년월일</b>
    
                <input type="text" placeholder="ex) 19910101" name="user_birth" id="user_birth">                
              
        </div>

        <!-- 4. 필드(성별) -->
        <div class="field address">
            <b>주소</b>
            
            <div>
                <input type="text" placeholder="우편번호" name="postCode" id="postCode">
                <input type="button" onclick="post()" value="우편번호 찾기">
            </div>
            <input type="text" placeholder="주소" name="roadAddr" id="roadAddr">
            <input type="text" placeholder="상세주소" name="detailAddr" id="detailAddr">
        </div>

        <!-- 5. 이메일_전화번호 -->
        <div class="field">
            <b>이메일</b>
            <input type="email" placeholder="ex) abc123@naver.com" name="user_email" id="user_email">
            
        </div>
        
        <div class="field tel-number">
            <b>휴대전화</b>
            
            <div>
                <input type="tel" placeholder="ex) 01011112222" name="user_phone" id="user_phone">
                
            </div>
            
        </div>

        <!-- 6. 가입하기 버튼 -->
        <input type="submit" value="가입하기">

        
        
    </div>
    </form>
    </div>
	<%-- top버튼 삭제 X --%>
			<div id="topBtn">
				<span class="fonti um-arrow-circle-up um-3x icon"></span>TOP
			</div>
	<%-- 푸터 영역 --%>
	<footer>
	
			<%-- header include --%>
			<jsp:include page="../include/footer.jsp"/>
		
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
		
		<%-- footer 부분 --%>
		// 서비스 이용약관 텍스트 클릭시 새창 열기
		function openPopup_service() {
	        var page_width = '525';
	        var page_height = '650';
	    
	        // 팝업을 가운데 위치시키기 위해 아래와 같이 값 구하기
	        var page_left = Math.ceil((window.screen.width - page_width)/2);
	        var page_top = Math.ceil((window.screen.height - page_height)/2);
	
	    window.open("http://localhost:8046/Shopping_Mall/util/service.jsp", "service",'width='+ page_width +', height='+ page_height +', left=' + page_left + ', top='+ page_top);
	    
	    }
	    
		// 개인정보 처리 텍스트 클릭시 새창 열기
		function openPopup_privacy() {
	        var page_width = '525';
	        var page_height = '555';
	    
	        // 팝업을 가운데 위치시키기 위해 아래와 같이 값 구하기
	        var page_left = Math.ceil((window.screen.width - page_width)/2);
	        var page_top = Math.ceil((window.screen.height - page_height)/2);
	
	    window.open("http://localhost:8046/Shopping_Mall/util/privacy.jsp", "privacy",'width='+ page_width +', height='+ page_height +', left=' + page_left + ', top='+ page_top);
	    
	    }
		
		// 입점/제휴 문의 텍스트 클릭시 새창 열기
		function openPopup_inquiry() {
	        var page_width = '525';
	        var page_height = '555';
	    
	        // 팝업을 가운데 위치시키기 위해 아래와 같이 값 구하기
	        var page_left = Math.ceil((window.screen.width - page_width)/2);
	        var page_top = Math.ceil((window.screen.height - page_height)/2);
	
	    window.open("http://localhost:8046/Shopping_Mall/util/inquiry.jsp", "inquiry",'width='+ page_width +', height='+ page_height +', left=' + page_left + ', top='+ page_top);
	    
	    }
		
		// 인증 마크 클릭시 새창 열기
	    function openPopup_certificate() {
	        var page_width = '460';
	        var page_height = '380';
	    
	        // 팝업을 가운데 위치시키기 위해 아래와 같이 값 구하기
	        var page_left = Math.ceil((window.screen.width - page_width)/2);
	        var page_top = Math.ceil((window.screen.height - page_height)/2);
	
	    window.open("http://localhost:8046/Shopping_Mall/util/certificate.jsp", "certificate",'width='+ page_width +', height='+ page_height +', left=' + page_left + ', top='+ page_top);
	    
	    }
	</script>
</body>
</html>