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
    public partial class AddExaminer : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            String connStr = WebConfigurationManager.ConnectionStrings["PostGradSys"].ToString();
            SqlConnection conn = new SqlConnection(connStr);
            string tsno = thesisserialno.Text;
            string dd = defensedate.Text;
            string en = examinername.Text;
            string p = pass.Text;
            string fow = fieldofwork.Text;
            SqlCommand AddExaminerproc = new SqlCommand("AddExaminer", conn);
            AddExaminerproc.CommandType = CommandType.StoredProcedure;
            AddExaminerproc.Parameters.Add(new SqlParameter("@ThesisSerialNo", tsno));
            AddExaminerproc.Parameters.Add(new SqlParameter("@DefenseDate", dd));
            AddExaminerproc.Parameters.Add(new SqlParameter(" @ExaminerName", en));
            AddExaminerproc.Parameters.Add(new SqlParameter("@Password", p));
            AddExaminerproc.Parameters.Add(new SqlParameter("@fieldOfWork", fow));
            if (CheckBoxList1.SelectedIndex == 0)
            {
                AddExaminerproc.Parameters.Add(new SqlParameter("@National", '1'));
            }
            else
            {
                AddExaminerproc.Parameters.Add(new SqlParameter("@National", '0'));
            }

            conn.Open();
            AddExaminerproc.ExecuteNonQuery();

            conn.Close();
        }

        protected void CheckBoxList1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }

}
    