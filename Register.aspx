<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="BookSwapDB.Register" %>

<!DOCTYPE html>
<html lang="ar">
<head>
    <meta charset="utf-8" />
    <title>📌 تسجيل حساب جديد - BookSwap</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Tajawal:wght@400;700&display=swap');

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

        .register-container {
            flex-grow: 1;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            text-align: center;
            padding: 50px 20px;
        }

        .register-box {
            background: white;
            border-radius: 10px;
            box-shadow: 0px 5px 15px rgba(0, 0, 0, 0.1);
            padding: 30px;
            width: 350px;
            text-align: right;
        }

        .register-box h2 {
            font-size: 28px;
            font-weight: bold;
            color: #004d61;
            margin-bottom: 15px;
        }

        .form-control {
            border-radius: 6px;
        }

        .btn-register {
            padding: 12px;
            font-size: 18px;
            font-weight: bold;
            background: linear-gradient(to right, #ff7e5f, #feb47b);
            color: white;
            border: none;
            border-radius: 6px;
            cursor: pointer;
            transition: background 0.3s ease-in-out, transform 0.2s ease-in-out;
        }

        .btn-register:hover {
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
            margin-top: auto;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="register-container">
            <div class="register-box">
                <h2>📌 تسجيل حساب جديد</h2>

                <div class="mb-3">
                    <label class="form-label">👤 الاسم الكامل</label>
                    <asp:TextBox ID="txtFullName" runat="server" CssClass="form-control" placeholder="أدخل اسمك الكامل"></asp:TextBox>
                </div>

                <div class="mb-3">
                    <label class="form-label">📧 البريد الإلكتروني</label>
                    <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" placeholder="example@email.com"></asp:TextBox>
                </div>

                <div class="mb-3">
                    <label class="form-label">🔒 كلمة المرور</label>
                    <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control" TextMode="Password"></asp:TextBox>
                </div>

                <asp:Button ID="btnRegister" runat="server" CssClass="btn-register w-100" Text="✅ تسجيل الحساب" OnClick="btnRegister_Click" />

                <div class="text-center mt-3">
                    <a href="Login.aspx">🔑 لديك حساب؟ سجل الدخول</a>
                </div>

                <asp:Label ID="lblMessage" runat="server" CssClass="text-danger d-block mt-3"></asp:Label>
            </div>
        </div>
    </form>

    <div class="footer">
        <p>© 2025 BookSwap | جميع الحقوق محفوظة.</p>
    </div>
</body>
</html>