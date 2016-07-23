<%@page import="java.util.Date"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    
    <%
    
    	request.setCharacterEncoding("UTF-8");
    	//从session中获取当前登录用户
    	String uname=(String) session.getAttribute("currentUser");
    
	    String status=request.getParameter("status");
	    SimpleDateFormat  sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	    String content=request.getParameter("content");
	    
	    String str="&nbsp;"+uname+" "+status+" 说 :"+sdf.format(new Date())+"<br />&nbsp;"+content;
	    
	    List<String>  words=new ArrayList<String>();
	    
	    if(application.getAttribute("words")!= null){
	    	words=(List<String>) application.getAttribute("words");
	    	
	    }
    	words.add(str);
    	application.setAttribute("words", words);
    	response.sendRedirect("content.jsp");
    
    %>
    