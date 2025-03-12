<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Invoice</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/cartstyle.css">
</head>
<body>

    <div class="invoice-container">
        <h2>Your Invoice</h2>
        <p>Click the button below to generate and download your invoice.</p>
        <a href="<%=request.getContextPath()%>/InvoiceServlet" class="btn">Download Invoice (PDF)</a>
    </div>

</body>
</html>