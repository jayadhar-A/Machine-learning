using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

public partial class time : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button6_Click(object sender, EventArgs e)
    {
        string data = TextBox1.Text;
        SqlConnection con = new SqlConnection("Data Source=.\\SQLEXPRESS;AttachDbFilename=C:\\Users\\jayadhar\\Documents\\new.mdf;Integrated Security=True;Connect Timeout=30;User Instance=True");
        con.Open();
        SqlCommand cmd = new SqlCommand("insert into data_table values(@data)",con);
        cmd.Parameters.AddWithValue("@data", data);
        int x = cmd.ExecuteNonQuery();
        if (x == 1)
        {

            Response.Redirect("time.aspx");
        }
        con.Close();

    }
}