package shop.puppyhome.controller;

import java.io.FileInputStream;
import java.io.IOException;
import java.util.Properties;
import java.util.StringTokenizer;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class FrontController extends HttpServlet { // 서블릿 클래스 => 여기서 실행해야함

   /* 서블릿 자바 특징
    * 1. 서블릿은 온라인 웹상에서 누구나 다 접근 가능하게 public으로 선언한다.
    * 2. 서블릿은 HttpSerlvet로 부터 상속받는다.
    * 3. get으로 접근할 때는 doGet()메서드를 오버라이딩해서 호출한다.
    * 4. post로 접근할 때는 doPost()메서드를 오버라이딩해서 호출한다.
    * 5. get or post 양쪽방식 모두 다 접근가능하게 service()메서드를 오버라이딩 해서 호출한다.
    * 6. HttpServletRequest 서블릿은 사용자 폼에서 입력한 정보를 서버로 가져오는 역할을 한다.
    * 7. HttpServletResponse 서블릿은 서버의 가공된 정보를 사용자 웹에 응답할 때 사용한다.
    */
	
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String requestUri = request.getRequestURI(); // MVC/*.shop 경로를 구함.
		String contextPath = request.getContextPath(); // 컨텍스트 패스 경로 : /MVC를 구함
		String command = requestUri.substring(contextPath.length()); // 컨텍스트 패스 경로 이후 문자를 구함. 즉 /*.daum <= url-pattern 매핑 주소를 구함.
		
		ActionForward forward = null;
		Action action = null;
		
		Properties prop = new Properties(); // java.util패키지에 있는 컬렉션 클래스. 키, 값 쌍으로 저장하는 자료구조이다.
		FileInputStream fis = new FileInputStream(request.getRealPath("/WEB-INF/classes/shop.properties"));
		// getRealPath()메서드는 실제 프로젝트 경로를 반환 => 톰켓 WAS서버에 의해서 반환된 실제 톰켓 프로젝트 경로
		// => D:\20221205_JAVA\Web_WorkSpace\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\MVC\WEB-INF\classes
		prop.load(fis); // 프로퍼티 컬렉션 로드
		fis.close(); // 입력스트림을 닫는다
		
		String value = prop.getProperty(command); // 키이름 맵핑주소에 해당하는 값을 가져옴.
		// 값 => execute|net.daum.controller.MemberLoginController
		
		if(value.substring(0, 7).contentEquals("execute")) { // 0이상 7미만 사이의 문자가 execute와 같다면
			try {
				StringTokenizer st = new StringTokenizer(value, "|"); // |구분자를 기준으로 문자를 분리
				String url_1 = st.nextToken(); // 첫번째로 분리된 execute가 저장됨.
				String url_2 = st.nextToken(); // 두번째로 분리된 풀패키지 경로(net.daum.controller.MemberLoginController)가 저장됨. 
				Class url = Class.forName(url_2); // 컨트롤러 클래스 객체화
				
				action = (Action)url.newInstance(); // 새로운 인스턴스로 다운캐스팅을 해서 액션 생성
				
				try {
					forward = action.execute(request, response); // 컨트롤러 클래스에 오버라이딩된 execute()메서드를 호출해서 리턴타입인 ActionForward객체를 생성 반환
				} catch(Exception e) {
					e.printStackTrace();
				}
			} catch(ClassNotFoundException ne) { // 해당 클래스 파일명을 못찾을때 발생하는 예외
				ne.printStackTrace();
			} catch(InstantiationException ex) { // 추상클래스나 인터페이스를 인스턴스화하고자 할때
				ex.printStackTrace();
			} catch(IllegalAccessException ex) { // 클래스 접근을 못할 때
				ex.printStackTrace();
			}
		} // end if
		
		if(forward != null) {
			if(forward.isRedirect() == true) {
				response.sendRedirect(forward.getPath()); /* 기존 매핑주소를 잃어버리고 새로운 매핑주소로 이동하기 때문에 request.setAttribute("속성 키이름", "값");에
				 저장된 속성 키이름, 값을 유지 하지 못한다. 하지만 로그인 인증할 때 사용하는 session.setAttribute("속성 키이름", "값");에 의해서 저장된 세션값은 유지한다. */
			} else {
				RequestDispatcher dis = request.getRequestDispatcher(forward.getPath());
				dis.forward(request, response);
				/* getRequestDispatcher.forward()로 이동하는 특징
				 * 1. 기존 매핑주소값을 유지하기 때문에 request.setAttribute("속성 키이름", "값")을 유지한다.
				 * 2. 로그인 인증할 때 사용하는 세션값도 유지한다.
				 */
			} // if else
			
		} // end if
		
	} // end service()
	
} // end MFrontController class
