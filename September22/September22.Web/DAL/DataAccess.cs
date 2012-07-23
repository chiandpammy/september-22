using System.Collections.Generic;
using System.Linq;

namespace September22.DAL
{
    public static class DataAccess
    {
        public static IQueryable<DinnerPreference> GetDinnerPreferences(bool excludeOther = true)
        {
            using (var entities = new WeddingEntities())
            {
                //result
                var dinnerPreferences = new List<DinnerPreference>(entities.DinnerPreferences);

                //check exclude other condition
                if (excludeOther)
                    dinnerPreferences.RemoveAll(pref => pref.Name == "Other");

                return dinnerPreferences.AsQueryable();
            }
        }

        public static void SaveInvitation(Invitation invitation)
        {
            using (var entities = new WeddingEntities())
            {
                object existingObject;
                if (entities.TryGetObjectByKey(invitation.EntityKey, out existingObject))
                {
                    entities.ApplyCurrentValues("Invitations",
                                                invitation);

                    List<Guest> existingGuests = (existingObject as Invitation).Guests.ToList();
                    foreach (var existingGuest in existingGuests)
                    {
                        entities.DeleteObject(existingGuest);
                    }

                    foreach (var newGuest in invitation.DetachedGuests)
                    {
                        Guest guest = entities.Guests.CreateObject();
                        guest.InvitationID = invitation.ID;
                        guest.FullName = newGuest.FullName;
                        guest.DinnerPreferenceID = newGuest.DinnerPreferenceID;
                        entities.AddToGuests(guest);
                    }
                    entities.SaveChanges();
                }
            }
        }

        public static List<Invitation> GetInvitations()
        {
            using (var entities = new WeddingEntities())
            {
                return entities.Invitations.ToList();
            }
        }

        public static Invitation GetInvitationByFullName(string fullName)
        {
            using (var entities = new WeddingEntities())
            {
                Invitation invitation = entities.Invitations.Where(inv => inv.FirstName + " " + inv.LastName == fullName)
                    .FirstOrDefault();
                entities.Detach(invitation);

                invitation.DetachedGuests = entities.Guests.Where(guest => guest.InvitationID == invitation.ID).ToList();
                foreach (var guest in invitation.DetachedGuests)
                {
                    entities.Detach(guest);
                }

                return invitation;
            }
        }
    }
}