

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*,db.Dbutil,java.text.DateFormat,java.util.Locale,java.util.Calendar,java.text.SimpleDateFormat" %>
<%
    Connection con = null;
    Statement st = null;    
    String formType = request.getParameter("formType");
    DateFormat dateFormat;
    if ("formCheckoutCreate".  equals(formType)) {
        String user_id=request.getParameter("user_id");
        String item_id=request.getParameter("item_id");
        String package_id=request.getParameter("package_id");  
        
        dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        java.util.Date today=new java.util.Date();
        String date=dateFormat.format(today).toString();
        
        String price=request.getParameter("amount");
        String paytype=request.getParameter("paytype");
        String duration=request.getParameter("duration");
        float amount=Float.parseFloat(price)*Float.parseFloat(duration);        
        String address=request.getParameter("address");
        
        Calendar calendar = Calendar.getInstance();
        calendar.setTime(today);
        calendar.add(Calendar.DAY_OF_MONTH, Integer.parseInt(duration));
        java.util.Date newDate = calendar.getTime();
        
        String due_date=dateFormat.format(newDate).toString();
        String status="Order Placed";  
        
        
        try{
            con = Dbutil.conn();
            st = con.createStatement();
            //String qur = "insert into orders(user_id,item_id,package_id,date,amount,paytype,duration,due_date,status) values('"+user_id+"','"+item_id+"','"+package_id+"','"+date+"','"+amount+"','"+paytype+"','"+duration+"','"+due_date+"','"+status+"')";
            String qur = "insert into orders(user_id,item_id,package_id,date,amount,paytype,duration,due_date,status,address) values('"+user_id+"','"+item_id+"','"+package_id+"','"+date+"','"+amount+"','"+paytype+"','"+duration+"','"+due_date+"','"+status+"','"+address+"')";
            int i = st.executeUpdate(qur);
            if(i > 0)
            {
                request.setAttribute("successMessage", "Orer Placed successfully.");
                request.getRequestDispatcher("orders.jsp").forward(request, response);
            }
        }
        catch(Exception ex)
        {
            request.setAttribute("errorMessage", "Error info : " +ex);
            request.getRequestDispatcher("checkout.jsp").forward(request, response);
        }
    } 
%>
    
    