﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using HackNet.Security;
using HackNet.Data;
using HackNet.Loggers;

using System.Web.Security;

namespace HackNet.Auth {
	public partial class SignIn : Page {
		protected void Page_Load(object sender, EventArgs e)
		{
			if (CurrentUser.IsAuthenticated())
				Response.Redirect("~/Game/Home");

			DataContext ctx = new DataContext();
        }

        protected void LoginClick(object sender, EventArgs e)
        {
			string email = Email.Text.ToLower();
			try
			{
				using (Authenticate auth = new Authenticate(email))
				{
					AuthResult result = auth.ValidateLogin(UserPass.Text);
					switch (result)
					{
						case AuthResult.Success:
							LoginSuccess(email, auth.TempKeyStore);
							break;
						case AuthResult.PasswordIncorrect:
							Msg.Text = "User and/or password not found (1)";
							break;
						case AuthResult.UserNotFound:
							Msg.Text = "User and/or password not found (2)";
							break;
						case AuthResult.EmailNotVerified:
							Msg.Text = "Email has not been verified";
							break;
						default:
							Msg.Text = "Unhandled error has occured";
							break;
					}
				}
			} catch (UserException)
			{
				Msg.Text = "User and/or password not found (2)";
			}
		}

		private void LoginSuccess(string email, KeyStore ks)
		{
			using (Authenticate a = new Authenticate(email))
			{
				string redir = Request.QueryString["ReturnUrl"];

				if (!IsLocalUrl(redir))
					redir = "/";

				if (string.IsNullOrWhiteSpace(redir))
					redir = "~/Default";
				else if (redir.Equals("/"))
					redir = "~/Default";
				else
					redir = Request.QueryString["ReturnUrl"];
					
				if (a.Is2FAEnabled)
				{
					Session["TempKeyStore"] = ks;
					Session["Cookie"] = a.AuthCookie;
					Session["PasswordSuccess"] = email;
					Session["ReturnUrl"] = redir;
					Response.Redirect("~/Auth/OtpVerify");
				} else
				{
					Session["KeyStore"] = ks;
					Response.Cookies.Add(a.AuthCookie);
					Response.Redirect(redir);
				}
			}
		}

		private bool IsLocalUrl(string url)
		{
			if (string.IsNullOrEmpty(url))
			{
				return false;
			}

			Uri absoluteUri;
			if (Uri.TryCreate(url, UriKind.Absolute, out absoluteUri))
			{
				return Request.Url.Host.Equals(absoluteUri.Host, StringComparison.OrdinalIgnoreCase);
			}
			else
			{
				bool isLocal = !url.StartsWith("http:", StringComparison.OrdinalIgnoreCase)
					&& !url.StartsWith("https:", StringComparison.OrdinalIgnoreCase)
					&& Uri.IsWellFormedUriString(url, UriKind.Relative);
				return isLocal;
			}
		}
	}
}