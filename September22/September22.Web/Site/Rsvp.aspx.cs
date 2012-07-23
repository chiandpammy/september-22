using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
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
        private const string CSS_BOUNCE = "bounce";
        private const string RSVP_GUEST_STRING_FORMAT = "RSVP from {0} {1}. Guest: {2}. Dinner Preference: {3}.";
        private const string SPECIAL_REQUEST_STRING_FORMAT = "Special Request from {0}. Request: {1}";

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

                        txtSpecialRequest.Text = CurrentInvitation.Notes;

                        UpdatePanel1.Update();
                        break;

                    //user chose accept/decline
                    case 3:
                        UpdateInvitationFromScreen();

                        if (rbAccept.SelectedValue == bool.TrueString)
                        {
                            if (!pnlAccepted.CssClass.Contains(CSS_BOUNCE))
                            {
                                pnlAccepted.CssClass += " " + CSS_BOUNCE;
                            }

                            //update listview
                            lvGuests.DataSource = CurrentInvitation.DetachedGuests.OrderBy(GuestSorter);
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
                    //  ie new item click, delete row click and so forth
                    return 0;
                }
            }

            //we get here if we don't have invitation selected
            return 1;
        }

        protected void btnNewGuest_Click(object sender, EventArgs e)
        {
            //update invitation from screen
            UpdateInvitationFromScreen();

            //check viewstate
            if (CurrentInvitation.DetachedGuests.Count >= CurrentInvitation.MaxNumberOfGuests)
            {
                return;
            }

            //add new person
            Guest newGuest = new Guest();
            newGuest.Index = CurrentInvitation.DetachedGuests.Any() ? CurrentInvitation.DetachedGuests.Max(g => g.Index) + 1 : 0;
            CurrentInvitation.DetachedGuests.Add(newGuest);

            //update listview
            lvGuests.DataSource = CurrentInvitation.DetachedGuests.OrderBy(GuestSorter);
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
            UpdateInvitationFromScreen();

            //update listview
            lvGuests.DataSource = CurrentInvitation.DetachedGuests.OrderBy(GuestSorter);
            lvGuests.DataBind();

            UpdatePanel1.Update();
        }

        protected void btnConfirm_Click(object sender, EventArgs e)
        {
            //possible errors
            var errors = new List<Exception>();

            //guests entered in the screen, but not necessarily in database yet
            UpdateInvitationFromScreen();

            //get invitation
            Invitation invitation = CurrentInvitation;

            if (invitation.Attending.HasValue && !invitation.Attending.Value)
            {
                invitation.DetachedGuests.Clear();
            }

            StringBuilder emailText = new StringBuilder();

            //file log
            try
            {
                //log guests
                foreach (var guest in invitation.DetachedGuests)
                {
                    Utilities.LogMessage(
                        string.Format(RSVP_GUEST_STRING_FORMAT, invitation.FirstName, invitation.LastName, guest.FullName,
                                      guest.DinnerPreferenceID));
                    emailText.AppendFormat(RSVP_GUEST_STRING_FORMAT,
                                           invitation.FirstName, invitation.LastName, guest.FullName, guest.DinnerPreferenceID);
                    emailText.AppendLine();
                }
                //log special request
                if (!string.IsNullOrEmpty(invitation.Notes))
                {
                    Utilities.LogMessage(
                        string.Format(SPECIAL_REQUEST_STRING_FORMAT, invitation.FirstName, txtSpecialRequest.Text));
                    emailText.AppendFormat(SPECIAL_REQUEST_STRING_FORMAT, invitation.FirstName, txtSpecialRequest.Text);
                    emailText.AppendLine();
                }
            }
            catch (Exception ex)
            {
                errors.Add(ex);
            }

            //send email
            try
            {
                //send email
                Utilities.SendEmail(
                    "RSVP from " + hfInvitationName.Value,
                    emailText.ToString());
            }
            catch (Exception ex)
            {
                errors.Add(ex);
            }

            //save to database
            try
            {
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

            mvMain.SetActiveView(viewFinished);
        }

        protected void rbAccept_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (rbAccept.SelectedValue == bool.TrueString)
            {
                mvRSVP.SetActiveView(viewAccepted);
                btnNewGuest.Visible = true;

                if (!CurrentInvitation.DetachedGuests.Any())
                {
                    //add new person
                    Guest newGuest = new Guest();
                    newGuest.FullName = hfInvitationName.Value;
                    newGuest.Index = CurrentInvitation.DetachedGuests.Any() ? CurrentInvitation.DetachedGuests.Max(g => g.Index) + 1 : 0;
                    CurrentInvitation.DetachedGuests.Add(newGuest);
                }

                //update listview
                lvGuests.DataSource = CurrentInvitation.DetachedGuests.OrderBy(GuestSorter);
                lvGuests.DataBind();

                UpdatePanel1.Update();
            }
            else
            {
                mvRSVP.SetActiveView(viewDeclined);
                btnNewGuest.Visible = false;
            }

            //show confirmation box
            btnConfirm.Visible = true;

            //Update viewmodel
            Invitation invitation = CurrentInvitation;
            invitation.Attending = bool.Parse(rbAccept.SelectedValue);
            CurrentInvitation = invitation;
        }

        /// <summary>
        /// Update guest list with what user sees on the screen.
        /// </summary>
        private void UpdateInvitationFromScreen()
        {
            //get invitation
            Invitation invitation = CurrentInvitation;
            if (invitation.DetachedGuests.Any())
                invitation.DetachedGuests.Clear();

            //guests are loaded onto listview
            for (int i = 0; i < lvGuests.Items.Count; i++)
            {
                ListViewDataItem item = lvGuests.Items.ElementAt(i);
                TextBox txtBox = item.FindControl("txtGuest") as TextBox;
                DropDownList ddlDropDown = item.FindControl("ddlDinnerPreferences") as DropDownList;

                var guest = new Guest();
                guest.FullName = txtBox.Text;

                int selectedDinnerPreference = Int32.Parse(ddlDropDown.SelectedValue);
                guest.DinnerPreferenceID = (selectedDinnerPreference == -1) ? (int?)null : selectedDinnerPreference;
                
                guest.Index = i;
                invitation.DetachedGuests.Add(guest);
            }

            string specialRequest = txtSpecialRequest.Text.Trim();
            invitation.Notes = string.IsNullOrEmpty(specialRequest) ? null : specialRequest;
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

        private int GuestSorter(Guest guest)
        {
            return guest.Index;
        }
    }
}