using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Routing;
using System.Web.Security;
using System.Web.SessionState;

namespace September22
{
    public class Global : System.Web.HttpApplication
    {
        void Application_Start(object sender, EventArgs e)
        {
            // Code that runs on application startup
            RegisterRoutes(RouteTable.Routes);
        }

        private void RegisterRoutes(RouteCollection routeCollection)
        {
            routeCollection.MapPageRoute(string.Empty, "Error/", "~/Site/Error.aspx");
            routeCollection.MapPageRoute(string.Empty, "Home/", "~/Site/Home.aspx");
            routeCollection.MapPageRoute(string.Empty, "Map/", "~/Site/Map.aspx");
            routeCollection.MapPageRoute(string.Empty, "Photo/", "~/Site/OurPhotos.aspx");
            routeCollection.MapPageRoute(string.Empty, "Wedding/", "~/Site/OurWedding.aspx");
            routeCollection.MapPageRoute(string.Empty, "Story/", "~/Site/OurStory.aspx");
            routeCollection.MapPageRoute(string.Empty, "RSVP/", "~/Site/Rsvp.aspx");
            routeCollection.MapPageRoute(string.Empty, "Party/", "~/Site/WeddingParty.aspx");
            routeCollection.MapPageRoute(string.Empty, "Contact/", "~/Site/Contact.aspx");
            routeCollection.MapPageRoute(string.Empty, "Guestbook/", "~/Site/Guestbook.aspx");
        }

        void Application_End(object sender, EventArgs e)
        {
            //  Code that runs on application shutdown
        }

        void Application_Error(object sender, EventArgs e)
        {
            // Code that runs when an unhandled error occurs
        }

        void Session_Start(object sender, EventArgs e)
        {
            // Code that runs when a new session is started
        }

        void Session_End(object sender, EventArgs e)
        {
            // Code that runs when a session ends. 
            // Note: The Session_End event is raised only when the sessionstate mode
            // is set to InProc in the Web.config file. If session mode is set to StateServer 
            // or SQLServer, the event is not raised.
        }
    }
}
