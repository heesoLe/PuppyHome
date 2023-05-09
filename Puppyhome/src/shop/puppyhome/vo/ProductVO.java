package shop.puppyhome.vo;

public class ProductVO { //tbl_product 테이블 컬럼명과 동일

   private int product_no; //상품 글번호
   private String product_title; //상품명
   private int product_price; //상품 가격
   private String product_maker; //제조사
   private String product_type; //소분류
   private String product_cont; // 상품 내용(사진)
   private String product_cont1;
   private String product_cont2;
   private String product_cont3;
   private int product_star; // 별점
   private String product_date; //상품 등록날짜
   
   public String getProduct_cont1() {
      return product_cont1;
   }
   public void setProduct_cont1(String product_cont1) {
      this.product_cont1 = product_cont1;
   }
   public String getProduct_cont2() {
      return product_cont2;
   }
   public void setProduct_cont2(String product_cont2) {
      this.product_cont2 = product_cont2;
   }
   public String getProduct_cont3() {
      return product_cont3;
   }
   public void setProduct_cont3(String product_cont3) {
      this.product_cont3 = product_cont3;
   }
   

   // 검색 기능
   private String find_name;// 검색어
   private String find_field;// 검색 필드

   public int getProduct_no() {
      return product_no;
   }
   public void setProduct_no(int product_no) {
      this.product_no = product_no;
   }
   public String getProduct_title() {
      return product_title;
   }
   public void setProduct_title(String product_title) {
      this.product_title = product_title;
   }
   public int getProduct_price() {
      return product_price;
   }
   public void setProduct_price(int product_price) {
      this.product_price = product_price;
   }
   public String getProduct_maker() {
      return product_maker;
   }
   public void setProduct_maker(String product_maker) {
      this.product_maker = product_maker;
   }


   public String getProduct_type() {
      return product_type;
   }
   public void setProduct_type(String product_type) {
      this.product_type = product_type;
   }


   public String getProduct_cont() {
      return product_cont;
   }
   public void setProduct_cont(String product_cont) {
      this.product_cont = product_cont;
   }
   public int getProduct_star() {
      return product_star;
   }
   public void setProduct_star(int product_star) {
      this.product_star = product_star;
   }
   public String getProduct_date() {
      return product_date;
   }
   public void setProduct_date(String product_date) {
      this.product_date = product_date.substring(0,10);//0이상 10미만 사이의 년월일 만 반환
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

   @Override
   public String toString() {
      return "ProductVO [product_no=" + product_no + ", product_title=" + product_title + ", product_price=" + product_price + ", product_maker="
      + product_maker + ", product_type=" + product_type + ", product_cont=" + product_cont
      + ", product_star=" + product_star + ", product_date=" + product_date + ", find_name=" + find_name   + ", finde_field=" + find_field + "]";
   }



}