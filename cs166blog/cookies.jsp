<%@ page import="java.util.*" %>
<%
   // Cookies to be Added:
   // Last Page
   // Date of Last Visit
   // User ID
   String red = "index.jsp";
   
   Cookie[] cookies = request.getCookies();
   
   for (int i = 0; i < cookies.length; i+=1){
    //date
    Date thisVisit = new Date();
    String date = thisVisit.toString();
    boolean dateChanged = false;
    
    // if cookie called date exists, replace
    if(cookies[i].getName().equals("LASTVISIT") ){
            cookies[i].setValue(date);
            dateChanged = true;
        }
   
    // create cookies that did not exist
    if (!dateChanged){
        Cookie lastVisit = new Cookie("LASTVISIT", date );
        response.addCookie(lastVisit);
        }
    }
   
     
    boolean cookieFound = false;
         for (int j = 0; j < cookies.length; j+=1){
                if(cookies[j].getName().equals("LASTPAGE") ){
                red = cookies[j].getValue();
                cookieFound= true;                           
            }
        }
        if (!cookieFound){
            red="blogs.jsp";
         }
                                            
red = "/" + red;                                            
RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(red);
dispatcher.forward(request, response);

%>

