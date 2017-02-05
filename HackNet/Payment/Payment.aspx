﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Game.Master" AutoEventWireup="true" CodeBehind="Payment.aspx.cs" Inherits="HackNet.Payment.Payment" %>
<asp:Content ID="Content1" ContentPlaceHolderID="GameContent" runat="server">
    
    <link rel="stylesheet" href="/payment/backend/paymentCSS.css" />
    <script src="/Payment/backend/JSv2.js" lang="javascript" type="text/javascript"></script>

    <div class="panel panel-default">
		<div class="panel-heading">
			<h3 class="panel-title">Payment</h3>
		</div>
		<div class="panel-body">
            <asp:Label ID="warning" runat="server" Text="* WARNING *" ForeColor="Red" Font-Bold="True" Font-Size="Large"></asp:Label>
            <p>You have chosen to use REAL currency to pay for premium items.
                <br />
                If you have NOT chosen to do so, <asp:LinkButton ID="backButton" runat="server" postbackurl="~/Game/Market.aspx">click to go back</asp:LinkButton>
            </p>

            <h3>Payment Details</h3>
            <asp:Label ID="packageDetailsLbl" runat="server" forecolor="Red"></asp:Label>
   
            <hr /><p>For Paypal, click on the Paypal button. For Credit Card, enter a valid card number and expiration date.</p>
    
            <div class="dropinBox">
                <div id="payment-form"></div>
                <input type="hidden" name="payment_method_nonce" id="payment_method_nonce"/>
            </div>

            <br />
            <asp:Button ID="checkoutBtn" type='submit' runat="server" Text="Checkout" OnClick="checkoutClick" CssClass="btn btn-success" />
            <asp:Button ID="CancelButton" Text="Cancel" CssClass="btn btn-success"	OnClick="CancelClick" runat="server" />

            <script>
                braintree.setup("<%=clientToken%>", "dropin", {
                    container: 'payment-form',
                    form: 'checkout-form'
                });
            </script>
        </div>
    </div>
</asp:Content>