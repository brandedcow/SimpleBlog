<%
// last page
String lastPage = (String) session.getAttribute("lastPage");
Cookie c = new Cookie("LASTPAGE", lastPage);
   
boolean cookieFound = false;

Cookie[] cookies = request.getCookies();

for (int i = 0; i < cookies.length; i+=1){
// check if cookie called lastPage exists, delete and add new cookie
    if(cookies[i].getName().equals("LASTPAGE") ){
        cookies[i].setMaxAge(0);
        response.addCookie(c);
        cookieFound = true;
    }
}

// else create cookie
if (!cookieFound){
    response.addCookie(c);
    cookieFound = false;                               
}

   
session.invalidate();
response.sendRedirect("index.jsp");
%>
<%
//Correct
/*
String sqlStr = "insert into login(fullname,user, pass) values (?,? sha2(?, 256))";
PreparedStatement stmt = con.prepareStatement(sqlStr);
stmt.setString(1,fullname);
stmt.setString(2,user);
stmt.setString(3,pass);
ResultSet rs = stmt.execute();
*/
//SQL injection attack
// a' OR 1=1 -- 
%>