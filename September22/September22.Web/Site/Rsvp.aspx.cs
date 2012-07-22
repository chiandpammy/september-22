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
        //private const string ACCEPTED = "Yes";
        //private const string DECLINED = "No";
        private const string CSS_BOUNCE = "bounce";

        private const string TO_ADDR1 = @"bebbiwebbi@gmail.com";
        private const string TO_ADDR2 = @"sta12quest@gmail.com";
        private const string FROM_ADDR = @"admin@september22.us";

        private Invitation CurrentInvitation
        {
            get
            {
                return ViewState["invitation"] as Invitation;
            }
            set
            {
                ViewState["invitation"] = value;
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (this.IsPostBack)
            {
                // remove all "CSS_BOUNCE" CSS classes
                if (pnlDecision.CssClass.Contains(CSS_BOUNCE))
                {
                    pnlDecision.CssClass = pnlDecision.CssClass.Replace(CSS_BOUNCE, string.Empty).TrimEnd();
                }

                if (pnlAccepted.CssClass.Contains(CSS_BOUNCE))
                {
                    pnlAccepted.CssClass = pnlDecision.CssClass.Replace(CSS_BOUNCE, string.Empty).TrimEnd();
                }

                if (pnlDeclined.CssClass.Contains(CSS_BOUNCE))
                {
                    pnlDeclined.CssClass = pnlDeclined.CssClass.Replace(CSS_BOUNCE, string.Empty).TrimEnd();
                }

                int currentStep = CheckCurrentStep();

                switch (currentStep)
                {
                    ////new page and postback
                    //case 1:
                    //    //hide decision panel and remove bounce
                    //    pnlDecision.Visible = false;

                    //    //clean decision panel
                    //    rbAccept.SelectedIndex = -1;

                    //    //clean accepted/declined panel
                    //    mvRSVP.ActiveViewIndex = -1;

                    //    //hide confirmation box
                    //    btnConfirm.Visible = false;
                    //    break;

                    //user chose invitation
                    //  it is time to show decision panel
                    case 2:
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
                        break;

                    //user chose accept/decline
                    case 3:
                        UpdateGuests();

                        if (rbAccept.SelectedValue == bool.TrueString)
                        {
                            if (!pnlAccepted.CssClass.Contains(CSS_BOUNCE))
                            {
                                pnlAccepted.CssClass += " " + CSS_BOUNCE;
                            }

                            //update listview
                            lvGuests.DataSource = CurrentInvitation.Guests.OrderBy(GuestSorter);
                            lvGuests.DataBind();

                            UpdatePanel1.Update();
                        }
                        else
                        {
                            if (!pnlDeclined.CssClass.Contains(CSS_BOUNCE))
                            {
                                pnlDeclined.CssClass += " " + CSS_BOUNCE;
                            }
                        }

                        //show confirmation box
                        btnConfirm.Visible = true;
                        break;
                }
            }
            ScriptManager.RegisterStartupScript(this, this.GetType(), string.Empty, "bounce();", true);
        }

        /// <summary>
        /// Step 2
        ///     user chose an invitation.
        /// Step 3
        ///     user clicked on accepted/declined indicator
        /// </summary>
        /// <returns></returns>
        private int CheckCurrentStep()
        {
            Invitation prevInvitation = null;
            if (CurrentInvitation != null)
            {
                prevInvitation = CurrentInvitation;
            }

            if (!string.IsNullOrEmpty(hfInvitationName.Value))
            {
                //set invitation
                Invitation selectedInvitation = DataAccess.GetInvitationByFullName(hfInvitationName.Value);
                CurrentInvitation = selectedInvitation;

                //previously chosen invitation does not match selected invitation
                //  user must've chosen a new invitation name
                if (prevInvitation == null || prevInvitation.ID != selectedInvitation.ID)
                {
                    return 2;
                }

                //check decision
                string prevDecision = CurrentInvitation.Attending.HasValue ? CurrentInvitation.Attending.Value.ToString() : null;  //this is current invitation's last known decision
                if (rbAccept.SelectedIndex >= 0)
                {
                    //set decision
                    CurrentInvitation.Attending = bool.Parse(rbAccept.SelectedValue);

                    if (prevDecision != rbAccept.SelectedValue)
                        return 3;

                    //we were already in step 3
                    //  and this is postback
                    //  ie new item click, delte row click and so forth
                    return 0;
                }
            }

            //we get here if we don't have invitation selected
            return 1;
        }

        protected void btnNewGuest_Click(object sender, EventArgs e)
        {
            //update invitation from screen
            UpdateGuests();

            //check viewstate
            if (CurrentInvitation.Guests.Count >= CurrentInvitation.MaxNumberOfGuests)
            {
                return;
            }

            //add new person
            Guest newGuest = new Guest();
            newGuest.InvitationID = CurrentInvitation.ID;
            CurrentInvitation.Guests.Add(newGuest);

            //update listview
            lvGuests.DataSource = CurrentInvitation.Guests.OrderBy(GuestSorter);
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
            //delete this person
            lvGuests.Items.RemoveAt(e.ItemIndex);

            //update invitation from screen
            UpdateGuests();

            //update listview
            lvGuests.DataSource = CurrentInvitation.Guests.OrderBy(GuestSorter);
            lvGuests.DataBind();

            UpdatePanel1.Update();
        }

        private DateTime GuestSorter(Guest guest)
        {
            return guest.DateCreated;
        }

        protected void btnConfirm_Click(object sender, EventArgs e)
        {
            //possible errors
            var errors = new List<Exception>();

            //guests entered in the screen, but not necessarily in database yet
            //UpdateGuests();

            //get invitation
            Invitation invitation = CurrentInvitation;

            //file log
            try
            {
                //log guests
                foreach (var guest in invitation.Guests)
                {
                    Utilities.LogMessage(
                        string.Format("RSVP from {0}. Guest: {1}. Dinner Preference: {2}. ", invitation.FirstName, guest.FullName, guest.DinnerPreference));
                }
                //log special request
                if (!string.IsNullOrEmpty(txtSpecialRequest.Text))
                {
                    Utilities.LogMessage(
                        string.Format("Special Request from {0}. Request: {1}", invitation.FirstName, txtSpecialRequest.Text));
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
                //add guests to invitation
                //guests.ForEach(invitation.Guests.Add);

                //save to database
                DataAccess.SaveInvitation(invitation);
            }
            catch (Exception ex)
            {
                errors.Add(ex);
            }

            //log any error that occurred
            foreach (var error in errors)
            {
                Utilities.LogException("RSVP btnConfirm_Click " + invitation.FullName, error);
            }
        }

        protected void rbAccept_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (rbAccept.SelectedValue == bool.TrueString)
            {
                mvRSVP.SetActiveView(viewAccepted);
                btnNewGuest.Visible = true;
            }
            else
            {
                mvRSVP.SetActiveView(viewDeclined);
                btnNewGuest.Visible = false;
            }

            //Update viewmodel
            Invitation invitation = CurrentInvitation;
            invitation.Attending = bool.Parse(rbAccept.SelectedValue);
            CurrentInvitation = invitation;
        }

        /// <summary>
        /// Update guest list with what user sees on the screen.
        /// </summary>
        private Invitation UpdateGuests()
        {
            //get invitation
            Invitation invitation = CurrentInvitation;
            invitation.Guests.Clear();

            //guests are loaded onto listview
            foreach (ListViewDataItem item in lvGuests.Items)
            {
                TextBox txtBox = item.FindControl("txtGuest") as TextBox;
                DropDownList ddlDropDown = item.FindControl("ddlDinnerPreferences") as DropDownList;

                var guest = new Guest();
                guest.FullName = txtBox.Text;
                guest.InvitationID = invitation.ID;
                if (ddlDropDown.SelectedValue == null)
                    guest.DinnerPreferenceID = null;
                else
                    guest.DinnerPreferenceID = Int32.Parse(ddlDropDown.SelectedValue);
                invitation.Guests.Add(guest);
            }

            //save invitation
            //CurrentInvitation = invitation;

            return invitation;
        }

        [System.Web.Services.WebMethod]
        [System.Web.Script.Services.ScriptMethod]
        public static string[] GetInvitationList(string prefixText, int count)
        {
            try
            {
                if (_invitationList == null)
                {
                    _invitationList = DataAccess.GetInvitations()
                                        .ToList()
                                        .Select(a => a.FullName)
                                        .ToArray();
                }

                return
                    (from m in _invitationList
                     where m.ToUpperInvariant()
                     .Contains(prefixText.ToUpperInvariant())
                     select m)
                     .Take(count)
                     .ToArray();
            }
            catch (Exception ex)
            {
                Utilities.LogException("RSVP GetInvitationList", ex);
            }

            return null;
        }
        static string[] _invitationList;
    }
}