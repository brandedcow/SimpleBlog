<%@include file="db.jsp" %><%		
//Check user
String blogtitle = request.getParameter( "blogtitle" );
String user = (String) session.getAttribute( "user" );
                              
String token = request.getParameter("token");
String storedToken = (String) session.getAttribute("CSRF");                                

if(storedToken.equals(token)){                              
    String sqlStr = "SELECT `title`, `content` FROM `blog` WHERE `title`=?" ; 
    PreparedStatement stmt = con.prepareStatement(sqlStr);
    stmt.setString(1,blogtitle);
    ResultSet rs = stmt.executeQuery();
    if(rs.next() ){
        request.setAttribute("TITLE", rs.getString(1) );
        request.setAttribute("BLOG", rs.getString(2) );                      
    }                   
                              
    request.getRequestDispatcher("blogpost.jsp").forward(request, response);
}
%>
    
