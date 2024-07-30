<%@ page import="dao.myDataBase" %>
<%@ page import="java.sql.*" %><%--
  Created by IntelliJ IDEA.
  User: HP
  Date: 09-05-2024
  Time: 15:56
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
                            Add Games
                        </button>
                    </div>
                </div>
            </div>
        </div>

        <!-- Export Datatable start -->
        <div class="card-box pb-10">

            <div class="h5 pd-20 mb-0">Recent Patient</div>
            <table class=" table nowrap  data-table-export ">
                <thead>
                <tr>
                    <th>Id</th>
                    <th>Game Name</th>
                    <th>Discription</th>
                    <th>Rules</th>
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
                        ResultSet rs = st.executeQuery("select * from games");
                        while (rs.next())
                        {
                            int id = rs.getInt("id");
                %>
                <tr>
                    <td><%= id %></td>
                    <td><%= rs.getString("game_name") %></td>
                    <td><p><%= rs.getString("game_discribtion") %></p></td>
                    <td><p><%= rs.getString("game_rules") %></p></td>
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
                <h4 class="modal-title" id="myLargsoli
                eModalLabel">
                    Large modal
                </h4>

                <button
                        type="button"
                        class="close"
                        data-dismiss="modal"
                        aria-hidden="true"
                >
                    <%--                    <lord-icon--%>
                    <%--                            src="https://cdn.lordicon.com/jkppkiom.json"--%>
                    <%--                            trigger="hover"--%>
                    <%--                            style="width:30px;height:30px">--%>
                    <%--                    </lord-icon>--%>
                    ×
                </button>
            </div>
            <div class="modal-body">
                <form id="gameForm" class="needs-validation" action="addGameservlet" method="post" enctype="multipart/form-data" novalidate>

                    <div class="mb-3">
                        <label for="exampleInputGamename">Game Name</label>
                        <input type="text" class="form-control" id="exampleInputGamename" name="gamename" required>
                        <div class="invalid-feedback">Please provide a game name.</div>
                    </div>
                    <div class="mb-3">
                        <label for="exampleInputDescribtion">Description</label>
                        <textarea class="form-control" id="exampleInputDescribtion" name="gamedesc" required></textarea>
                        <div class="invalid-feedback">Please provide a description.</div>
                    </div>
                    <div class="mb-3">
                        <label for="exampleInputRules">Rules</label>
                        <input type="text" class="form-control" id="exampleInputRules" name="gamerules" required>
                        <div class="invalid-feedback">Please provide game rules.</div>
                    </div>
                    <div class="mb-3">
                        <label for="exampleInputPrice">Price</label>
                        <input type="text" class="form-control" id="exampleInputPrice" name="price" required>
                        <div class="invalid-feedback">Please provide a price.</div>
                    </div>
                    <div class="mb-3">
                        <label for="exampleInputImage">Image</label>
                        <input type="file" class="form-control" id="exampleInputImage" name="image" required>
                        <div class="invalid-feedback">Please provide a image.</div>
                    </div>
                    <div class="mb-3">
                        <label for="exampleInputImage">Date</label>
                        <input type="date" class="form-control" id="exampleInputDate" name="gdate" required>
                        <div class="invalid-feedback">Please provide a date.</div>
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
        ResultSet rs = st.executeQuery("select * from games");
        while (rs.next()) {
            int id = rs.getInt("id");
%>
<div class="modal fade bs-example-modal-lg" id="editCourse_<%= id %>" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-md modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title" id="myLargeModalLabel">Update Game</h4>
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
            </div>
            <div class="modal-body">
                <form id="gameForm" class="needs-validation" action="updateGameservlet" method="post" enctype="multipart/form-data" novalidate>

                    <div class="mb-3">
                        <label for="exampleInputId">Id</label>
                        <input type="number" class="form-control" id="exampleInputId" name="gId" value="<%= id %>" required readonly>
                        <div class="invalid-feedback">Please provide a game id.</div>
                    </div>
                    <div class="mb-3">
                        <label for="exampleInputGamename">Game Name</label>
                        <input type="text" class="form-control" id="exampleInputGamename" name="gName" value="<%= rs.getString("game_name") %>" required>
                        <div class="invalid-feedback">Please provide a game name.</div>
                    </div>
                    <div class="mb-3">
                        <label for="exampleInputDescribtion">Description</label>
                        <textarea class="form-control" id="exampleInputDescribtion" name="gDesc" required><%= rs.getString("game_discribtion") %></textarea>
                        <div class="invalid-feedback">Please provide a game describtion.</div>
                    </div>
                    <div class="mb-3">
                        <label for="exampleInputRules">Rules</label>
                        <input type="text" class="form-control" id="exampleInputRules" name="gRule" value="<%= rs.getString("game_rules") %>" required>
                        <div class="invalid-feedback">Please provide a game rules.</div>
                    </div>
                    <div class="mb-3">
                        <label for="exampleInputPrice">Price</label>
                        <input type="text" class="form-control" id="exampleInputPrice" name="gPrice" value="<%= rs.getInt("price") %>" required>
                        <div class="invalid-feedback">Please provide a game price.</div>
                    </div>
                    <div class="mb-3">
                        <label for="exampleInputImage">Image</label>
                        <input type="file" class="form-control" id="exampleInputImage" name="gImage" />
                        <div class="invalid-feedback">Please provide a game image.</div>
                    </div>
                    <div class="mb-3">
                        <label for="exampleInputDate">Date</label>
                        <input type="date" class="form-control" id="exampleInputDate" name="gd" />
                        <div class="invalid-feedback">Please provide a game date.</div>
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
<%-----------------------------------------(Delete)-----------------------------%>
<div class="modal fade bs-example-modal-lg" id="deleteModal_<%= id %>">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title">Delete Game</h4>
                <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>
            <div class="modal-body">
                <form action="deleteGameServlet" method="post" enctype="multipart/form-data">
                    <p>Are you sure you want to delete this Game?<%= id %></p>
                    <input type="hidden" name="GameId" value="<%= id %>" id="deleteId">
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
    } catch (SQLException e) {
        throw new RuntimeException(e);
    } catch (ClassNotFoundException e) {
        throw new RuntimeException(e);
    }
%>



<!-- ============(Delete)=========================================== -->

<%--<%--%>
<%--    try {--%>
<%--        Class.forName("com.mysql.cj.jdbc.Driver");--%>
<%--        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/event_management", "root", "");--%>
<%--        Statement st = conn.createStatement();--%>
<%--        ResultSet rs = st.executeQuery("select * from games");--%>
<%--        while (rs.next()) {--%>
<%--            int id = rs.getInt("id");--%>
<%--%>--%>
<%--<div class="modal fade bs-example-modal-lg" id="deleteModal_<%= id %>" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">--%>
<%--    <div class="modal-dialog">--%>
<%--        <div class="modal-content">--%>
<%--            <div class="modal-header">--%>
<%--                <h4 class="modal-title">Delete Student</h4>--%>
<%--                <button type="button" class="close" data-dismiss="modal">&times;</button>--%>
<%--            </div>--%>
<%--            <div class="modal-body">--%>
<%--                <form action="deleteGameServlet" method="post" enctype="multipart/form-data">--%>
<%--                    <p>Are you sure you want to delete this student?</p>--%>
<%--                    <input type="hidden" name="GameId" value="<%= id %>" id="deleteId">--%>
<%--                    <button type="submit" class="btn btn-danger">Delete</button>--%>
<%--                    <button--%>
<%--                            type="button"--%>
<%--                            class="btn btn-light w-25"--%>
<%--                            data-dismiss="modal"--%>
<%--                    >--%>
<%--                        Close--%>
<%--                    </button>--%>
<%--                </form>--%>
<%--            </div>--%>
<%--            <%--%>

<%--                    }--%>
<%--                } catch (SQLException e) {--%>
<%--                    throw new RuntimeException(e);--%>
<%--                } catch (ClassNotFoundException e) {--%>
<%--                    throw new RuntimeException(e);--%>
<%--                }--%>
<%--            %>--%>
<%--        </div>--%>
<%--    </div>--%>
<%--</div>--%>
<script>

    document.addEventListener('DOMContentLoaded', function () {

        const urlParams = new URLSearchParams(window.location.search);
        const successParam = urlParams.get('a');

        if (successParam && successParam === 'b') {
            // Display success toast
            Swal.fire({
                icon: "success",
                title: "Deleted",
                text: "Iteam Deleted Successfully..."
            });
            urlParams.delete('a');
            const newUrl = `./?p_name=AddGame`;
            window.history.replaceState({}, document.title, newUrl);

        }

    });
    document.addEventListener('DOMContentLoaded', function () {

        const urlParams = new URLSearchParams(window.location.search);
        const successParam = urlParams.get('a');

        if (successParam && successParam === 'nu') {
            // Display success toast
            Swal.fire({
                icon: "error",
                title: "Deleted",
                text: "Iteam Not Deleted..."
            });
            urlParams.delete('a');
            const newUrl = `./?p_name=AddGame`;
            window.history.replaceState({}, document.title, newUrl);

        }

    });

    document.addEventListener('DOMContentLoaded', function () {
        const urlParams = new URLSearchParams(window.location.search);
        const successParam = urlParams.get('x');

        if (successParam && successParam === 'y') {
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

            urlParams.delete('x');
            const newUrl = `./?p_name=AddGame`;
            window.history.replaceState({}, document.title, newUrl);
        }
    });
    document.addEventListener('DOMContentLoaded', function () {
        const urlParams = new URLSearchParams(window.location.search);
        const successParam = urlParams.get('x');

        if (successParam && successParam === 'nu') {
            // Display success toast with auto-close and timer
            let timerInterval;
            Swal.fire({
                icon: "success",
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

            urlParams.delete('x');
            const newUrl = `./?p_name=AddGame`;
            window.history.replaceState({}, document.title, newUrl);
        }
    });

    document.addEventListener('DOMContentLoaded', function () {
        const urlParams = new URLSearchParams(window.location.search);
        const successParam = urlParams.get('s');

        if (successParam && successParam === 't') {
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

            urlParams.delete('s');
            const newUrl = `./?p_name=AddGame`;
            window.history.replaceState({}, document.title, newUrl);
        }
    });

    document.addEventListener('DOMContentLoaded', function () {
        const urlParams = new URLSearchParams(window.location.search);
        const successParam = urlParams.get('s');

        if (successParam && successParam === 'nu') {
            // Display success toast with auto-close and timer
            let timerInterval;
            Swal.fire({
                icon: "error",
                title: "Updated",
                html: "Item Not Updated Successfully... I will close in <b></b> milliseconds.",
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

            urlParams.delete('s');
            const newUrl = `./?p_name=AddGame`;
            window.history.replaceState({}, document.title, newUrl);
        }
    });

</script>
</body>
</html>

