<!DOCTYPE html>
<%@page import="java.lang.reflect.Method"%>
<%@page import="javax.security.auth.login.LoginException"%>
<%@page import="javax.security.auth.login.LoginContext"%>

<%
// This gumpf below uses java reflection to access the com.sap.security.auth api's, otherwise
// the execution on Tomcat local server woul throw a ClassNotfound exception.
// Of course... its better not to use reflection if you don't want to run in tomcat local server.
// This generates a http400 on HANA Cloud! It still logs you out though - its just the response.

String result = "";
String reason = "";

LoginContext login = null;
if (request.getRemoteUser() != null) {
  try {
    Class<?> loginContextFactoryClass = this.getClass().getClassLoader().loadClass("com.sap.security.auth.login.LoginContextFactory");
    
    if (loginContextFactoryClass != null) {
      Method method = loginContextFactoryClass.getMethod("createLoginContext");
      login = (LoginContext)method.invoke(null);
      login.logout();
      result = "You have successfully logged out.";
      reason = "Congratulations.";
    }
  } catch (Exception e) {
    // Servlet container handles the login exception. It throws it to the application for its information
    result = "Logout failed.";
    reason = e.getClass().getName() + " " + e.getMessage();
  }
}
else {
   result = "You were already logged out.";
   reason = "Current user is Guest.";
}  
%>
  
<html>
  <head>
    <title>abendrot | logout</title>
  </head>
  <body>
    <h1><%=result%></h1>
    <div><%=reason%></div>
  </body>      
</html>