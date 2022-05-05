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
    public partial class FillProgressReport : System.Web.UI.Page
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
                string st = state.Text;
                string PRNo = progressreportnumber.Text;
                string tsno = thesisserialnumber.Text;
                string desc = description.Text;

                SqlCommand FillProgressReportproc = new SqlCommand("FillProgressReport", conn);
                FillProgressReportproc.CommandType = CommandType.StoredProcedure;
                FillProgressReportproc.Parameters.Add(new SqlParameter("@studentID", id));
                FillProgressReportproc.Parameters.Add(new SqlParameter("@state", st));
                FillProgressReportproc.Parameters.Add(new SqlParameter("@progressReportNo", PRNo));
                FillProgressReportproc.Parameters.Add(new SqlParameter("@thesisSerialNo", tsno));
                FillProgressReportproc.Parameters.Add(new SqlParameter("@description", desc));
                conn.Open();
                FillProgressReportproc.ExecuteNonQuery();
                conn.Close();
            }
        }
    }
}