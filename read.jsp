<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="java.sql.PreparedStatement"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="util.DatabaseUtil"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="java.io.IOException"%>

<%
	request.setCharacterEncoding("EUC-KR");

	String sql="select * from Who_takes_lead_role";
	Connection conn=null;
	PreparedStatement pstmt=null;
	ResultSet rs=null;
	
	conn=DatabaseUtil.getConnection();
	
	pstmt=conn.prepareStatement(sql);
	rs=pstmt.executeQuery();
	PrintWriter script=response.getWriter();
	
	while(rs.next()){
		String Title=rs.getString(1);
		int IDNum=rs.getInt(2);
		String Name=rs.getString(3);
		
		script.println("<h1>"+Title+" "+IDNum+" "+Name+" "+"</h1>");
	}

	
	rs.close();
	pstmt.close();
	conn.close();


%>