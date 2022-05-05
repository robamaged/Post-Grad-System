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
    public partial class ProgressReport : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            String connStr = WebConfigurationManager.ConnectionStrings["PostGradSys"].ToString();
            SqlConnection conn = new SqlConnection(connStr);
            if (Session["publicId"] != null)
            {
                string id1 = Session["publicId"].ToString();
                int id = Int16.Parse(id1);
                string PRdate = progressreportdate.Text;
                string PRNo = progressreportnumber.Text;
                string tsno = thesisserialnumber.Text;

                SqlCommand AddProgressReportproc = new SqlCommand("AddProgressReport", conn);
                AddProgressReportproc.CommandType = CommandType.StoredProcedure;
                AddProgressReportproc.Parameters.Add(new SqlParameter("@studentID", id));
                AddProgressReportproc.Parameters.Add(new SqlParameter("@progressReportDate", PRdate));
                AddProgressReportproc.Parameters.Add(new SqlParameter("@progressReportNo", PRNo));
                AddProgressReportproc.Parameters.Add(new SqlParameter("@thesisSerialNo", tsno));
                conn.Open();
                AddProgressReportproc.ExecuteNonQuery();
                conn.Close();
            }

        }
    }
}