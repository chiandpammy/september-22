using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Documents;
using System.Windows.Ink;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Animation;
using System.Windows.Media.Imaging;
using System.Windows.Shapes;

namespace DoodleApp
{
    public partial class MainPage : UserControl
    {
        public MainPage()
        {
            InitializeComponent();
            SetPresenterClip();
        }

        Stroke myStroke;

        private void iPresenter_MouseLeftButtonDown(object sender, MouseEventArgs e)
        {
            // Use Mouse to Catch Data
            iPresenter.CaptureMouse();

            // Collect Data Point and Save Value to StylusPointCollection
            StylusPointCollection stylusPointCollection = new StylusPointCollection();

            stylusPointCollection.Add(e.StylusDevice.GetStylusPoints(iPresenter));

            // Save Data Point Collection as Stroke
            myStroke = new Stroke(stylusPointCollection);

            // Set Drawing Effect of Stork as Color, Size and so on
            myStroke.DrawingAttributes.Color = Colors.Gray;

            myStroke.DrawingAttributes.Width = 1;
            myStroke.DrawingAttributes.Height = 1;
            iPresenter.Strokes.Add(myStroke);
        }

        private void iPresenter_MouseMove(object sender, MouseEventArgs e)
        {
            // Add Data Point to Stroke when Moving Mouse
            if (myStroke != null)
                myStroke.StylusPoints.Add(e.StylusDevice.GetStylusPoints(iPresenter));
        }

        private void iPresenter_LostMouseCapture(object sender, MouseEventArgs e)
        {
            // Clear Stroke
            myStroke = null;

            iPresenter.ReleaseMouseCapture();// Release Mouse Location
        }

        /// <summary>
        /// Set Drawing Range as Size of InkPresenter
        /// </summary>
        private void SetPresenterClip()
        {
            RectangleGeometry MyRectangleGeometry = new RectangleGeometry();
            MyRectangleGeometry.Rect = new Rect(0, 0, iPresenter.ActualWidth, iPresenter.ActualHeight);

            // Set Available Range to Get Drawing Content
            iPresenter.Clip = MyRectangleGeometry;
        }

        private void button1_Click(object sender, RoutedEventArgs e)
        {
            // Save Image which is Drawing in InkPresenter Doodle Pad
            WriteableBitmap _bitmap = new WriteableBitmap(iPresenter, null);

            this.showIP.Source = _bitmap;

            SaveFileDialog sfd = new SaveFileDialog();

            sfd.Filter = "PNG Files (*.png)|*.png|All Files (*.*)|*.*";

            sfd.DefaultExt = ".png";

            sfd.FilterIndex = 1;

            if ((bool)sfd.ShowDialog())
            {
                using (Stream fs = sfd.OpenFile())
                {
                    int width = _bitmap.PixelWidth;
                    int height = _bitmap.PixelHeight;

                    EditableImage ei = new EditableImage(width, height);

                    for (int i = 0; i < height; i++)
                    {
                        for (int j = 0; j < width; j++)
                        {
                            int pixel = _bitmap.Pixels[(i * width) + j];
                            ei.SetPixel(j, i,
                                        (byte) ((pixel >> 16) & 0xFF),
                                        (byte) ((pixel >> 8) & 0xFF),
                                        (byte) (pixel & 0xFF),
                                        (byte) ((pixel >> 24) & 0xFF));
                        }
                    }

                    // Get Stream
                    Stream png = ei.GetStream();

                    int len = (int)png.Length;

                    byte[] bytes = new byte[len];

                    png.Read(bytes, 0, len);

                    fs.Write(bytes, 0, len);

                    MessageBox.Show("Succeed to Save Image");
                }
            }
        }
    }
}
