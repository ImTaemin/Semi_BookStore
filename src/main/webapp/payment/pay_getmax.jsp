<%@page import="db.OrderDAO"%>
<%@page import="db.OrderDTO"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
 <script src="https://code.jquery.com/jquery-3.5.0.js"></script>
 <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <link href="https://fonts.googleapis.com/css2?
family=Dokdo&family=Gaegu&family=Gugi&family=Nanum+Pen+Script&display=swap" rel="stylesheet">

</head>
<body>

<%
	request.setCharacterEncoding("utf-8");
	
	OrderDTO dto=new OrderDTO();
	dto.setPay_method(request.getParameter("pay_method"));
	dto.setBook_price(Integer.parseInt(request.getParameter("book_price")));
	dto.setRecipient(request.getParameter("recipient"));
	dto.setLocation(request.getParameter("location"));
	
	OrderDAO dao=new OrderDAO();
	
	dao.insertOrder(dto);
	
	String order_id=dao.getMaxnum();
	
	response.sendRedirect("../index.jsp?main=payment/pay_endform.jsp?order_id="+order_id);
%>

</body>
</html>