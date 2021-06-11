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
    int IDNum=Integer.parseInt(request.getParameter("IDNumber"));

    String sql="DELETE FROM ACTOR where IDNum=?";
   
   //db 연결및 JDBC 드라이버 로딩
   conn=DatabaseUtil.getConnection();
   //sql문 준비
   pstmt=conn.prepareStatement(sql);
   PrintWriter script=response.getWriter();
   pstmt.setInt(1, IDNum);
   out.println("<h1>"+"Deleting to ACTOR table is successed"+"</h1>");
   }


   else if (function==2)
   {
    int Movie_IDNum=Integer.parseInt(request.getParameter("Movie_IDNumber"));

       String sql="DELETE FROM ACTOR where Movie_IDNum=?";
   
   //db 연결및 JDBC 드라이버 로딩
   conn=DatabaseUtil.getConnection();
   //sql문 준비
   pstmt=conn.prepareStatement(sql);
   PrintWriter script=response.getWriter();
   pstmt.setInt(1, Movie_IDNum);
   out.println("<h1>"+"Deleting to MOVIE table is successed"+"</h1>");
    }


   else if (function==3)
   {
    int IDNum=Integer.parseInt(request.getParameter("IDNumber"));
    String Name=request.getParameter("Name");
    String sql="DELETE FROM DIRECTOR where IDNum=?";
   
   //db 연결및 JDBC 드라이버 로딩
   conn=DatabaseUtil.getConnection();
   //sql문 준비
   pstmt=conn.prepareStatement(sql);
   PrintWriter script=response.getWriter();
   pstmt.setInt(1, IDNum);
   out.println("<h1>"+"Deleting to DIRECTOR table is successed"+"</h1>");
   }


   else if (function==4)
   {
    int IDNum=Integer.parseInt(request.getParameter("IDNumber"));
    String Name=request.getParameter("Name");
    String sql="DELETE FROM PRODUCER where IDNum=?";
   
   
   //db 연결및 JDBC 드라이버 로딩
   conn=DatabaseUtil.getConnection();
   //sql문 준비
   pstmt=conn.prepareStatement(sql);
   PrintWriter script=response.getWriter();
   pstmt.setInt(1, IDNum);
   out.println("<h1>"+"Deleting to PRODUCER table is successed"+"</h1>");
    }

   else
   {out.println("<h1>"+"Failed to Create"+"</h1>");}
   
   pstmt.executeUpdate();
   
   pstmt.close();
   conn.close();
   
%>