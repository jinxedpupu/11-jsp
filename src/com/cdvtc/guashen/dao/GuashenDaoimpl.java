package com.cdvtc.guashen.dao;

import com.cdvtc.guashen.db.DBConnection;
import com.cdvtc.guashen.model.User;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class GuashenDaoimpl implements GuashenDao{
    DBConnection db = new DBConnection();

    @Override
    public User getUser(String userzh, String usermm) {

        try {
            Connection con = db.getConnection();
            //执行查询
            PreparedStatement pst = con.prepareStatement("select  * from  user where  userzh = ? and usermm = ?");
            pst.setString(1,userzh);
            pst.setString(2,usermm);

            ResultSet rs = pst.executeQuery();

            //处理结果集
            if(rs.next()){
                //获取行数据封装成管理员对象
                User user = new User();
                user.setUserzh(userzh);
                user.setUsermm(usermm);
                user.setUserid(rs.getInt("userid"));
                user.setUsermc(rs.getString("usermc"));
                user.setUserdh(rs.getString("userdh"));
                user.setUserqq(rs.getString("userqq"));
                // 关闭连接，释放资源
                rs.close();
                pst.close();
                con.close();
                return user;
            }

            // 关闭连接，释放资源
            rs.close();
            pst.close();
            con.close();

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return null;
    }
}
