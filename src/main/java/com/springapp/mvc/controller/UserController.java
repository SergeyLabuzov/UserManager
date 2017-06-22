package com.springapp.mvc.controller;

import com.springapp.mvc.model.ActionUser;
import com.springapp.mvc.model.User;
import com.springapp.mvc.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.support.PagedListHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.ServletRequestUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.UnsupportedEncodingException;

@Controller
@RequestMapping("/users")
public class UserController {

    private UserService userService;

    @Autowired(required = true)
    @Qualifier(value = "userService")
    public void setUserService(UserService userService) {
        this.userService = userService;
    }

    @RequestMapping()
    public ModelAndView listUsers(HttpServletRequest request, HttpServletResponse response, @ModelAttribute("SearchParam") User searchUser){
        ModelAndView model = new ModelAndView();

        String method = request.getMethod();

        if (request.getMethod().equals("POST")) {
            ActionUser.getUser().setName(searchUser.getName());
        }

        PagedListHolder pagedListHolder = new PagedListHolder(this.userService.listUsers(ActionUser.getUser().getName()));
        int page = ServletRequestUtils.getIntParameter(request, "p", 0);
        pagedListHolder.setPage(page);
        int pageSize = 1;
        pagedListHolder.setPageSize(pageSize);
        model.addObject("pagedListHolder", pagedListHolder);

        model.addObject("SearchParam", ActionUser.getUser());
        model.setViewName("users");

        boolean isFirst = pagedListHolder.isFirstPage();
        int firstLinkedPage = pagedListHolder.getFirstLinkedPage();

        return model;
    }

    @RequestMapping(value = "new", method = RequestMethod.GET)
    public ModelAndView newUser() {
        ModelAndView model = new ModelAndView();
        model.addObject("newUser", new User());
        model.setViewName("create");
        return model;
    }

    @RequestMapping(value = "add", method = RequestMethod.POST)
    public ModelAndView addUser(@ModelAttribute("newUser") User user, HttpServletRequest request){
        ModelAndView model = new ModelAndView();
        try {
            this.userService.addUser(user);
            model.setViewName("redirect:/users");
        } catch (Exception e) {
            model.addObject("errorMessage", e);
            model.addObject("returnPage", "");
            model.setViewName("error");
        }
        return model;
    }

    @RequestMapping(value = "edit/{id}")
    public ModelAndView editUser(@PathVariable int id) {
        ModelAndView model = new ModelAndView();

        User user = this.userService.getUserById(id);
        if (user != null) {
            model.addObject("editUser", user);
            model.setViewName("edit");
        } else {
            model.addObject("errorMessage", "");
            model.addObject("returnPage", "");
            model.setViewName("error");
        }
        return model;
    }

    @RequestMapping(value = "update", method = RequestMethod.POST)
    public ModelAndView updateUser(@ModelAttribute("editUser") User user, HttpServletRequest request) {
        ModelAndView model = new ModelAndView();
        this.userService.updateUser(user);
        model.setViewName("redirect:/users");
        return model;
    }

    @RequestMapping(value = "delete/{id}", method = RequestMethod.GET)
    public ModelAndView deleteUser(@PathVariable int id, HttpServletRequest request) {
        ModelAndView model = new ModelAndView();
        this.userService.removeUser(id);
        model.setViewName("redirect:/users");
        return model;
    }

}
