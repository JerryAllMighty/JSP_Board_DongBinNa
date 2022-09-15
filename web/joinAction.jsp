<%--
  Created by IntelliJ IDEA.
  User: yoonminkim
  Date: 2022/09/10
  Time: 2:44 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ page import="kr.ac.abc.def.user.UserDAO" %>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="kr.ac.abc.def.user.UserDAO" %>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="user" class="kr.ac.abc.def.user.User" scope="page"/>
<jsp:setProperty name="user" property="userID"></jsp:setProperty>
<jsp:setProperty name="user" property="userPassword"></jsp:setProperty>
<jsp:setProperty name="user" property="userName"></jsp:setProperty>
<jsp:setProperty name="user" property="userGender"></jsp:setProperty>
<jsp:setProperty name="user" property="userEmail"></jsp:setProperty>
<html>
<head>
    <meta http-equiv="Content-Type" charset="UTF-8" content="text/html">
    <title>Login</title>
</head>
<body>

<%
    String userID = null;
    if (session.getAttribute("userID") != null) {
        userID = (String) session.getAttribute("userID");
    }
    if (userID != null){
        PrintWriter script = response.getWriter();
        script.println("<script>");
        script.println("alert('이미 로그인이 되어 있습니다.')");
        script.println("location.href = 'main.jsp'");
        script.println("</script>");
    }

    if (user.getUserID() == null || user.getUserPassword() == null || user.getUserName() == null || user.getUserGender() == null || user.getUserEmail() == null) {
        PrintWriter script = response.getWriter();
        script.println("<script>");
        script.println("alert('입력이 안 된 사항이 있습니다.')");
        script.println("history.back()");
        script.println("</script>");
    } else {

        UserDAO userDAO = new UserDAO();
        int result =
                userDAO.join(user);
        if (result == -1) {
            PrintWriter script = response.getWriter();
            script.println("<script>");
            script.println("alert('이미 존재하는 아이디입니다.')");
            script.println("history.back()");
            script.println("</script>");
        } else{
            session.setAttribute("userID", user.getUserID());
            PrintWriter script = response.getWriter();
            script.println("<script>");
            script.println("location.href='main.jsp'");
            script.println("</script>");
        }
    }

%>
</body>
</html>
