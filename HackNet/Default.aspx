﻿<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="HackNet._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="panel panel-default">
        <div class="panel-body">
            <div class="col-sm-12 col-md-9">
                <div class="col-sm-12 col-md-3" style="border: 1px dotted blue; height: 96px; width: 96px;">
                    Profile Picture
                </div>
                <div class="col-sm-12 col-md-1">
                </div>
                <div class="col-sm-12 col-md-5">
                    <div class="row">
                        <asp:Label runat="server" ID="PlayerName">DogRoy1997</asp:Label>
                    </div>
                    <div class="row">
                        Level
                        <asp:Label runat="server" ID="LevelsLbl" Text="4" Font-Bold="true"></asp:Label>
                    </div>

                    <div class="row">
                        <div class="progress">
                            <div class="progress-bar progress-bar-striped active" role="progressbar" aria-valuenow="70" aria-valuemin="0" aria-valuemax="100" style="width: 70%">
                                <asp:Label runat="server" Text="7000/10000XP (70%)"></asp:Label>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-sm-12 col-md-3">
                    <div class="row" style="text-align: right">
                        Coins
                        <asp:Label runat="server" ID="CoinsLbl" Text="999" Font-Bold="true"></asp:Label>
                    </div>
                    <div class="row" style="text-align: right">
                        Bucks
                        <asp:Label runat="server" ID="BucksLbl" Text="10" Font-Bold="true"></asp:Label>
                    </div>
                </div>
            </div>
            <div class="col-sm-12 col-md-3" style="box-shadow: inset 0px 0px 10px rgba(0,0,0,0.9); background-color: lightslategrey; color: white;">
                Medals
                 <asp:BulletedList runat="server">
                     <asp:ListItem> Script Kiddie Medal </asp:ListItem>
                 </asp:BulletedList>
                <br />
            </div>
        </div>
    </div>
    <div class="row text-center">
        <div class="btn-group btn-group-lg" role="group" aria-label="...">
            <button type="button" class="btn btn-default">Hackspace</button>
            <button type="button" class="btn btn-default">Missions</button>
            <button type="button" class="btn btn-default">Events</button>
            <button type="button" class="btn btn-default">Logs</button>
            <button type="button" class="btn btn-default">Inventory</button>
            <button type="button" class="btn btn-default">Market</button>
        </div>
    </div>
    <br />
    <div class="col-sm-12 col-md-8">
        <div class="panel panel-default">
            <div class="panel-heading">
                <strong>Missions</strong>
            </div>
            <div class="panel-body">
            </div>
            <ul class="list-group">
                <li class="list-group-item">Cras justo odio</li>
                <li class="list-group-item">Dapibus ac facilisis in</li>
                <li class="list-group-item">Morbi leo risus</li>
                <li class="list-group-item">Porta ac consectetur ac</li>
                <li class="list-group-item">Vestibulum at eros</li>
            </ul>
        </div>
    </div>
    <div class="col-sm-12 col-md-4">
        <div class="panel panel-warning">
            <div class="panel-heading">
                <strong>Events</strong>
            </div>
            <div class="panel-body">
            </div>
        </div>
    </div>


</asp:Content>
