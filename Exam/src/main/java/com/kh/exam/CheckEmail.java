package com.kh.exam;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@ResponseBody
@RequestMapping("/CheckEmail")
public class CheckEmail(HttpServletRequest request, HttpServletResponse response) {
	MemberDAO dao = new MemberDAO();
	response.setContentType("text/html;charset=utf-8");
	PrintWriter resp = response.getWriter();

	String email = request.getParameter("email");
	try {
		boolean result = dao.isEmailExist(email);

		if(result) {
			resp.write("이미 사용중인 email 입니다.");
		} else {
			resp.write("사용 가능한 email 입니다.");
		}
	} catch (Exception e) {
		e.printStackTrace();

		resp.write("조회하는 도중 오류가 발생했습니다.");
	}
}