<%@include file="db.jsp" %><%		
//Check user
String usertd = request.getParameter( "usertd" );
String user = (String) session.getAttribute( "user" );
                              
String token = request.getParameter("token");
String storedToken = (String) session.getAttribute("CSRF");    
                              
if(storedToken(token)){
    String sqlStr = "DELETE FROM `login` WHERE `user`= ? " ; 
    PreparedStatement stmt = con.prepareStatement(sqlStr);
    stmt.setString(1,usertd);                             
    stmt.execute();
    response.sendRedirect("usermanage.jsp");      
}
%>