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
    public partial class thesis : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            String connStr = WebConfigurationManager.ConnectionStrings["PostGradSys"].ToString();
            SqlConnection conn = new SqlConnection(connStr);
            string sid = studentID.Text;

            SqlCommand ViewGucianThesisproc = new SqlCommand("ViewGucianThesis", conn);
            ViewGucianThesisproc.CommandType = CommandType.StoredProcedure;
            ViewGucianThesisproc.Parameters.Add(new SqlParameter("@studentID", sid));
            SqlDataAdapter sd = new SqlDataAdapter(ViewGucianThesisproc);
            DataTable d = new DataTable();
            sd.Fill(d);
            GridView1.DataSource = d;
            GridView1.DataBind();

            conn.Open();
            ViewGucianThesisproc.ExecuteNonQuery();
            conn.Close();
        }
    }
}