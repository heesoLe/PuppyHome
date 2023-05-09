package shop.puppyhome.vo;

public class CSVO { // tbl_client 테이블  컬럼명과 동일
	
	private int client_no; // 고객문의 글 번호
	private String client_title; // 제목
	private String client_cont; // 내용
	private String client_category; // '회원정보, 상품확인, 주문/결제, 배송, 교환/취소/반품, 서비스'
	private String user_id;// '회원 아이디'
	private String client_date; //작성 날짜(sysdate)	
	private String client_cont_reply; //답변 글	
	
	// 검색 기능
	private String find_name;// 검색어
	private String find_field;// 검색 필드
		
	public int getClient_no() {
		return client_no;
	}
	public void setClient_no(int client_no) {
		this.client_no = client_no;
	}
	public String getClient_title() {
		return client_title;
	}
	public void setClient_title(String client_title) {
		this.client_title = client_title;
	}
	public String getClient_cont() {
		return client_cont;
	}
	public void setClient_cont(String client_cont) {
		this.client_cont = client_cont;
	}
	public String getClient_category() {
		return client_category;
	}
	public void setClient_category(String client_category) {
		this.client_category = client_category;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getClient_date() {
		return client_date;
	}
	public void setClient_date(String client_date) {
		String Y = client_date.substring(0,4); //년
		String M = client_date.substring(5, 7); //월
		String D = client_date.substring(8,10); //일
		this.client_date = Y + "년 " + M +"월 " + D +"일"; //0이상 10미만 사이의 년월일 만 반환
	}
	
	
	public String getFind_name() {
		return find_name;
	}
	public void setFind_name(String find_name) {
		this.find_name = find_name;
	}
	public String getFind_field() {
		return find_field;
	}
	public void setFind_field(String find_field) {
		this.find_field = find_field;
	}
	public String getClient_cont_reply() {
		return client_cont_reply;
	}
	public void setClient_cont_reply(String client_cont_reply) {
		this.client_cont_reply = client_cont_reply;
	}
	
	
	
	
}
