package com.springapp.mvc.dao;


import com.springapp.mvc.model.User;

import java.util.List;

public interface UserDao {

    void addUser(User user);

    void updateUser(User user);

    void removeUser(int id);

    User getUserById(int id);

    List listUsers(String name);
}
