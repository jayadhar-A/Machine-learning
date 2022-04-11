<%@ Page Language="C#" MasterPageFile="~/homePage.master" AutoEventWireup="true" CodeFile="home.aspx.cs" Inherits="home" Title="Untitled Page" %>

<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">
 <marquee><asp:Repeater id="Repeater1" runat="server">
  <ItemTemplate>
        <asp:Image Width ="200" Height ="200" ID="Image1" BorderWidth="5" BorderColor="AppWorkspace" runat="server" ImageUrl ='<%#String.Format("Admin/images/{0}",Eval("movieimage")) %>'/>
    </ItemTemplate>
    </asp:Repeater> </marquee>&nbsp;&nbsp;<BR /><asp:Label id="Label1" runat="server" Text="Username"></asp:Label>&nbsp;&nbsp;&nbsp;<asp:TextBox id="TextBox1" runat="server"></asp:TextBox> <asp:RequiredFieldValidator id="RequiredFieldValidator1" runat="server" ErrorMessage="*" ControlToValidate="TextBox1"></asp:RequiredFieldValidator><BR /><asp:Label id="Label2" runat="server" Text="Password"></asp:Label>&nbsp;&nbsp; <asp:TextBox id="TextBox2" runat="server" TextMode="Password"></asp:TextBox>&nbsp;&nbsp;<asp:RequiredFieldValidator id="RequiredFieldValidator2" runat="server" ErrorMessage="*" ControlToValidate="TextBox2"></asp:RequiredFieldValidator>&nbsp;&nbsp; <asp:Button id="Button1" runat="server" Text="SignIn" OnClick="Button1_Click"></asp:Button>
    <asp:HyperLink ID="HyperLink1" runat="server" Font-Bold="True" Font-Italic="True"
        NavigateUrl="~/userreg.aspx">SignUp</asp:HyperLink>
    
</asp:Content>

