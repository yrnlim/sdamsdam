package kr.co.greenapple.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Lazy;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.greenapple.beans.BookBean;
import kr.co.greenapple.beans.ContentBean;
import kr.co.greenapple.beans.QnaBean;
import kr.co.greenapple.beans.UserBean;
import kr.co.greenapple.pager.Pager;
import kr.co.greenapple.service.UserService;
import kr.co.greenapple.validator.UserValidator;

@Controller
@RequestMapping("/user")
public class UserController {
	
	@Autowired
	private UserService userService;
	
	@Resource(name = "loginUserBean")
	@Lazy
	private UserBean loginUserBean;
	
	
	@GetMapping("/login")
	public String login(@ModelAttribute("loginInfo") UserBean loginInfo, @RequestParam(value = "fail", defaultValue = "false") boolean fail, Model model) {
		
		model.addAttribute("fail", fail);
		return "user/login";
	}
	
	@PostMapping("/login_pro")
	public String login_pro(@Valid @ModelAttribute("loginInfo") UserBean loginInfo, BindingResult result) {
		if(result.hasErrors()) {
			return "user/login";
		}
	
		userService.getLoginUserInfo(loginInfo);
		
		if(loginUserBean.isUserLogin() == true) {
						
			return "user/login_success";
		} else {
			return "user/login_fail";
		}
	}
	
	@GetMapping("/join_user")
	public String join_user(@ModelAttribute("joinUserBean") UserBean joinUserBean) {
		return "user/join_user";
	}
	@GetMapping("/join_therapist")
	public String join_therapist(@ModelAttribute("joinUserBean") UserBean joinUserBean) {
		return "user/join_therapist";
	}
	
	@GetMapping("/join_company")
	public String join_company(@ModelAttribute("joinUserBean") UserBean joinUserBean) {
		return "user/join_company";
	}
	@GetMapping("/join_select")
	public String join_select(@ModelAttribute("joinUserBean") UserBean joinUserBean) {
		return "user/join_select";
	}
	
	@PostMapping("/join_pro")
	public String join_pro(@Valid @ModelAttribute("joinUserBean") UserBean joinUserBean, BindingResult result) {
		
		if(result.hasErrors()) {
			System.out.println("가입 실패");
			return "user/join_user_fail";
		}
		
		if(joinUserBean.getUser_info() != null && joinUserBean.getUser_info().equals("T")  ) {
			userService.addTherapist(joinUserBean);			
		}else {
			userService.addUserInfo(joinUserBean);
		}
		return "user/join_success";
	}
	

	//마이페이지
	@GetMapping("/modify")
	public String modify(@ModelAttribute("modifyUserBean") UserBean modifyUserBean) {
		
		userService.getModifyUserInfo(modifyUserBean);
		
		return "user/modify";
	}
	
	@PostMapping("/modify_pro")
	public String modify_pro(@Valid @ModelAttribute("modifyUserBean") UserBean modifyUserBean, BindingResult result) {
		if(result.hasErrors()) {
			return "user/modify";
		}
		
		userService.modifyUserInfo(modifyUserBean);
		
		return "user/modify_success";
	}
	
	@GetMapping("/logout")
	public String logout(HttpServletRequest request) {
		loginUserBean.setUserLogin(false);
		
		request.getSession().invalidate(); //로그아웃시 세션삭제

		return "user/logout";
	}
		
	@GetMapping("/not_login")
	public String not_login() {
		return "user/not_login";
	}
	
	@InitBinder
	public void initBinder(WebDataBinder binder) {
		UserValidator validator1 = new UserValidator();
		binder.addValidators(validator1);
	}
	
	//마이페이지>게시물관리
	@GetMapping("/myboard")
	public String myboard(Model model) {
		
		int user_idx = loginUserBean.getUser_idx();
		List<QnaBean> myQnaBoardList = userService.myQnaBoard(user_idx);
		model.addAttribute("qnaList", myQnaBoardList);
		
		return "user/myboard";
	}
	
	//마이페이지>예약관리
	@GetMapping("/myservice")
	public String myservice() {
		return "user/myservice";
	}
	
	//마이페이지>예약관리
	@GetMapping("/mydelete")
	public String mydelete() {
		return "user/user_del";
	}
	
	@PostMapping("/mydelete_pro")
	public String mydelete_pro() {
//		if(result.hasErrors()) {
//			return "user/user_del";
//		}		
//		userService.modifyUserInfo(modifyUserBean);
		return "user/userdel_success";
	}
	
	//마이페이지
//		@GetMapping("/modify")
//		public String modify(@ModelAttribute("modifyUserBean") UserBean modifyUserBean) {
//			userService.getModifyUserInfo(modifyUserBean);
//			return "user/modify";
//		}
		
//		@PostMapping("/modify_pro")
//		public String modify_pro(@Valid @ModelAttribute("modifyUserBean") UserBean modifyUserBean, BindingResult result) {
//			if(result.hasErrors()) {
//				return "user/modify";
//			}		
//			userService.modifyUserInfo(modifyUserBean);
//			return "user/modify_success";
//		}
	
	
	
	
	//MemDelServlet
//	@RequestMapping(value = "/member/del.do", method = RequestMethod.GET)
//	public String del(String memId) {

		//String memId = req.getParameter("memId"); //전송되어 온 파라미터 값을 꺼내서 String 변수로 받아
//		int num = memberService.delMember(memId); //받은걸 db에서 삭제하고, 받은 갯수를 화면에 출력하기 위해 변수로 받아
			
		//2)list를 보여준다
//		return "redirect:/member/list.do";
//	}
	
}
