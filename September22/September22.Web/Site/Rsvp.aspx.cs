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

        protected void btnNew_Click(object sender, EventArgs e)
        {
            //check viewstate
            List<Person> persons = GetPersons();

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
                ListViewDataItem lastItem = lv.Items.LastOrDefault();
                if (lastItem != null)
                {
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
    }
    
    [Serializable]
    public class Person
    {
        public string Name { get; set; }
    }
}