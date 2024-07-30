<%--
  Created by IntelliJ IDEA.
  User: HP
  Date: 09-05-2024
  Time: 18:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>

    <div class="brand-logo">
        <a href="./?page=Dashboard">
            <img src="vendors/images/logo_black.png" alt="" class="dark-logo" />
            <img
                    src="vendors/images/logo_white.png"
                    alt=""
                    class="light-logo"
            />
        </a>
        <div class="close-sidebar" data-toggle="left-sidebar-close">
            <i class="ion-close-round"></i>
        </div>
    </div>
    <div class="menu-block customscroll">
        <div class="sidebar-menu">
            <ul id="accordion-menu">
                <li>
                    <a href="./?page=Dashboard" class="dropdown-toggle no-arrow">
								<span class="micon bi bi-house"></span
                                ><span class="mtext">Dashboard</span>
                    </a>
                </li>


                </li>
                <li class="dropdown">
                    <a href="javascript:;" class="dropdown-toggle">
								<span class="micon bi bi-back"></span
                                ><span class="mtext">Master</span>
                    </a>
                    <ul class="submenu">
                        <li><a href="./?page=AddGame">Add Games</a></li>
                        <li><a href="./?page=AddCoordinator">Add Co-ordinator</a></li>
                    </ul>
                </li>
                <li>
                    <a href="./?page=Game" class="dropdown-toggle no-arrow">
								<span class="micon bi bi-calendar4-week"></span
                                ><span class="mtext">Games</span>
                    </a>
                </li>

                <li>
                    <a href="./?page=Coordinator" class="dropdown-toggle no-arrow">
								<span class="micon bi bi-diagram-3"></span
                                ><span class="mtext">Co-ordinator</span>
                    </a>
                </li>
                <li>
                    <a href="./?page=UserQuery" class="dropdown-toggle no-arrow">
								<span class="micon bi bi-chat-right-dots"></span
                                ><span class="mtext">Users Query</span>
                    </a>
                </li>
                <li>
                    <a href="./?page=Profile" class="dropdown-toggle no-arrow">
								<span class="micon bi bi-receipt-cutoff"></span
                                ><span class="mtext">Profile</span>
                    </a>
                </li>
                <li>
                    <div class="dropdown-divider"></div>
                </li>
            </ul>
        </div>
    </div>

</body>
</html>
