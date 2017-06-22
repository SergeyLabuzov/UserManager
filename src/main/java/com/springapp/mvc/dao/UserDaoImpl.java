package com.springapp.mvc.dao;


import com.springapp.mvc.model.User;
import org.hibernate.*;
import org.hibernate.criterion.Restrictions;
import org.hibernate.persister.entity.Loadable;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class UserDaoImpl implements UserDao {

    private SessionFactory sessionFactory;

    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    @Override
    public void addUser(User user) {
        Session session = this.sessionFactory.getCurrentSession();
        user.check();
        session.persist(user);
    }

    @Override
    public void updateUser(User user) {
        Session session = this.sessionFactory.getCurrentSession();
        Query query = session.createQuery("select count(1) from User where id = :id");
        query.setInteger("id", user.getId());

        long count = (Long) query.uniqueResult();
        if (count == 1) {
            user.check();
            session.update(user);
        }
    }

    @Override
    public void removeUser(int id) {
        Session session = this.sessionFactory.getCurrentSession();
        User user = (User) session.load(User.class, new Integer(id));

        if(user != null){
            session.delete(user);
        }
    }

    @Override
    public User getUserById(int id) {
        Session session = this.sessionFactory.getCurrentSession();
        User user = (User) session.load(User.class, new Integer(id));
        return user.copy();
    }

    @Override
    public List<User> listUsers(String name) {
        Session session = this.sessionFactory.getCurrentSession();
        Criteria criteria = session.createCriteria(User.class);
        if (name != null && !name.isEmpty()) {
            criteria.add(Restrictions.like("name", "%" + name + "%"));
        }
        List<User> list = criteria.list();
        //List<User> list = session.createQuery("from User").list();
        return list;
    }
}
