using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
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
    public partial class CourseGrades : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            String connStr = WebConfigurationManager.ConnectionStrings["PostGradSys"].ToString();
            SqlConnection conn = new SqlConnection(connStr);
            SqlCommand NonGucianCoursesproc = new SqlCommand("NonGucianCourses", conn);
            NonGucianCoursesproc.CommandType = CommandType.StoredProcedure;
            SqlDataAdapter sd = new SqlDataAdapter(NonGucianCoursesproc);
            DataTable d = new DataTable();
           
            GridView1.DataSource = d;
            GridView1.DataBind();
            sd.Fill(d);
            conn.Open();
            NonGucianCoursesproc.ExecuteNonQuery();
            conn.Close();
        }

    }

   
    }
