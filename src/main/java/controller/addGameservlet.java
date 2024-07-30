package controller;

import dao.GameDB;
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

@WebServlet(name = "addGameservlet",value = "/addGameservlet")
@MultipartConfig
public class addGameservlet extends HttpServlet
{
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String gamename = req.getParameter("gamename");
        String gamedesc = req.getParameter("gamedesc");
        String gamerules = req.getParameter("gamerules");
        int price = Integer.parseInt(req.getParameter("price"));
        String gdate = req.getParameter("gdate");

//        String imageName = extractFileName(image);
//        String imageUploadPath = "F:/JSP_PRO/Admin_game/src/main/webapp/Upload/"+imageName;
//        image.write(imageUploadPath);
        Part image = req.getPart("image");
        InputStream inputStream = image.getInputStream();
        byte[] dp = readBytesFromInputStream(inputStream);



        Game game = new Game(gamename,gamedesc,gamerules,price,dp,gdate);
        GameDB gDB = new GameDB();
        boolean insert = gDB.insertData(game);

        if(insert)
        {
            resp.sendRedirect(req.getContextPath() + "/?page=AddGame&x=y");
        }
        else
        {
            resp.sendRedirect(req.getContextPath()+"/?page=AddGame&x=nu");
        }

    }

//    private String extractFileName(Part part)
//    {
//        String contentDisposition = part.getHeader("content-disposition");
//        String[] tokens = contentDisposition.split(";");
//        for (String token : tokens) {
//            if (token.trim().startsWith("filename")) {
//                return token.substring(token.indexOf("=") + 2, token.length() - 1);
//            }
//        }
//
//        return "";
//    }

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
