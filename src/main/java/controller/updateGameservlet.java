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


@WebServlet(name = "updateGameservlet",value = "/updateGameservlet")
@MultipartConfig
public class updateGameservlet extends HttpServlet
{
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String gIdParam = req.getParameter("gId");
        String gName = req.getParameter("gName");
        String gDesc = req.getParameter("gDesc");
        String gRule = req.getParameter("gRule");
        String gPriceParam = req.getParameter("gPrice");
        Part image = req.getPart("gImage");
        String gd = req.getParameter("gd");

        // Check if parameters are null
        if (gIdParam == null || gName == null || gDesc == null || gRule == null || gPriceParam == null || image == null) {
            resp.sendRedirect(req.getContextPath() + "/?page=AddGame&s=nu"); // Redirect with error message
            return;
        }

        int gId = Integer.parseInt(gIdParam);
        int gPrice = Integer.parseInt(gPriceParam);

        InputStream inputStream = image.getInputStream();
        byte[] dp = readBytesFromInputStream(inputStream);

        Game game = new Game(gId, gName, gDesc, gRule, gPrice, dp, gd);
        GameDB gDB = new GameDB();
        boolean update = gDB.updateData(game);
        if (update) {
            resp.sendRedirect(req.getContextPath() + "/?page=AddGame&s=t");
        } else {
            resp.sendRedirect(req.getContextPath() + "/?page=AddGame&s=nu");
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
