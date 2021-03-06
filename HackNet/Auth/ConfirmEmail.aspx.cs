﻿using HackNet.Security;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HackNet.Auth
{
	public partial class ConfirmEmail : System.Web.UI.Page
	{
		protected void Page_Load(object sender, EventArgs e)
		{
			string email = Request.QueryString["Email"];
			string cfmcode = Request.QueryString["Code"];

            if (CurrentUser.IsAuthenticated())
            {
                Response.Redirect("~/Default", true);
            }

			if (email != null && cfmcode != null)
			{
				Confirm(email, cfmcode);
			}
		}

		protected void EmailConfirm_Click(object sender, EventArgs e)
		{
			string email = Email.Text;
			string cfmcode = EmailCode.Text;

			Confirm(email, cfmcode);
		}

		protected void Confirm(string email, string cfmcode)
		{
			switch (EmailConfirm.EmailValidate(email, cfmcode))
			{
				case EmailConfirmResult.Failed:
					Msg.Text = "Email address confirmation code failed";
					break;
				case EmailConfirmResult.Success:
					Msg.Text = "Email address successfully confirmed";
					Msg.ForeColor = System.Drawing.Color.GreenYellow;
					EmailConfirmBtn.Visible = false;
					ConfirmTable.Visible = false;
					break;
				case EmailConfirmResult.UserNotFound:
				case EmailConfirmResult.OtherError:
					Msg.Text = "User not found or an error has occured";
					break;
			}
		}
	}
}