using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using September22.Common;
using September22.DAL;

namespace September22
{
    public partial class Rsvp : PageBase
    {
        private const string ACCEPTED = "Yes";
        private const string DECLINED = "No";

        protected void Page_Load(object sender, EventArgs e)
        {
            timeLabel.Text = DateTime.Now.ToLongTimeString();
        }

        protected void btnNewGuest_Click(object sender, EventArgs e)
        {
            //bounce script
            ScriptManager.RegisterStartupScript(this, this.GetType(), string.Empty, "bounce();", true);

            //check viewstate
            List<Person> persons = GetPersons();

            if (persons.Count >= 5)
            {
                return;
            }

            //add new person
            Person newPerson = new Person();
            persons.Add(newPerson);

            SavePersons(persons);

            //update listview
            lvGuests.DataSource = persons;
            lvGuests.DataBind();

            UpdatePanel1.Update();
        }

        protected void lvGuests_DataBound(object sender, EventArgs e)
        {
            ListView lv = sender as ListView;
            if (lv != null)
            {
                //find last item in the list
                ListViewDataItem lastItem = lv.Items.LastOrDefault();
                if (lastItem != null)
                {
                    //add css class bounce
                    WebControl control = lastItem.FindControl("itemPlaceHolder") as WebControl;
                    if (control != null)
                    {
                        control.CssClass = "bounce";
                    }
                }
            }
        }

        protected void lvGuests_ItemDeleting(object sender, ListViewDeleteEventArgs e)
        {
            //bounce script
            ScriptManager.RegisterStartupScript(this, this.GetType(), string.Empty, "bounce();", true);

            //check viewstate
            List<Person> persons = GetPersons();

            //delete this person
            persons.RemoveAt(e.ItemIndex);

            SavePersons(persons);

            //update listview
            lvGuests.DataSource = persons;
            lvGuests.DataBind();

            UpdatePanel1.Update();
        }

        protected void btnConfirm_Click(object sender, EventArgs e)
        {

        }

        private List<Person> GetPersons()
        {
            List<Person> persons = new List<Person>();

            if (lvGuests.Items.Count == 0)
            {
                //this is first time load
                if (ViewState["persons"] != null)
                {
                    persons = ViewState["persons"] as List<Person>;
                }
            }
            else
            {
                //persons is loaded onto listview
                foreach (ListViewDataItem item in lvGuests.Items)
                {
                    TextBox txtBox = item.FindControl("txtGuest") as TextBox;
                    if (txtBox != null && txtBox.Text != null)
                    {
                        persons.Add(new Person() { Name = txtBox.Text });
                    }
                    else
                    {
                        persons.Add(new Person());
                    }
                }
            }

            return persons;
        }

        private void SavePersons(List<Person> persons)
        {
            ViewState["persons"] = persons;
        }

        protected void rbAccept_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (rbAccept.SelectedValue == ACCEPTED)
            {
                mvRSVP.SetActiveView(viewAccepted);
                btnNewGuest.Visible = true;
            }
            else if (rbAccept.SelectedValue == DECLINED)
            {
                mvRSVP.SetActiveView(viewDeclined);
                btnNewGuest.Visible = false;
            }
        }

        [System.Web.Services.WebMethod]
        [System.Web.Script.Services.ScriptMethod]
        public static string[] GetCompletionList(string prefixText, int count)
        {
            string[] invitationNames =
                DataAccess.GetInvitations()
                    .Select(a => new {FullName = a.FirstName + " " + a.LastName})
                    .Select(b => b.FullName)
                    .ToArray();
            
            string[] searchResults = 
                (from m in invitationNames 
                 where m.ToUpperInvariant()
                 .Contains(prefixText.ToUpperInvariant()) 
                 select m)
                 .Take(count)
                 .ToArray();

            return searchResults;
        }

    }
    
    [Serializable]
    public class Person
    {
        public string Name { get; set; }

        public override string ToString()
        {
            return Name;
        }
    }
}