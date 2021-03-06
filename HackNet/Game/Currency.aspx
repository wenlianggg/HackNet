﻿<%@ Page Language="C#" MasterPageFile="~/Game.Master" AutoEventWireup="true" CodeBehind="Currency.aspx.cs" Inherits="HackNet.Game.Currency" %>
<asp:Content ID="Content1" ContentPlaceHolderID="GameContent" runat="server">

    <link rel="stylesheet" href="/Market1/market1.css" />
    <!-- this cssfile can be found in the jScrollPane package 
    <link rel="stylesheet" type="text/css" href="jquery.jscrollpane.css" />
    <!-- latest jQuery direct from google's CDN
    script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.2/jquery.min.js"></script>
    <!-- the jScrollPane script
    script type="text/javascript" src="jquery.jscrollpane.min.js"></script
-->
    <script>
        function showEditModal() {
            $('#EditModal').modal('show');
        }
    </script>
    <link rel="stylesheet" href="/payment/backend/redirectimagebutton.css" />

    <style>
        .customscrollbar{
        }

        .nav-tabs > li > a{
            color:limegreen;
        }
        .nav-tabs > li.active > a,
        .nav-tabs > li.active > a:hover,
        .nav-tabs > li.active > a:focus {
            background-color:rgba(10, 10, 10, 0.9);
            color: white;
            border: 0px solid #333;
        }

        .nav > li a:hover {
            background-color: rgba(10, 10, 10, 0.9);
            color: white;
            border: 0px solid #333;
        }
    </style>

<!-- =============== START MODAL CONTENT ============== -->
    <div id="EditModal" class="modal fade" role="dialog">
        <div class="modal-dialog">
            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <asp:Label runat="server" Text="*WARNING*" ForeColor="Red" Font-Size="Larger" Font-Bold="True"></asp:Label>
                </div>
                <div class="modal-body" style="color: black;">
                    <asp:Label ID="messageLabel" runat="server" Text=""></asp:Label>
                </div>
                <div class="modal-footer">
                    <asp:Button id="convertFromModal" CssClass="btn btn-default" runat="server" OnClick="ConversionButton_Click" Text="Confirm" />
                    <asp:Button id="cancelConvert" CssClass="btn btn-default" runat="server" OnClick="cancelConvertBtn_Click" Text="Cancel" />
                </div>
            </div>
        </div>
    </div>
<!-- =============== END MODAL CONTENT ============== -->

    <div class="panel panel-default">
		<div class="panel-heading">
			<h3 class="panel-title">Market - Currency</h3>
		</div>
		<div class="panel-body">
            <div class="col-xs-3">
                <!-- required for floating -->
                <!-- Nav tabs -->
                <ul class="nav nav-tabs tabs-left fade in active" style="width:20%;">
                    <li class="active"><a href="#conversion" data-toggle="tab">Conversion</a></li>
                    <li><a href="#packages" data-toggle="tab">Packages</a></li>
                </ul>
            </div>
            <div class="col-xs-9" style="float:left ;">
                <!-- Tab panes -->
                <div class="tab-content">
<!-- ====================== Conversion tab ===================== -->
                    <div class="tab-pane fade in active" id="conversion">
                        Enter the number of bucks you wish to convert to coins. Click on 'Convert' once you are done.
                        <hr />
                        <asp:UpdatePanel ID="ConversionPanel" runat="server">
                            <ContentTemplate>
                                Bucks:
                                <asp:TextBox ID="buckTextBox" CssClass="form-control" runat="server" autocomplete="off" OnTextChanged="buckTextBox_TextChanged" AutoPostBack="true"></asp:TextBox>
                                <asp:RangeValidator 
                                    ID="buckValidator" ControlToValidate="buckTextBox" 
                                    MinimumValue="0" Type="Integer" runat="server"
                                    ErrorMessage="* Please enter a valid number" ForeColor="Red">
                                </asp:RangeValidator>
                               <br />
                               <asp:RegularExpressionValidator 
                                    ID="buckExValidator" runat="server" 
                                    ErrorMessage="* Please use whole numbers only" ValidationExpression="^\d+$"
                                    ControlToValidate="buckTextBox" ForeColor="Red">
                               </asp:RegularExpressionValidator>
                                    <!-- expressions: ^[1-9]\d$ || ^\d+$ || ^[0-9]*$ but allows space-->

                               <br />Coins: <asp:Label ID="convertedCoinLabel" runat="server" Text=""></asp:Label>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                        <br />
                        <asp:Button ID="confirmConvertBtn" runat="server" CssClass="btn btn-success" Text="Convert" OnClick="confirmConvertBtn_Click"/>
                    </div>

<!-- ====================== End Conversion tab ===================== -->

<!-- ================= Packages tab ====================== -->
                    <div class="tab-pane fade in" id="packages">
                        <asp:Label ID="warning" runat="server" Text="* WARNING *" ForeColor="Red" Font-Bold="True" Font-Size="Large"></asp:Label>
                        <br />These premium packages require the use of REAL money.
                        <hr />
<!-- ================= repeater ====================== -->
                        <asp:Repeater ID="packageRepeater" runat="server">
                            <ItemTemplate>
                                <asp:LinkButton ID="packageButton" class="redirectButton" runat="server" 
                                        OnCommand="buyPackage_Command"  CommandArgument='<%#Eval("PackageId")%>' Font-Underline="False">
                                    <asp:Image ID="packageImage" runat="server" CssClass="redirectImg" ImageUrl='<%#Eval("ItemPic")%>'  BackColor="Transparent" />
                                    <br />
                                    <asp:Label ID="packageDesc" CssClass="redirectLbl" runat="server" Text='<%#Eval("Description")%>' Font-Size="Smaller"></asp:Label>
                                    <br />
                                    <asp:Label ID="packageName" CssClass="redirectLbl" runat="server" Text="Package "></asp:Label>
                                        <asp:Label ID="packageNo" CssClass="redirectLbl" runat="server" Text='<%#Eval("PackageId")%>'></asp:Label>
                                </asp:LinkButton>
                            </ItemTemplate>
                        </asp:Repeater>
<!-- ================= end repeater ====================== -->
                    </div>
<!-- ================= end Packages tab ====================== -->


                 
                </div>
            </div>
        </div>
    </div>
    <br /><br /><br />
</asp:Content>
