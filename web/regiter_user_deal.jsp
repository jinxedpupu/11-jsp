<%@ page import="com.cdvtc.guashen.dao.GuashenDao" %>
<%@ page import="com.cdvtc.guashen.dao.GuashenDaoimpl" %>
<%@ page import="com.cdvtc.guashen.model.User" %><%--
  Created by IntelliJ IDEA.
  User: 刘云龙
  Date: 2020/12/4
  Time: 9:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    //获取参数
    //request.setCharacterEncoding("UTF-8"); //设置编码，解决中文乱码问题，只针对post方式

    String usermc = request.getParameter("usermc");
    String userzh = request.getParameter("userzh");
    String usermm = request.getParameter("usermm");
    String userdh = request.getParameter("userdh");
    String userqq = request.getParameter("userqq");

    String error_mobile =null;
    //验证}
    if(userdh == null || userdh.length()<11 || userdh.length()>11){
        error_mobile = "手机号码格式不对！";
    }

    //验证学号是否已经存在
    GuashenDao dao = new GuashenDaoimpl();

    if(error_mobile == null){//成功：将数据写入数据库，返回首页

        User user = new User();
        user.setUsermc(usermc);
        user.setUserzh(userzh);
        user.setUsermm(usermm);
        user.setUserdh(userdh);
        user.setUserqq(userqq);

        //将数据写入数据库
        dao.addUser(user);

        response.sendRedirect("index.jsp");//页面跳转到 - 首页
    }else{//失败：返回注册页面，增加错误提示
        request.setAttribute("error_mobile",error_mobile);//将错误信息写入请求对象中，用于注册页面进行错误信息提示
        request.getRequestDispatcher("register_user.jsp").forward(request, response);//前转至页面：注册页面
    }
%>
