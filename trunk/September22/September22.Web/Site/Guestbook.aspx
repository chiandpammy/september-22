<%--
        information on this page came from How to: Add Silverlight to a Web Page by Using HTML
        http://msdn.microsoft.com/en-us/library/cc189089(v=vs.95).aspx
--%>

<%@ Page Title="Guestbook" Language="C#" MasterPageFile="~/Master/Site_1Col.master"
    AutoEventWireup="true" CodeBehind="Guestbook.aspx.cs" Inherits="September22.Guestbook" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">
        #silverlightControlHost
        {
            text-align: center;
        }
    </style>
    <script type="text/javascript" src="../Scripts/silverlight.js"></script>
    <script type="text/javascript">
        function onSilverlightError(sender, args) {
            var appSource = "";
            if (sender != null && sender != 0) {
                appSource = sender.getHost().Source;
            }

            var errorType = args.ErrorType;
            var iErrorCode = args.ErrorCode;

            if (errorType == "ImageError" ||
                errorType == "MediaError") {
                return;
            }

            var errMsg = "Unhandled Error in Silverlight Application "
                + appSource + "\n";

            errMsg += "Code: " + iErrorCode + "    \n";
            errMsg += "Category: " + errorType + "       \n";
            errMsg += "Message: " + args.ErrorMessage + "     \n";

            if (errorType == "ParserError") {
                errMsg += "File: " + args.xamlFile + "     \n";
                errMsg += "Line: " + args.lineNumber + "     \n";
                errMsg += "Position: " + args.charPosition + "     \n";
            }
            else if (errorType == "RuntimeError") {
                if (args.lineNumber != 0) {
                    errMsg += "Line: " + args.lineNumber + "     \n";
                    errMsg += "Position: " + args.charPosition +
                        "     \n";
                }
                errMsg += "MethodName: " + args.methodName + "     \n";
            }

            throw new Error(errMsg);
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MiddleColumnContent" runat="server">
    <div id="silverlightControlHost">
        <object width="400" height="400" type="application/x-silverlight-2" data="data:application/x-silverlight-2,">
            <param name="source" value="../ClientBin/DoodleApp.xap"/>
            <param name="onerror" value="onSilverlightError" />
            <param name="background" value="white" />
            <param name="minRuntimeVersion" value="4.0.60310.0" />
            <param name="autoUpgrade" value="true" />
            
            <!-- This displays installation image. -->
            <a href="http://go.microsoft.com/fwlink/?LinkID=149156&v=4.0.60310.0" style="text-decoration: none;">
                <img src="http://go.microsoft.com/fwlink/?LinkId=161376" alt="Get Microsoft Silverlight"
                    style="border-style: none" />
            </a>
        </object>
        <!-- This is for cross-browser compatibility with Safari. -->
        <iframe id="_sl_historyFrame" style='visibility: hidden; height: 0px; width: 0px; border: 0px'></iframe>
    </div>
</asp:Content>
