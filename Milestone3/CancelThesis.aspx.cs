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
    public partial class CancelThesis : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            String connStr = WebConfigurationManager.ConnectionStrings["PostGradSys"].ToString();
            SqlConnection conn = new SqlConnection(connStr);
            string tsno = thesisserialno.Text;

            SqlCommand CancelThesisproc = new SqlCommand("CancelThesis", conn);
            CancelThesisproc.CommandType = CommandType.StoredProcedure;
            CancelThesisproc.Parameters.Add(new SqlParameter("@ThesisSerialNo", tsno));

            conn.Open();
            CancelThesisproc.ExecuteNonQuery();
            conn.Close();
        }
    }
}