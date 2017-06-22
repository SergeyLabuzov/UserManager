package com.springapp.mvc.model;


public class ActionUser {

    private static User user = new User();

    public static User getUser() {
        return user;
    }

    public static User getUser(User user) {

        if (user == null) {
            user = new User();
        }

        return user;
    }
}
