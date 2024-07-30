package controller;

import dao.CoordinateDB;
import dao.GameDB;
import model.Coordinate;
import model.Game;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;


@WebServlet(name = "updateCoordinateServlet",value = "/updateCoordinateServlet")
@MultipartConfig
public class updateCoordinateServlet extends HttpServlet
{
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String cId = req.getParameter("cuId");
        String cuName = req.getParameter("cuName");
        String cuEmail = req.getParameter("cuEmail");
        String cuPhone = req.getParameter("cuPhone");
        String cuGame = req.getParameter("cuGame");
        Part cImage = req.getPart("cuImage");
// Check if parameters are null
        if (cId == null || cuName == null || cuEmail == null || cuPhone == null || cuGame == null || cImage == null) {
            resp.sendRedirect(req.getContextPath() + "/?page=AddGame&s=nu"); // Redirect with error message
            return;
        }

        int cuId = Integer.parseInt(cId);

        InputStream inputStream = cImage.getInputStream();
        byte[] dp = readBytesFromInputStream(inputStream);

        Coordinate coordinate = new Coordinate(cuId,cuName,cuEmail,cuPhone,cuGame,dp);
        CoordinateDB cDB = new CoordinateDB();
        boolean update = cDB.updateData(coordinate);
        if(update)
        {
            resp.sendRedirect(req.getContextPath() + "/?page=AddCoordinator&m=n");
        }
        else
        {
            resp.sendRedirect(req.getContextPath()+"/?page=AddCoordinator&m=nu");
        }
    }
    private byte[] readBytesFromInputStream(InputStream inputStream) throws IOException {
        ByteArrayOutputStream buffer = new ByteArrayOutputStream();
        int bytesRead;
        byte[] data = new byte[1024];
        while ((bytesRead = inputStream.read(data, 0, data.length)) != -1) {
            buffer.write(data, 0, bytesRead);
        }
        return buffer.toByteArray();
    }
}
