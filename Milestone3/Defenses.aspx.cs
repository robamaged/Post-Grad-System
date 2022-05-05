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
    public partial class Defenses : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["publicId"] != null)
            {
                string id1 = Session["publicId"].ToString();
                int id = Int16.Parse(id1);
                String connStr = WebConfigurationManager.ConnectionStrings["PostGradSys"].ToString();
                SqlConnection conn = new SqlConnection(connStr);
                SqlCommand ExaminerViewDefenses = new SqlCommand("ExaminerViewDefenses", conn);
                ExaminerViewDefenses.CommandType = CommandType.StoredProcedure;
                ExaminerViewDefenses.Parameters.Add(new SqlParameter("@ExaminerId", id));
                SqlDataAdapter sd = new SqlDataAdapter(ExaminerViewDefenses);
                DataTable d = new DataTable();
                sd.Fill(d);
                GridView1.DataSource = d;
                GridView1.DataBind();
                conn.Open();
                ExaminerViewDefenses.ExecuteNonQuery();
                conn.Close();
            }
        }
    }
}