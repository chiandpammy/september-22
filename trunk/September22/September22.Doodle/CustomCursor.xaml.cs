using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Animation;
using System.Windows.Shapes;

namespace DoodleApp
{
    public partial class CustomCursor : UserControl
    {
        public CustomCursor()
        {
            InitializeComponent();
        }

        public void SetCursor(string resource)
        {
            Uri uri = new Uri(resource, UriKind.Relative);
            MyCursor.Source = new System.Windows.Media.Imaging.BitmapImage(uri);
        }

        public void MoveTo(Point pt)
        {
            this.SetValue(Canvas.LeftProperty, pt.X-40);
            this.SetValue(Canvas.TopProperty, pt.Y-45);
        }
    }
}
