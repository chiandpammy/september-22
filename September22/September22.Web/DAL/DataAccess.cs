using System;
using System.Collections.Generic;
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

        private static List<DinnerPreference> _DinnerPreferences;
        public static IQueryable<DinnerPreference> GetDinnerPreferences(bool addBlank = true, bool excludeOther = true)
        {
            if (_DinnerPreferences == null)
            {
                _DinnerPreferences = Entities.DinnerPreferences.ToList();
            }

            //result
            var dinnerPreferences = new List<DinnerPreference>(_DinnerPreferences);
            
            //check exclude other condition
            if (excludeOther)
                dinnerPreferences.RemoveAll(pref => pref.Name == "Other");

            //check add blank condition
            if (addBlank)
                dinnerPreferences.Insert(0, new DinnerPreference() { Name = string.Empty, ID = 0 });

            return dinnerPreferences.AsQueryable();
        }

        public static void SaveGuests(List<Guest> Guests)
        {
            foreach (var guest in Guests)
            {
                Entities.Guests.AddObject(guest);
            }
            Entities.SaveChanges();
        }

        private static List<Invitation> _Invitations;
        public static IQueryable<Invitation> GetInvitations()
        {
            if (_Invitations == null)
            {
                _Invitations = Entities.Invitations.ToList();
            }

            return _Invitations.AsQueryable();
        }

        public static Invitation GetInvitationByFullName(string fullName)
        {
            IQueryable<Invitation> invitations = GetInvitations();
            return invitations.Where(inv => inv.FullName == fullName).FirstOrDefault();
        }
    }
}