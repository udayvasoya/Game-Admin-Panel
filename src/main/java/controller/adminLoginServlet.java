package controller;

import dao.AdminDB;
import model.Admin_login;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet(name = "adminLoginServlet",value = "/adminLoginServlet")
@MultipartConfig
public class adminLoginServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String adminname = req.getParameter("name");
        String password = req.getParameter("password");


        Admin_login adminlogin =new Admin_login(adminname,password);
        AdminDB adb = new AdminDB();
        boolean success = adb.validateAdmin(adminlogin);

        if(success)
        {
            HttpSession hs = req.getSession();
            hs.setAttribute("admin",adminname);
//            resp.sendRedirect(req.getContextPath() + "/?page=Dashboard");
            RequestDispatcher rd = req.getRequestDispatcher("/?page=index.jsp");
            rd.include(req,resp);
        }
        else
        {
            resp.sendRedirect(req.getContextPath()+"/login.jsp");
        }
    }
}
