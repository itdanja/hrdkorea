<%@page import="DAO.Dao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
   <%
   		request.setCharacterEncoding("UTF-8");
   		String sno = request.getParameter("sno");
   		String ekor = request.getParameter("ekor");
   		String emath = request.getParameter("emath");
   		String eeng = request.getParameter("eeng");
   		String ehist = request.getParameter("ehist");
   		Dao dao = new Dao();
   		boolean result = dao.examinput(sno, ekor, emath, eeng, ehist);
   		response.sendRedirect("examinput.jsp");
   %>
