package shop.puppyhome.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface Action { // 인터페이스
   
   public abstract ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception; //추상 메서드 정의
   
}