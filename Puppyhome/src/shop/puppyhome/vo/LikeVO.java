package shop.puppyhome.vo;

public class LikeVO {
	private int like_no; // 찜 글 번호
	private int product_no; // 상품 글 번호(fk)
	private String user_id; // 회원 아이디(fk)
	
	// 페이징(쪽나누기)관련변수
	private int startrow; // 시작행 번호
	private int endrow; // 끝행 번호
	
	// 검색 기능 관련변수
	private String find_field; // 검색 필드, 콤보박스(제목, 글내용, 글쓴이)
	private String find_name; // 검색어
	
	public int getLike_no() {
		return like_no;
	}
	public void setLike_no(int like_no) {
		this.like_no = like_no;
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
		return "like_no = " + like_no + ", product_no = " + product_no + ", user_id = " + user_id;
	}
	
	
	
}
