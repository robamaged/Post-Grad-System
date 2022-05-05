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
    public partial class RegisterExaminer : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            String connStr = WebConfigurationManager.ConnectionStrings["PostGradSys"].ToString();
            SqlConnection conn = new SqlConnection(connStr);
            String name = examinername.Text;
            String fow = fieldofwork.Text;
            String pass = password.Text;
            string date = defensedate.Text;
            String tsn = thesisserialnumber.Text;
            
            SqlCommand AddExaminer = new SqlCommand("AddExaminer", conn);
            AddExaminer.CommandType = CommandType.StoredProcedure;
            AddExaminer.Parameters.Add(new SqlParameter("@ExaminerName", name));
            AddExaminer.Parameters.Add(new SqlParameter("@fieldOfWork", fow));
            AddExaminer.Parameters.Add(new SqlParameter("@password", pass));
            AddExaminer.Parameters.Add(new SqlParameter("@DefenseDate", date));
            AddExaminer.Parameters.Add(new SqlParameter("@ThesisSerialNo", tsn));
            SqlParameter IDout = AddExaminer.Parameters.Add("@IDout", SqlDbType.Int);
            IDout.Direction = ParameterDirection.Output;
            if (CheckBoxList1.SelectedIndex == 0)
            {
                AddExaminer.Parameters.Add(new SqlParameter("@National", '1'));
            }
            else
            {
                AddExaminer.Parameters.Add(new SqlParameter("@National", '0'));
            }
            conn.Open();
            AddExaminer.ExecuteNonQuery();
            if(tsn.Length==0 || pass.Length==0)
            {
                Response.Write("This field cannot be empty.");
            }
            Response.Write("Registration Successful,your Username is "+IDout.Value+ ", now go to login.");
            conn.Close();
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("Login.aspx");
        }
    }
}