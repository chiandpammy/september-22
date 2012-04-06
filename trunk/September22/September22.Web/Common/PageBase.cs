using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;

namespace September22.Common
{
    /// <summary>
    /// Summary description for PageBase
    /// </summary>
    public class PageBase : System.Web.UI.Page
    {
        public PageBase()
        {
        }

        protected override void OnPreInit(EventArgs e)
        {
            //Set theme
            if (Request.QueryString[Utilities.THEME] != null)
            {
                Utilities.SetTheme(Request.QueryString[Utilities.THEME]);

                Page.Theme = "Wedding";// Request.QueryString[Utilities.THEME];
            }
            else
            {
                Page.Theme = "Wedding";// Utilities.GetTheme();
            }

            base.OnPreInit(e);
        }
    }
}