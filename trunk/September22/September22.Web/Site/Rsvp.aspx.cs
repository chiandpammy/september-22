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
    /// <summary>
    /// 
    /// </summary>
    public partial class Rsvp : PageBase
    {
        private const string ACCEPTED = "Yes";
        private const string DECLINED = "No";
        private const string CSS_BOUNCE = "bounce";

        private const string TO_ADDR1 = @"bebbiwebbi@gmail.com";
        private const string TO_ADDR2 = @"sta12quest@gmail.com";
        private const string FROM_ADDR = @"admin@september22.us";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (this.IsPostBack)
            {
                int currentStep = CheckCurrentStep();

                //new page and postback
                if (currentStep == 1)
                {
                    //hide decision panel and remove bounce
                    pnlDecision.Visible = false;

                    //clean decision panel
                    rbAccept.SelectedIndex = -1;
                    
                    //clean accepted/declined panel
                    mvRSVP.ActiveViewIndex = -1;

                    //hide confirmation box
                    btnConfirm.Visible = false;
                }
                
                //user chose invitation
                //  it is time to show decision panel
                if (currentStep == 2)
                {
                    pnlDecision.Visible = true;
                    if (!pnlDecision.CssClass.Contains(CSS_BOUNCE))
                    {
                        pnlDecision.CssClass += " " + CSS_BOUNCE;
                    }
                    
                    //clean decision panel
                    rbAccept.SelectedIndex = -1;

                    //clean accepted/declined panel
                    mvRSVP.ActiveViewIndex = -1;

                    //hide confirmation box
                    btnConfirm.Visible = false;

                    lvGuests.DataSource = null;
                    lvGuests.DataBind();

                    UpdatePanel1.Update();
                }
                else
                {
                    if (pnlDecision.CssClass.Contains(CSS_BOUNCE))
                    {
                        pnlDecision.CssClass = pnlDecision.CssClass.Replace(CSS_BOUNCE, string.Empty).TrimEnd();
                    }
                }

                //user chose accept/decline
                if (currentStep == 3)
                {
                    if (rbAccept.SelectedValue == ACCEPTED)
                    {
                        if (!pnlAccepted.CssClass.Contains(CSS_BOUNCE))
                        {
                            pnlAccepted.CssClass += " " + CSS_BOUNCE;
                        }

                        //update listview
                        lvGuests.DataSource = GetGuests();
                        lvGuests.DataBind();

                        UpdatePanel1.Update();
                    }
                    if (rbAccept.SelectedValue == DECLINED)
                    {
                        if (!pnlDeclined.CssClass.Contains(CSS_BOUNCE))
                        {
                            pnlDeclined.CssClass += " " + CSS_BOUNCE;
                        }
                    }

                    //show confirmation box
                    btnConfirm.Visible = true;
                }
                else
                {
                    if (pnlAccepted.CssClass.Contains(CSS_BOUNCE))
                    {
                        pnlAccepted.CssClass = pnlDecision.CssClass.Replace(CSS_BOUNCE, string.Empty).TrimEnd();
                    }

                    if (pnlDeclined.CssClass.Contains(CSS_BOUNCE))
                    {
                        pnlDeclined.CssClass = pnlDeclined.CssClass.Replace(CSS_BOUNCE, string.Empty).TrimEnd();
                    }

                }
            }
            ScriptManager.RegisterStartupScript(this, this.GetType(), string.Empty, "bounce();", true);
        }

        /// <summary>
        /// Step 2
        ///     user chose an invitation.
        ///     ViewState["decision"] is set to empty
        ///     ViewState["guests"] is set to empty
        /// Step 3
        ///     user clicked on accepted/declined indicator
        ///     ViewState["decision"] is no longer empty
        /// </summary>
        /// <returns></returns>
        private int CheckCurrentStep()
        {
            string prevInvitation = string.Empty;
            if (ViewState["invitation"] != null)
            {
                prevInvitation = ViewState["invitation"] as string;
            }
            if (!string.IsNullOrEmpty(hfInvitationName.Value))
            {
                //set invitation
                ViewState["invitation"] = hfInvitationName.Value;

                //previously chosen invitation does not match newly chosen invitation
                //  user must've chosen an invitation name
                if (prevInvitation != hfInvitationName.Value)
                {
                    //must reset other values
                    ViewState["decision"] = null;
                    ViewState["guests"] = null;

                    return 2;
                }

                //check decision
                string prevDecision = string.Empty;
                if (ViewState["decision"] != null)
                {
                    prevDecision = ViewState["decision"] as string;
                }
                if (rbAccept.SelectedIndex >= 0)
                {
                    //set decision
                    ViewState["decision"] = rbAccept.SelectedValue;

                    //decision is changed
                    //  user must've chosen to accept or decline rsvp
                    if (prevDecision != rbAccept.SelectedValue)
                    {
                        return 3;
                    }
                }

                //postback without changing step
                //  we can get here via validtion.... add/delete guest.... and so forth
                return 0;
            }

            //we get here if we don't have invitation selected
            ViewState["guests"] = null;
            return 1;
        }

        protected void btnNewGuest_Click(object sender, EventArgs e)
        {
            //check viewstate
            List<Person> persons = GetGuests();

            if (persons.Count >= 5)
            {
                return;
            }

            //add new person
            Person newPerson = new Person();
            persons.Add(newPerson);

            SaveGuests(persons);

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
                        control.CssClass = CSS_BOUNCE;
                    }
                }
            }
        }

        protected void lvGuests_ItemDeleting(object sender, ListViewDeleteEventArgs e)
        {
            //check viewstate
            List<Person> persons = GetGuests();

            //delete this person
            persons.RemoveAt(e.ItemIndex);

            SaveGuests(persons);

            //update listview
            lvGuests.DataSource = persons;
            lvGuests.DataBind();

            UpdatePanel1.Update();
        }

        protected void btnConfirm_Click(object sender, EventArgs e)
        {
            var errors = new List<Exception>();

            //file log
            try
            {
                List<Person> guests = GetGuests();
                //log guests
                foreach (var guest in guests)
                {
                    Utilities.LogMessage(
                        string.Format("RSVP from {0}. Guest: {1}. Dinner Preference: {2}. ", hfInvitationName.Value, guest.Name, guest.DinnerPreference));
                }
                //log special request
                if (!string.IsNullOrEmpty(txtSpecialRequest.Text))
                {
                    Utilities.LogMessage(
                        string.Format("Special Request from {0}. Request: {1}", hfInvitationName.Value, txtSpecialRequest.Text));
                }
            }
            catch (Exception ex)
            {
                errors.Add(ex);
            }

            //send email
            try
            {
                //Utilities.SendEmail(
                //    FROM_ADDR,
                //    new string[] { TO_ADDR1, TO_ADDR2 },
                //    null, //"Contact from " + txtName.Text + " (" + txtEmail.Text + ")",
                //    null  //txtMessage.Text
                //    );
            }
            catch (Exception ex)
            {
                errors.Add(ex);
            }

            //save to database
            try
            {
                //SaveGuests
            }
            catch (Exception ex)
            {
                errors.Add(ex);
            }

            //log any error that occurred
            foreach (var error in errors)
            {
                Utilities.LogException("RSVP btnConfirm_Click " + hfInvitationName.Value, error);
            }
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

        /// <summary>
        /// Get guests that are in memory after use changes, additions, deletions and so forth.  This list is what the user sees.
        /// </summary>
        private List<Person> GetGuests()
        {
            List<Person> guests = new List<Person>();

            if (lvGuests.Items.Count == 0)
            {
                //this is first time load
                if (ViewState["guests"] == null)
                {
                    //add invitation name to guest name
                    var guest = new Person();
                    guest.Name = hfInvitationName.Value;
                    guests.Add(guest);

                    //save needed
                    SaveGuests(guests);
                }
                else
                {
                    guests = ViewState["guests"] as List<Person>;
                }
            }
            else
            {
                //guests is loaded onto listview
                foreach (ListViewDataItem item in lvGuests.Items)
                {
                    TextBox txtBox = item.FindControl("txtGuest") as TextBox;
                    DropDownList ddlDropDown = item.FindControl("ddlDinnerPreferences") as DropDownList;
                    var guest = new Person();
                    guest.Name = txtBox.Text;
                    guest.DinnerPreference = Int32.Parse(ddlDropDown.SelectedValue);
                    guests.Add(guest);
                }
            }

            return guests;
        }

        private void SaveGuests(List<Person> guests)
        {
            ViewState["guests"] = guests;
        }

        [System.Web.Services.WebMethod]
        [System.Web.Script.Services.ScriptMethod]
        public static string[] GetCompletionList(string prefixText, int count)
        {
            try
            {
                string[] invitationNames =
                    DataAccess.GetInvitations()
                        .Select(a => new { FullName = a.FirstName + " " + a.LastName })
                        .Select(b => b.FullName)
                        .ToArray();

                return
                    (from m in invitationNames
                     where m.ToUpperInvariant()
                     .Contains(prefixText.ToUpperInvariant())
                     select m)
                     .Take(count)
                     .ToArray();
            }
            catch (Exception ex)
            {
                Utilities.LogException("RSVP GetCompletionList", ex);
            }

            return null;
        }
    }
    
    [Serializable]
    public class Person
    {
        public string Name { get; set; }
        
        public int DinnerPreference { get; set; }

        public override string ToString()
        {
            return Name;
        }
    }
}