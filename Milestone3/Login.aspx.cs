using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Milestone3
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {

        }

        protected void login(object sender, EventArgs e)
        {
            String connStr = WebConfigurationManager.ConnectionStrings["PostGradSys"].ToString();
            SqlConnection conn = new SqlConnection(connStr);
            int id = Int16.Parse(Username.Text);
            String pass = Password.Text;
            SqlCommand loginproc = new SqlCommand("userLogin", conn);
            loginproc.CommandType = CommandType.StoredProcedure;
            loginproc.Parameters.Add(new SqlParameter("@id", id));
            loginproc.Parameters.Add(new SqlParameter("@password", pass));
            Session["publicId"] = id;
            SqlParameter success = loginproc.Parameters.Add("@success", SqlDbType.Int);
            SqlParameter type = loginproc.Parameters.Add("@type", SqlDbType.Int);
            success.Direction = ParameterDirection.Output;
            type.Direction = ParameterDirection.Output;
            conn.Open();
            loginproc.ExecuteNonQuery();
            conn.Close();

            if(success.Value.ToString()=="1")
            {
                if(type.Value.ToString() == "0")
                {
                    Response.Redirect(string.Format("GucianNonGucian.aspx",id));
                }
                else if(type.Value.ToString() == "1")
                {
                    Response.Redirect(string.Format("Admin.aspx",id));
                }
                else if (type.Value.ToString() == "2")
                {
                    Response.Redirect(string.Format("SupervisorHome.aspx",id));
                }
                else if (type.Value.ToString() == "3")
                {
                    Response.Redirect(string.Format("ExaminerHome.aspx",id));
                }
            }
            else
            {
                Response.Write("Invalid username or password.");
                Username.Text= string.Empty;
                Password.Text = string.Empty;
            }
        }

        protected void Button1_Click1(object sender, EventArgs e)
        {
            Response.Redirect("RegisterStudent.aspx");
        }

        protected void Button1_Click2(object sender, EventArgs e)
        {
            Response.Redirect("RegisterSupervisor.aspx");
        }

        protected void Button1_Click3(object sender, EventArgs e)
        {
            Response.Redirect("RegisterExaminer.aspx");
        }

        protected void Button1_Click4(object sender, EventArgs e)
        {
            Response.Redirect("RegisterAdmin.aspx");
        }
    }
}