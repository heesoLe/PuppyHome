package shop.puppyhome.vo;

public class MemberVO {
	
	private String user_id;
	private int user_no; 
	private String user_pwd; 
	private String user_name; 
	private String user_birth; 
	private String postCode ;
	private String roadAddr ;
	private String detailAddr; 
	private String user_email ;
	private String user_phone ;
	private int user_state ;
	private int user_grade ;
	private int user_black;
	private String user_date;
	
	private String find_field;
	private String find_name;
	

	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public int getUser_no() {
		return user_no;
	}
	public void setUser_no(int user_no) {
		this.user_no = user_no;
	}

	public String getUser_pwd() {
		return user_pwd;
	}
	public void setUser_pwd(String user_pwd) {
		this.user_pwd = user_pwd;
	}
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	public String getUser_birth() {
		return user_birth;
	}
	public void setUser_birth(String user_birth) {
		this.user_birth = user_birth;
	}
	public String getPostCode() {
		return postCode;
	}
	public void setPostCode(String postCode) {
		this.postCode = postCode;
	}
	public String getRoadAddr() {
		return roadAddr;
	}
	public void setRoadAddr(String roadAddr) {
		this.roadAddr = roadAddr;
	}
	public String getDetailAddr() {
		return detailAddr;
	}
	public void setDetailAddr(String detailAddr) {
		this.detailAddr = detailAddr;
	}
	public String getUser_email() {
		return user_email;
	}
	public void setUser_email(String user_email) {
		this.user_email = user_email;
	}
	public String getUser_phone() {
		return user_phone;
	}
	public void setUser_phone(String user_phone) {
		this.user_phone = user_phone;
	}
	public int getUser_state() {
		return user_state;
	}
	public void setUser_state(int user_state) {
		this.user_state = user_state;
	}
	public int getUser_grade() {
		return user_grade;
	}
	public void setUser_grade(int user_grade) {
		this.user_grade = user_grade;
	}
	public int getUser_black() {
		return user_black;
	}
	public void setUser_black(int user_black) {
		this.user_black = user_black;
	}
	public String getUser_date() {
		return user_date;
	}
	public void setUser_date(String user_date) {
		this.user_date = user_date;
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
		return "MemberVO [user_id=" + user_id + ", user_no=" + user_no + ", user_pwd=" + user_pwd + ", user_name="
				+ user_name + ", user_birth=" + user_birth + ", postCode=" + postCode + ", roadAddr=" + roadAddr
				+ ", detailAddr=" + detailAddr + ", user_email=" + user_email + ", user_phone=" + user_phone
				+ ", user_state=" + user_state + ", user_grade=" + user_grade + ", user_black=" + user_black
				+ ", user_date=" + user_date + "]";
	}

}
