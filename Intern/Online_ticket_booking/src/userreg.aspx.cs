using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Data.SqlClient;
public partial class user_userreg : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["con"].ConnectionString);

    protected void Button1_Click(object sender, EventArgs e)
    { string gen="";
        if(RadioButton1.Checked)
            gen=RadioButton1.Text;
        else
            gen=RadioButton2.Text;
        con.Open();
        SqlCommand cmd = new SqlCommand("insert into tbluser values('" + uname.Text + "','" + upwd.Text + "','" + gen + "','" + uphno + "','" + Umailid.Text + "','" + uadrs.Text + "'," + Convert.ToInt16(uage.Text)+",'u')", con);
        if (cmd.ExecuteNonQuery() > 0)
            Response.Write("<script>alert('Inserted')</script>");
        else

            Response.Write("<script>alert('Error')</script>");

        uname.Text = "";
        upwd.Text = "";
        uphno.Text = "";
        Umailid.Text = "";
        uadrs.Text = "";
        uage.Text = "";
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        uname.Text = "";
        upwd.Text = "";
        uphno.Text = "";
        Umailid.Text = "";
        uadrs.Text = "";
        uage.Text = "";

        
    }
}
