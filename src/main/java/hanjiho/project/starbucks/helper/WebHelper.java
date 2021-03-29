package hanjiho.project.starbucks.helper;

import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.View;
import org.springframework.web.servlet.view.AbstractView;

import lombok.extern.slf4j.Slf4j;

@Slf4j
public class WebHelper {
	/* 기본 인코딩 타입 설정 */
	private String encType;

	/* JSP의 request 내장 객체 */
	// -> import javax.servlet.http.HttpServletRequest;
	private HttpServletRequest request;

	/* JSP의 response 내장 객체 */
	// -> import javax.servlet.http.HttpServletResponse;
	private HttpServletResponse response;
	
	/*JSP 내장객체를 연결하기 위한 메서드*/
	public void init(HttpServletRequest request, HttpServletResponse response) {
		this.request = request;		// JSP 내장객체 참조하기
		this.response = response;	// JSP 내장객체 참조하기
		
		/* 실행 위치를 로그로 기록하기 위한 기능 구현 */
		String methodName = request.getMethod();	//GET방식인지, POST방식인지 조회
		String url = request.getRequestURI().toString();	//현재 URL 획득
		String queryString = request.getQueryString();	//URL에서 "?"이후의 GET파라미터 문자열을 모두 가져온다
		
		//가져온 값이 있다면 URL과 결합하여 완전한 URL을 구성한다.
		if (queryString != null) {
			url = url + "?" + queryString;
		}
		log.debug(String.format("[%s] %s", methodName, url)); //획득 정보를 로그로 표시

		/* 내장객체 초기화 -> utf-8설정 */
		// -> import java.io.UnsupportedEncodingException;
		try {
			this.request.setCharacterEncoding(this.encType);
			this.response.setCharacterEncoding(this.encType);
			
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
	}
	
	/* 페이지 강제이동 구현 */
	/**
	 * 메시지 표시 후 페이지를 지정된 곳으로 이동한다. 
	 * @param url - 이동할 페이지의 url, Null일 경우 이전 페이지로 이동
	 * @param msg - 화면에 표시할 메시지, Null일 경우 표시 안함
	 * @return ModelAndView
	 */
	public ModelAndView redirect(String url, String msg) {
		
		//획득한 정보를 로그로 표시한다.
		log.debug(String.format(" --> [redirect] %s >> %s", url, msg));
		
		//가상의 View로 만들기 위한 HTML 태그 구성
		String html = "<!doctype html>";
		html += "<html>";
		html += "<head>";
		html += "<meta charset'"+this.encType+"'>";
		
		//메시지 표시 - msg 파라미터가 null이 아닌 경우 JS 메시지 박스 구성
		if (msg != null) {
			html += "<script type = 'text/javascript'>alert('"+msg+"');</script>";
		}
		
		//페이지 이동
		if (url != null) {
			html += "<meta http-equiv='refresh' content'0; url="+url+"' />";
		} else {
			html += "<script type = 'text/javascript'>history.back();</script>";
		}
		
		html +="</head>";
		html +="<body></body>";
		html +="</html>";
		
//		Spring은 JSP Model1,2와 같이 out객체를 통한 직접출력을 지원하지 않는다.
//		그러므로 아래의 코드는 사용할 수 없기 때문에 주석처리하거나 삭제한다.
		
//		//구성된 HTML을 출력
//		try {
//			//브라우저에 결과값을 출력하기 위한 out 객체를 생성한다 (예외처리 필요)
//			//-> import java.io.PrintWriter;
//			PrintWriter out = this.response.getWriter();
//			
//			//준비된 html 태그를 출력
//			out.print(html);
//			
//		} catch (IOException e) {
//			e.printStackTrace();
//		}
		
//		대신 컨트롤러에서 HTML 문자열을 출력하기 위한 메서드를 정의한다. virtualView()...
		
		return this.virtualView(html);
	}
	
	/**
	 * 파라미터로 받은 내용을 가상의 View로 생성후 리턴한다.
	 * 브라우저에게 전달할  HTML, CSS, JS 조합을 출력하기 위해 사용한다.
	 * @param body
	 * @return ModelAndView
	 */
	public ModelAndView virtualView(final String body) {
		/*가상의 View를 익명클래스 방식으로 생성하여 리턴*/
		View view = new AbstractView() {
			@Override
			protected void renderMergedOutputModel(Map<String, Object> model, HttpServletRequest request,
					HttpServletResponse response) throws Exception {
				PrintWriter out = response.getWriter();
				out.println(body);
				out.flush();
			}
		};
		
		//가상의 뷰를 리턴한다.
		return new ModelAndView(view);
	}

	
	/* Getter, Setter 메서드 */
	public String getEncType() {
		return encType;
	}
	
	public void setEncType(String encType) {
		this.encType = encType;
	}
	
	public HttpServletRequest getRequest() {
		return request;
	}
	
	public void setRequest(HttpServletRequest request) {
		this.request = request;
	}
	
	public HttpServletResponse getResponse() {
		return response;
	}
	
	public void setResponse(HttpServletResponse response) {
		this.response = response;
	}
	
}
