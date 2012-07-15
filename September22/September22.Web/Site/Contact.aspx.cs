using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using September22.Common;
using System.Net.Mail;

namespace September22
{
    public partial class Contact : PageBase
    {
        private const string TO_ADDR1 = @"bebbiwebbi@gmail.com";
        private const string TO_ADDR2 = @"sta12quest@gmail.com";
        private const string FROM_ADDR = @"admin@september22.us";

        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void btnSend_Click(object sender, EventArgs e)
        {
            //show thanks
            mviewContactUs.SetActiveView(viewFinished);

            //send email
            Utilities.SendEmail(
                FROM_ADDR,
                new string[] {TO_ADDR1, TO_ADDR2},
                "Contact from " + txtName.Text + " (" + txtEmail.Text + ")",
                txtMessage.Text);
        }
    }
}