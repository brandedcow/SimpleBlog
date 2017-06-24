<%@include file="db.jsp" %><%		
//Check user
String usertu = request.getParameter( "usertu" );
String user = (String) session.getAttribute( "user" );

String token = request.getParameter("token");
String storedToken = (String) session.getAttribute("CSRF");  

if(storedToken.equals(token)){                             
    String sqlStr = "SELECT type FROM login WHERE user=?";
    PreparedStatement stmt = con.prepareStatement(sqlStr);
     stmt.setString(1, usertu);                             
    ResultSet rs = stmt.executeQuery();

    if(rs.next()){
           String temp = rs.getString(1);                       
           if (temp.equals("admin") ){
                     sqlStr = "UPDATE `login` SET `type`='normal' WHERE `user`=?";
                     stmt = con.prepareStatement(sqlStr);
                     stmt.setString(1, usertu);              
                     stmt.execute();              
            }  else {
                     sqlStr = "UPDATE `login` SET `type`='admin' WHERE `user`=?";
                     stmt = con.prepareStatement(sqlStr);
                     stmt.setString(1, usertu);              
                     stmt.execute();             
            }                     
    }    

    response.sendRedirect("usermanage.jsp");      
}
%>
    

    
