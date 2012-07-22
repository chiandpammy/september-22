using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Objects;
using System.Data.Objects.DataClasses;
using System.Linq;
using System.Web;
using September22.DAL;

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

        //public static void DeleteGuests(List<Guest> guests)
        //{
        //    using (var entities = new WeddingEntities())
        //    {
        //        foreach (var guest in guests)
        //        {
        //            entities.Guests.DeleteObject(guest);
        //        }
        //        //entities.SaveChanges();
        //    }
        //}

        public static void SaveInvitation(Invitation invitation)
        {
            using (var entities = new WeddingEntities())
            {
                object existingInvitation;
                if (entities.TryGetObjectByKey(invitation.EntityKey,out existingInvitation))
                {
                    entities.ApplyCurrentValues("Invitations",
                                                existingInvitation);
                    //entities.AddObject("Invitations", invitation);
                    entities.SaveChanges();
                }
                //Invitation existingInvitation = entities.Invitations.Single(inv => inv.ID == invitation.ID);
                //entities.ApplyCurrentValues("Invitations", invitation);
                //entities.SaveChanges();
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
                Invitation invitation = entities.Invitations.Include("Guests").Where(inv => inv.FirstName + " " + inv.LastName == fullName)
                    .FirstOrDefault();
//                Invitation invitation = GetInvitations().Where(inv => inv.FullName == fullName).FirstOrDefault();
                return invitation;
            }
        }
    }
}