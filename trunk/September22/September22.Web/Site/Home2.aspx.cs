using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using September22.Common;

namespace September22.Site
{
    public partial class Home2 : September22.Common.PageBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void lvContents_DataBound(object sender, EventArgs e)
        {
            if (Request.QueryString["postID"] != null)
            {
                if (lvContents.Items.Count == 1)
                {
                    HyperLink hl = lvContents.Items[0].FindControl("hlPost") as HyperLink;

                    if (hl != null)
                    {
                        hl.Visible = false;
                    }
                }
            }
        }

        protected void srcContent_Selected(object sender, ObjectDataSourceStatusEventArgs e)
        {
            srcNavigation.SelectParameters.Clear();
            srcNavigation.SelectParameters.Add("sectionID", (e.OutputParameters["secID"] == null) ? String.Empty : e.OutputParameters["secID"].ToString());
        }
    }
}