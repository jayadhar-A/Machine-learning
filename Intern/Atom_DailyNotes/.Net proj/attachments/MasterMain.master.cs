using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class MasterMain : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void home_Click(object sender, EventArgs e)
    {
        Response.Redirect("home.aspx");
    }
    protected void btnimage_Click(object sender, EventArgs e)
    {
        Response.Redirect("images.aspx");
    }
    protected void btnfrd_Click(object sender, EventArgs e)
    {
        Response.Redirect("contacts.aspx");
    }
    protected void btntime_Click(object sender, EventArgs e)
    {
        Response.Redirect("time.aspx");
    }
    protected void Button5_Click(object sender, EventArgs e)
    {
        Response.Redirect("dairy.aspx");
    }
}
