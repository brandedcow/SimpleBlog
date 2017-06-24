<%@ page import="java.security.SecureRandom"%>
<%@page import="com.captcha.botdetect.web.servlet.Captcha"%>
<%@ include file="db.jsp"%>
<%                            

String red = "index.jsp";
String token = request.getParameter("token");
String storedToken = (String) session.getAttribute("CSRF");   
   
//Load previous captcha
Captcha captcha = Captcha.load(request, "registerCaptcha");
   
// validate the Captcha to check were not dealing with a bot
boolean isHuman = captcha.validate(request.getParameter("captchaCode"));
if (isHuman) {
   
    //get form input
    String fullname = request.getParameter( "fullname" );
    String user = request.getParameter( "user" );
    String pass = request.getParameter( "pass" );


    SecureRandom random = new SecureRandom();
    byte[] bytes = new byte[32];
    random.nextBytes(bytes);   
    String salt = new String(bytes);                                                          

    pass = salt + pass;                              

    String sqlStr = "insert into login(fullname,user, pass, salt) values (?, ?, sha2(?, 256), ?)";
    PreparedStatement stmt = con.prepareStatement(sqlStr);
       stmt.setString(1,fullname);
       stmt.setString(2,user);
       stmt.setString(3,pass);
       stmt.setString(4,salt);
    stmt.execute();
    red ="index.jsp";

//else not human
                
}else {
	red = "index.jsp";
}
red = "/" + red;
RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(red);
dispatcher.forward(request, response);
   
%>