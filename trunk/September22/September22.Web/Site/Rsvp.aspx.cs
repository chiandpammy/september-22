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
            //WeddingEntities entities = new WeddingEntities();

            //DropDownList1.DataSource = entities.DinnerPreferences;
            //DropDownList1.DataTextField = "Name";
            //DropDownList1.DataValueField = "ID";
            //DropDownList1.DataBind();

            ScriptManager.RegisterStartupScript(UpdatePanel1, UpdatePanel1.GetType(), string.Empty, "bounce();", true);
        }

        protected void btnNewGuest_Click(object sender, EventArgs e)
        {
            //check viewstate
            List<Person> persons;
            if (ViewState["persons"] != null)
            {
                persons = ViewState["persons"] as List<Person>;
            }
            else
            {
                persons = new List<Person>();
            }

            //add new person
            Person newPerson = new Person() { Name = txtName.Text };
            persons.Add(newPerson);
            
            ViewState["persons"] = persons;

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
                    WebControl control = lastItem.FindControl("bounceControl") as WebControl;
                    if (control != null)
                    {
                        control.CssClass = "bounce";
                    }
                }
            }
        }
    }
    
    [Serializable]
    public class Person
    {
        public string Name { get; set; }
    }
}