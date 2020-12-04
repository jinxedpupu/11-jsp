<%@ page import="com.cdvtc.guashen.model.User" %>
<%@ page import="com.cdvtc.guashen.dao.GuashenDao" %>
<%@ page import="com.cdvtc.guashen.dao.GuashenDaoimpl" %><%--
  Created by IntelliJ IDEA.
  User: 刘云龙
  Date: 2020/11/30
  Time: 11:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    //获取参数
    //request.setCharacterEncoding("UTF-8"); //设置编码，解决中文乱码问题，只针对post方式
    String account = request.getParameter("userzh");
    String password = request.getParameter("usermm");

    //验证
    GuashenDao dao = new GuashenDaoimpl();
    User user = dao.getUser(account,password);
    if (user != null) {//验证成功
        session.setAttribute("user",user);//将管理员信息保留在Session中（向其他页面共享数据）
        response.sendRedirect("index.jsp");//重置到(前转) - 首页,redirect与forward的区别是：redirect不是同一次请求，forward是同一次请求
    } else {//验证失败
        request.setAttribute("error", "账号或密码错误！");
        request.getRequestDispatcher("index.jsp").forward(request, response);//前转到登录页面
    }
%>
