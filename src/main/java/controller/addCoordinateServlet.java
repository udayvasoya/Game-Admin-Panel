package controller;

import dao.CoordinateDB;
import model.Coordinate;

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


@WebServlet(name = "addCoordinateServlet",value = "/addCoordinateServlet")
@MultipartConfig
public class addCoordinateServlet extends HttpServlet
{
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String cName = req.getParameter("cName");
        String cEmail = req.getParameter("cEmail");
        String cPhone = req.getParameter("cPhone");
        String cGame = req.getParameter("cGame");
        Part cImage = req.getPart("cImage");

        InputStream inputStream = cImage.getInputStream();
        byte[] dp = readBytesFromInputStream(inputStream);

        Coordinate coordinate = new Coordinate(cName,cEmail,cPhone,cGame,dp);
        CoordinateDB cDB = new CoordinateDB();
        boolean insert = cDB.insertData(coordinate);

        if(insert)
        {
            resp.sendRedirect(req.getContextPath() + "/?page=AddCoordinator&p=q");
        }
        else
        {
            resp.sendRedirect(req.getContextPath()+"/?page=AddCoordinator");
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
