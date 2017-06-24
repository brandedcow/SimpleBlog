<%@include file="db.jsp" %><%		
//Check user
String blogtitle = request.getParameter( "blogtitle" );
String user = (String) session.getAttribute( "user" );
                              
String token = request.getParameter("token");
String storedToken = (String) session.getAttribute("CSRF");                                

if(storedToken.equals(token)){                              
    String sqlStr = "DELETE FROM `blog` WHERE `title`=?" ; 
    PreparedStatement stmt = con.prepareStatement(sqlStr);
    stmt.setString(1,blogtitle);                             
    stmt.execute();
    response.sendRedirect("blogmanage.jsp"); 
}
%>
    
