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
    	session.removeAttribute(uname);
    	
    	boolean flag=false;
    	List<String> userList=new ArrayList<String>();
		
		//先判断是否有人在线
		if(application.getAttribute("userList")!=null){
			//先取出当前在线的用户
			userList=(List<String>) application.getAttribute("userList");
			application.removeAttribute("userList");
			userList.remove(userList.indexOf(uname));
			application.setAttribute("userList", userList);
			
			flag=true;
		}
		
		
    	
    	if(flag==true){

    		response.sendRedirect("index.jsp");
    	}
    	
    	
    	
    %>
    