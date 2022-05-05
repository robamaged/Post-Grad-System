using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
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
    public partial class AddDefense : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            
            String tsno = thesisserialno.Text;
            String dd = defensedate.Text;
            String dl = defenseloc.Text;
            


            if (CheckBoxList1.SelectedIndex == 0)
            {
                String connStr = WebConfigurationManager.ConnectionStrings["PostGradSys"].ToString();
                SqlConnection conn = new SqlConnection(connStr);
                SqlCommand AddDefenseGucian = new SqlCommand(" AddDefenseGucian", conn);
                AddDefenseGucian.CommandType = CommandType.StoredProcedure;
                AddDefenseGucian.Parameters.Add(new SqlParameter("@ThesisSerialNo", tsno));
                AddDefenseGucian.Parameters.Add(new SqlParameter("@DefenseDate", dd));
                AddDefenseGucian.Parameters.Add(new SqlParameter("@DefenseLocation", dl));
                conn.Open();
                AddDefenseGucian.ExecuteNonQuery();
                Response.Redirect("AddExaminer.aspx");
                conn.Close();
            }
            else
            {
                String connStr = WebConfigurationManager.ConnectionStrings["PostGradSys"].ToString();
                SqlConnection conn = new SqlConnection(connStr);
                SqlCommand AddDefenseNonGucian = new SqlCommand(" AddDefenseNonGucian", conn);
                AddDefenseNonGucian.CommandType = CommandType.StoredProcedure;
                AddDefenseNonGucian.Parameters.Add(new SqlParameter("@ThesisSerialNo", tsno));
                AddDefenseNonGucian.Parameters.Add(new SqlParameter("@DefenseDate", dd));
                AddDefenseNonGucian.Parameters.Add(new SqlParameter("@DefenseLocation", dl));
                conn.Open();
                AddDefenseNonGucian.ExecuteNonQuery();
                Response.Redirect("AddExaminer.aspx");
                conn.Close();
            }
        }

        protected void CheckBoxList1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}