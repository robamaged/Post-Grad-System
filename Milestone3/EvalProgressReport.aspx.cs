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
    public partial class EvalProgressReport : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            String connStr = WebConfigurationManager.ConnectionStrings["PostGradSys"].ToString();
            SqlConnection conn = new SqlConnection(connStr);
            string sup = supId.Text;
            string tsno = thesisserialno.Text;
            string prno = progressreportno.Text;
            string ev = eval.Text;

            SqlCommand EvaluateProgressReportproc = new SqlCommand("EvaluateProgressReport", conn);
            EvaluateProgressReportproc.CommandType = CommandType.StoredProcedure;
            EvaluateProgressReportproc.Parameters.Add(new SqlParameter("@supervisorID", sup));
            EvaluateProgressReportproc.Parameters.Add(new SqlParameter("@thesisSerialNo", tsno));
            EvaluateProgressReportproc.Parameters.Add(new SqlParameter("@progressReportNo", prno));
            EvaluateProgressReportproc.Parameters.Add(new SqlParameter("@evaluation", ev));


            conn.Open();
            EvaluateProgressReportproc.ExecuteNonQuery();
            conn.Close();

        }
    }
}