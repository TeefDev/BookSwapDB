<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SendMessage.aspx.cs" Inherits="BookSwapDB.SendMessage" %>

<!DOCTYPE html>
<html lang="ar">
<head>
    <meta charset="utf-8" />
    <title>✉️ إرسال رسالة</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
    <style>
        body {
            font-family: 'Tajawal', Arial, sans-serif;
            background: linear-gradient(to right, #6aa8b0, #b2e4ed);
            color: #333;
            text-align: center;
            margin: 0;
            padding: 0;
            display: flex;
            flex-direction: column;
            min-height: 100vh;
        }

        .container {
            flex-grow: 1;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            text-align: center;
            padding: 50px 20px;
        }

        .form-control {
            font-size: 16px;
            padding: 10px;
            width: 100%;
            max-width: 400px;
        }

        .btn-primary {
            background: #ff7e5f;
            color: white;
            border: none;
            padding: 12px 20px;
            font-size: 18px;
            border-radius: 8px;
            transition: background 0.3s ease-in-out, transform 0.2s ease-in-out;
        }

        .btn-primary:hover {
            background: #e64a3b;
            transform: scale(1.05);
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

    <!-- ✅ التأكد من أن جميع العناصر داخل فورم -->
    <form id="form1" runat="server">
        <div class="container">
            <h2>✉️ إرسال رسالة</h2>

            <label>📩 نص الرسالة:</label>
            <asp:TextBox ID="txtMessage" runat="server" CssClass="form-control" TextMode="MultiLine" Rows="5"></asp:TextBox>

            <asp:HiddenField ID="hfReceiverId" runat="server" />
            <asp:HiddenField ID="hfBookId" runat="server" />

            <asp:Button ID="btnSend" runat="server" CssClass="btn btn-primary mt-3" Text="📤 إرسال" OnClick="btnSend_Click" />
        </div>
    </form>

    <div class="footer">
        <p>© 2025 BookSwap | جميع الحقوق محفوظة.</p>
    </div>

</body>
</html>