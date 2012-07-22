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
        private static WeddingEntities Entities = new WeddingEntities();

        public static IQueryable<DinnerPreference> GetDinnerPreferences(bool excludeOther = true)
        {
            //result
            var dinnerPreferences = new List<DinnerPreference>(Entities.DinnerPreferences);
            
            //check exclude other condition
            if (excludeOther)
                dinnerPreferences.RemoveAll(pref => pref.Name == "Other");

            return dinnerPreferences.AsQueryable();
        }

        public static void SaveGuests(List<Guest> guests)
        {
            foreach (var guest in guests)
            {
                Entities.Guests.AddObject(guest);
            }
            Entities.SaveChanges();
        }

        public static void DeleteGuests(List<Guest> guests)
        {
            foreach (var guest in guests)
            {
                Entities.Guests.DeleteObject(guest);
            }
            Entities.SaveChanges();

            //List<ChildObject> children = ParentObject.ChildObjects.ToList();
            //for (int i = 0; i < children.Count; i++)
            //{
            //    try
            //    {
            //        //Delete the Child Object from your ObjectContext
            //        //(We have a wrapper function to do that
            //        dataAccessor.Delete(children[i]);
            //    }
            //    catch
            //    {

            //    }
            //}

        }

        public static void SaveInvitation(Invitation invitation)
        {
            Invitation existingInvitation = GetInvitations().SingleOrDefault(inv => inv.ID == invitation.ID);
            //existingInvitation.Attending = invitation.Attending;
            //existingInvitation.Notes = invitation.Notes;
            //existingInvitation.Guests = invitation.Guests;
            Entities.SaveChanges();
        }

        public static IQueryable<Invitation> GetInvitations()
        {
            return Entities.Invitations;
        }

        public static Invitation GetInvitationByFullName(string fullName)
        {
            IQueryable<Invitation> invitations = GetInvitations();
            return invitations.ToList().Where(inv => inv.FullName == fullName).FirstOrDefault();
        }
    }
}