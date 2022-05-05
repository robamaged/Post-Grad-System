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
    public partial class MyProfile : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click1(object sender, EventArgs e)
        {

            String connStr = WebConfigurationManager.ConnectionStrings["PostGradSys"].ToString();
            SqlConnection conn = new SqlConnection(connStr);
            if (Session["publicId"] != null)
            {
                string id1 = Session["publicId"].ToString();
                int id = Int16.Parse(id1);
                SqlCommand viewMyProfileproc = new SqlCommand("viewMyProfile", conn);
                viewMyProfileproc.CommandType = CommandType.StoredProcedure;
                viewMyProfileproc.Parameters.Add(new SqlParameter("@studentId", id));

                conn.Open();
                viewMyProfileproc.ExecuteNonQuery();
                Response.Redirect(string.Format("ViewMyProfile.aspx",id));
                conn.Close();
            }
        }
    }
}