<%--
  Created by IntelliJ IDEA.
  User: yoonminkim
  Date: 2022/09/10
  Time: 2:44 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ page import="kr.ac.abc.def.bbs.BbsDAO" %>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="kr.ac.abc.def.user.UserDAO" %>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="bbs" class="kr.ac.abc.def.bbs.Bbs" scope="page"/>
<jsp:setProperty name="bbs" property="bbsTitle"></jsp:setProperty>
<jsp:setProperty name="bbs" property="bbsContent"></jsp:setProperty>
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
    if (userID == null){
        PrintWriter script = response.getWriter();
        script.println("<script>");
        script.println("alert('로그인을 하세요.')");
        script.println("location.href = 'login.jsp'");
        script.println("</script>");
    }else{
        if (bbs.getBbsTitle() == null || bbs.getBbsContent() == null) {
            PrintWriter script = response.getWriter();
            script.println("<script>");
            script.println("alert('입력이 안 된 사항이 있습니다.')");
            script.println("history.back()");
            script.println("</script>");
        } else {

            BbsDAO bbsDAO = new BbsDAO();
            int result =
                    bbsDAO.write(bbs.getBbsTitle(), userID, bbs.getBbsContent());
            if (result == -1) {
                PrintWriter script = response.getWriter();
                script.println("<script>");
                script.println("alert('글쓰기에 실패했습니다.')");
                script.println("history.back()");
                script.println("</script>");
            } else{
                PrintWriter script = response.getWriter();
                script.println("<script>");
                script.println("location.href='bbs.jsp'");
                script.println("</script>");
            }
        }

    }



%>
</body>
</html>
