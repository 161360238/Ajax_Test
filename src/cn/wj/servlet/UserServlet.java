package cn.wj.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.wj.bean.User;
import cn.wj.service.UserService;
import cn.wj.serviceImpl.UserServiceImpl;

import com.google.gson.Gson;

public class UserServlet extends HttpServlet {
	private UserService userService=new UserServiceImpl();
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		String uname=request.getParameter("uname");
		User user=userService.selectUserService(uname);
		response.getWriter().write(new Gson().toJson(user));
	}
}
