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
<div class="pre-loader">
  <div class="pre-loader-box">
    <div class="loader-logo">
      <img src="vendors/images/logo_black.png" alt="" style="height: 60px"/>
    </div>
    <div class="loader-progress" id="progress_div">
      <div class="bar" id="bar1"></div>
    </div>
    <div class="percent" id="percent1">0%</div>
    <div class="loading-text">Loading...</div>
  </div>
</div>

<div class="header">
<jsp:include page="./pages/header.jsp"/>
</div>

<div class="right-sidebar">
  <jsp:include page="./pages/rightsidebar.jsp"/>
</div>

<div class="left-side-bar">
  <jsp:include page="./pages/leftsidebar.jsp"/>
</div>

<div class="mobile-menu-overlay"></div>

<div class="main-container">
  <%
    String pageName = request.getParameter("page");

    if(pageName != null)
    {
      switch (pageName)
      {
        case "Dashboard":
  %>
  <jsp:include page="./pages/dashboard.jsp" />
  <%
    break;
  case "AddGame":
%>
  <jsp:include page="./pages/addGames.jsp" />
  <%
    break;
  case "AddCoordinator":
%>
  <jsp:include page="./pages/addCo-ordinator.jsp" />
  <%
      break;
    case "Game":
  %>

  <jsp:include page="./pages/games.jsp" />
  <%
      break;
    case "Coordinator":
  %>
  <jsp:include page="./pages/Co-ordinator.jsp" />
  <%
      break;
    case "UserQuery":
  %>
  <jsp:include page="./pages/usersQuery.jsp" />
  <%
      break;
    case "Profile":
  %>
  <jsp:include page="./pages/profile.jsp" />
  <%
      break;
    case "GameDetails":
  %>
  <jsp:include page="./pages/gamedetails.jsp" />
  <%
      break;
    case "CoordinateDetails":
  %>
  <jsp:include page="./pages/Co-ordinatorDetails.jsp" />
  <%
    break;
  default:
%>
  <jsp:include page="./pages/dashboard.jsp" />
  <%
      break;
  }
}
else {
%>
  <jsp:include page="./pages/dashboard.jsp" />
  <%
  }
%>

</div>
<!-- welcome modal start -->


<!-- welcome modal end -->
<!-- js -->
<script src="vendors/scripts/core.js"></script>
<script src="vendors/scripts/script.min.js"></script>
<script src="vendors/scripts/process.js"></script>
<script src="vendors/scripts/layout-settings.js"></script>
<script src="src/plugins/apexcharts/apexcharts.min.js"></script>
<script src="src/plugins/datatables/js/jquery.dataTables.min.js"></script>
<script src="src/plugins/datatables/js/dataTables.bootstrap4.min.js"></script>
<script src="src/plugins/datatables/js/dataTables.responsive.min.js"></script>
<script src="src/plugins/datatables/js/responsive.bootstrap4.min.js"></script>
<script src="vendors/scripts/dashboard3.js"></script>
<script>
  // Bootstrap validation script
  (function () {
    'use strict'

    // Fetch all the forms we want to apply custom Bootstrap validation styles to
    var forms = document.querySelectorAll('.needs-validation')

    // Loop over them and prevent submission
    Array.prototype.slice.call(forms)
            .forEach(function (form) {
              form.addEventListener('submit', function (event) {
                if (!form.checkValidity()) {
                  event.preventDefault()
                  event.stopPropagation()
                  form.classList.add('was-validated')
                }
              }, false)

              // Add event listener to each input field to show validation error only if the field is touched
              var inputFields = form.querySelectorAll('input, textarea,select')
              Array.prototype.slice.call(inputFields)
                      .forEach(function (inputField) {
                        inputField.addEventListener('blur', function () {
                          if (!inputField.checkValidity()) {
                            inputField.classList.add('is-invalid')
                          }
                        })
                      })
            })
  })()
</script>
<!-- Google Tag Manager (noscript) -->
<noscript
><iframe
        src="https://www.googletagmanager.com/ns.html?id=GTM-NXZMQSS"
        height="0"
        width="0"
        style="display: none; visibility: hidden"
></iframe
></noscript>
<!-- End Google Tag Manager (noscript) -->
</body>
</html>
