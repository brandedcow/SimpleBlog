<%@include file="db.jsp" %><%

String user = (String) session.getAttribute( "user" );
String username = (String) session.getAttribute( "username" );
String type = (String) session.getAttribute("type");  
if (null == user) {
	response.sendRedirect("index.html"); 
}

//Check user
String sql = "SELECT title, content, user from blog";                             
PreparedStatement stmt = con.prepareStatement(sql);
ResultSet rs = stmt.executeQuery();
    
// Cookie                              
   String uri = request.getRequestURI();
   String pageName = uri.substring(uri.lastIndexOf("/")+1);
   session.setAttribute("lastPage", pageName);
%>
<html>
<head>
    <title>CS 166 Blog</title>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="author" content="Afnizar Nur Ghifari">
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link rel="stylesheet" href="css/kube.min.css" />
    <link rel="stylesheet" href="css/font-awesome.min.css" />
    <link rel="stylesheet" href="css/custom.min.css" />
    <link rel="shortcut icon" href="img/favicon.png" />
    <link href="http://fonts.googleapis.com/css?family=Lato:400,700" rel="stylesheet" type="text/css">
    <link href="http://fonts.googleapis.com/css?family=Open+Sans:400,700" rel="stylesheet" type="text/css">
</head>
<body>
	<!-- Navigation -->
	<div class="main-nav">
		<div class="container">
			<header class="group top-nav">
				<nav class="navbar logo-w navbar-left" >
					<a class="logo" href="blogs.jsp">CS 166 BLOG</a>
				</nav>
				<div class="navigation-toggle" data-tools="navigation-toggle" data-target="#navbar-1">
				    <span class="logo">CS 166 BLOG</span>
				</div>
			    <nav id="navbar-1" class="navbar item-nav navbar-right">
				    <ul>
                        <% if(type.equals("admin")){ %>
                            <li><a href="usermanage.jsp">Users</a></li>
                            
                        <% } %>
                        <li><a href="blogpost.jsp">Post</a></li>
				         <li><a href="blogmanage.jsp">Manage</a></li>
                        <li><a href="logout_action.jsp">Logout</a></li>
                       
				    </ul>
				</nav>
			</header>
		</div>
	</div>

	<!-- Introduction -->
	<div class="intro">
		<div class="container">
			<div class="units-row">
			    <div class="unit-10">
			    	<img class="img-intro" src="img/frog.png" alt="">
			    </div>
			    <div class="unit-90">
			    	<p class="p-intro">Welcome <%= username %></p>
			    </div>
			</div>
		</div>
	</div>
	
	<!-- Content -->
	<div class="content">
		<div class="container">
            <%	
               while ( rs.next() ) {
                   out.print("<div class='post'>");
	               out.print("<h1>" + rs.getString(1) + "</h1>");
                    out.print("<hr>");
                    out.print("<div class='in-content'>");
	               out.print("<p>" + rs.getString(2) + "</p>");
                 out.print("</div>");
               
               String temp = rs.getString(3);
               
             
               out.print("<div class='foot-post'>");
               out.print("<a class='read-more' href='#'>Authored By: " + temp+"</a>");
               out.print("</div>");
               
               out.print("</div>");
               }
            %>

		</div>
	</div>

	<footer>
		<div class="container">
			<p class="text-centered foot-cp">
	    		<a href="privacypolicy.jsp">Privacy Policy</a>
	    	</p>
		</div>
	</footer>

	<!-- Javascript -->
	<script src="js/jquery.min.js"></script>
    <script src="js/kube.min.js"></script>
</body>
</html>

