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

@WebServlet(name = "RegisterServlet" ,urlPatterns = "/RegisterServlet")
public class RegisterServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        // 获取参数
        request.setCharacterEncoding("UTF-8"); //设置编码，只针对POST提交有效
        String userzh = request.getParameter("userzh");
        String usermm = request.getParameter("usermm");
        String usermc = request.getParameter("usermc");
        String userdh = request.getParameter("userdh");
        String userqq = request.getParameter("userqq");

        String error_userzh =null;
        String error_usermc =null;
        String error_userdh = null;
        //验证
        if(userzh == null || userzh.length()<2){
            error_userzh = "账号不能为空！";
        }
        if(usermc == null || usermc.length()<2){
            error_usermc = "名称不能为空！";
        }
        if(userdh == null || userdh.length()<11){
            error_userdh = "手机号码格式不对！";
        }

        if(error_userzh == null && error_usermc == null && error_userdh == null){//成功：将数据写入数据库，返回首页
            GuashenDao dao = new GuashenDaoimpl();
            User user = new User();
            user.setUserzh(userzh);
            user.setUsermm(usermm);
            user.setUsermc(usermc);
            user.setUserdh(userdh);
            user.setUserqq(userqq);
            //将数据写入数据库
            dao.addUser(user);

            response.sendRedirect("index.jsp");//页面跳转到 - 首页
        }else{//失败：返回注册页面，增加错误提示
            request.setAttribute("error_userzh",error_userzh);//将错误信息写入请求对象中，用于注册页面进行错误信息提示
            request.setAttribute("error_usermc",error_usermc);
            request.setAttribute("error_userdh",error_userdh);

            request.getRequestDispatcher("register_user.jsp").forward(request, response);//前转至页面：注册页面
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}