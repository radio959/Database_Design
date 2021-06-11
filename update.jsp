<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="java.sql.PreparedStatement"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="util.DatabaseUtil"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="java.io.IOException"%>

<%
   request.setCharacterEncoding("UTF-8");

   int function=Integer.parseInt(request.getParameter("Function"));
   Connection conn=null;
   PreparedStatement pstmt=null;

   if (function==1)
   {
	int prev_IDNum=Integer.parseInt(request.getParameter("prev_IDNumber"));
    int IDNum=Integer.parseInt(request.getParameter("IDNumber"));
    String Name=request.getParameter("Name");
    int WinAward=Integer.parseInt(request.getParameter("WinAward"));

    String sql="UPDATE ACTOR SET IDNum=?, Name=?, WinAward=? WHERE IDNum=?";
   
   //db 연결및 JDBC 드라이버 로딩
   conn=DatabaseUtil.getConnection();
   //sql문 준비
   pstmt=conn.prepareStatement(sql);
   PrintWriter script=response.getWriter();
   pstmt.setInt(1, IDNum);
   pstmt.setString(2, Name);
   pstmt.setInt(3, WinAward);
   pstmt.setInt(4, prev_IDNum);
   out.println("<h1>"+"Updating to ACTOR table is successed"+"</h1>");
   }


   else if (function==2)
   {
    int Movie_IDNum=Integer.parseInt(request.getParameter("Movie_IDNumber"));
    String Title=request.getParameter("Title");
    String Genre=request.getParameter("Genre");
	int Runningtime=Integer.parseInt(request.getParameter("Runningtime"));
	int prev_Movie_IDNum=Integer.parseInt(request.getParameter("prev_Movie_IDNumber"));

	   String sql="UPDATE MOVIE SET Movie_IDNum=?, Title=?, Genre=? Runningtime=? WHERE IDNum=?";
   //db 연결및 JDBC 드라이버 로딩
   conn=DatabaseUtil.getConnection();
   //sql문 준비
   pstmt=conn.prepareStatement(sql);
   PrintWriter script=response.getWriter();
   pstmt.setInt(1, Movie_IDNum);
   pstmt.setString(2, Title);
   pstmt.setString(3, Genre);
   pstmt.setInt(4, Runningtime);
   pstmt.setInt(5, prev_Movie_IDNum);
   out.println("<h1>"+"Updating to MOVIE table is successed"+"</h1>");
    }


   else if (function==3)
   {
    int IDNum=Integer.parseInt(request.getParameter("IDNumber"));
	String Name=request.getParameter("Name");
	int prev_IDNum=Integer.parseInt(request.getParameter("prev_IDNumber"));
	
	String sql="UPDATE DIRECTOR SET IDNum=?, Name=? WHERE IDNum=?";
   
   //db 연결및 JDBC 드라이버 로딩
   conn=DatabaseUtil.getConnection();
   //sql문 준비
   pstmt=conn.prepareStatement(sql);
   PrintWriter script=response.getWriter();
   pstmt.setInt(1, IDNum);
   pstmt.setString(2, Name);
   pstmt.setInt(3, prev_IDNum);
   out.println("<h1>"+"Updating to DIRECTOR table is successed"+"</h1>");
   }


   else if (function==4)
   {
    int IDNum=Integer.parseInt(request.getParameter("IDNumber"));
	String Name=request.getParameter("Name");
	int prev_IDNum=Integer.parseInt(request.getParameter("prev_IDNumber"));
	
	String sql="UPDATE PRODUCER SET IDNum=?, Name=? WHERE IDNum=?";
   
   
   //db 연결및 JDBC 드라이버 로딩
   conn=DatabaseUtil.getConnection();
   //sql문 준비
   pstmt=conn.prepareStatement(sql);
   PrintWriter script=response.getWriter();
   pstmt.setInt(1, IDNum);
   pstmt.setString(2, Name);
   pstmt.setInt(3, prev_IDNum);

   out.println("<h1>"+"Updating to PRODUCER table is successed"+"</h1>");
    }

   else
   {out.println("<h1>"+"Failed to Create"+"</h1>");}
   
   pstmt.executeUpdate();
   
   pstmt.close();
   conn.close();
   
%>