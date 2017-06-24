<%@include file="db.jsp" %>
<%@page import="com.captcha.botdetect.web.servlet.Captcha"%>
<%

   //Check CAPTCHA
Captcha captcha = request.getParameter("captcha");
String cinput = request.getParameter("captchaCode");
if ("POST".equalsIgnoreCase(request.getMethod())) {
    boolean isHuman = captcha.validate( cinput );
    if (!isHuman) {
   
   //Check user
String user = request.getParameter( "user" );
String pass = request.getParameter( "pass" );

String sql = "SELECT salt FROM login WHERE user=?";                              
PreparedStatement stmt = con.prepareStatement(sql);
stmt.setString(1,user);

ResultSet salts = stmt.executeQuery();

if (salts.next()) {                            
      String temp = new String( salts.getString(1) );
      pass = temp + pass;
}                           
                              
String sqlStr = "SELECT fullname, type FROM login WHERE user=? and pass = sha2(?, 256)"; 
stmt = con.prepareStatement(sqlStr);
stmt.setString(1,user);
stmt.setString(2,pass);
                             
ResultSet rs = stmt.executeQuery();
if ( rs.next() ) {
	session.setAttribute( "user", user );
	session.setAttribute( "username", rs.getString(1) );
    session.setAttribute( "type" , rs.getString(2) );                         
	response.sendRedirect("blogs.jsp");	
} else {
	response.sendRedirect("index.jsp");
}


   
   // if not human
    } else {
        response.sendRedirect("index.jsp");
    
}

  %>
