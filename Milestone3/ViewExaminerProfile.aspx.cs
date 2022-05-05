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
    public partial class ViewExaminerProfile : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            String connStr = WebConfigurationManager.ConnectionStrings["PostGradSys"].ToString();
            SqlConnection conn = new SqlConnection(connStr);
            if (Session["publicId"] != null)
            {
                string id1 = Session["publicId"].ToString();
                int id = Int16.Parse(id1);
                SqlCommand ExaminerViewMyProfile = new SqlCommand("ExaminerViewMyProfile", conn);
                ExaminerViewMyProfile.CommandType = CommandType.StoredProcedure;
                ExaminerViewMyProfile.Parameters.Add(new SqlParameter("@ExaminerId", id));
                SqlDataAdapter sd = new SqlDataAdapter(ExaminerViewMyProfile);
                DataTable d = new DataTable();
                sd.Fill(d);
                GridView1.DataSource = d;
                GridView1.DataBind();
                conn.Open();
                ExaminerViewMyProfile.ExecuteNonQuery();
                conn.Close();
            }
            
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void editProfile_Click(object sender, EventArgs e)
        {
            if (Session["publicId"] != null)
            {
                String connStr = WebConfigurationManager.ConnectionStrings["PostGradSys"].ToString();
                SqlConnection conn = new SqlConnection(connStr);
                string id1 = Session["publicId"].ToString();
                int id = Int16.Parse(id1);
                string name = newName.Text;
                string fow = newFOW.Text;
                string pass = newPassword.Text;
                SqlCommand UpdateExaminerProfile = new SqlCommand("UpdateExaminerProfile", conn);
                UpdateExaminerProfile.CommandType = CommandType.StoredProcedure;
                UpdateExaminerProfile.Parameters.Add(new SqlParameter("@ExaminerId", id));
                UpdateExaminerProfile.Parameters.Add(new SqlParameter("@name", name));
                UpdateExaminerProfile.Parameters.Add(new SqlParameter("@fieldOfWork", fow));
                UpdateExaminerProfile.Parameters.Add(new SqlParameter("@password", pass));
                conn.Open();
                UpdateExaminerProfile.ExecuteNonQuery();
                conn.Close();
                Response.Redirect(string.Format("ViewExaminerProfile.aspx",id));
            }
        }
    }
}