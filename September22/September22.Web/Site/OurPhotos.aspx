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
                <img src="../Photos/Anniversaries/Thumbs/2003 - 1st Anniversary - 1 of 2 - thumb.jpg" class="image1" />
                </a>
            </li>
            <li>
                <a href="../Photos/Anniversaries/2003 - 1st Anniversary - 2 of 2.jpg">
                <img src="../Photos/Anniversaries/Thumbs/2003 - 1st Anniversary - 2 of 2 - thumb.jpg" class="image2" />
                </a>
            </li>
            <li>
                <a href="../Photos/Anniversaries/2004 - 2nd Anniversary - 1 of 2.jpg">
                <img src="../Photos/Anniversaries/Thumbs/2004 - 2nd Anniversary - 1 of 2 - thumb.jpg" class="image1" />
                </a>
            </li>
            <li>
                <a href="../Photos/Anniversaries/2004 - 2nd Anniversary - 2 of 2.jpg">
                <img src="../Photos/Anniversaries/Thumbs/2004 - 2nd Anniversary - 2 of 2 - thumb.jpg" class="image2" />
                </a>
            </li>
            <li>
                <a href="../Photos/Anniversaries/2005 - 3rd Anniversary - 1 of 4.jpg">
                <img src="../Photos/Anniversaries/Thumbs/2005 - 3rd Anniversary - 1 of 4 - thumb.jpg" class="image1" />
                </a>
            </li>
            <li>
                <a href="../Photos/Anniversaries/2005 - 3rd Anniversary - 2 of 4.jpg">
                <img src="../Photos/Anniversaries/Thumbs/2005 - 3rd Anniversary - 2 of 4 - thumb.jpg" class="image2" />
                </a>
            </li>
          </ul>
        </div>
      </div>
    </div>
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
            <li><asp:HyperLink ID="hlIreland" runat="server" Text="Ireland" NavigateUrl="#" /></li>
            <li><asp:HyperLink ID="hlIndia" runat="server" Text="India" NavigateUrl="#" /></li>
        </ul>
    </div>
</asp:Content>