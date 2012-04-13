using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using September22.Common;
using September22.DataAccess;

namespace September22
{
    public partial class Rsvp : PageBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            timeLabel.Text = DateTime.Now.ToLongTimeString();

            ScriptManager.RegisterStartupScript(this, this.GetType(), string.Empty, "bounce();", true);
        }

        protected void btnNewGuest_Click(object sender, EventArgs e)
        {
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

                if (lv.Items.Count >= 2)
                {
                    //find second to last item in the list
                    ListViewDataItem secondLastItem = lv.Items[lv.Items.Count - 2];

                    //add css class bounce-little
                    WebControl control = secondLastItem.FindControl("itemPlaceHolder") as WebControl;
                    if (control != null)
                    {
                        control.CssClass = "bounce-little";
                    }
                }
            }
        }

        protected void lvGuests_ItemDeleting(object sender, ListViewDeleteEventArgs e)
        {
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
                    TextBox txtBox = item.FindControl("txtName") as TextBox ;
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

        const string ACCEPTED = "Yes";
        const string DECLINED = "No";
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
    }
    
    [Serializable]
    public class Person
    {
        public string Name { get; set; }
    }
}