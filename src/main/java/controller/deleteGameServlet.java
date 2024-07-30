package controller;

import dao.GameDB;
import model.Game;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "deleteGameServlet",value = "/deleteGameServlet")
@MultipartConfig
public class deleteGameServlet extends HttpServlet
{
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int GameId = Integer.parseInt(req.getParameter("GameId"));

        Game game = new Game(GameId);
        GameDB gDB = new GameDB();
        boolean delete = gDB.deleteData(game);
        if(delete)
        {
            resp.sendRedirect(req.getContextPath() + "/?page=AddGame&a=b");
        }
        else
        {
            resp.sendRedirect(req.getContextPath()+"/?page=AddGame&a=nu");
        }
    }
}
