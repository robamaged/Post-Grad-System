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
    public partial class NonGucianThesis : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            String connStr = WebConfigurationManager.ConnectionStrings["PostGradSys"].ToString();
            SqlConnection conn = new SqlConnection(connStr);
            string sid = studentId.Text;

            SqlCommand ViewNonGucianThesisproc = new SqlCommand("ViewNonGucianThesis", conn);
            ViewNonGucianThesisproc.CommandType = CommandType.StoredProcedure;
            ViewNonGucianThesisproc.Parameters.Add(new SqlParameter("@studentID", sid));
            SqlDataAdapter sd = new SqlDataAdapter(ViewNonGucianThesisproc);
            DataTable d = new DataTable();
            sd.Fill(d);
            GridView1.DataSource = d;
            GridView1.DataBind();
            conn.Open();
            ViewNonGucianThesisproc.ExecuteNonQuery();
            conn.Close();
        }
    
    }
}