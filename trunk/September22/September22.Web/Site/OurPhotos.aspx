<%@ Page Title="Our Photos" Language="C#" MasterPageFile="~/Master/Site_2Col.master" AutoEventWireup="true" CodeBehind="OurPhotos.aspx.cs" Inherits="September22.OurPhotos" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
<style type="text/css">
  <%--* {
    font-family: "Lucida Grande", "Lucida Sans Unicode", "Lucida Sans", Verdana, Arial, sans-serif;
    color: #333;
    line-height: 140%;
  }
  select, input, textarea {
    font-size: 1em;
  }
  body {
    padding: 30px;
    font-size: 70%;
    width: 800px;
  }
  h2 {
    margin-top: 1.2em;
    margin-bottom: 0;
    padding: 0;
    border-bottom: 1px dotted #dedede;
  }
  h3 {
    margin-top: 1.2em;
    margin-bottom: 0;
    padding: 0;
  }--%>
  .example {
    border: 1px solid #CCC;
    background: #f2f2f2;
    padding: 10px;
  }
  ul {
    list-style-image:url(list-style.gif);
  }
  pre {
    font-family: "Lucida Console", "Courier New", Verdana;
    border: 1px solid #CCC;
    background: #f2f2f2;
    padding: 10px;
  }
  code {
    font-family: "Lucida Console", "Courier New", Verdana;
    margin: 0;
    padding: 0;
  }

  #gallery {
    padding: 30px;
    background: #e1eef5;
  }
  #descriptions {
    position: relative;
    height: 50px;
    background: #EEE;
    margin-top: 10px;
    width: 640px;
    padding: 10px;
    overflow: hidden;
  }
    #descriptions .ad-image-description {
      position: absolute;
    }
      #descriptions .ad-image-description .ad-description-title {
        display: block;
      }
  </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="LeftColumnContent" runat="server">
    <div id="wrapper">
        <div id="steps">
            <div class="step">
                <h2><span>Through the Years</span></h2>
                <p>
                    <%--<div class="ad-gallery">
                      <div class="ad-image-wrapper">
                      </div>
                      <div class="ad-controls">
                      </div>
                      <div class="ad-nav">
                        <div class="ad-thumbs">
                          <ul class="ad-thumb-list">
                            <li>
                              <a href="../Photos/Anniversaries/2003 - 1st Anniversary - 1 of 2.jpg">
                                <img src="../Photos/Anniversaries/Thumbs/2003 - 1st Anniversary - 1 of 2 - thumb.jpg" title="2003 - 1st Anniversary - 1 of 2" alt="2003 - 1st Anniversary - 1 of 2" />
                              </a>
                            </li>
                            <li>
                              <a href="../Photos/Anniversaries/2003 - 1st Anniversary - 2 of 2.jpg">
                                <img src="../Photos/Anniversaries/Thumbs/2003 - 1st Anniversary - 2 of 2 - thumb.jpg" title="2003 - 1st Anniversary - 2 of 2" alt="2003 - 1st Anniversary - 2 of 2" />
                              </a>
                            </li>
                          </ul>
                        </div>
                      </div>
                    </div>--%>
                        <div id="gallery" class="ad-gallery">
      <div class="ad-image-wrapper">
      </div>
      <div class="ad-controls">
      </div>
      <div class="ad-nav">
        <div class="ad-thumbs">
          <ul class="ad-thumb-list">
            <li>
                              <a href="../Photos/Anniversaries/2003 - 1st Anniversary - 1 of 2.jpg">
                                <img src="../Photos/Anniversaries/Thumbs/2003 - 1st Anniversary - 1 of 2 - thumb.jpg" title="2003 - 1st Anniversary - 1 of 2" alt="2003 - 1st Anniversary - 1 of 2" class="image1" />
                              </a>
                            </li>
                            <li>
                              <a href="../Photos/Anniversaries/2003 - 1st Anniversary - 2 of 2.jpg">
                                <img src="../Photos/Anniversaries/Thumbs/2003 - 1st Anniversary - 2 of 2 - thumb.jpg" title="2003 - 1st Anniversary - 2 of 2" alt="2003 - 1st Anniversary - 2 of 2" class="image2" />
                              </a>
                            </li>
            <%--<li>
              <a href="images/11.jpg">
                <img src="images/thumbs/t11.jpg" title="A title for 11.jpg" longdesc="http://coffeescripter.com" alt="This is a nice, and incredibly descriptive, description of the image 11.jpg" class="image2">
              </a>
            </li>
            <li>
              <a href="images/12.jpg">
                <img src="images/thumbs/t12.jpg" title="A title for 12.jpg" alt="This is a nice, and incredibly descriptive, description of the image 12.jpg" class="image3">
              </a>
            </li>
            <li>
              <a href="images/13.jpg">
                <img src="images/thumbs/t13.jpg" title="A title for 13.jpg" alt="This is a nice, and incredibly descriptive, description of the image 13.jpg" class="image4">
              </a>
            </li>
            <li>
              <a href="images/14.jpg">
                <img src="images/thumbs/t14.jpg" title="A title for 14.jpg" alt="This is a nice, and incredibly descriptive, description of the image 14.jpg" class="image5">
              </a>
            </li>
            <li>
              <a href="images/2.jpg">
                <img src="images/thumbs/t2.jpg" title="A title for 2.jpg" alt="This is a nice, and incredibly descriptive, description of the image 2.jpg" class="image6">
              </a>
            </li>
            <li>
              <a href="images/3.jpg">
                <img src="images/thumbs/t3.jpg" title="A title for 3.jpg" alt="This is a nice, and incredibly descriptive, description of the image 3.jpg" class="image7">
              </a>
            </li>
            <li>
              <a href="images/4.jpg">
                <img src="images/thumbs/t4.jpg" title="A title for 4.jpg" alt="This is a nice, and incredibly descriptive, description of the image 4.jpg" class="image8">
              </a>
            </li>
            <li>
              <a href="images/5.jpg">
                <img src="images/thumbs/t5.jpg" title="A title for 5.jpg" alt="This is a nice, and incredibly descriptive, description of the image 5.jpg" class="image9">
              </a>
            </li>
            <li>
              <a href="images/6.jpg">
                <img src="images/thumbs/t6.jpg" title="A title for 6.jpg" alt="This is a nice, and incredibly descriptive, description of the image 6.jpg" class="image10">
              </a>
            </li>
            <li>
              <a href="images/7.jpg">
                <img src="images/thumbs/t7.jpg" title="A title for 7.jpg" alt="This is a nice, and incredibly descriptive, description of the image 7.jpg" class="image11">
              </a>
            </li>
            <li>
              <a href="images/8.jpg">
                <img src="images/thumbs/t8.jpg" title="A title for 8.jpg" alt="This is a nice, and incredibly descriptive, description of the image 8.jpg" class="image12">
              </a>
            </li>
            <li>
              <a href="images/9.jpg">
                <img src="images/thumbs/t9.jpg" title="A title for 9.jpg" alt="This is a nice, and incredibly descriptive, description of the image 9.jpg" class="image13">
              </a>
            </li>--%>
          </ul>
        </div>
      </div>
    </div>
<%--
    <div id="descriptions">

    </div>
    <p>Examples of how you can alter the behaviour on the fly;
    Effect: <select id="switch-effect">
      <option value="slide-hori">Slide horizontal</option>
      <option value="slide-vert">Slide vertical</option>
      <option value="resize">Shrink/grow</option>
      <option value="fade">Fade</option>
      <option value="">None</option>
    </select><br>
    <a href="#" id="toggle-slideshow">Toggle slideshow</a> |
    <a href="#" id="toggle-description">Toggle having description outside of image</a>
    </p>--%>
                </p>
            </div>
            <div class="step">
                <h2><span>Ireland</span></h2>
                <p>
                    Coming soon...
                </p>
            </div>
            <div class="step">
                <h2><span>Through the Years</span></h2>
                <p>
                    Coming soon...
                </p>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="RightColumnContent" runat="server">
    <div id="navigation">
        <h3>
            <span>
                <asp:Label ID="lblPhotos" runat="server" Text="Our Photos"></asp:Label>
            </span>
        </h3>
        <ul>
            <li><asp:HyperLink ID="hlAnniversaries" runat="server" Text="Through the Years" NavigateUrl="#" /></li>
            <li><asp:HyperLink ID="HyperLink3" runat="server" Text="Ireland" NavigateUrl="#" /></li>
            <li><asp:HyperLink ID="HyperLink2" runat="server" Text="Our Proposal" NavigateUrl="#" /></li>
        </ul>
    </div>
</asp:Content>