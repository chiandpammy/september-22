using System;
using September22.Common;

namespace September22
{
    public partial class Contact : PageBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void btnSend_Click(object sender, EventArgs e)
        {
            //show thanks
            mviewContactUs.SetActiveView(viewFinished);

            //send email
            Utilities.SendEmail(
                "Contact from " + txtName.Text + " (" + txtEmail.Text + ")",
                txtMessage.Text);
        }
    }
}