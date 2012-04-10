using System;
using System.Collections.Generic;
using System.Linq;
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

            //send
            SendMailMessage(
                FROM_ADDR, 
                new string[] { TO_ADDR1, TO_ADDR2 },
                "Contact from " + txtName.Text + " (" + txtEmail.Text + ")",
                txtMessage.Text);
        }

        private static void SendMailMessage(string from, string[] to, string subject, string body)
        {
            //create message
            MailMessage message = new MailMessage();

            //set sender
            message.From = new MailAddress(from);

            //set recipients
            for(int i = 0; i < to.Length; i++)
                message.To.Add(new MailAddress(to[i]));

            //set message
            message.Subject = subject;
            message.Body = body;
            message.IsBodyHtml = false;
            
            SmtpClient mSmtpClient = new SmtpClient();
            
            //send message
            mSmtpClient.Send(message);
        }
    }
}