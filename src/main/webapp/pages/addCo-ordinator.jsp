<%@ page import="java.sql.*" %><%--
  Created by IntelliJ IDEA.
  User: HP
  Date: 09-05-2024
  Time: 17:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
</head>
<body>

    <div class="pd-ltr-20 xs-pd-20-10">
        <div class="min-height-200px">
            <div class="page-header">
                <div class="row">
                    <div class="col-md-6 col-sm-12">
                        <div class="title">
                            <h4>DataTable</h4>
                        </div>
                        <nav aria-label="breadcrumb" role="navigation">
                            <ol class="breadcrumb">
                                <li class="breadcrumb-item">
                                    <a href="./?page=Dashboard">Home</a>
                                </li>
                                <li class="breadcrumb-item active" aria-current="page">
                                    DataTable
                                </li>
                            </ol>
                        </nav>
                    </div>
                    <div class="col-md-6 col-sm-12 text-right">
                        <div>
                            <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#addCourse">
                                Add Coordinator
                            </button>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Export Datatable start -->
            <div class="card-box pb-10">
                <div class="h5 pd-20 mb-0">Co-ordinators</div>
                <table class=" table nowrap  data-table-export ">
                    <thead>
                    <tr>
                        <th>Id</th>
                        <th>Name</th>
                        <th>Email</th>
                        <th>Phone</th>
                        <th>Game Name</th>
                        <th class="datatable-nosort">Actions</th>
                    </tr>
                    </thead>
                    <tbody>
                    <%
                        try {
                            Class.forName("com.mysql.cj.jdbc.Driver");
                            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/event_management", "root", "");
                            Statement st = conn.createStatement();
                            ResultSet rs = st.executeQuery("select * from coordinate");
                            while (rs.next())
                            {
                            int id = rs.getInt("id");
                    %>
                    <tr>
                        <td><%= id %></td>
                        <td><%= rs.getString("fullname") %></td>
                        <td><%= rs.getString("email") %></td>
                        <td><%= rs.getString("phone") %></td>
                        <td><%= rs.getString("game") %></td>
                        <td>
                            <div class="table-actions">
                                <a href="" class="btn" data-color="#265ed7"
                                   data-toggle="modal" data-target="#editCourse_<%= id %>"
                                ><i class="icon-copy dw dw-edit2"></i
                                ></a>
                                <a href="" class="btn" data-color="#e95959"
                                   data-toggle="modal" data-target="#deleteModal_<%= id %>"
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
            <!-- Export Datatable End -->
        </div>

    </div>

<!-- Add modal start -->
<div
        class="modal fade bs-example-modal-lg"
        id="addCourse"
        tabindex="-1"
        role="dialog"
        aria-labelledby="myLargeModalLabel"
        aria-hidden="true"
>
    <div class="modal-dialog modal-md modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title" id="myLargeModalLabel">
                    Add Coordinator Form
                </h4>
                <button
                        type="button"
                        class="close"
                        data-dismiss="modal"
                        aria-hidden="true"
                >
                    ×
                </button>
            </div>
            <div class="modal-body">
                <form id="gameForm" class="needs-validation" action="addCoordinateServlet" method="post" enctype="multipart/form-data" novalidate>
                    <div class="mb-3">
                        <label for="exampleInputName">FullName</label>
                        <input type="text" class="form-control" id="exampleInputName" name="cName" required>
                        <div class="invalid-feedback">Please provide a FullName .</div>
                    </div>
                    <div class="mb-3">
                        <label for="exampleInputEmail">Email address</label>
                        <input type="email" class="form-control" id="exampleInputEmail" name="cEmail" required>
                        <div class="invalid-feedback">Please provide a valid Email .</div>
                    </div>

                    <div class="mb-3">
                        <label for="exampleInputPhone">Phone</label>
                        <input type="tel" class="form-control" id="exampleInputPhone" name="cPhone" required>
                        <div class="invalid-feedback">Please provide Phone.</div>
                    </div>

                    <div class="mb-3">
                        <label for="exampleInputGamename">Game</label>
<%--                        <input type="password" class="form-control" id="exampleInputGamename" required>--%>
                        <select class="form-control" id="exampleInputGamename" name="cGame" required>
                            <option value="">--Select--</option>
                            <%
                                try {
                                    Class.forName("com.mysql.cj.jdbc.Driver");
                                    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/event_management", "root", "");
                                    PreparedStatement ps = conn.prepareStatement("SELECT * FROM games");
                                    ResultSet rs = ps.executeQuery();
                                    while (rs.next())
                                    {
                                        String gName = rs.getString("game_name");

                            %>
                            <option value="<%= gName %>"><%= gName %></option>
                            <% }
                            }
                            catch (Exception ex)
                            {
                                ex.printStackTrace();
                            }%>
                        </select>
                        <div class="invalid-feedback">Please provide a gamename</div>
                    </div>
                    <div class="mb-3">
                        <label for="exampleInputImage">Image</label>
                        <input type="file" class="form-control" id="exampleInputImage" name="cImage" required>
                        <div class="invalid-feedback">Please provide a image.</div>
                    </div>
                    <div class="d-flex" style="gap: 20px;">
                        <button type="submit" class="btn btn-primary w-75">Submit</button>
                        <button type="button" class="btn btn-danger w-25" data-dismiss="modal">Close</button>
                    </div>
                </form>
            </div>

        </div>
    </div>
</div>
<!-- ============(Edit)=========================================== -->
    <%
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/event_management", "root", "");
            Statement st = conn.createStatement();
            ResultSet rs = st.executeQuery("select * from coordinate");
            while (rs.next()) {
                int id = rs.getInt("id");
    %>

    <div class="modal fade bs-example-modal-lg" id="editCourse_<%= id %>" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-md modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title" id="myLargeModalLabel">Edit Coordinate</h4>
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                </div>
                <div class="modal-body">
                    <form id="gameForm" class="needs-validation" action="updateCoordinateServlet" method="post" enctype="multipart/form-data" novalidate>
                        <div class="mb-3">
                            <label for="exampleInputId">Id</label>
                            <input type="number" class="form-control" id="exampleInputId" name="cuId" value="<%= id %>" required readonly>
                            <div class="invalid-feedback">Please provide an ID.</div>
                        </div>
                        <div class="mb-3">
                            <label for="exampleInputFullName">Full Name</label>
                            <input type="text" class="form-control" id="exampleInputFullName" name="cuName" value="<%= rs.getString("fullname") %>" required>
                            <div class="invalid-feedback">Please provide a full name.</div>
                        </div>
                        <div class="mb-3">
                            <label for="exampleInputEmail">Email Address</label>
                            <input type="email" class="form-control" id="exampleInputEmail" name="cuEmail" value="<%= rs.getString("email") %>" required>
                            <div class="invalid-feedback">Please provide a valid email address.</div>
                        </div>
                        <div class="mb-3">
                            <label for="exampleInputPhone">Phone</label>
                            <input type="text" class="form-control" id="exampleInputPhone" name="cuPhone" value="<%= rs.getString("phone") %>" required>
                            <div class="invalid-feedback">Please provide a phone number.</div>
                        </div>
                        <div class="mb-3">
                            <label for="exampleInputGame">Game</label>
                            <select class="form-control" id="exampleInputGame" name="cuGame" required>
                                <option value="">--Select--</option>
                                <%-- Retrieve games from the database and populate the dropdown --%>
                                <%
                                    try {
                                        Connection gameConn = DriverManager.getConnection("jdbc:mysql://localhost:3306/event_management", "root", "");
                                        Statement gameSt = gameConn.createStatement();
                                        ResultSet gameRs = gameSt.executeQuery("SELECT * FROM games");
                                        while (gameRs.next()) {
                                            String gameName = gameRs.getString("game_name");
                                %>
                                <option value="<%= gameName %>"><%= gameName %></option>
                                <%
                                        }
                                        gameConn.close();
                                    } catch (SQLException ex) {
                                        ex.printStackTrace();
                                    }
                                %>
                            </select>
                            <div class="invalid-feedback">Please select a game.</div>
                        </div>
                        <div class="mb-3">
                            <label for="exampleInputImage">Image</label>
                            <input type="file" class="form-control" id="exampleInputImage" name="cuImage" required>
                            <div class="invalid-feedback">Please provide an image.</div>
                        </div>
                        <div class="d-flex" style="gap: 20px;">
                            <button type="submit" class="btn btn-primary w-75">Submit</button>
                            <button type="button" class="btn btn-danger w-25" data-dismiss="modal">Close</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>

<%--    ---------------------Delete Model-------------------------------%>

    <div class="modal fade bs-example-modal-lg" id="deleteModal_<%= id %>" >
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title">Delete Coordinater</h4>
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                </div>
                <div class="modal-body">
                    <form action="deleteCoordinateServlet" method="post" enctype="multipart/form-data">
                        <p>Are you sure you want to delete this Co-ordinater?<%= id%></p>
                        <input type="hidden" name="cuId" value="<%= id %>" id="deleteId">
                        <button type="submit" class="btn btn-danger">Delete</button>
                        <button
                                type="button"
                                class="btn btn-light w-25"
                                data-dismiss="modal"
                        >
                            Close
                        </button>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <%
            }
            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    %>



<!-- ============(Delete)=========================================== -->

<%--<%--%>
<%--    try {--%>
<%--        Class.forName("com.mysql.cj.jdbc.Driver");--%>
<%--        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/event_management", "root", "");--%>
<%--        Statement st = conn.createStatement();--%>
<%--        ResultSet rs = st.executeQuery("select * from coordinate");--%>
<%--        while (rs.next()) {--%>
<%--            int id = rs.getInt("id");--%>
<%--%>--%> 
<%--    <div class="modal fade bs-example-modal-lg" id="deleteModal_<%= id %>" >--%>
<%--        <div class="modal-dialog">--%>
<%--            <div class="modal-content">--%>
<%--                <div class="modal-header">--%>
<%--                    <h4 class="modal-title">Delete Student</h4>--%>
<%--                    <button type="button" class="close" data-dismiss="modal">&times;</button>--%>
<%--                </div>--%>
<%--                <div class="modal-body">--%>
<%--                    <form action="deleteCoordinateServlet" method="post" enctype="multipart/form-data">--%>
<%--                        <p>Are you sure you want to delete this student?</p>--%>
<%--                        <input type="hidden" name="cuId" value="<%= id %>" id="deleteId">--%>
<%--                        <button type="submit" class="btn btn-danger">Delete</button>--%>
<%--                        <button--%>
<%--                                type="button"--%>
<%--                                class="btn btn-light w-25"--%>
<%--                                data-dismiss="modal"--%>
<%--                        >--%>
<%--                            Close--%>
<%--                        </button>--%>
<%--                    </form>--%>
<%--                </div>--%>
<%--                <%--%>

<%--                        }--%>
<%--                    } catch (Exception e) {--%>
<%--                        e.printStackTrace();--%>
<%--                    }--%>
<%--                %>--%>
<%--            </div>--%>
<%--        </div>--%>
<%--    </div>--%>
<script>

    document.addEventListener('DOMContentLoaded', function () {

        const urlParams = new URLSearchParams(window.location.search);
        const successParam = urlParams.get('s');

        if (successParam && successParam === 'i') {
            // Display success toast
            Swal.fire({
                icon: "success",
                title: "Deleted",
                text: "Iteam Deleted Successfully..."
            });
            urlParams.delete('s');
            const newUrl = `./?p_name=AddCoordinator`;
            window.history.replaceState({}, document.title, newUrl);

        }

    });

    document.addEventListener('DOMContentLoaded', function () {

        const urlParams = new URLSearchParams(window.location.search);
        const successParam = urlParams.get('s');

        if (successParam && successParam === 'nu') {
            // Display success toast
            Swal.fire({
                icon: "error",
                title: "Deleted",
                text: "Iteam Not Delete..."
            });
            urlParams.delete('s');
            const newUrl = `./?p_name=AddCoordinator`;
            window.history.replaceState({}, document.title, newUrl);

        }

    });


    document.addEventListener('DOMContentLoaded', function () {
        const urlParams = new URLSearchParams(window.location.search);
        const successParam = urlParams.get('p');

        if (successParam && successParam === 'q') {
            // Display success toast with auto-close and timer
            let timerInterval;
            Swal.fire({
                icon: "success",
                title: "Inserted",
                html: "Item Inserted Successfully... I will close in <b></b> milliseconds.",
                timer: 2000,
                timerProgressBar: true,
                didOpen: () => {
                    Swal.showLoading();
                    const timer = Swal.getHtmlContainer().querySelector('b');
                    timerInterval = setInterval(() => {
                        timer.textContent = `${Swal.getTimerLeft()}`;
                    }, 100);
                },
                willClose: () => {
                    clearInterval(timerInterval);
                }
            }).then((result) => {
                if (result.dismiss === Swal.DismissReason.timer) {
                    console.log("I was closed by the timer");
                }
            });

            urlParams.delete('p');
            const newUrl = `./?p_name=AddGame`;
            window.history.replaceState({}, document.title, newUrl);
        }
    });
    document.addEventListener('DOMContentLoaded', function () {
        const urlParams = new URLSearchParams(window.location.search);
        const successParam = urlParams.get('p');

        if (successParam && successParam === 'nu') {
            // Display success toast with auto-close and timer
            let timerInterval;
            Swal.fire({
                icon: "error",
                title: "Inserted",
                html: "Item Not Inserted... I will close in <b></b> milliseconds.",
                timer: 2000,
                timerProgressBar: true,
                didOpen: () => {
                    Swal.showLoading();
                    const timer = Swal.getHtmlContainer().querySelector('b');
                    timerInterval = setInterval(() => {
                        timer.textContent = `${Swal.getTimerLeft()}`;
                    }, 100);
                },
                willClose: () => {
                    clearInterval(timerInterval);
                }
            }).then((result) => {
                if (result.dismiss === Swal.DismissReason.timer) {
                    console.log("I was closed by the timer");
                }
            });

            urlParams.delete('p');
            const newUrl = `./?p_name=AddGame`;
            window.history.replaceState({}, document.title, newUrl);
        }
    });

    document.addEventListener('DOMContentLoaded', function () {
        const urlParams = new URLSearchParams(window.location.search);
        const successParam = urlParams.get('m');

        if (successParam && successParam === 'n') {
            // Display success toast with auto-close and timer
            let timerInterval;
            Swal.fire({
                icon: "success",
                title: "Updated",
                html: "Item Updated Successfully... I will close in <b></b> milliseconds.",
                timer: 2000,
                timerProgressBar: true,
                didOpen: () => {
                    Swal.showLoading();
                    const timer = Swal.getHtmlContainer().querySelector('b');
                    timerInterval = setInterval(() => {
                        timer.textContent = `${Swal.getTimerLeft()}`;
                    }, 100);
                },
                willClose: () => {
                    clearInterval(timerInterval);
                }
            }).then((result) => {
                if (result.dismiss === Swal.DismissReason.timer) {
                    console.log("I was closed by the timer");
                }
            });

            urlParams.delete('m');
            const newUrl = `./?p_name=AddCoordinator`;
            window.history.replaceState({}, document.title, newUrl);
        }
    });
    document.addEventListener('DOMContentLoaded', function () {
        const urlParams = new URLSearchParams(window.location.search);
        const successParam = urlParams.get('m');

        if (successParam && successParam === 'nu') {
            // Display success toast with auto-close and timer
            let timerInterval;
            Swal.fire({
                icon: "error",
                title: "Updated",
                html: "Item Not Updated... I will close in <b></b> milliseconds.",
                timer: 2000,
                timerProgressBar: true,
                didOpen: () => {
                    Swal.showLoading();
                    const timer = Swal.getHtmlContainer().querySelector('b');
                    timerInterval = setInterval(() => {
                        timer.textContent = `${Swal.getTimerLeft()}`;
                    }, 100);
                },
                willClose: () => {
                    clearInterval(timerInterval);
                }
            }).then((result) => {
                if (result.dismiss === Swal.DismissReason.timer) {
                    console.log("I was closed by the timer");
                }
            });

            urlParams.delete('m');
            const newUrl = `./?p_name=AddCoordinator`;
            window.history.replaceState({}, document.title, newUrl);
        }
    });


</script>
</body>
</html>

