package controller;

import dao.CoordinateDB;
import model.Coordinate;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;


@WebServlet(name = "deleteCoordinateServlet",value = "/deleteCoordinateServlet")
@MultipartConfig
public class deleteCoordinateServlet extends HttpServlet
{
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int cuId = Integer.parseInt(req.getParameter("cuId"));

        Coordinate coordinate = new Coordinate(cuId);
        CoordinateDB cDB = new CoordinateDB();
        boolean delete = cDB.deleteData(coordinate);

        if(delete)
        {
            System.out.println("Coordinate deleted successfully");
            resp.sendRedirect(req.getContextPath() + "/?page=AddCoordinator&s=i");
        }
        else
        {
            resp.sendRedirect(req.getContextPath()+"/?page=AddCoordinator&s=nu");
        }

    }
}
