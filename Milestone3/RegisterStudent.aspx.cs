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
    public partial class Register : System.Web.UI.Page
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
            String add = address.Text;
            SqlCommand studentRegister = new SqlCommand("studentRegister", conn);
            studentRegister.CommandType = CommandType.StoredProcedure;
            studentRegister.Parameters.Add(new SqlParameter("@first_name", firstName));
            studentRegister.Parameters.Add(new SqlParameter("@last_name", lastName));
            studentRegister.Parameters.Add(new SqlParameter("@password", pass));
            studentRegister.Parameters.Add(new SqlParameter("@faculty", fac));
            studentRegister.Parameters.Add(new SqlParameter("@email", mail));
            studentRegister.Parameters.Add(new SqlParameter("@address", add));
            SqlParameter IDout = studentRegister.Parameters.Add("@IDout", SqlDbType.Int);
            IDout.Direction = ParameterDirection.Output;
            if (CheckBoxList1.SelectedIndex == 0)
            {
                studentRegister.Parameters.Add(new SqlParameter("@Gucian", '1'));
            }
            else
            {
                studentRegister.Parameters.Add(new SqlParameter("@Gucian", '0'));
            }
            conn.Open();
            studentRegister.ExecuteNonQuery();
            Response.Write("Registration Successful,your Username is " + IDout.Value + ", now go to login or add phone number.");
            conn.Close();
        }

        protected void CheckBoxList1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void Button1_Click4(object sender, EventArgs e)
        {
            Response.Redirect("Login.aspx");
        }

        protected void Button1_Click5(object sender, EventArgs e)
        {
            Response.Redirect("PhoneNumber.aspx");
        }
    }
}