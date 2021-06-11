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
    String Name=request.getParameter("Name");
    int WinAward=Integer.parseInt(request.getParameter("WinAward"));

    String sql="INSERT INTO ACTOR (IDNum,Name,WinAward) VALUES  (?,?,?)";
   
   //db 연결및 JDBC 드라이버 로딩
   conn=DatabaseUtil.getConnection();
   //sql문 준비
   pstmt=conn.prepareStatement(sql);
   PrintWriter script=response.getWriter();
   pstmt.setInt(1, IDNum);
   pstmt.setString(2, Name);
   pstmt.setInt(3, WinAward);
   out.println("<h1>"+"Inserting to ACTOR table is successed"+"</h1>");
   }


   else if (function==2)
   {
    int Movie_IDNum=Integer.parseInt(request.getParameter("Movie_IDNumber"));
    String Title=request.getParameter("Title");
    String Genre=request.getParameter("Genre");
    int Runningtime=Integer.parseInt(request.getParameter("Runningtime"));
    int DIRECTOR_IDNum=Integer.parseInt(request.getParameter("Dir_IDNumber"));
    int PRODUCER_IDNum=Integer.parseInt(request.getParameter("Pro_IDNumber"));

       String sql="INSERT INTO MOVIE (Movie_IDNum, Title, Genre, Runningtime, 
                                    DIRECTOR_IDNum, PRODUCER_IDNum) VALUES (?,?,?,?,?,?)";
   
   //db 연결및 JDBC 드라이버 로딩
   conn=DatabaseUtil.getConnection();
   //sql문 준비
   pstmt=conn.prepareStatement(sql);
   PrintWriter script=response.getWriter();
   pstmt.setInt(1, Movie_IDNum);
   pstmt.setString(2, Title);
   pstmt.setString(3, Genre);
   pstmt.setInt(4, Runningtime);
   pstmt.setInt(5, DIRECTOR_IDNum);
   pstmt.setInt(6, PRODUCER_IDNum);
   out.println("<h1>"+"Inserting to MOVIE table is successed"+"</h1>");
    }


   else if (function==3)
   {
    int IDNum=Integer.parseInt(request.getParameter("IDNumber"));
    String Name=request.getParameter("Name");
    String sql="INSERT INTO DIRECTOR (IDNum,Name) VALUES (?,?)";
   
   //db 연결및 JDBC 드라이버 로딩
   conn=DatabaseUtil.getConnection();
   //sql문 준비
   pstmt=conn.prepareStatement(sql);
   PrintWriter script=response.getWriter();
   pstmt.setInt(1, IDNum);
   pstmt.setString(2, Name);
   out.println("<h1>"+"Inserting to DIRECTOR table is successed"+"</h1>");
   }


   else if (function==4)
   {
    int IDNum=Integer.parseInt(request.getParameter("IDNumber"));
    String Name=request.getParameter("Name");
    String sql="INSERT INTO PRODUCER (IDNum,Name) VALUES (?,?)";
   
   
   //db 연결및 JDBC 드라이버 로딩
   conn=DatabaseUtil.getConnection();
   //sql문 준비
   pstmt=conn.prepareStatement(sql);
   PrintWriter script=response.getWriter();
   pstmt.setInt(1, IDNum);
   pstmt.setString(2, Name);
   out.println("<h1>"+"Inserting to PRODUCER table is successed"+"</h1>");
    }

   else
   {out.println("<h1>"+"Failed to Create"+"</h1>");}
   
   pstmt.executeUpdate();
   
   pstmt.close();
   conn.close();
   
%>