<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Header</title>
</head>
<body>
    <div class="header-left">
        <div class="menu-icon bi bi-list"></div>
<%--        <%--%>
<%--            HttpSession hs = request.getSession(false);--%>
<%--            String nm = (String) hs.getAttribute("admin");--%>
<%--        %>--%>
<%--        <h2 class="h3 mb-0">Welcome <%= nm %></h2>--%>
    </div>
    <div class="header-right">
<%--        <div class="dashboard-setting user-notification">--%>
<%--            <div class="dropdown">--%>
<%--                <a--%>
<%--                        class="dropdown-toggle no-arrow"--%>
<%--                        href="javascript:;"--%>
<%--                        data-toggle="right-sidebar"--%>
<%--                >--%>
<%--                    <i class="dw dw-settings2"></i>--%>
<%--                </a>--%>
<%--            </div>--%>
<%--        </div>--%>

        <div class="user-info-dropdown">
            <div class="dropdown">
                <a
                        class="dropdown-toggle"
                        href="#"
                        role="button"
                        data-toggle="dropdown"
                >
							<span class="user-icon">
								<img src="vendors/images/uday.jpg" alt="" />
							</span>
                    <span class="user-name">Uday</span>
                </a>
                <div
                        class="dropdown-menu dropdown-menu-right dropdown-menu-icon-list"
                >
                    <a class="dropdown-item" href="./?page=Profile"
                    ><i class="dw dw-user1"></i> Profile</a
                    >
<%--                    <a class="dropdown-item" href="./?page=Profile"--%>
<%--                    ><i class="dw dw-settings2"></i> Setting</a--%>
<%--                    >--%>
                    <a
                            class="dropdown-item"
                            href="javascript:;"
                            data-toggle="right-sidebar"
                    >
                        <i class="dw dw-settings2"></i>Setting
                    </a>
<%--                    <a class="dropdown-item" href="./?page=Dashboard"--%>
<%--                    ><i class="dw dw-help"></i> Help</a--%>
<%--                    >--%>
<%--                    <%--%>
<%--                        HttpSession hs = request.getSession();--%>
<%--                        String lo = (String) hs.getAttribute("admin");--%>
<%--                        if(lo != null)--%>
<%--                        {--%>
<%--                            hs.invalidate();--%>

<%--                    %>--%>
                    <a class="dropdown-item" href="./?page=Profile">
                        <i class="dw dw-logout"></i>
                        Log Out
                    </a>
<%--                    <%--%>
<%--                        }--%>

<%--                    %>--%>
                </div>
            </div>
        </div>

    </div>

</body>
</html>
