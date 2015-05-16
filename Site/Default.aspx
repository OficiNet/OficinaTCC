<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Site.Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>OficiNet</title>

    <link href="http://fonts.googleapis.com/css?family=Source+Sans+Pro:200,300,400,600,700,900" rel="stylesheet" />
    <link href="../Layout/css/default.css" rel="stylesheet" />
    <link href="../Layout/css/fonts.css" rel="stylesheet" />
    <link href="../Layout/css/bootstrap.css" rel="stylesheet" />
</head>
<body>
    <div id="header-wrapper">
        <div id="header" class="container">
            <div id="logo">
                <%--<span class="icon icon-cog"></span>--%>
                <h1><a href="#">OficiNet</a></h1>
                <span>Acesso ao sistema</span>
                <br />
                <br />
                <a class="button" href="/Pages/Login.aspx" accesskey="1" title="">Administrador</a>
                <br />
                <br />
                <a class="button" href="#" accesskey="2" title="">Cliente</a>
            </div>
            <div id="triangle-up"></div>
        </div>
    </div>
</body>
</html>
