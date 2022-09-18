<%--
  Created by IntelliJ IDEA.
  User: yoonminkim
  Date: 2022/09/10
  Time: 2:44 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ page import="kr.ac.abc.def.bbs.BbsDAO" %>
<%@ page import="kr.ac.abc.def.bbs.Bbs" %>
<%@ page import="java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8"); %>
<html>
<head>
    <meta http-equiv="Content-Type" charset="UTF-8" content="text/html">
    <link rel="stylesheet" href="css/custom.css">
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
    }
    int bbsID = 0;
    if (request.getParameter("bbsID") != null) {
        bbsID = Integer.parseInt(request.getParameter("bbsID"));

    }
    if (bbsID == 0) {
        PrintWriter script = response.getWriter();
        script.println("<script>");
        script.println("alert('유효하지 않은 글입니다.')");
        script.println("location.href = 'bbs.jsp'");
        script.println("</script>");

    }
    Bbs bbs = new BbsDAO().getBbs(bbsID);
    if(!userID.equals(bbs.getUserID())){
        PrintWriter script = response.getWriter();
        script.println("<script>");
        script.println("alert('권한이 없습니다.')");
        script.println("location.href = 'bbs.jsp'");
        script.println("</script>");

    }

    else{

            BbsDAO bbsDAO = new BbsDAO();
            int result =
                    bbsDAO.delete(bbsID);
            if (result == -1) {
                PrintWriter script = response.getWriter();
                script.println("<script>");
                script.println("alert('글 삭제에 실패했습니다.')");
                script.println("history.back()");
                script.println("</script>");
            } else{
                PrintWriter script = response.getWriter();
                script.println("<script>");
                script.println("location.href='bbs.jsp'");
                script.println("</script>");
            }


    }



%>
</body>
</html>
