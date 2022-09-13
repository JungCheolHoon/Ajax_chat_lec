<?xml version="1.0" encoding="utf-8" ?>
<%@page import="java.net.Inet4Address"%>
<%@ page contentType = "text/xml; charset=utf-8" %>
<%@ page import = "java.sql.*" %>
<%@ page import = "java.util.List" %>
<%@ page import = "util.DB" %>
<%@ page import = "util.Util" %>
<%@ page import="java.util.Date" %>
<%
	request.setCharacterEncoding("utf-8");
	String nickName = request.getParameter("nickName");
	String msg = request.getParameter("msg");
	String click = request.getParameter("click");
	String message = null;
	Inet4Address.getLocalHost().getHostAddress();
	Date today = new Date();
	if(click.charAt(0) == 't'){
		message = "["+Inet4Address.getLocalHost().getHostAddress()+"]"+"["+nickName +"]" +"[" +today.getHours()+":"+today.getMinutes()+":"+today.getSeconds()+"] "+msg;
	}
	else{
		message = "["+nickName +"]" +"[" +today.getHours()+":"+today.getMinutes()+":"+today.getSeconds()+"] "+msg;
	}
	Connection conn = null;
	PreparedStatement pstmt = null;
	
	boolean isSuccess = true;
	
	try {
		conn = DB.getConnection();
		pstmt = conn.prepareStatement(
			"insert into CHAT_MESSAGE (NICKNAME, REGISTER_DATE, MESSAGE) "+
			"values (?, now(), ?)");
		pstmt.setString(1, nickName);
		pstmt.setString(2, message);
		pstmt.executeUpdate();
	} catch(SQLException ex) {
		isSuccess = false;
	} finally {
		if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
		if (conn != null) try { conn.close(); } catch(SQLException ex) {}
	}
%>
<result>
	<code><%= isSuccess ? "success" : "fail" %></code>
</result>
