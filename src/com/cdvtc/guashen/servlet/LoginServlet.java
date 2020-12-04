package com.cdvtc.guashen.servlet;

import com.cdvtc.guashen.dao.GuashenDao;
import com.cdvtc.guashen.dao.GuashenDaoimpl;
import com.cdvtc.guashen.model.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;


@WebServlet(name = "LoginServlet" ,urlPatterns = "/loginServlet")
public class LoginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        // 获取参数
        request.setCharacterEncoding("UTF-8"); //设置编码，只针对POST提交有效
        String userzh = request.getParameter("userzh");
        String usermm = request.getParameter("usermm");

        // 验证
        GuashenDao dao = new GuashenDaoimpl();
        User user = dao.getUser(userzh, usermm);
        if (user != null) {  //成功
            HttpSession session = request.getSession();  //通过request获取session
            session.setAttribute("user", user); // 将信息保存在Session中（向其它页面共享数据）
            response.sendRedirect("login_cgym.jsp"); // 重置页面（前转）：首面
        } else { //失败
            request.setAttribute("error", "账户或密码错误！");
            request.getRequestDispatcher("login_user.jsp").forward(request, response); // 前面页面：登陆页面
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
