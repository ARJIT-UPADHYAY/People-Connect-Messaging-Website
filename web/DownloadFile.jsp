<%@page import="java.util.HashMap"%>
<%
    HashMap UserDetails=(HashMap)session.getAttribute("UserDetails");
    if(UserDetails!=null){ 
        String p=request.getParameter("pid");
        db.DbConnection db=(db.DbConnection)session.getAttribute("db");
        if(db==null){
            db=new db.DbConnection();
            session.setAttribute("db",db);
        }
        int pid=Integer.parseInt(p);
        java.util.ArrayList fileData=db.getFile(pid);
        if(fileData!=null){
        response.setContentType("APPLICATION/OCTET-STREAM");   
        response.setHeader("Content-Disposition","attachment; filename="+fileData.get(0)); 
        response.getOutputStream().write((byte[])fileData.get(1));
        }else{
            session.setAttribute("msg","PeopleMessage ID is Wrong!");
            response.sendRedirect("profile.jsp");
        }
    }else{
        session.setAttribute("msg","Plz Login first");
        response.sendRedirect("home.jsp");
    }
%>