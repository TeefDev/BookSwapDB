<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddBook.aspx.cs" Inherits="BookSwapDB.AddBook" %>

<!DOCTYPE html>
<html lang="ar">
<head>
    <meta charset="utf-8" />
    <title>📚 إضافة كتاب</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Tajawal:wght@400;700&display=swap');

        body {
            font-family: 'Tajawal', Arial, sans-serif;
            background: linear-gradient(to right, #6aa8b0, #b2e4ed);
            color: #333;
            text-align: right;
            direction: rtl;
            margin: 0;
            padding: 0;
            display: flex;
            flex-direction: column;
            min-height: 100vh;
        }
        .navbar {
            background: rgba(255, 255, 255, 0.2);
            padding: 15px;
            border-radius: 0 0 10px 10px;
            box-shadow: 0px 5px 10px rgba(0, 0, 0, 0.2);
            display: flex;
            justify-content: center;
            gap: 15px;
        }
        .navbar a {
            color: white;
            text-decoration: none;
            padding: 12px 20px;
            font-size: 18px;
            font-weight: bold;
            transition: background 0.3s ease-in-out, transform 0.2s ease-in-out;
            border-radius: 5px;
        }
        .navbar a:hover {
            background: rgba(255, 255, 255, 0.3);
            transform: scale(1.05);
        }
        .container {
            flex-grow: 1;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            text-align: right;
            padding: 40px 15px;
            width: 50%;
            margin: auto;
        }
        .form-control {
            font-size: 14px;
            padding: 8px;
            width: 100%;
            text-align: right;
        }
        .btn-primary {
            background: linear-gradient(to right, #ff7e5f, #feb47b);
            border: none;
            padding: 14px 35px;
            font-size: 18px;
            font-weight: bold;
            border-radius: 8px;
            cursor: pointer;
            transition: background 0.3s ease-in-out, transform 0.2s ease-in-out;
        }
        .btn-primary:hover {
            background: linear-gradient(to right, #feb47b, #ff7e5f);
            transform: scale(1.1);
        }
        .footer {
            background: rgba(0, 0, 0, 0.1);
            padding: 15px;
            text-align: center;
            color: white;
            font-size: 14px;
            border-radius: 10px 10px 0 0;
            margin-top: auto;
        }
    </style>
</head>
<body>
    <div class="navbar">
        <a href="Home.aspx">الصفحة الرئيسية 🏠</a>
        <a href="Books.aspx">الكتب المتاحة 📚</a>
        <a href="AddBook.aspx">إضافة كتاب ➕</a>
        <a href="MyBooks.aspx">كتبي 📖</a>
        <a href="Contact.aspx">تواصل معنا 📞</a>
    </div>

    <form id="form1" runat="server">
        <div class="container">
            <label> عنوان الكتاب📖:</label>
            <asp:TextBox ID="txtTitle" runat="server" CssClass="form-control" required></asp:TextBox>

            <label> المؤلف✍️:</label>
            <asp:TextBox ID="txtAuthor" runat="server" CssClass="form-control" required></asp:TextBox>

            <label> وصف الكتاب📝:</label>
            <asp:TextBox ID="txtDescription" runat="server" CssClass="form-control" TextMode="MultiLine"></asp:TextBox>

            <label> حالة الكتاب🔍:</label>
            <asp:DropDownList ID="ddlBookCondition" runat="server" CssClass="form-control">
                <asp:ListItem Text="اختر" Value="" Selected="True"></asp:ListItem>
                <asp:ListItem Text="جديد" Value="جديد"></asp:ListItem>
                <asp:ListItem Text="مستعمل" Value="مستعمل"></asp:ListItem>
            </asp:DropDownList>

            <label> الجامعة 🏛:</label>
            <asp:TextBox ID="txtUniversity" runat="server" CssClass="form-control" required></asp:TextBox>

            <label> التخصص🎓:</label>
            <asp:TextBox ID="txtMajor" runat="server" CssClass="form-control" required></asp:TextBox>

            <label> البيع أو التبادل🔄:</label>
            <asp:DropDownList ID="ddlExchangeOption" runat="server" CssClass="form-control" AutoPostBack="true" OnSelectedIndexChanged="ddlExchangeOption_SelectedIndexChanged">
                <asp:ListItem Text="اختر" Value="" Selected="True"></asp:ListItem>
                <asp:ListItem Text="للبيع" Value="بيع"></asp:ListItem>
                <asp:ListItem Text="للتبادل" Value="تبادل"></asp:ListItem>
            </asp:DropDownList>

            <label> السعر (ريال)💰:</label>
            <asp:TextBox ID="txtPrice" runat="server" CssClass="form-control" TextMode="Number"></asp:TextBox>

            <label> صورة الغلاف🖼:</label>
            <asp:FileUpload ID="fileUploadImage" runat="server" CssClass="form-control" />

            <asp:Button ID="btnSubmit" runat="server" CssClass="btn btn-primary mt-3" Text="📥 إضافة الكتاب" OnClick="btnSubmit_Click" />
            <asp:Label ID="lblMessage" runat="server" ForeColor="Red" CssClass="mt-3"></asp:Label>
        </div>
    </form>

    <div class="footer">
        <p>© 2025 BookSwap | جميع الحقوق محفوظة.</p>
    </div>
</body>
</html>