<%@ page import="java.sql.*" %>
<%@ page import="java.io.InputStream" %><%--
  Created by IntelliJ IDEA.
  User: HP
  Date: 09-05-2024
  Time: 17:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>

</head>
<body>

    <div class="pd-ltr-20 xs-pd-20-10">
        <div class="min-height-200px">
            <div class="page-header">
                <div class="row">
                    <div class="col-md-12 col-sm-12">
                        <div class="title">
                            <h4>Product Detail</h4>
                        </div>
                        <nav aria-label="breadcrumb" role="navigation">
                            <ol class="breadcrumb">
                                <li class="breadcrumb-item">
                                    <a href="./?page=Dashboard">Home</a>
                                </li>
                                <li class="breadcrumb-item active" aria-current="page">
                                    Game Detail
                                </li>
                            </ol>
                        </nav>
                    </div>
                </div>
            </div>

            <div class="product-wrap">
                <div class="product-detail-wrap mb-30">
                    <div class="row">
                        <div class="col-lg-12 col-md-12 col-sm-12 mt-3">
                            <%
                                try {
                                    String id = request.getParameter("id"); // Retrieve the 'id' parameter from the request
                                    if (id == null || id.isEmpty()) {
                                        id = "1";
                                    }
                                    Class.forName("com.mysql.cj.jdbc.Driver");
                                    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/event_management", "root", "");
//                                    String query = "SELECT c.fullname,c.email, g.game_discribtion, g.game_rules, g.price,g.image FROM coordinate c, games g WHERE g.id = ? and c.fullname = g.game_name";

                                    String query = "SELECT c.fullname, c.email, g.game_discribtion, g.game_rules, g.price, g.image,g.date FROM coordinate AS c JOIN games AS g ON c.game = g.game_name WHERE g.id = ?";
                                    PreparedStatement ps = conn.prepareStatement(query);
                                    ps.setString(1, id); // Set the 'id' parameter dynamically
                                    ResultSet rs = ps.executeQuery();
                                    if (rs.next()) { // Fetch only one record
                                        byte[] img = rs.getBytes("image");
                                        String base64Imagee = java.util.Base64.getEncoder().encodeToString(img);
                                        String gImage = "data:image/jpeg;base64," + base64Imagee;
                                        String game_discribtion = rs.getString("game_discribtion");
                            %>
                            <div class="product-detail-desc pd-20 card-box height-100-p">

                                <div class="demo p-4" style="background-image: url('<%= gImage %>');border-radius: 10px;color: white;justify-content: center;background-repeat: no-repeat;
                                        background-attachment: fixed;
                                        background-size: cover; text-align: center; display: flex; flex-direction: column; align-items: center;
                                        height: 80vh;
                                        ">
                                </div>
                                <div class="details mt-3 " id="overflow-hidden">

                                    <div style="margin-top: 10px; border-radius: 10px;color: black;justify-content: center;background-repeat: no-repeat;
                                      background-attachment: fixed;
                                      background-size: cover; text-align: center; display: flex; flex-direction: column; align-items: center;  padding-top: 10px; padding-bottom: 20px; box-shadow: rgba(0, 0, 0, 0.15) 0px 5px 15px 0px;">
                                        Details

                                        <p><%= game_discribtion %></p>
                                    </div>
                                    <div style="margin-top: 10px; border-radius: 10px;color: black;justify-content: center;background-repeat: no-repeat;
                                    background-attachment: fixed;
                                    background-size: cover; text-align: center; display: flex; flex-direction: column; align-items: center;  padding-top: 10px; padding-bottom: 20px; box-shadow: rgba(0, 0, 0, 0.15) 0px 5px 15px 0px;">
                                        Rules

                                        <p><%= rs.getString("game_rules") %></p>
                                    </div>
                                    <div class="d-flex justify-content-around" style="margin-top: 10px;box-shadow: rgba(0, 0, 0, 0.15) 0px 5px 15px 0px; padding: 25px 0px; margin-bottom: 20px;">
                                        <h5><%= rs.getInt("price") %></h5>
                                        <h5><%= rs.getString("fullname") %></h5>
                                        <h5><%= rs.getString("date")%></h5>
                                    </div>
                                </div>
                                <%
                                        }
                                        rs.close();
                                        ps.close();
                                        conn.close();
                                    } catch (Exception e) {
                                        e.printStackTrace();
                                    }
                                %>
                                <div class="card-box pb-10">

                                    <div class="h5 pd-20 mb-0">participant Details</div>
                                    <table class=" table nowrap  data-table-export ">
                                        <thead>
                                        <tr>
                                            <th>Id</th>
                                            <th>Name</th>
                                            <th>Email</th>
                                            <th>Price</th>
                                            <th class="datatable-nosort">Actions</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <%
                                            try
                                            {
                                                Class.forName("com.mysql.cj.jdbc.Driver");
                                                Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/event_management","root","");
                                                Statement st = conn.createStatement();
                                                ResultSet rs = st.executeQuery("select * from apply");
                                                while (rs.next())
                                                {
                                                    int id = rs.getInt("id");
                                        %>
                                        <tr>
                                            <td><%= id %></td>
                                            <td><%= rs.getString("name") %></td>
                                            <td><p><%= rs.getString("email") %></p></td>
                                            <td><%= rs.getInt("price") %></td>
                                            <td>
                                                <div class="table-actions">
                                                    <a href="" class="btn" data-color="#265ed7"
                                                       data-toggle="modal" data-target="#editCourse_<%= rs.getInt("id") %>"
                                                    ><i class="icon-copy dw dw-edit2"></i
                                                    ></a>
                                                    <a href="" class="btn" data-color="#e95959"
                                                       data-toggle="modal" data-target="#deleteModal_<%= rs.getInt("id") %>"
                                                    ><i class="icon-copy dw dw-delete-3"></i
                                                    ></a>
                                                </div>
                                            </td>
                                        </tr>
                                        <%
                                                }
                                            } catch (SQLException e) {
                                                throw new RuntimeException(e);
                                            } catch (ClassNotFoundException e) {
                                                throw new RuntimeException(e);
                                            }
                                        %>
                                        </tbody>
                                    </table>
                                </div>

                            </div>


                        </div>


                    </div>
                </div>

            </div>
        </div>
    </div>

</body>
</html>

