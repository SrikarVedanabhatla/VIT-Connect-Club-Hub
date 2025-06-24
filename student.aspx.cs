using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace ClubManagementSystem
{
    public partial class student : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void Page_Init(object sender, EventArgs e)

        {

            CheckSession();

        }

        //method to check the session

        private void CheckSession()

        {

            if (Session["role"] == null)

            {

                Response.Redirect("Default.aspx");

            }

        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}
