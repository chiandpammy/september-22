using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace September22.Common
{
    #region Class Definitions

    public class NavigationHeader
    {
        public string HeaderName { get; set; }
        public List<NavigationLink> Links { get; set; }
    }

    public class NavigationLink
    {
        public string LinkURL { get; set; }
        public string LinkName { get; set; }
    }

    public class Content
    {
        private int _SectionID;
        private int _PostID;
        private string _PostTitle;
        private string _CreatingUserName;
        private DateTime _CreatedDateTime;
        private string _ContentHTML;
        private int _CommentCount;
        public List<UserComment> _Comments;

        public int SectionID
        {
            get { return _SectionID; }
            set { _SectionID = value; }
        }
        public int PostID
        {
            get { return _PostID; }
            set { _PostID = value; }
        }
        public string PostTitle
        {
            get { return _PostTitle; }
            set { _PostTitle = value; }
        }
        public string CreatingUserName
        {
            get { return _CreatingUserName; }
            set { _CreatingUserName = value; }
        }
        public DateTime CreatedDateTime
        {
            get { return _CreatedDateTime; }
            set { _CreatedDateTime = value; }
        }
        public string ContentHTML
        {
            get { return _ContentHTML; }
            set { _ContentHTML = value; }
        }
        public int CommentCount
        {
            get { return _CommentCount; }
            set { _CommentCount = value; }
        }
        public List<UserComment> Comments
        {
            get { return _Comments; }
            set { _Comments = value; }
        }
    }

    public class UserComment
    {
        private string _CreatingUserName;
        private DateTime _CreatedDateTime;
        private string _ContentHTML;

        public string CreatingUserName
        {
            get { return _CreatingUserName; }
            set { _CreatingUserName = value; }
        }
        public DateTime CreatedDateTime
        {
            get { return _CreatedDateTime; }
            set { _CreatedDateTime = value; }
        }
        public string ContentHTML
        {
            get { return _ContentHTML; }
            set { _ContentHTML = value; }
        }
    }
    public class Section 
    {
        public int sectionId {get; set;}
        public string sectionName {get; set;}
    }
    #endregion

    public class Class1
    {
        public List<NavigationHeader> GetNavigation(int? sectionID)
        {
            return new List<NavigationHeader>()
            {
                new NavigationHeader() 
                { 
                    HeaderName = "header x", 
                    Links = new List<NavigationLink>()
                    {
                        new NavigationLink() { LinkName = "link a", LinkURL = "#" },
                        new NavigationLink() { LinkName = "link b", LinkURL = "#" },
                        new NavigationLink() { LinkName = "link c", LinkURL = "#" },
                        new NavigationLink() { LinkName = "link d", LinkURL = "#" }
                    }
                },
                new NavigationHeader() 
                {
                    HeaderName = "header y", 
                    Links = new List<NavigationLink>()
                    {
                        new NavigationLink() { LinkName = "link 0", LinkURL = "#" },
                        new NavigationLink() { LinkName = "link 1", LinkURL = "#" },
                        new NavigationLink() { LinkName = "link 2", LinkURL = "#" },
                        new NavigationLink() { LinkName = "link 3", LinkURL = "#" }
                    }
                }
            };
        }

        public List<Content> GetContents(int? postID, int? categoryID, int? sectionID, out int? secID)
        {
            secID = sectionID;
            return new List<Content>()
            {
                new Content() {ContentHTML = "abcd"}
            };
        }

        public List<Section> GetSections()
        {
            List<Section> sections = new List<Section>()
            {
                new Section() { sectionId = 1, sectionName="Our Story"},
                new Section() { sectionId = 2, sectionName="Our Proposal"},
                new Section() { sectionId = 3, sectionName="Our Photos"},
                new Section() { sectionId = 4, sectionName="Ceremony and Reception"},
                new Section() { sectionId = 5, sectionName="Wedding Party"},
                new Section() { sectionId = 6, sectionName="Map of Events"},
                new Section() { sectionId = 7, sectionName="RSVP"}
            };

            return sections.ToList();
        }


        public class LinkGroup
        {
            public string GroupURL { get; set; }
            public string GroupName { get; set; }

            public List<Link> Links { get; set; }
        }

        public class Link
        {
            public string LinkURL { get; set; }
            public string LinkName { get; set; }

            public List<Link> SubGroup { get; set; }
        }
    }
}
