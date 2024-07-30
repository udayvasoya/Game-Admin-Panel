<%@ page import="java.sql.*" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <!-- Basic Page Info -->
    <meta charset="utf-8" />
    <title>Games Event Management</title>

    <!-- Site favicon -->
    <link
            rel="apple-touch-icon"
            sizes="180x180"
            href="vendors/images/apple-touch-icon.png"
    />
    <link
            rel="icon"
            type="image/png"
            sizes="32x32"
            href="vendors/images/favicon-32x32.png"
    />
    <link
            rel="icon"
            type="image/png"
            sizes="16x16"
            href="vendors/images/favicon-16x16.png"
    />

    <!-- Mobile Specific Metas -->
    <meta
            name="viewport"
            content="width=device-width, initial-scale=1, maximum-scale=1"
    />

    <!-- Google Font -->
    <link
            href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700;800&display=swap"
            rel="stylesheet"
    />
    <!-- CSS -->
    <link rel="stylesheet" type="text/css" href="vendors/styles/core.css" />
    <link
            rel="stylesheet"
            type="text/css"
            href="vendors/styles/icon-font.min.css"
    />
    <link
            rel="stylesheet"
            type="text/css"
            href="src/plugins/datatables/css/dataTables.bootstrap4.min.css"
    />
    <link
            rel="stylesheet"
            type="text/css"
            href="src/plugins/datatables/css/responsive.bootstrap4.min.css"
    />
    <link rel="stylesheet" type="text/css" href="vendors/styles/style.css" />

    <!-- Global site tag (gtag.js) - Google Analytics -->
    <script
            async
            src="https://www.googletagmanager.com/gtag/js?id=G-GBZ3SGGX85"
    ></script>
    <script
            async
            src="https://pagead2.googlesyndication.com/pagead/js/adsbygoogle.js?client=ca-pub-2973766580778258"
            crossorigin="anonymous"
    ></script>
    <script>
        window.dataLayer = window.dataLayer || [];
        function gtag() {
            dataLayer.push(arguments);
        }
        gtag("js", new Date());

        gtag("config", "G-GBZ3SGGX85");
    </script>
    <!-- Google Tag Manager -->
    <script>
        (function (w, d, s, l, i) {
            w[l] = w[l] || [];
            w[l].push({ "gtm.start": new Date().getTime(), event: "gtm.js" });
            var f = d.getElementsByTagName(s)[0],
                j = d.createElement(s),
                dl = l != "dataLayer" ? "&l=" + l : "";
            j.async = true;
            j.src = "https://www.googletagmanager.com/gtm.js?id=" + i + dl;
            f.parentNode.insertBefore(j, f);
        })(window, document, "script", "dataLayer", "GTM-NXZMQSS");
    </script>
    <!-- End Google Tag Manager -->
</head>
<body>

    <div class="xs-pd-20-10 pd-ltr-20">
        <div class="title pb-20">
            <h2 class="h3 mb-0">Event Overview</h2>
        </div>

        <div class="row pb-10">
            <div class="col-xl-3 col-lg-3 col-md-6 mb-20">
                <div class="card-box height-100-p widget-style3">
                    <div class="d-flex flex-wrap">
                        <div class="widget-data">
                            <div class="weight-700 font-24 text-dark">10</div>
                            <div class="font-14 text-secondary weight-500">Users</div>
                        </div>
                        <div class="widget-icon">
                            <div class="icon" data-color="#00eccf">
                                <i class="fa fa-users" aria-hidden="true"></i>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-xl-3 col-lg-3 col-md-6 mb-20">
                <div class="card-box height-100-p widget-style3">
                    <div class="d-flex flex-wrap">
                        <div class="widget-data">
                            <%
                                try {
                                    Class.forName("com.mysql.cj.jdbc.Driver");
                                    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/event_management", "root", "");
                                    Statement st = conn.createStatement();
                                    ResultSet rs = st.executeQuery("SELECT COUNT(DISTINCT id) AS coordinator_count FROM coordinate");
                                    while (rs.next())
                                    {
                                        int cc = rs.getInt("coordinator_count");
                            %>
                            <div class="weight-700 font-24 text-dark"><%= cc %></div>
                            <%
                                    }
                                } catch (Exception e) {
                                    e.printStackTrace();
                                }
                            %>
                            <div class="font-14 text-secondary weight-500">
                                Co-ordinator
                            </div>
                        </div>
                        <div class="widget-icon">
                            <div class="icon" data-color="#ff5b5b">
                                <i class="fa fa-user-circle-o" aria-hidden="true"></i>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-xl-3 col-lg-3 col-md-6 mb-20">
                <div class="card-box height-100-p widget-style3">
                    <div class="d-flex flex-wrap">
                        <div class="widget-data">
                            <div class="weight-700 font-24 text-dark">10+</div>
                            <div class="font-14 text-secondary weight-500">
                                Total Games
                            </div>
                        </div>
                        <div class="widget-icon">
                            <div class="icon">
                                <i class="fa fa-gamepad" aria-hidden="true"></i>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="col-xl-3 col-lg-3 col-md-6 mb-20">
                <div class="card-box height-100-p widget-style3">
                    <div class="d-flex flex-wrap">
                        <div class="widget-data">
                            <div class="weight-700 font-24 text-dark">15+</div>
                            <div class="font-14 text-secondary weight-500">
                                Winners
                            </div>
                        </div>
                        <div class="widget-icon">
                            <div class="icon">
                                <i class="fa fa-trophy" aria-hidden="true"></i>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="row">
            <div class="col-lg-5 col-md-12 mb-20">
                <div class="card-box height-100-p pd-20 min-height-200px">
                    <div class="d-flex justify-content-between pb-10">
                        <div class="h5 mb-0">Event Co-ordinator</div>
                        <div class="dropdown">
                            <a
                                    class="btn btn-link font-24 p-0 line-height-1 no-arrow dropdown-toggle"
                                    data-color="#1b3133"
                                    href="#"
                                    role="button"
                                    data-toggle="dropdown"
                            >
                                <i class="dw dw-more"></i>
                            </a>
                            <div
                                    class="dropdown-menu dropdown-menu-right dropdown-menu-icon-list"
                            >
                                <a class="dropdown-item" href="#"
                                ><i class="dw dw-eye"></i> View</a
                                >
                                <a class="dropdown-item" href="#"
                                ><i class="dw dw-edit2"></i> Edit</a
                                >
                                <a class="dropdown-item" href="#"
                                ><i class="dw dw-delete-3"></i> Delete</a
                                >
                            </div>
                        </div>
                    </div>
                    <div class="user-list">
                        <ul>
                            <%
                                try {
                                    Class.forName("com.mysql.cj.jdbc.Driver");
                                    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/event_management", "root", "");
                                    Statement st = conn.createStatement();
                                    ResultSet rs = st.executeQuery("select * from coordinate");
                                    while (rs.next())
                                    {
                                        byte[] img = rs.getBytes("image");
                                        String base64Imagee = java.util.Base64.getEncoder().encodeToString(img);
                                        String cImage = "data:image/jpeg;base64," + base64Imagee;
                            %>
                            <li class="d-flex align-items-center justify-content-between">
                                <div class="name-avatar d-flex align-items-center pr-2">
                                    <div class="avatar mr-2 flex-shrink-0 " style="height: 10vh !important;">
                                        <img src="<%= cImage %>" class="border-radius-100 object-fit-cover  box-shadow" width="50" alt="" style="height: 10vh !important;  object-fit: cover" />
                                    </div>
                                    <div class="txt">
							  <span
                                      class="badge badge-pill badge-sm"
                                      data-bgcolor="#e7ebf5"
                                      data-color="#265ed7"
                              >4.9</span
                              >
                                        <div class="font-14 weight-600"><%= rs.getString("fullname") %></div>
                                        <div class="font-12 weight-500" data-color="#b2b1b6">
                                            Co-ordinator
                                        </div>
                                    </div>
                                </div>
                                <div class="cta flex-shrink-0">
                                    <a href="./?page=CoordinateDetails&id=<%= rs.getInt("id") %>" class="btn btn-sm btn-outline-primary"
                                    >Details</a>
                                </div>
                            </li>
                            <%
                                    }
                                    rs.close();
                                    st.close();
                                    conn.close();
                                } catch (SQLException e) {
                                    throw new RuntimeException(e);
                                } catch (ClassNotFoundException e) {
                                    throw new RuntimeException(e);
                                }
                            %>
                        </ul>
                    </div>
                </div>
            </div>



            <div class="col-xl-7  col-md-12 mb-20">
                <div class="card-box height-100-p pd-20">
                    <div
                            class="d-flex flex-wrap justify-content-between align-items-center pb-0 pb-md-3"
                    >
                        <div class="h5 mb-md-0">Hospital Activities</div>
                        <div class="form-group mb-md-0">
                            <select class="form-control form-control-sm selectpicker">
                                <option value="">Last Week</option>
                                <option value="">Last Month</option>
                                <option value="">Last 6 Month</option>
                                <option value="">Last 1 year</option>
                            </select>
                        </div>
                    </div>
                    <div id="activities-chart"></div>
                </div>
            </div>
        </div>

        <div class="card-box pb-10">
            <div class="h5 pd-20 mb-0">Users</div>
            <table class="data-table table nowrap">
                <thead>
                <tr>
                    <th class="table-plus">User Name</th>
                    <th>Email</th>
                    <th>Phone Number</th>
                    <th>Password</th>
                    <th class="datatable-nosort">Actions</th>
                </tr>
                </thead>
                <tbody>
                <tr>
                    <td class="table-plus">
                        <div class="name-avatar d-flex align-items-center">
                            <div class="avatar mr-2 flex-shrink-0">
                                <img
                                        src="vendors/images/Raj.jpg"
                                        class="border-radius-100 shadow"
                                        width="40"
                                        height="40"
                                        alt=""
                                />
                            </div>
                            <div class="txt">
                                <div class="weight-600">Raj Zadafiya</div>
                            </div>
                        </div>
                    </td>
                    <td>raj123@gmail.com</td>
                    <td>9988776655</td>
                    <td>Raj@123</td>
                    <td>
                        <div class="table-actions">
                            <a href="#" data-color="#265ed7"
                            ><i class="icon-copy dw dw-edit2"></i
                            ></a>
                            <a href="#" data-color="#e95959"
                            ><i class="icon-copy dw dw-delete-3"></i
                            ></a>
                        </div>
                    </td>
                </tr>
                </tbody>
            </table>
        </div>

        <div class="title pb-20 pt-20">
            <h2 class="h3 mb-0">Quick Start</h2>
        </div>

        <div class="row">
            <div class="col-md-4 mb-20">
                <a href="#" class="card-box d-block mx-auto pd-20 text-secondary">
                    <div class="img pb-30">
                        <img src="vendors/images/medicine-bro.svg" alt="" />
                    </div>
                    <div class="content">
                        <h3 class="h4">Services</h3>
                        <p class="max-width-200">
                            We provide superior health care in a compassionate maner
                        </p>
                    </div>
                </a>
            </div>
            <div class="col-md-4 mb-20">
                <a href="#" class="card-box d-block mx-auto pd-20 text-secondary">
                    <div class="img pb-30">
                        <img src="vendors/images/remedy-amico.svg" alt="" />
                    </div>
                    <div class="content">
                        <h3 class="h4">Medications</h3>
                        <p class="max-width-200">
                            Look for prescription and over-the-counter drug information.
                        </p>
                    </div>
                </a>
            </div>
            <div class="col-md-4 mb-20">
                <a href="#" class="card-box d-block mx-auto pd-20 text-secondary">
                    <div class="img pb-30">
                        <img src="vendors/images/paper-map-cuate.svg" alt="" />
                    </div>
                    <div class="content">
                        <h3 class="h4">Locations</h3>
                        <p class="max-width-200">
                            Convenient locations when and where you need them.
                        </p>
                    </div>
                </a>
            </div>
        </div>

        <div class="footer-wrap pd-20 mb-20 card-box">
            @ Copyright
            <a href="https://github.com/dashboard" target="_blank">Uday Vasoya</a>
        </div>
    </div>

</body>
</html>
