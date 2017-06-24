<%@include file="db.jsp" %><%		
//Check user
String blogtitle = request.getParameter( "blogtitle" );
String user = (String) session.getAttribute( "user" );

String sqlStr = "DELETE FROM `blog` WHERE `title`='" + blogtitle + "'" ; 
Statement stmt = con.createStatement();
stmt.execute(sqlStr);
response.sendRedirect("blogmanage.jsp");                         
%>
    
