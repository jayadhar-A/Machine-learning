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

public partial class home : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["con"].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["con"].ConnectionString);
        con.Open();
        SqlDataAdapter da = new SqlDataAdapter("SELECT e.movieimage,e.moviename FROM tblmovie e INNER JOIN tbassignmovie j ON e.moviename = j.moviename where dateavailable > getdate()", con);
        DataSet ds = new DataSet();
        da.Fill(ds);
        Repeater1.DataSource = ds.Tables[0];
        Repeater1.DataBind();
        con.Close();
        
       /* con.Open();
        SqlDataAdapter da = new SqlDataAdapter("SELECT distinct(e.movieimage) FROM tblmovie e INNER JOIN tbassignmovie j ON e.moviename = j.moviename where dateavailable > getdate()", con);
       DataSet ds = new DataSet();
        da.Fill(ds);
        Repeater1.DataSource = ds.Tables[0];
        Repeater1.DataBind();
        con.Close();
        */
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        if (TextBox1.Text == "admin" && TextBox2.Text == "admin")
        {
            Response.Redirect("~/Admin/Adminhome.aspx");
        }

       con.Open();
        SqlDataAdapter da1 = new SqlDataAdapter("select type  from tbluser where name='"+TextBox1.Text+"'and password='"+TextBox2.Text+"'",con);
         DataSet ds2 = new DataSet();
        da1.Fill(ds2);
        if (ds2.Tables[0].Rows.Count > 0)
        {
            if(ds2.Tables[0].Rows[0][0].ToString() == "a")
            {
       
   
        Response.Redirect("~/Admin/Adminhome.aspx");
 
    }
          else if (ds2.Tables[0].Rows[0][0].ToString()=="u")
          {
              Session["uname"] = TextBox1.Text;
           
  
       Response.Redirect("~/user/userhome.aspx");
                
          }
      }
      else
          Response.Write("<script>alert('invalid id or password ')</script>");

      con.Close();
    


    }
}
