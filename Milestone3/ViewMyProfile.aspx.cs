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
    public partial class ViewMyProfile : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["publicId"] != null)
            {
                string id1 = Session["publicId"].ToString();
                int id = Int16.Parse(id1);

                
                String connStr = WebConfigurationManager.ConnectionStrings["PostGradSys"].ToString();
                SqlConnection conn = new SqlConnection(connStr);
                SqlCommand viewMyProfileproc = new SqlCommand("viewMyProfile", conn);
                viewMyProfileproc.CommandType = CommandType.StoredProcedure;
                viewMyProfileproc.Parameters.Add(new SqlParameter("@studentId", id));
                SqlDataAdapter sd = new SqlDataAdapter(viewMyProfileproc);
                DataTable d = new DataTable();
                sd.Fill(d);
                GridView1.DataSource = d;
                GridView1.DataBind();
            }
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}