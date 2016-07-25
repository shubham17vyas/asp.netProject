<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="CreateUser.aspx.cs" Inherits="CreateUser"  Debug="true"%>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">




    <asp:CreateUserWizard ID="CreateUserWizard1" runat="server" BorderColor="Silver"
                 BackColor="Tan" BorderWidth="5" Font-Bold="true" Font-Size="Medium" 
        ContinueDestinationPageUrl="~/Default.aspx" ForeColor="Maroon" OnCreatedUser="CreateUserWizard1_CreatedUser" Height="500">
        <WizardSteps>
            <asp:CreateUserWizardStep ID="CreateUserWizardStep1" runat="server">
            </asp:CreateUserWizardStep>
            <asp:CompleteWizardStep ID="CompleteWizardStep1" runat="server">
            </asp:CompleteWizardStep>
        </WizardSteps>
    </asp:CreateUserWizard>







</asp:Content>

