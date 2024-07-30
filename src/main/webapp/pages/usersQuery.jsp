<%@ page import="java.sql.*" %><%--
  Created by IntelliJ IDEA.
  User: HP
  Date: 09-05-2024
  Time: 17:42
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
                            <h4>Chat</h4>
                        </div>
                        <nav aria-label="breadcrumb" role="navigation">
                            <ol class="breadcrumb">
                                <li class="breadcrumb-item">
                                    <a href="./?page=Dashboard">Home</a>
                                </li>
                                <li class="breadcrumb-item active" aria-current="page">
                                    Chat
                                </li>
                            </ol>
                        </nav>
                    </div>
                </div>
            </div>
            <div class="card-box pb-10">
                <div class="h5 pd-20 mb-0">userQuery</div>
                <table class=" table nowrap  data-table-export ">
                    <thead>
                    <tr>
                        <th class="table-plus">Id</th>
                        <th>name</th>
                        <th>Email</th>
                        <th>Subject</th>
                        <th>Message</th>
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
                            ResultSet rs = st.executeQuery("select * from contact");
                            while (rs.next())
                            {
                                int id = rs.getInt("id");
                                String name = rs.getString("name");
                                String gmail = rs.getString("gmail");
                                String subject = rs.getString("subject");
                                String message = rs.getString("message");
                    %>
                    <tr>
                        <td class="table-plus">
                            <div class="name-avatar d-flex align-items-center">
                                <div class="txt">
                                    <div><%= id %></div>
                                </div>
                            </div>
                        </td>
                        <td><%= name %></td>
                        <td><%= gmail %></td>
                        <td><%= subject %></td>
                        <td><%= message %></td>
                        <td>
                            <div class="table-actions">

                                <a href="" class="btn" data-color="#e95959"
                                   data-toggle="modal" data-target="#deleteModal_<%= id %>"
                                ><i class="icon-copy dw dw-delete-3"></i
                                ></a>
                            </div>
                        </td>
                    </tr>
                    <div class="modal fade bs-example-modal-lg" id="deleteModal_<%= id %>">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h4 class="modal-title">Delete Query</h4>
                                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                                </div>
                                <div class="modal-body">
                                    <form action="deleteQueryServlet" method="post" enctype="multipart/form-data">
                                        <p>Are you sure you want to delete this Query?<%= id %></p>
                                        <input type="hidden" name="qid" value="<%= id %>" id="deleteId">
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
            const newUrl = `./?p_name=UserQuery`;
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
                text: "Iteam Not Deleted..."
            });
            urlParams.delete('s');
            const newUrl = `./?p_name=UserQuery`;
            window.history.replaceState({}, document.title, newUrl);

        }

    });
</script>
</body>
</html>

