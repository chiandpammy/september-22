<%@ Page Title="Error" Language="C#" MasterPageFile="~/Master/Site_1Col.master" AutoEventWireup="true"
    CodeBehind="Error.aspx.cs" Inherits="September22.Error" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />

    <style type="text/css">
        #parallax_shell
        {
            position: relative; 
            margin-left: -20px;
        }
        #parallax_field{
            overflow: hidden;
            position: absolute;
            left: 0;
            top: 0;
            height: 370px;
            width: 730px;
        }
        #parallax_field #parallax_bg {
            position: absolute;
            top: 0px;
            left: 0px;
            width: 110%;
            height: 425px;
            z-index: 1;
        }
        #parallax_illustration {
            display:block;
            width: 730px;
            height: 370px;
            overflow: hidden;
            clear: both;
        }
        #parallax_illustration #parallax_error_text {
            position: absolute;
            top: 80px;
            left: 30px;
            z-index: 10;
        }
        #parallax_illustration #parallax_octocat {
            position: absolute;
            top: 94px;
            left: 306px;
            z-index: 9;
        }
        #parallax_illustration #parallax_octocatshadow {
            position: absolute;
            top: 297px;
            left: 321px;
            z-index: 7;
        }
        #parallax_illustration #parallax_speeder {
            position: absolute;
            top: 100px;
            left: 260px;
            z-index: 8;
        }
        #parallax_illustration #parallax_speedershadow {
            position: absolute;
            top: 200px;
            left: 270px;
            z-index: 6;
        }
        #parallax_illustration #parallax_building_1 {
            position: absolute;
            top: 43px;
            left: 137px;
            z-index: 5;
        }
        #parallax_illustration #parallax_building_2 {
            position: absolute;
            top: 100px;
            left: 540px;
            z-index: 4;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MiddleColumnContent" runat="server">
    <h2><span>Oops!</span></h2>
    <br />
    <div id="parallax_shell">
        <div id="parallax_field">
            <img alt="building" id="parallax_bg" src="../App_Themes/Wedding/Images/parallax_bg.jpg" />
        </div>
        <div id="parallax_illustration">
            <img alt="404 | “This is not the web page you are looking for”" id="parallax_error_text" src="../App_Themes/Wedding/Images/parallax_errortext.png" />
            <img alt="Octobi Wan Catnobi" id="parallax_octocat" src="../App_Themes/Wedding/Images/parallax_octocat.png" />
            <img alt="land speeder" id="parallax_speeder" src="../App_Themes/Wedding/Images/parallax_speeder.png" />
            <img alt="Octobi Wan Catnobi's shadow" id="parallax_octocatshadow" src="../App_Themes/Wedding/Images/parallax_octocatshadow.png" />
            <img alt="land speeder's shadow" id="parallax_speedershadow" src="../App_Themes/Wedding/Images/parallax_speedershadow.png" />
            <img alt="building" id="parallax_building_1" src="../App_Themes/Wedding/Images/parallax_building_1.png" />
            <img alt="building" id="parallax_building_2" src="../App_Themes/Wedding/Images/parallax_building_2.png" />
        </div>
    </div>
</asp:Content>