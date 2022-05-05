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
    public partial class RegisterSupervisor : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void TextBox1_TextChanged(object sender, EventArgs e)
        {

        }

        protected void Button1_Click3(object sender, EventArgs e)
        {
            String connStr = WebConfigurationManager.ConnectionStrings["PostGradSys"].ToString();
            SqlConnection conn = new SqlConnection(connStr);
            String firstName = firstname.Text;
            String lastName = lastname.Text;
            String pass = password.Text;
            String fac = faculty.Text;
            String mail = email.Text;
            SqlCommand supervisorRegister = new SqlCommand("supervisorRegister", conn);
            supervisorRegister.CommandType = CommandType.StoredProcedure;
            supervisorRegister.Parameters.Add(new SqlParameter("@first_name", firstName));
            supervisorRegister.Parameters.Add(new SqlParameter("@last_name", lastName));
            supervisorRegister.Parameters.Add(new SqlParameter("@password", pass));
            supervisorRegister.Parameters.Add(new SqlParameter("@faculty", fac));
            supervisorRegister.Parameters.Add(new SqlParameter("@email", mail));
            SqlParameter IDout = supervisorRegister.Parameters.Add("@IDout", SqlDbType.Int);
            IDout.Direction = ParameterDirection.Output;
            conn.Open();
            supervisorRegister.ExecuteNonQuery();
            Response.Write("Registration Successful,your Username is " + IDout.Value + ", now go to login.");
            conn.Close();
        }

        protected void Button1_Click4(object sender, EventArgs e)
        {
            Response.Redirect("Login.aspx");
        }
    }
}