package controller;

import dao.QueryDB;
import model.Query;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name="deleteQueryServlet",value = "/deleteQueryServlet")
@MultipartConfig
public class deleteQueryServlet extends HttpServlet
{
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int qid = Integer.parseInt(req.getParameter("qid"));

        Query query = new Query(qid);
        QueryDB queryDB = new QueryDB();
        boolean delete = queryDB.deletequery(query);

        if(delete)
        {
            resp.sendRedirect(req.getContextPath() + "/?page=UserQuery&s=i");
        }
        else
        {
            resp.sendRedirect(req.getContextPath() + "/?page=UserQuery&s=nu");
        }
    }
}
