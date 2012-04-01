<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Error.aspx.cs" Inherits="September22.WebForm1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
		<meta http-equiv="X-UA-Compatible" content="IE=edge" />

		<script src="./Scripts/jquery-parallax.js" type="text/javascript"></script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
	<div style="position: relative; margin-left: -235px; margin-top: -8px;" >
        <style type="text/css">
			* {
				margin: 0px;
				padding: 0px;
			}
			#parallax_field{
				overflow: hidden;
				position: absolute;
				left: 0;
				top: 0;
				height: 370px;
				width: 950px;
			}
			#parallax_field #parallax_bg {
				position: absolute;
				top: -20px;
				left: -20px;
				width: 110%;
				height: 425px;
				z-index: 1;
			}
			#parallax_illustration {
				display:block;
				width: 940px;
				height: 370px;
				overflow: hidden;
				clear: both;
			}
			#parallax_illustration #parallax_error_text {
				position: absolute;
				top: 72px;
				left: 72px;
				z-index: 10;
			}
			#parallax_illustration #parallax_octocat {
				position: absolute;
				top: 94px;
				left: 356px;
				z-index: 9;
			}
			#parallax_illustration #parallax_speeder {
				position: absolute;
				top: 150px;
				left: 432px;
				z-index: 8;
			}
			#parallax_illustration #parallax_octocatshadow {
				position: absolute;
				top: 297px;
				left: 371px;
				z-index: 7;
			}
			#parallax_illustration #parallax_speedershadow {
				position: absolute;
				top: 263px;
				left: 442px;
				z-index: 6;
			}
			#parallax_illustration #parallax_building_1 {
				position: absolute;
				top: 73px;
				left: 467px;
				z-index: 5;
			}
			#parallax_illustration #parallax_building_2 {
				position: absolute;
				top: 113px;
				left: 762px;
				z-index: 4;
			}
			#footer {
				margin-top: 0px;
				z-index: 12;
			}
		</style>

		<div id="parallax_field">
			<img style="left: -20px; top: -21.2534px;" alt="building" class="js-plaxify" data-invert="true" data-xrange="0" data-yrange="20" id="parallax_bg" src="./Images/parallax_bg.jpg" height="415" width="940">
		</div>
		<div id="parallax_illustration">
			<img style="left: 70.3064px; top: 72.6267px;" alt="404 | “This is not the web page you are looking for”" class="js-plaxify" data-xrange="20" data-yrange="10" id="parallax_error_text" src="./Images/parallax_errortext.png" height="249" width="271">
			<img style="left: 355.153px; top: 94.6267px;" alt="Octobi Wan Catnobi" class="js-plaxify" data-xrange="10" data-yrange="10" id="parallax_octocat" src="./Images/parallax_octocat.png" height="230" width="188">
			<img style="left: 431.153px; top: 150.627px;" alt="land speeder" class="js-plaxify" data-xrange="10" data-yrange="10" id="parallax_speeder" src="./Images/parallax_speeder.png" height="156" width="440">
			<img style="left: 370.153px; top: 297.627px;" alt="Octobi Wan Catnobi's shadow" class="js-plaxify" data-xrange="10" data-yrange="10" id="parallax_octocatshadow" src="./Images/parallax_octocatshadow.png" height="49" width="166">
			<img style="left: 441.153px; top: 263.627px;" alt="land speeder's shadow" class="js-plaxify" data-xrange="10" data-yrange="10" id="parallax_speedershadow" src="./Images/parallax_speedershadow.png" height="75" width="430">
			<img style="left: 471.234px; top: 71.7466px;" alt="building" class="js-plaxify" data-invert="true" data-xrange="50" data-yrange="20" id="parallax_building_1" src="./Images/parallax_building_1.png" height="123" width="304">
			<img style="left: 767.851px; top: 111.12px;" alt="building" class="js-plaxify" data-invert="true" data-xrange="75" data-yrange="30" id="parallax_building_2" src="./Images/parallax_building_2.png" height="50" width="116">
		</div>
    </div>
</asp:Content>
