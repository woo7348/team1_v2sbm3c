package dev.mvc.admin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class AdminCont {
  
  public AdminCont() {
    System.out.println("-> AdminCont created.");
  }

  // 관리자만 접속 가능
  // http://localhost:9091/admin/admin.do
  @RequestMapping(value="/admin/admin.do", method=RequestMethod.GET)
  public String admin() {
        
    return "/admin/admin";
  }

  // 로그인
  // http://localhost:9091/admin/login_form.do
  @RequestMapping(value="/admin/login_form.do", method=RequestMethod.GET)
  public String login_orm() {
    System.out.println("-> AdminCont login_form()");
    return "/admin/login_form";  // /WEB-INF/views/admin/login_form.jsp
  }
    
  @RequestMapping(value="/admin/login_error.do", method=RequestMethod.GET)
  public String login_error() {
    System.out.println("-> AdminCont login_error()");
    return "/admin/login_error";
  }
    
  // logout.jsp -> <form name='frm' action="/admin/logout.do" method="post">
  // -> Spring 자동 logout 처리
  @RequestMapping(value="/admin/logout.do", method=RequestMethod.GET)
  public String logout() {
    System.out.println("-> AdminCont logout() GET");
    return "/admin/logout";  // /WEB-INF/views/admin/logout.jsp
  }
    
}


 