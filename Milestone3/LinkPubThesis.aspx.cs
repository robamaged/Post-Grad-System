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
    public partial class LinkPubThesis : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            String connStr = WebConfigurationManager.ConnectionStrings["PostGradSys"].ToString();
            SqlConnection conn = new SqlConnection(connStr);
            string tsn = thesisserialno.Text;
            string pid = pubid.Text;
             SqlCommand linkPubThesisproc = new SqlCommand("linkPubThesis", conn);
            linkPubThesisproc.CommandType = CommandType.StoredProcedure;
            linkPubThesisproc.Parameters.Add(new SqlParameter("@PubID", pid));
            linkPubThesisproc.Parameters.Add(new SqlParameter("@thesisSerialNo", tsn));
            conn.Open();
            linkPubThesisproc.ExecuteNonQuery();
            conn.Close();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {

        }
    }
}