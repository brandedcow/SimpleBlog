<%@include file="db.jsp" %><%
//Check user
String blogtitle = request.getParameter( "blogtitle" );
String blogcontent = request.getParameter( "blogcontent" );
String user = (String) session.getAttribute( "user" );
                            
                              
String token = (String) request.getParameter("token");
String storedToken = (String) session.getAttribute("CSRF"); 
                              
                        
if(storedToken.equals(token)){   
    String sqlStr = "insert into blog (title,content,user) values (?, ?, ?)"; 
    PreparedStatement stmt = con.prepareStatement(sqlStr);
     stmt.setString(1,blogtitle);
     stmt.setString(2,blogcontent);
     stmt.setString(3,user);                             
    stmt.execute();
    response.sendRedirect("blogs.jsp");
}
%>