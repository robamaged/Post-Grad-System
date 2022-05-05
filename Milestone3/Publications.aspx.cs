
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
    public partial class Publications : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            String connStr = WebConfigurationManager.ConnectionStrings["PostGradSys"].ToString();
            SqlConnection conn = new SqlConnection(connStr);
            if (Session["publicId"] != null)
            {
                string id1 = Session["publicId"].ToString();
                int id = Int16.Parse(id1);
                SqlCommand ViewAStudentPublicationsproc = new SqlCommand("ViewAStudentPublications", conn);
                ViewAStudentPublicationsproc.CommandType = CommandType.StoredProcedure;
                ViewAStudentPublicationsproc.Parameters.Add(new SqlParameter("@StudentID", id));
                SqlDataAdapter sd = new SqlDataAdapter(ViewAStudentPublicationsproc);
                DataTable d = new DataTable();
                sd.Fill(d);
                GridView1.DataSource = d;
                GridView1.DataBind();
                conn.Open();
                ViewAStudentPublicationsproc.ExecuteNonQuery();
                conn.Close();
            }

        }
    }
}