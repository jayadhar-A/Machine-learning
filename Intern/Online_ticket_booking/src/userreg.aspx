<%@ Page Language="C#" MasterPageFile="~/homePage.master" AutoEventWireup="true" CodeFile="userreg.aspx.cs" Inherits="user_userreg" Title="Untitled Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div style="text-align: left">
        <table width="70%">
            <tr>
                <td style="height: 26px" >
                    <asp:Label ID="Label1" runat="server" Text="Name" Font-Bold="True"></asp:Label></td>
                <td style="width: 389px; height: 26px" >
                    <asp:TextBox ID="uname" runat="server"></asp:TextBox></td>
                <td style="height: 26px" >
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="uname"
                        ErrorMessage="*"></asp:RequiredFieldValidator></td>
            </tr>
            <tr>
                <td >
                    <asp:Label ID="Label2" runat="server" Text="Password" Font-Bold="True"></asp:Label></td>
                <td style="width: 389px" >
                    <asp:TextBox ID="upwd" runat="server" TextMode="Password"></asp:TextBox></td>
                <td >
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="upwd"
                        ErrorMessage="*"></asp:RequiredFieldValidator></td>
            </tr>
            <tr>
                <td style="height: 22px" >
                    <asp:Label ID="Label3" runat="server" Text="Gender" Font-Bold="True"></asp:Label></td>
                <td style="width: 389px; height: 22px" >
                    <asp:RadioButton ID="RadioButton1" runat="server" Checked="True" GroupName="g1" Text="Male" Font-Bold="True" />
                    <asp:RadioButton ID="RadioButton2" runat="server" GroupName="g1" Text="Female" Font-Bold="True" /></td>
                <td style="height: 22px" >
                </td>
            </tr>
            <tr>
                <td style="height: 26px" >
                    <asp:Label ID="Label4" runat="server" Text="Phone No" Font-Bold="True"></asp:Label></td>
                <td style="width: 389px; height: 26px" >
                    <asp:TextBox ID="uphno" runat="server"></asp:TextBox></td>
                <td style="height: 26px" >
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="uphno"
                        ErrorMessage="*"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="uphno"
                        ErrorMessage="Enter 10 digits only" ValidationExpression="\d{10}"></asp:RegularExpressionValidator></td>
            </tr>
            <tr>
                <td style="height: 26px" >
                    <asp:Label ID="Label5" runat="server" Text="EmailId" Font-Bold="True"></asp:Label></td>
                <td style="width: 389px; height: 26px" >
                    <asp:TextBox ID="Umailid" runat="server"></asp:TextBox></td>
                <td style="height: 26px" >
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="Umailid"
                        ErrorMessage="*"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="Umailid"
                        ErrorMessage="Enter Correct Id" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator></td>
            </tr>
            <tr>
                <td >
                    <asp:Label ID="Label6" runat="server" Text="Address" Font-Bold="True"></asp:Label></td>
                <td style="width: 389px" >
                    <asp:TextBox ID="uadrs" runat="server"></asp:TextBox></td>
                <td >
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="uadrs"
                        ErrorMessage="*"></asp:RequiredFieldValidator></td>
            </tr>
            <tr>
                <td >
                    <asp:Label ID="Label7" runat="server" Text="Age" Font-Bold="True"></asp:Label></td>
                <td style="width: 389px" >
                    <asp:TextBox ID="uage" runat="server"></asp:TextBox></td>
                <td >
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="uage"
                        ErrorMessage="*"></asp:RequiredFieldValidator>
                    <asp:RangeValidator ID="RangeValidator1" runat="server" ControlToValidate="uage"
                        ErrorMessage="Enter 18-90" MaximumValue="90" MinimumValue="18" Type="Integer"></asp:RangeValidator></td>
            </tr>
            <tr>
                <td style="height: 21px" >
                </td>
                <td style="width: 389px; height: 21px" >
                </td>
                <td style="height: 21px" >
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Submit" Font-Bold="True" /></td>
                <td style="width: 389px">
                    <asp:Button ID="Button2" runat="server" CausesValidation="False" Text="Clear" Font-Bold="True" OnClick="Button2_Click" />
                    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </td>
                <td>
                </td>
            </tr>
        </table>
    </div>
</asp:Content>

