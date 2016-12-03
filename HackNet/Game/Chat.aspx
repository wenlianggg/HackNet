﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Game.Master" AutoEventWireup="true" CodeBehind="Chat.aspx.cs" Inherits="HackNet.Game.Chat" %>

<asp:Content ID="HeadContent" ContentPlaceHolderID="GameHeadPH" runat="server">
	<link rel="stylesheet" href="../Content/Chat.css" />
</asp:Content>
<asp:Content ID="ChatContent" ContentPlaceHolderID="GameContent" runat="server">
	<nav class="navbar navbar-default">
    <div class="navbar-header">
      <a class="navbar-brand" href="#">HackNet Chat</a>
    </div>
	<input type="text" class="form-control" style="top:20px;" placeholder="Recipient Username">
</nav>
	<div class="chatsection">
		<div class="ChatTitle">Chatting with Wuggle</div>
		<ol class="chat">
			<li class="other">
				<div class="msg">
					<div class="user">Wuggle<span class="range admin">Admin</span></div>
					<p>Dude</p>
					<p>
						Want to go dinner?
					</p>
					<time>20:17</time>
				</div>
			</li>
			<li class="self">
				<div class="msg">
					<p>Hmm...</p>
					<p>
						HOW ABOUT NO!
					</p>
					<p>I'd prefer another day actually</p>
					<time>20:18</time>
				</div>
			</li>
			<li class="other">
				<div class="msg">
					<div class="user">Wuggle<span class="range admin">Admin</span></div>
					<p>
						Awwww okay!
					</p>
					<time>20:18</time>
				</div>
			</li>
			<li class="self">
				<div class="msg">
					<p>Seeya then!</p>
					<p>It's for tomorrow I guess</p>
					<time>20:18</time>
				</div>
			</li>
		</ol>
	</div>
	<div>
		<textarea placeholder="Say something"></textarea><input type="submit" class="send" value="" />
	</div>
</asp:Content>
