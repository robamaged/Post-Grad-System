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
    public partial class RegisterAdmin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            String connStr = WebConfigurationManager.ConnectionStrings["PostGradSys"].ToString();
            SqlConnection conn = new SqlConnection(connStr);
            String pass = password.Text;
            String mail = adminEmail.Text;
            SqlCommand adminRegister = new SqlCommand("adminRegister", conn);
            adminRegister.CommandType = CommandType.StoredProcedure;
            adminRegister.Parameters.Add(new SqlParameter("@password", pass));
            adminRegister.Parameters.Add(new SqlParameter("@email", mail));
            SqlParameter IDout = adminRegister.Parameters.Add("@IDout", SqlDbType.Int);
            IDout.Direction = ParameterDirection.Output;
            conn.Open();
            adminRegister.ExecuteNonQuery();
            if (pass.Length == 0)
            {
                Response.Write("This field cannot be empty.");
            }
            Response.Write("Registration Successful,your Username is " + IDout.Value + ", now go to login.");
            conn.Close();
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("Login.aspx");
        }
    }
}