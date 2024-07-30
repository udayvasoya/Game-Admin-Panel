<%@ page import="java.sql.*" %><%--
  Created by IntelliJ IDEA.
  User: HP
  Date: 09-05-2024
  Time: 17:35
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
            <div class="pd-20  mb-30">


                <!-- /Breadcrumb -->

<%--                <div class="row gutters-sm">--%>
<%--                    <div class="col-md-4 mb-3">--%>
<%--                        <div class="card">--%>
<%--                            <div class="card-body">--%>
<%--                                <%--%>
<%--                                    try {--%>
<%--                                        Class.forName("com.mysql.cj.jdbc.Driver");--%>
<%--                                        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/event_management", "root", "");--%>
<%--                                        Statement st = conn.createStatement();--%>
<%--                                        ResultSet rs = st.executeQuery("select * from coordinate where id = ?");--%>

<%--                                        while (rs.next())--%>
<%--                                        {--%>
<%--                                            int id = Integer.parseInt(rs.getInt("id"));--%>
<%--                                            %>--%>
<%--                                                <div class="d-flex flex-column align-items-center text-center">--%>
<%--                                    <img src="<%= rs.getString("image") %>" alt="Admin" class="rounded-circle" width="150">--%>
<%--                                <div class="mt-3">--%>
<%--                                    <h4><%= rs.getString("fullname") %></h4>--%>
<%--                                </div>--%>
<%--                            </div>--%>
<%--                                <%--%>

<%--                                        }--%>
<%--                                    } catch (SQLException e) {--%>
<%--                                        throw new RuntimeException(e);--%>
<%--                                    } catch (ClassNotFoundException e) {--%>
<%--                                        throw new RuntimeException(e);--%>
<%--                                    }--%>
<%--                                %>--%>
<%--                            </div>--%>
<%--                        </div>--%>

<%--                    </div>--%>
<%--                    <div class="col-md-8">--%>
<%--                        <div class="card mb-3">--%>
<%--                            <div class="card-body">--%>
<%--                                <%--%>
<%--                                    try {--%>
<%--                                        Class.forName("com.mysql.cj.jdbc.Driver");--%>
<%--                                        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/event_management", "root", "");--%>
<%--                                        Statement st = conn.createStatement();--%>
<%--                                        ResultSet rs = st.executeQuery("select * from coordinate where id = ?");--%>

<%--                                        while (rs.next())--%>
<%--                                        {--%>
<%--                                            int id = Integer.parseInt(rs.getString("id"));--%>
<%--                                %>--%>
<%--                                <div class="row">--%>
<%--                                    <div class="col-sm-3">--%>
<%--                                        <h6 class="mb-0">Full Name</h6>--%>
<%--                                    </div>--%>
<%--                                    <div class="col-sm-9 text-secondary">--%>
<%--                                        <%= rs.getString("fullname") %>--%>
<%--                                    </div>--%>
<%--                                </div>--%>
<%--                                <hr>--%>
<%--                                <div class="row">--%>
<%--                                    <div class="col-sm-3">--%>
<%--                                        <h6 class="mb-0">Email</h6>--%>
<%--                                    </div>--%>
<%--                                    <div class="col-sm-9 text-secondary">--%>
<%--                                        <%= rs.getString("email") %>--%>
<%--                                    </div>--%>
<%--                                </div>--%>
<%--                                <hr>--%>
<%--                                <div class="row">--%>
<%--                                    <div class="col-sm-3">--%>
<%--                                        <h6 class="mb-0">Phone</h6>--%>
<%--                                    </div>--%>
<%--                                    <div class="col-sm-9 text-secondary">--%>
<%--                                        <%= rs.getString("phone") %>--%>
<%--                                    </div>--%>
<%--                                </div>--%>
<%--                                <hr>--%>
<%--                                <div class="row">--%>
<%--                                    <div class="col-sm-3">--%>
<%--                                        <h6 class="mb-0">Game Coodinate</h6>--%>
<%--                                    </div>--%>
<%--                                    <div class="col-sm-9 text-secondary">--%>
<%--                                        <%= rs.getString("game") %>--%>
<%--                                    </div>--%>
<%--                                </div>--%>
<%--                                <%--%>
<%--                                        }--%>
<%--                                    } catch (SQLException e) {--%>
<%--                                        throw new RuntimeException(e);--%>
<%--                                    } catch (ClassNotFoundException e) {--%>
<%--                                        throw new RuntimeException(e);--%>
<%--                                    }--%>
<%--                                %>--%>
<%--                            </div>--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--_______________________________________________________--%>
                <%
                    String id = request.getParameter("id"); // Retrieve the 'id' parameter from the request
                    if (id == null || id.isEmpty()) {
                        id = "1"; // Default to '1' if 'id' parameter is not provided (you can handle this according to your requirements)
                    }
                %>

                <div class="row gutters-sm">
                    <div class="col-md-4 mb-3">
                        <div class="card">
                            <div class="card-body">
                                <%
                                    try {
                                        Class.forName("com.mysql.cj.jdbc.Driver");
                                        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/event_management", "root", "");
                                        String query = "SELECT * FROM coordinate WHERE id = ?";
                                        PreparedStatement ps = conn.prepareStatement(query);
                                        ps.setInt(1, Integer.parseInt(id)); // Set the 'id' parameter dynamically
                                        ResultSet rs = ps.executeQuery();
                                        if (rs.next()) { // Fetch only one record
                                            byte[] img = rs.getBytes("image");
                                            String base64Imagee = java.util.Base64.getEncoder().encodeToString(img);
                                            String cImage = "data:image/jpeg;base64," + base64Imagee;
                                %>
                                <div class="d-flex flex-column align-items-center text-center">
                                    <img src="<%= cImage %>" alt="Admin" class="rounded-circle" width="150">
                                    <div class="mt-3">
                                        <h4><%= rs.getString("fullname") %></h4>
                                    </div>
                                </div>

                            </div>
                        </div>
                    </div>
                    <div class="col-md-8">
                        <div class="card mb-3">
                            <div class="card-body">
                               
                                <div class="row">
                                    <div class="col-sm-3">
                                        <h6 class="mb-0">Full Name</h6>
                                    </div>
                                    <div class="col-sm-9 text-secondary">
                                        <%= rs.getString("fullname") %>
                                    </div>
                                </div>
                                <hr>
                                <div class="row">
                                    <div class="col-sm-3">
                                        <h6 class="mb-0">Email</h6>
                                    </div>
                                    <div class="col-sm-9 text-secondary">
                                        <%= rs.getString("email") %>
                                    </div>
                                </div>
                                <hr>
                                <div class="row">
                                    <div class="col-sm-3">
                                        <h6 class="mb-0">Phone</h6>
                                    </div>
                                    <div class="col-sm-9 text-secondary">
                                        <%= rs.getString("phone") %>
                                    </div>
                                </div>
                                <hr>
                                <div class="row">
                                    <div class="col-sm-3">
                                        <h6 class="mb-0">Game Coordinate</h6>
                                    </div>
                                    <div class="col-sm-9 text-secondary">
                                        <%= rs.getString("game") %>
                                    </div>
                                </div>
                                <%
                                        }
                                        rs.close();
                                        ps.close();
                                        conn.close();
                                    } catch (SQLException e) {
                                        throw new RuntimeException(e);
                                    } catch (ClassNotFoundException e) {
                                        throw new RuntimeException(e);
                                    }
                                %>
                            </div>
                        </div>
                    </div>
                </div>


            <%---------------------(another Details)-----------------------------------------------------------------------%>
                <div class="row pb-10 mt-4">
                    <div class="col-xl-3 col-lg-3 col-md-6 mb-20">
                        <div class="card-box height-100-p widget-style3">
                            <div class="d-flex flex-wrap">
                                <div class="widget-data">
                                    <div class="weight-700 font-24 text-dark">75</div>
                                    <div class="font-14 text-secondary weight-500">
                                        Appointment
                                    </div>
                                </div>
                                <div class="widget-icon">
                                    <div class="icon" data-color="#00eccf">
                                        <i class="icon-copy dw dw-calendar1"></i>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-3 col-lg-3 col-md-6 mb-20">
                        <div class="card-box height-100-p widget-style3">
                            <div class="d-flex flex-wrap">
                                <div class="widget-data">
                                    <div class="weight-700 font-24 text-dark">124,551</div>
                                    <div class="font-14 text-secondary weight-500">
                                        Total Patient
                                    </div>
                                </div>
                                <div class="widget-icon">
                                    <div class="icon" data-color="#ff5b5b">
                                        <span class="icon-copy ti-book"></span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-3 col-lg-3 col-md-6 mb-20">
                        <div class="card-box height-100-p widget-style3">
                            <div class="d-flex flex-wrap">
                                <div class="widget-data">
                                    <div class="weight-700 font-24 text-dark">400+</div>
                                    <div class="font-14 text-secondary weight-500">
                                        Total Doctor
                                    </div>
                                </div>
                                <div class="widget-icon">
                                    <div class="icon" data-color="#ffff">
                                        <span class="icon-copy ti-book"></span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-3 col-lg-3 col-md-6 mb-20">
                        <div class="card-box height-100-p widget-style3">
                            <div class="d-flex flex-wrap">
                                <div class="widget-data">
                                    <div class="weight-700 font-24 text-dark">$50,000</div>
                                    <div class="font-14 text-secondary weight-500">Earning</div>
                                </div>
                                <div class="widget-icon">
                                    <div class="icon" data-color="#ffff">
                                        <span class="icon-copy ti-book"></span>
                                    </div>
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

