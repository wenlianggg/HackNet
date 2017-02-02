﻿using HackNet.Data;
using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HackNet.Admin
{
    public partial class PackageMgmt : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        private DataTable LoadInventory(int itemType)
        {
            List<Items> ilist = Data.Items.GetItems(itemType);
            
            DataTable dt = new DataTable();
            dt.Columns.Add("ItemName", typeof(string));
            dt.Columns.Add("ItemID", typeof(int));
            foreach (Items i in ilist)
            {
                dt.Rows.Add(i.ItemName, i.ItemId);
            }

            //ProcessList.DataSource = dt;
            //ProcessList.DataBind();
            return dt;
        }


        protected void btnAddPackage_Click(object sender, EventArgs e)
        {
            Packages package = new Packages();
            PackageItems pkgItems = new PackageItems();
            package.Description = pkgDesc.Text; //add textbox
            //package.Price = Int32.Parse(packagePrice.Text); //add textbox

            pkgItems.PackageId = package.PackageId;
            //.ItemId = ItemName.ID; // add dropdown and get from current list of items, thereafter must select
            //pkgItems.Quantity = quantity.Text; //add textbox

            using (DataContext db = new DataContext())
            {
                db.Packages.Add(package);
                db.PackageItems.Add(pkgItems);
                db.SaveChanges();
            }
        }

        protected void DisplayItems(object sender, EventArgs e)
        {
            selectedItemLbl.Text = string.Empty;
            Items item = new Items();
            int itemType = Convert.ToInt32(itemTypeDDL.SelectedItem.Value);
            SelectionDataList.DataSource = LoadInventory(itemType);
            SelectionDataList.DataBind();
        }

        protected void SelectedItem_Command(object sender, CommandEventArgs e)
        {
            int itemid = int.Parse(e.CommandArgument.ToString());
            Items i = HackNet.Data.Items.GetItem(itemid);
            selectedItemLbl.Text = i.ItemName.ToString();
        }

        protected void btnAddItem_Click(object sender, EventArgs e)
        {
            Items item = new Items();
            item.ItemName = ItemName.Text;
            item.ItemType = (ItemType)Int32.Parse(ItemTypeList.SelectedItem.Value);

            Stream strm = UploadPhoto.PostedFile.InputStream;
            BinaryReader br = new BinaryReader(strm);
            item.ItemPic = br.ReadBytes((int)strm.Length);
            item.ItemDesc = ItemDesc.Text;
            item.ItemPrice = Int32.Parse(ItemPrice.Text);
            item.ItemBonus = Int32.Parse(ItemStat.Text);
            using (DataContext db = new DataContext())
            {
                db.Items.Add(item);
                db.SaveChanges();
            }
        }

        protected void EditItemBTn_Command(object sender, CommandEventArgs e)
        {
            int itemid = int.Parse(e.CommandArgument.ToString());
            Items i = HackNet.Data.Items.GetItem(itemid);
            Cache["ItemID"] = itemid;
            EditItemName.Text = i.ItemName.ToString();
            EditItemType.Text = i.ItemType.ToString();
            EditItemDesc.Text = i.ItemDesc.ToString();
            EditItemPrice.Text = i.ItemPrice.ToString();
            EditItemBonus.Text = i.ItemBonus.ToString();

            ScriptManager.RegisterStartupScript(this, this.GetType(), "EditItemModal", "showEditItemModal()", true);
        }

        protected void UpdatePartsInfoBtn_Click(object sender, EventArgs e)
        {
            using (DataContext db = new DataContext())
            {
                Items i = Data.Items.GetItem(int.Parse(Cache["ItemID"].ToString()), -1, false, db);
                i.ItemName = EditItemName.Text;
                i.ItemDesc = EditItemDesc.Text;
                i.ItemPrice = int.Parse(EditItemPrice.Text);
                i.ItemBonus = int.Parse(EditItemBonus.Text);

                db.SaveChanges();
            }
        }

    }
}