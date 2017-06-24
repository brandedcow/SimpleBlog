<%@include file="db.jsp" %><%
//Check user
String blogtitle = request.getParameter( "blogtitle" );
String blogcontent = request.getParameter( "blogcontent" );
String user = (String) session.getAttribute( "user" );

String sqlStr = "insert into blog (title,content,user) values ('" + blogtitle +"','"+blogcontent+"','"+user+"')";
PreparedStatement stmt = con.prepareStatement(sqlStr);                           
stmt.execute();
response.sendRedirect("blogs.jsp"); 
%>

<%
//SQL injection attack
// a ' OR '1'='1' -- 
//Users', (select GROUP_CONCAT(fullname) from login), 'hacker') -- 
%>
