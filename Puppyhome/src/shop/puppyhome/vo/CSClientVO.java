package shop.puppyhome.vo;

public class CSClientVO {

	private String client_title;
	private String client_cont;
	private String client_category;
	private String client_date;
	private int client_no;
	private String user_id;
	private String client_reply_cont;
	private String client_cont_reply;
	
	
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
	public String getClient_date() {
		return client_date;
	}
	public void setClient_date(String client_date) {
		this.client_date = client_date.substring(0,10);
	}

	public int getClient_no() {
		return client_no;
	}
	public void setClient_no(int client_no) {
		this.client_no = client_no;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getClient_reply_cont() {
		return client_reply_cont;
	}
	public void setClient_reply_cont(String client_reply_cont) {
		this.client_reply_cont = client_reply_cont;
	}
	public String getClient_cont_reply() {
		return client_cont_reply;
	}
	public void setClient_cont_reply(String client_cont_reply) {
		this.client_cont_reply = client_cont_reply;
	}
	
	
}
