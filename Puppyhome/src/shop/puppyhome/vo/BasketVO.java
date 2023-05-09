package shop.puppyhome.vo;

public class BasketVO {
	private int basket_no; // 장바구니 글 번호
	private int basket_cnt; // 장바구니에 담은 수량
	private int product_no; // 상품 글 번호(fk)
	private String user_id; // 회원 아이디(fk)
	
	// 페이징(쪽나누기)관련변수
	private int startrow; // 시작행 번호
	private int endrow; // 끝행 번호
	
	// 검색 기능 관련변수
	private String find_field; // 검색 필드, 콤보박스(제목, 글내용, 글쓴이)
	private String find_name; // 검색어
	
	public int getBasket_no() {
		return basket_no;
	}
	public void setBasket_no(int basket_no) {
		this.basket_no = basket_no;
	}
	public int getBasket_cnt() {
		return basket_cnt;
	}
	public void setBasket_cnt(int basket_cnt) {
		this.basket_cnt = basket_cnt;
	}
	public int getProduct_no() {
		return product_no;
	}
	public void setProduct_no(int product_no) {
		this.product_no = product_no;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public int getStartrow() {
		return startrow;
	}
	public void setStartrow(int startrow) {
		this.startrow = startrow;
	}
	public int getEndrow() {
		return endrow;
	}
	public void setEndrow(int endrow) {
		this.endrow = endrow;
	}
	public String getFind_field() {
		return find_field;
	}
	public void setFind_field(String find_field) {
		this.find_field = find_field;
	}
	public String getFind_name() {
		return find_name;
	}
	public void setFind_name(String find_name) {
		this.find_name = find_name;
	}
	
	@Override
	public String toString() {
		return "basket_no = " + basket_no + ", basket_cnt = " + basket_cnt + ", product_no = " + product_no
				+ ", user_id = " + user_id;
	}

}
