<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="BookDetails.aspx.cs" Inherits="BookSwapDB.BookDetails" %>

<!DOCTYPE html>
<html lang="ar">
<head>
    <meta charset="utf-8" />
    <title>تفاصيل الكتاب</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f9f9f9;
            text-align: center;
        }
        .book-details-container {
            width: 50%;
            margin: auto;
            background: white;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
        }
        .book-title {
            font-size: 24px;
            font-weight: bold;
            color: #333;
        }
        .book-info {
            font-size: 18px;
            margin: 10px 0;
        }
        .btn-back {
            margin-top: 20px;
            padding: 10px 20px;
            background-color: #007BFF;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }
        .btn-back:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="book-details-container">
            <p class="book-title"><asp:Label ID="lblTitle" runat="server"></asp:Label></p>
            <p class="book-info">📖 <strong>المؤلف:</strong> <asp:Label ID="lblAuthor" runat="server"></asp:Label></p>
            <p class="book-info">📌 <strong>حالة الكتاب:</strong> <asp:Label ID="lblCondition" runat="server"></asp:Label></p>
            <p class="book-info">📝 <strong>الوصف:</strong> <asp:Label ID="lblDescription" runat="server"></asp:Label></p>
            <asp:Button ID="btnBack" runat="server" CssClass="btn-back" Text="⬅ رجوع" OnClick="btnBack_Click" />
        </div>
    </form>
</body>
</html>