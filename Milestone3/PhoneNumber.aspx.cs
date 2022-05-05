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
    public partial class PhoneNumber : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            String connStr = WebConfigurationManager.ConnectionStrings["PostGradSys"].ToString();
            SqlConnection conn = new SqlConnection(connStr);
            String ID = id.Text;
            String phone = PhoneNo.Text;
            SqlCommand addMobile = new SqlCommand("addMobile", conn);
            addMobile.CommandType = CommandType.StoredProcedure;
            addMobile.Parameters.Add(new SqlParameter("@ID", ID));
            addMobile.Parameters.Add(new SqlParameter("@mobile_number", phone));
            conn.Open();
            addMobile.ExecuteNonQuery();
            conn.Close();
        }
    }
}