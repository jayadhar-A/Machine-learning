<%@ Page Language="C#" MasterPageFile="~/homePage.master" AutoEventWireup="true" CodeFile="about us.aspx.cs" Inherits="user_about_us" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<meta http-equiv="refresh" content="2" >
    <div style="text-align: left">
        
                <table width="90%">
                    <tr >
                        <td colspan="3" style="height: 21px">
                            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                            &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;
                            <asp:Label ID="Label1" runat="server" Text="About Us" BackColor="#FF9966" Font-Bold="True" Font-Italic="True" Font-Names="Arial TUR" Font-Underline="True" ForeColor="#009933"></asp:Label></td>
                    </tr>
                </table>
            </div>
    <div style="text-align: center">
        <table>
            <tr>
                <td style="width: 329px; text-align: left">
                    <asp:AdRotator ID="AdRotator1" runat="server" AdvertisementFile="~/XMLFile.xml" Height="314px"
                        Width="317px" />
                </td>
                <td style="width: 634px; text-align: left">
                    <strong>MovieWorld is the flagship product of Time Vision Infotech. Till now PA or Personal
                        Assitants have been a luxoury afforded by limited corporate heads. Now, Move World
                        promises that those are days of the past. Within few months, Movie World aspires
                        to be a complete virtual personal assistant to all your queries and needs. Build
                        up with a view to satisfying all its users, our distinction lies in delivering quick
                        solutions to all your queries. It will help you plan and schedule all your lesuire
                        as well as day to day activities - a web site or an assitant for every day reference.
                        We just wont answer your query but will walk the extra mile to help you acquire
                        the object of query be it The movie tickets Booking or canceling. we are currently
                        running these few services, but we dont want to limit ourselves only to these services.</strong></td>
                <td style="width: 281px; text-align: left">
                    <img src="images/Kick.jpg" style="width: 308px; height: 335px" /></td>
            </tr>
        </table>
    </div>
     
</asp:Content>

