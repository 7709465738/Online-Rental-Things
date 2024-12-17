
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*,db.Dbutil,java.io.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%            //Code to insert data in mysql database vegitem table
            try {
                String saveFile = "";
                String contentType = request.getContentType();
                if ((contentType != null) && (contentType.indexOf("multipart/form-data") >= 0)) {
                    DataInputStream in = new DataInputStream(request.getInputStream());
                    int formDataLength = request.getContentLength();
                    byte dataBytes[] = new byte[formDataLength];
                    int byteRead = 0;
                    int totalBytesRead = 0;
                    while (totalBytesRead < formDataLength) {
                        byteRead = in.read(dataBytes, totalBytesRead, formDataLength);
                        totalBytesRead += byteRead;
                    }
                    String file = new String(dataBytes,"CP1256");
                    saveFile = file.substring(file.indexOf("filename=\"") + 10);
                    saveFile = saveFile.substring(0, saveFile.indexOf("\n"));
                    saveFile = saveFile.substring(saveFile.lastIndexOf("\\") + 1, saveFile.indexOf("\""));
                    int lastIndex = contentType.lastIndexOf("=");
                    String boundary = contentType.substring(lastIndex + 1, contentType.length());
                    int pos;
                    pos = file.indexOf("filename=\"");
                    pos = file.indexOf("\n", pos) + 1;
                    pos = file.indexOf("\n", pos) + 1;
                    pos = file.indexOf("\n", pos) + 1;
                    int boundaryLocation = file.indexOf(boundary, pos) - 4;
                    int startPos = ((file.substring(0, pos)).getBytes("CP1256")).length;
                    int endPos = ((file.substring(0, boundaryLocation)).getBytes("CP1256")).length;
                    File ff = new File("D:/Java/rent-thing/web/img/categories/" + saveFile);
                    FileOutputStream fileOut = new FileOutputStream(ff);
                    fileOut.write(dataBytes, startPos, (endPos - startPos));
                    fileOut.flush();
                    fileOut.close();

                    Connection cn = null;
                    Statement st = null;

                    cn = Dbutil.conn();
                    st = cn.createStatement();
                    String path = "categories/" + saveFile;
                    String qur_add_img = "update category set image = '" + path + "' where id = '" + session.getAttribute("cat_id") + "'";
                    int i = st.executeUpdate(qur_add_img);
                    out.print(i);
                    if (i == 1) {
                        response.sendRedirect("category.jsp");
                    } else {
                        out.print("Failure");
                    }
                }
            } catch (Exception e) {
                out.print(e);
            }
        %>
    </body>
</html>
