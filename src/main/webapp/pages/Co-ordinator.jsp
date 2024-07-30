<%@ page import="java.sql.*" %><%--
  Created by IntelliJ IDEA.
  User: HP
  Date: 09-05-2024
  Time: 17:30
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
                            <h4>Sitemap</h4>
                        </div>
                        <nav aria-label="breadcrumb" role="navigation">
                            <ol class="breadcrumb">
                                <li class="breadcrumb-item">
                                    <a href="./?page=Dashboard">Home</a>
                                </li>
                                <li class="breadcrumb-item active" aria-current="page">
                                    Sitemap
                                </li>
                            </ol>
                        </nav>
                    </div>
                </div>
            </div>
            <div class="row clearfix">
                <%
                    try {
                        Class.forName("com.mysql.cj.jdbc.Driver");
                        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/event_management", "root", "");
                        Statement st = conn.createStatement();
                        ResultSet rs = st.executeQuery("select * from coordinate");
                        while (rs.next())
                        {
                            int id = rs.getInt("id");
                            byte[] img = rs.getBytes("image");
                            String base64Imagee = java.util.Base64.getEncoder().encodeToString(img);
                            String cImage = "data:image/jpeg;base64," + base64Imagee;
                %>
                <div class="col-lg-3 col-md-6 col-sm-12 mb-30">
                    <div class="da-card">
                        <div class="da-card-photo" style="height: 250px;">
                            <div class="product-detail-desc  card-box height-100-p">
                                <img src="<%= cImage %>" alt="Image" style="object-fit: cover; width: 100%; height: 100%;" >
                            </div>
                            <div class="da-overlay">
                                <div class="da-social">
                                    <ul class="clearfix">
                                        <li>
                                            <a href="./?page=CoordinateDetails&id=<%= id %>"><i class="fa fa-eye"></i></a>
                                        </li>

                                    </ul>
                                </div>
                            </div>
                        </div>
                        <div class="da-card-content">
                            <h5 class="h5 mb-10"><%= rs.getString("fullname") %></h5>
<%--                            <p class="mb-0">Lorem ipsum dolor sit amet</p>--%>
                        </div>
                    </div>
                </div>
                <%
                        }
                    } catch (SQLException e) {
                        throw new RuntimeException(e);
                    } catch (ClassNotFoundException e) {
                        throw new RuntimeException(e);
                    }
                %>
            </div>
        </div>

    </div>

</body>
</html>

