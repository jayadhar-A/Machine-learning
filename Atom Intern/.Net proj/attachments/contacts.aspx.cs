using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

public partial class contacts : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button6_Click(object sender, EventArgs e)
    {
        string name = TextBox1.Text;
        string number = TextBox2.Text;
        string email = TextBox3.Text;
        string address = TextBox4.Text;
        SqlConnection con = new SqlConnection("Data Source=.\\SQLEXPRESS;AttachDbFilename=C:\\Users\\jayadhar\\Documents\\keerthi.mdf;Integrated Security=True;Connect Timeout=30;User Instance=True");
        con.Open();
        SqlCommand cmd=new SqlCommand("insert into keerthi_contacts values(@name,@number,@email,@address)",con);
        cmd.Parameters.AddWithValue("@name",name);
        cmd.Parameters.AddWithValue("@number", number);
        cmd.Parameters.AddWithValue("@email", email);
        cmd.Parameters.AddWithValue("@address", address);
        int t = cmd.ExecuteNonQuery();
        if (t == 1)
        {
            Response.Redirect("contacts.aspx");
        }
        else {
            Response.Write("contact unable to enter check database");
        }
        con.Close();
    }
}