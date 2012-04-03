using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace September22
{
    public partial class Error : September22.Common.PageBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                //check master for label
                if (Master.Master != null && Master.Master.FindControl("MainContent") != null)
                {
                    Label SiteMapLabel = (Label)Master.Master.FindControl("MainContent").FindControl("SiteMapLabel");
                    
                    //update text
                    if (SiteMapLabel != null)
                    {
                        SiteMapLabel.Text = "You must be lost!";
                    }
                }
            }
        }
    }
}