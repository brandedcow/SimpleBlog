<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.captcha.botdetect.web.servlet.Captcha"%>
<%@taglib prefix="botDetect" uri="https://captcha.com/java/jsp"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Sign-Up/Login Form</title>
  <link href='http://fonts.googleapis.com/css?family=Titillium+Web:400,300,600' rel='stylesheet' type='text/css'>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css">

  
      <link rel="stylesheet" href="css/style.css">

  
</head>

<body>
  <div class="form">
      
      <ul class="tab-group">
        <li class="tab active"><a href="#login">Log In</a></li>
        <li class="tab"><a href="#signup">Sign Up</a></li>
      </ul>
      
      <div class="tab-content">
        
        <div id="login">   
          <h1>Welcome Back!</h1>
          
          <form action="login_action.jsp" method="post">
          
            <div class="field-wrap">
            <label>
              Username<span class="req">*</span>
            </label>
            <input name="user" required autocomplete="off"/>
          </div>
          
          <div class="field-wrap">
            <label>
              Password<span class="req">*</span>
            </label>
            <input name="pass" type="password"required autocomplete="off"/>
          </div>
             
        
          <fieldset>
              
      <!-- Adding BotDetect Captcha to the page -->
      <%
        Captcha captcha = Captcha.load(request, "loginCaptcha");
        captcha.setUserInputID("captchaCode");
        String captchaHtml = captcha.getHtml();
        out.write(captchaHtml);
      %>

      <div class="validationDiv">
        <input name="captchaCode" type="text" id="captchaCode" />
          <hr>
        <button type="submit"  class="button button-block" name="validateCaptchaButton" value="Validate" id="validateCaptchaButton" >LOGIN</button>

                                                
      </div> 
             
          </fieldset>
       
          
          </form>
     </div>

       
      
      <div id="signup">   
          <h1>Blog Sign Up</h1>
          
          <form action="register_action.jsp" method="post">          
          
            <div class="field-wrap">
              <label>
                Full Name<span class="req">*</span>
              </label>
              <input name="fullname" type="text" required autocomplete="off" />
            </div>
     

          <div class="field-wrap">
            <label>
              Username<span class="req">*</span>
            </label>
            <input name="user" required autocomplete="off"/>
          </div>
          
          <div class="field-wrap">
            <label>
              Set Password<span class="req">*</span>
            </label>
            <input name="pass" type="password"required autocomplete="off"/>
          </div>
              
                        <fieldset>
              
      <!-- Adding BotDetect Captcha to the page -->
      <%
        captcha = Captcha.load(request, "registerCaptcha");
        captcha.setUserInputID("captchaCode");
        captchaHtml = captcha.getHtml();
        out.write(captchaHtml);
      %>

      <div class="validationDiv">
        <input name="captchaCode" type="text" id="captchaCode" />
          <hr>
          <button type="submit"  class="button button-block" name="validateCaptchaButton" value="Validate" id="validateCaptchaButton">REGISTER</button>

                                                
      </div> 
             
          </fieldset>
       
          
          </form>

        </div>
        
      </div><!-- tab-content -->
      
</div> <!-- /   z -->
  <script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>

    <script src="js/index.js"></script>

</body>
</html>