<%@ page import="java.security.SecureRandom,java.math.BigInteger"%>
<%@include file="db.jsp" %>
<%@page import="com.captcha.botdetect.web.servlet.Captcha"%>
<%                                                               
String red = "index.jsp";              
                              
//Load previous captcha
Captcha captcha = Captcha.load(request, "loginCaptcha");
// validate the Captcha to check were not dealing with a bot
boolean isHuman = captcha.validate(request.getParameter("captchaCode"));
if (isHuman) {                                                      
//Authenticated Human
      // get username and password from form                                                         
      String user = request.getParameter( "user" );
      String pass = request.getParameter( "pass" );
                                                               
      //find salt from db
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
   
   //Generate CSRF
   SecureRandom random = new SecureRandom();
   String csrf = new BigInteger(130, random).toString(32);
   
   // Authenticated
    if ( rs.next() ) {
        session.setAttribute( "user", user );
        session.setAttribute( "username", rs.getString(1) );
        session.setAttribute( "type" , rs.getString(2) ); 
        session.setAttribute( "CSRF", csrf);
        response.sendRedirect("cookies.jsp");
        return;
    } else {
        red ="index.jsp";
    }
 
// Not Human   
} else {
	red = "index.jsp";
}

red = "/" + red;
RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(red);
dispatcher.forward(request, response);
                              

%>



