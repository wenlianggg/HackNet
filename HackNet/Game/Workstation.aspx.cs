﻿using HackNet.Data;
using HackNet.Security;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HackNet.Game
{
    public partial class Workstation : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            using (DataContext db = new DataContext()) {
               // This is to add a new default machine.
               //Machines.DefaultMachine(Authenticate.GetCurrentUser(),db);
                Machines m=Machines.GetUserMachine(Authenticate.GetCurrentUser(), db);
                // Text Labels
                WorkstationNameLbl.Text = m.MachineName;
                ProcessorLbl.Text = m.MachineProcessor;
                GraphicLbl.Text = m.MachineGraphicCard;
                MemoryLbl.Text = m.MachineMemory;
                PwsupLbl.Text = m.MachinePowerSupply;
                // Attribute Labels
                HpattrLabel.Text = m.Health.ToString();
                AtkattrLabel.Text = m.Attack.ToString();
                DefattrLabel.Text = m.Defence.ToString();
                SpeedattrLabel.Text = m.Speed.ToString();
                // Upgrade Panel
                WorkStnUpgradeName.Text = m.MachineName;
                LoadItemIntoList(ProcessList, 1);
                LoadItemIntoList(GraphicList, 4);
                LoadItemIntoList(MemoryList, 4);
                LoadItemIntoList(PowerSupList, 4);
            }
        }
        private void LoadItemIntoList(DropDownList ddList,int itemType)
        {
            List<Items> itmList = 
                InventoryItem.GetUserInvItems(
                    InventoryItem.GetUserInvList(Authenticate.GetCurrentUser()), itemType);
            System.Diagnostics.Debug.WriteLine("Num of items: "+itmList.Count);
            if (itmList[0] != null)
            {
                ddList.DataTextField = "ItemName";
                ddList.DataValueField = "ItemBonus";
                ddList.DataSource = itmList;
                ddList.DataBind();
            }else
            {
                ddList.Items.Add("No Parts in Inventory");
                ddList.Enabled = false;
            }  
        }


        protected void MarLnkBtn_Click(object sender, EventArgs e)
        {
            Response.Redirect("Market1.aspx");
        }
    }
}