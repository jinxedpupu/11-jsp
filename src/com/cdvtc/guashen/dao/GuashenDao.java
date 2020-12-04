package com.cdvtc.guashen.dao;

import com.cdvtc.guashen.model.User;

public interface GuashenDao {

    /**
     * 根据用户账号和密码，获取用户信息
     */
    User getUser(String userzh, String usermm);
}
