<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    
    <%
    	request.setCharacterEncoding("UTF-8");
    	
    	//获取当前登录的用户名
    	String uname=request.getParameter("uname");
    	
    	//判断当前用户的用户名是否符合规范
    	if( uname==null ||  "".equals(uname) ){
    		out.println("<script>alert('请输入您的用户名');location.href='index.jsp';</script>");
    	}else{
    	
    		//存储当前登录用户的用户名
    		session.setAttribute("currentUser", uname);
    		
    		//为了让所有用户都能取到当前用户列表，需要将用户信息添加到application中
    		List<String> userList=new ArrayList<String>();
    		
    		//先判断是否有人在线
    		if(application.getAttribute("userList")!=null){
    			//先取出当前在线的用户
    			userList=(List<String>) application.getAttribute("userList");
    			
    		}
    		
    		//无论有没有人在线，都需要将当前登录用户添加到在线聊天列表userList中
    		userList.add(uname);
    		
    		//更新application中当前用户列表信息
    		application.setAttribute("userList", userList);
    		
    		response.sendRedirect("talk.jsp");
    	}
    
    
    %>
    
    
    
    
    
    
    