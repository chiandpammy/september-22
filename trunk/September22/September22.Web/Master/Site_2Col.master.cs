using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using September22.Common;

namespace September22.Master
{
    public partial class Master_Site_2Col : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            hlTheme.Text = "Why so " + Page.Theme.ToLower() + "?";

            if (Request.QueryString.AllKeys.Contains(Utilities.THEME))
            {
                hlTheme.NavigateUrl = Request.Url.ToString().Replace(Utilities.THEME + "=" + Page.Theme, Utilities.THEME + "=" + Utilities.GetNextTheme());
            }
            else
            {
                if (Request.QueryString.Count > 0)
                {
                    hlTheme.NavigateUrl = Request.Url.ToString().TrimEnd(new char[] { '&' }) + "&" + Utilities.THEME + "=" + Utilities.GetNextTheme();
                }
                else
                {
                    hlTheme.NavigateUrl = Request.Url.ToString().TrimEnd(new char[] { '?' }) + "?" + Utilities.THEME + "=" + Utilities.GetNextTheme();
                }
            }
        }
    }
}