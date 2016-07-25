<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="RecoverPassword.aspx.cs" Inherits="RecoverPassword" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <asp:PasswordRecovery ID="PasswordRecovery1" runat="server" OnSendingMail="PasswordRecovery1_SendingMail" ForeColor="Chocolate" BorderColor="Silver"
         BorderWidth="5" BackColor="Tan" Font-Bold="true" Font-Size="Medium"></asp:PasswordRecovery>


</asp:Content>

