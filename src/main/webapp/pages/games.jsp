<%@ page import="java.sql.*" %><%--
  Created by IntelliJ IDEA.
  User: HP
  Date: 09-05-2024
  Time: 17:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <style>
        /*.ag-format-container {*/
        /*    width: 1142px;*/
        /*    margin: 0 auto;*/
        /*}*/

        /*.ag-courses_box {*/
        /*    width: 1200px;*/
        /*    display: -webkit-box;*/
        /*    display: -ms-flexbox;*/
        /*    display: flex;*/
        /*    -webkit-box-align: start;*/
        /*    -ms-flex-align: start;*/
        /*    align-items: flex-start;*/
        /*    -ms-flex-wrap: wrap;*/
        /*    flex-wrap: wrap;*/

        /*    padding: 50px 0;*/
        /*}*/
        /*.ag-courses_item {*/
        /*    -ms-flex-preferred-size: calc(33.33333% - 30px);*/
        /*    flex-basis: calc(33.33333% - 30px);*/

        /*    margin: 0 15px 30px;*/

        /*    overflow: hidden;*/

        /*    border-radius: 28px;*/
        /*}*/
        /*.ag-courses-item_link {*/
        /*    display: block;*/
        /*    padding: 30px 20px;*/
        /*    background-color: #121212;*/

        /*    overflow: hidden;*/

        /*    position: relative;*/
        /*}*/
        /*.ag-courses-item_link:hover,*/
        /*.ag-courses-item_link:hover .ag-courses-item_date {*/
        /*    text-decoration: none;*/
        /*    color: #fff;*/
        /*}*/
        /*.ag-courses-item_link:hover .ag-courses-item_bg {*/
        /*    -webkit-transform: scale(10);*/
        /*    -ms-transform: scale(10);*/
        /*    transform: scale(10);*/
        /*}*/
        /*.ag-courses-item_title {*/
        /*    min-height: 55px;*/
        /*    margin: 0px;*/

        /*    overflow: hidden;*/

        /*    font-weight: bold;*/
        /*    font-size: 24px;*/
        /*    color: #fff;*/

        /*    z-index: 2;*/
        /*    position: relative;*/
        /*}*/
        /*.ag-courses-item_date-box {*/
        /*    font-size: 18px;*/
        /*    color: #fff;*/

        /*    z-index: 2;*/
        /*    position: relative;*/
        /*}*/
        /*.ag-courses-item_date {*/
        /*    font-weight: bold;*/
        /*    color: #f9b234;*/

        /*    -webkit-transition: color 0.5s ease;*/
        /*    -o-transition: color 0.5s ease;*/
        /*    transition: color 0.5s ease;*/
        /*}*/
        /*.ag-courses-item_bg {*/
        /*    height: 128px;*/
        /*    width: 128px;*/
        /*    background-color: #f9b234;*/

        /*    z-index: 1;*/
        /*    position: absolute;*/
        /*    top: -75px;*/
        /*    right: -75px;*/

        /*    border-radius: 50%;*/

        /*    -webkit-transition: all 0.5s ease;*/
        /*    -o-transition: all 0.5s ease;*/
        /*    transition: all 0.5s ease;*/
        /*}*/
        /*.ag-courses_item:nth-child(2n) .ag-courses-item_bg {*/
        /*    background-color: #3ecd5e;*/
        /*}*/
        /*.ag-courses_item:nth-child(3n) .ag-courses-item_bg {*/
        /*    background-color: #04ebad;*/
        /*}*/
        /*.ag-courses_item:nth-child(4n) .ag-courses-item_bg {*/
        /*    background-color: #952aff;*/
        /*}*/
        /*.ag-courses_item:nth-child(5n) .ag-courses-item_bg {*/
        /*    background-color: #cd3e94;*/
        /*}*/
        /*.ag-courses_item:nth-child(6n) .ag-courses-item_bg {*/
        /*    background-color: #4c49ea;*/
        /*}*/

        /*@media only screen and (max-width: 979px) {*/
        /*    .ag-courses_item {*/
        /*        -ms-flex-preferred-size: calc(50% - 30px);*/
        /*        flex-basis: calc(50% - 30px);*/
        /*    }*/
        /*    .ag-courses-item_title {*/
        /*        font-size: 24px;*/
        /*    }*/
        /*}*/

        /*@media only screen and (max-width: 767px) {*/
        /*    .ag-format-container {*/
        /*        width: 96%;*/
        /*    }*/
        /*}*/
        /*@media only screen and (max-width: 639px) {*/
        /*    .ag-courses_item {*/
        /*        -ms-flex-preferred-size: 100%;*/
        /*        flex-basis: 100%;*/
        /*    }*/
        /*    .ag-courses-item_title {*/
        /*        min-height: 72px;*/
        /*        line-height: 1;*/

        /*        font-size: 20px;*/
        /*    }*/
        /*    .ag-courses-item_link {*/
        /*        padding: 22px 40px;*/
        /*    }*/
        /*    .ag-courses-item_date-box {*/
        /*        font-size: 16px;*/
        /*    }*/
        /*}*/

        /*.course-img-cover {*/
        /*    height: 200px; !* Set the desired height *!*/
        /*    width: 100%;*/
        /*    display: flex;*/
        /*    justify-content: center;*/
        /*    align-items: center;*/
        /*    position: relative;*/
        /*    overflow: hidden; !* Ensure the image doesn't overflow *!*/
        /*}*/

        /*.course-img {*/
        /*    width: 100%; !* Ensure the image fills the entire width of the container *!*/
        /*    height: 100%; !* Ensure the image fills the entire height of the container *!*/
        /*    object-fit: cover; !* Scale the image while preserving its aspect ratio *!*/
        /*}*/

        /*.fac-img-cover {*/
        /*    position: absolute;*/
        /*    height: 70px;*/
        /*    width: 70px;*/
        /*    bottom: 10px;*/
        /*    right: 10px;*/
        /*    !* border: transparent; *!*/
        /*    border-radius: 50%;*/
        /*    overflow: hidden;*/
        /*}*/

        /*.fac-img {*/
        /*    width: 100%;*/
        /*    height: 100%;*/
        /*    object-fit: cover;*/
        /*}*/

        /*.ag-courses-item_date-box:last-child {*/
        /*    margin-top: 10px;*/
        /*}*/
        .card-img-top {
            border-radius: 50px;
            padding: 20px;
        }
        .card {
            border-radius: 30px;
            box-shadow: rgba(0, 0, 0, 0.1) 0px 1px 2px 0px;
        }
        .card-body {
            padding: 25px;
            margin-top: -15px;
        }
        .btn-primary {
            border-radius: 50px;
            width: 120px;
        }
        .btn-primary:hover {
            background-color: black;
            border: none;
        }
        h3,
        h5 {
            color: rgb(0, 91, 228);
        }
        .card-img-top {
            height: 350px; /* Adjust the height as needed */
            object-fit: cover; /* Ensure the image covers the area */
        }
        .card-title{
            text-align: center;
        }
    </style>
</head>
<body>
    <div class="pd-ltr-20 xs-pd-20-10">
        <div class="min-height-200px">
            <div class="page-header">
                <div class="row">
                    <div class="col-md-12 col-sm-12">
                        <div class="title">
                            <h4>Product</h4>
                        </div>
                        <nav aria-label="breadcrumb" role="navigation">
                            <ol class="breadcrumb">
                                <li class="breadcrumb-item">
                                    <a href="./?page=Dashboard">Home</a>
                                </li>
                                <li class="breadcrumb-item active" aria-current="page">
                                    Product
                                </li>
                            </ol>
                        </nav>
                    </div>
                </div>
            </div>

                <div class="container">
                    <div class="row  card-details">
                        <%
                            try {
                                Class.forName("com.mysql.cj.jdbc.Driver");
                                Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/event_management", "root", "");
                                Statement st = conn.createStatement();
                                ResultSet rs = st.executeQuery("select * from games");
                                while (rs.next())
                                {
                                    int id = rs.getInt("id");
                                    byte[] img = rs.getBytes("image");
                                    String base64Imagee = java.util.Base64.getEncoder().encodeToString(img);
                                    String gImage = "data:image/jpeg;base64," + base64Imagee;
                        %>
                        <div class="col-4">
                            <a href="./?page=GameDetails&id=<%= id %>" class="col-12 col-sm-6 col-md-4">

                                <div class=" g-4 py-2">
                                    <div class="card">
                                        <img src="<%= gImage %>" class="card-img-top" alt="..." />
                                        <div class="card-body">
                                            <h5 class="card-title"><%= rs.getString("game_name") %></h5>
                                        </div>
                                    </div>
                                </div>
                            </a>
                        </div>

                        <%
                                }
                            } catch (Exception e) {
                                e.printStackTrace();
                            }
                        %>
                    </div>
                </div>
        </div>
    </div>

</body>
</html>

