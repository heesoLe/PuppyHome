package shop.puppyhome.vo;

public class ReviewVO {
	private int review_no; // 리뷰 글 번호
	private String review_date; // 리뷰 작성 날짜(sysdate)
	private String review_cont; // 리뷰 내용
	private int review_star; // 리뷰 별점
	private int product_no; // 상품 글 번호(fk)
	private String user_id; // 회원 아이디(fk)
	
	// 페이징(쪽나누기)관련변수
	private int startrow; // 시작행 번호
	private int endrow; // 끝행 번호
	
	// 검색 기능 관련변수
	private String find_field; // 검색 필드, 콤보박스(제목, 글내용, 글쓴이)
	private String find_name; // 검색어
	
	public int getReview_no() {
		return review_no;
	}
	public void setReview_no(int review_no) {
		this.review_no = review_no;
	}
	public String getReview_date() {
		return review_date;
	}
	public void setReview_date(String review_date) {
		this.review_date = review_date;
	}
	public String getReview_cont() {
		return review_cont;
	}
	public void setReview_cont(String review_cont) {
		this.review_cont = review_cont;
	}
	public int getReview_star() {
		return review_star;
	}
	public void setReview_star(int review_star) {
		this.review_star = review_star;
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
		return "review_no = " + review_no + ", review_date = " + review_date + ", review_cont = " + review_cont
				+ ", review_star = " + review_star + ", product_no = " + product_no + ", user_id = " + user_id;
	}
	
}
