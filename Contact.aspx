<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="BookSwapDB.Contact" %>

<!DOCTYPE html>
<html lang="ar">
<head>
    <meta charset="utf-8" />
    <title>📞 تواصل معنا - BookSwap</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Tajawal:wght@400;700&display=swap');

        body {
            font-family: 'Tajawal', Arial, sans-serif;
            background: linear-gradient(to right, #6aa8b0, #b2e4ed);
            color: #333;
            margin: 0;
            padding: 0;
            direction: rtl;
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

        .contact-container {
            display: flex;
            justify-content: center;
            align-items: center;
            text-align: right;
            padding: 60px 20px;
        }

        .contact-box {
            background: white;
            border-radius: 10px;
            box-shadow: 0px 5px 15px rgba(0, 0, 0, 0.1);
            padding: 30px;
            width: 450px;
            position: relative;
        }

        .contact-box h2 {
            font-size: 28px;
            font-weight: bold;
            color: #004d61;
            margin-bottom: 15px;
            text-align: center;
        }

        .form-control {
            border-radius: 6px;
            text-align: right;
        }

        .btn-contact {
            padding: 12px;
            font-size: 18px;
            font-weight: bold;
            background: linear-gradient(to right, #ff7e5f, #feb47b);
            color: white;
            border: none;
            border-radius: 6px;
            cursor: pointer;
            transition: background 0.3s ease-in-out, transform 0.2s ease-in-out;
            width: 100%;
        }

        .btn-contact:hover {
            background: linear-gradient(to right, #feb47b, #ff7e5f);
            transform: scale(1.05);
        }

        .footer {
            background: rgba(0, 0, 0, 0.1);
            padding: 15px;
            text-align: center;
            color: white;
            font-size: 14px;
            border-radius: 10px 10px 0 0;
            margin-top: 40px;
        }

        .contact-info {
            background: rgba(0, 0, 0, 0.05);
            padding: 15px;
            border-radius: 8px;
            margin-top: 20px;
            text-align: center;
        }

        .contact-info p {
            font-size: 16px;
            margin: 5px 0;
            color: #004d61;
            font-weight: bold;
        }

        .contact-info a {
            color: #ff7e5f;
            text-decoration: none;
            font-weight: bold;
        }

        .contact-info a:hover {
            text-decoration: underline;
        }

    </style>
</head>
<body>

    <!-- ✅ القائمة العلوية -->
    <div class="navbar">
        <a href="Home.aspx"> الصفحة الرئيسية 🏠</a>
        <a href="Books.aspx"> الكتب المتاحة 📚</a>
        <a href="AddBook.aspx"> إضافة كتاب ➕</a>
        <a href="MyBooks.aspx"> كتبي 📖</a>
        <a href="Contact.aspx"> تواصل معنا 📞</a>
    </div>

    <form id="form1" runat="server">
        <div class="contact-container">
            <div class="contact-box">
                <h2> تواصل معنا 📞</h2>

                <div class="mb-3">
                    <label class="form-label"> الاسم الكامل 👤:</label>
                    <asp:TextBox ID="txtFullName" runat="server" CssClass="form-control" placeholder="أدخل اسمك الكامل"></asp:TextBox>
                </div>

                <div class="mb-3">
                    <label class="form-label"> البريد الإلكتروني 📧:</label>
                    <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" placeholder="example@email.com"></asp:TextBox>
                </div>

                <div class="mb-3">
                    <label class="form-label"> رسالتك 📝:</label>
                    <asp:TextBox ID="txtMessage" runat="server" CssClass="form-control" TextMode="MultiLine" Rows="4" placeholder="اكتب رسالتك هنا..."></asp:TextBox>
                </div>

                <asp:Button ID="btnSend" runat="server" CssClass="btn-contact" Text="📨 إرسال الرسالة" OnClick="btnSend_Click" />

                <asp:Label ID="lblMessage" runat="server" CssClass="text-success d-block mt-3"></asp:Label>

                <!-- ✅ معلومات التواصل بشكل مرتب داخل نفس الصندوق -->
                <div class="contact-info">
                    <p>📞 الهاتف: +966 534 546 426</p>
                    <p>📧 الدعم الفني: <a href="mailto:teef122@icloud.com">teef122@icloud.com</a></p>
                </div>

            </div>
        </div>
    </form>

    <div class="footer">
        <p>© 2025 BookSwap | جميع الحقوق محفوظة.</p>
    </div>

</body>
</html>