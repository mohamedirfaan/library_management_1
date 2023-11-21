<%@page import="org.apache.commons.io.FilenameUtils"%>
<%@ page import="java.io.*, java.util.*" %>
<%@ page import="javax.servlet.http.*" %>
<%@ page import="org.apache.commons.fileupload.*" %>
<%@ page import="org.apache.commons.fileupload.disk.*" %>
<%@ page import="org.apache.commons.fileupload.servlet.*" %>
<%@ page import="org.apache.commons.io.output.*" %>


<%
   File file;
   int maxFileSize = 5000 * 1024;
   int maxMemSize = 5000 * 1024;
   ServletContext context = pageContext.getServletContext();
   System.out.println(context);
   String filePath = context.getInitParameter("file-upload");

   String uploadDirectory = getServletContext().getRealPath("/images"); // Get the absolute path

   if (uploadDirectory == null) {
       // Handle the case where the upload directory is not properly configured
       out.println("Upload directory is not configured.");
       return;
   }

   // Verify the content type
   String contentType = request.getContentType();

   if (contentType != null && contentType.indexOf("multipart/form-data") >= 0) {
      DiskFileItemFactory factory = new DiskFileItemFactory();
      factory.setSizeThreshold(maxMemSize);
      factory.setRepository(new File(uploadDirectory));

      ServletFileUpload upload = new ServletFileUpload(factory);
      upload.setSizeMax(maxFileSize);

      try { 
         List<FileItem> fileItems = upload.parseRequest(request);

         // Process the uploaded file items
         for (FileItem fi : fileItems) {
            if (!fi.isFormField()) {
               String fileName = FilenameUtils.getName(fi.getName()); // Get the sanitized file name
               File uploadedFile = new File(uploadDirectory, fileName);
               fi.write(uploadedFile);
               out.println("Uploaded Filename: " + fileName + "<br>");
            }
         }
      } catch (Exception ex) {
         ex.printStackTrace(); // Handle the exception properly (e.g., log it)
         out.println("Error uploading file.");
      }
   } else {
      out.println("No file uploaded");
   }
%>
