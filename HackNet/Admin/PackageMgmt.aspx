﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.master" AutoEventWireup="true" CodeBehind="PackageMgmt.aspx.cs" Inherits="HackNet.Admin.PackageMgmt" %>
<asp:Content ID="Content1" ContentPlaceHolderID="AdminPanelContent" runat="server">

    <script>
        function showEditItemModal() {
            $('#EditItemModal').modal('show');
        }
    </script>

    
                            

    <div id="EditItemModal" class="modal fade" role="dialog">
        <div class="modal-dialog">
            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <asp:Label runat="server" Text="Edit Item" ForeColor="Black" Font-Size="Larger"></asp:Label>
                </div>
                
                <div class="modal-body" style="color: black">
                    <asp:Label runat="server" Text="Item Name" />
                    <asp:TextBox autocomplete="off" runat="server" ID="EditItemName" Width="280px"></asp:TextBox>

                </div>
                <div class="modal-body" style="color: black">
                    <asp:Label runat="server" Text="Item Type" />
                    <asp:TextBox autocomplete="off" runat="server" ID="EditItemType" Enabled="false" Width="280px"></asp:TextBox>
                </div>
                <div class="modal-body" style="color: black">
                    <asp:Label runat="server" Text="Item Description" />
                    <asp:TextBox autocomplete="off" runat="server" ID="EditItemDesc" Width="280px"></asp:TextBox>
                </div>
                <div class="modal-body" style="color: black">
                    <asp:Label runat="server" Text="Item Price" />
                    <asp:TextBox autocomplete="off" runat="server" ID="EditItemPrice" Width="280px"></asp:TextBox>
                </div>
                <div class="modal-body" style="color: black">
                    <asp:Label runat="server" Text="Bonus" />
                    <asp:TextBox autocomplete="off" runat="server" ID="EditItemBonus" Width="280px"></asp:TextBox>
                </div>
                <div class="modal-footer">
                    <asp:Button runat="server" CssClass="btn btn-default" Text="Update" ID="UpdatePartsInfoBtn" OnClick="UpdatePartsInfoBtn_Click" />
                </div>
            </div>
        </div>
    </div>

    <div class="container-fluid">
        <div class="panel with-nav-tabs panel-default">
            <div class="panel-heading">
                <ul class="nav nav-tabs">
              <!--      <li class="active"><a href="#tab1default" data-toggle="tab">All</a></li> -->
                    <li><a href="#tab1default" data-toggle="tab">Add</a></li>
                    <li><a href="#tab2default" data-toggle="tab">Edit</a></li>
                </ul>
            </div>
            <div class="panel-body">
                <div class="tab-content">
                    <div class="tab-pane fade in active" id="tab1default">
                        <h2>Items</h2>

                        <asp:DataList ID="DataList1" runat="server" RepeatColumns="3" RepeatLayout="Table" Width="500px">
                            <ItemTemplate>
                                <asp:Label ID="itemName" runat="server" Text='<%#Eval("ItemName") %>' ForeColor="White" Font-Size="Large"></asp:Label>
                                <br />
                                <asp:Image ID="itemImg" runat="server" 
                                    Width="200px" Height="200px"     
                                    ImageUrl='<%#Eval("ItemPic")%>'/>
                                <br />
                                <asp:LinkButton runat="server" ID="EditItemBTn" OnCommand="EditItemBTn_Command" CommandArgument='<%# Eval("ItemID")%>' Text="Edit" />
                            </ItemTemplate>
                        </asp:DataList>

                        <div class="container-fluid" style="color: black; background-color: gray;">
                            <h2>Add Item</h2>
                            <div class="form-group row">
                                <asp:Label runat="server" Text="Item Name: " CssClass="col-xs-3 col-form-label"></asp:Label>
                                <asp:TextBox runat="server" ID="ItemName"></asp:TextBox>
                            </div>
                            <div class="form-group row">
                                <asp:Label runat="server" Text="Item Type: " CssClass="col-xs-3 col-form-label"></asp:Label>
                                <asp:DropDownList runat="server" ID="ItemTypeList">
                                    <asp:ListItem Value="1">Processor</asp:ListItem>
                                    <asp:ListItem Value="4">Graphic Card</asp:ListItem>
                                    <asp:ListItem Value="2">Memory</asp:ListItem>
                                    <asp:ListItem Value="3">Power Supply</asp:ListItem>
                                    <asp:ListItem Value="0">Booster</asp:ListItem>
                                </asp:DropDownList>
                            </div>
                            <div class="form-group row">
                                <asp:Label runat="server" Text="Item Image: " CssClass="col-xs-3 col-form-label"></asp:Label>
                                <asp:FileUpload ID="UploadPhoto" runat="server" />
                                <asp:Image ID="imgViewFile" runat="server" />
                            </div>
                            <div class="form-group row">
                                <asp:Label runat="server" Text="Item Description: " CssClass="col-xs-3 col-form-label"></asp:Label>
                                <asp:TextBox runat="server" ID="ItemDesc" TextMode="MultiLine"></asp:TextBox>
                            </div>
                            <div class="form-group row">
                                <asp:Label runat="server" Text="Item Price: " CssClass="col-xs-3 col-form-label"></asp:Label>
                                <asp:TextBox runat="server" ID="ItemPrice"></asp:TextBox>
                            </div>
                            <div class="form-group row">
                                <asp:Label runat="server" Text="Item Bonus: " CssClass="col-xs-3 col-form-label"></asp:Label>
                                <asp:TextBox runat="server" ID="ItemStat"></asp:TextBox>
                            </div>
                            <asp:Button runat="server" ID="btnAddItem" CssClass="btn btn-default" OnClick="btnAddItem_Click" Text="Add Item" />
                        </div>
                    </div>

                    <div class="tab-pane fade" id="tab2default">
                        <h2>Add Packages</h2>
                        <div class="container-fluid" style="color: black; background-color: gray;">
                            <br />
                            <div class="form-group row">
                                <asp:Label runat="server" Text="Item Type: " CssClass="col-xs-3 col-form-label"></asp:Label>
                                <asp:DropDownList runat="server" ID="itemTypeDDL" OnSelectedIndexChanged="DisplayItems" AutoPostBack="true">
                                    <asp:ListItem Value="-2">Choose An Item Type</asp:ListItem>
                                    <asp:ListItem Value="1">Processor</asp:ListItem>
                                    <asp:ListItem Value="4">Graphic Card</asp:ListItem>
                                    <asp:ListItem Value="2">Memory</asp:ListItem>
                                    <asp:ListItem Value="3">Power Supply</asp:ListItem>
                                    <asp:ListItem Value="0">Booster</asp:ListItem>
                                    <asp:ListItem Value="5">Currency</asp:ListItem>
                                </asp:DropDownList>
                            </div>
                            <div class="form-group row">
                                <asp:Label runat="server" Text="Item List: " CssClass="col-xs-3 col-form-label"></asp:Label>
                                <asp:DataList ID="SelectionDataList" runat="server" RepeatColumns="3" RepeatLayout="Table">
                                    <ItemTemplate>
                                        <div style="margin: 10px;">
                                            <asp:LinkButton runat="server" ID="itemName" OnCommand="SelectedItem_Command" 
                                                CommandArgument='<%# Eval("ItemID")%>' forecolor="Black" Text='<%#Eval("ItemName") %>' />
                                        </div>
                                    </ItemTemplate>
                                </asp:DataList>
                            </div>
                            <div class="form-group row">
                                <asp:Label runat="server" Text="Item Selected: " CssClass="col-xs-3 col-form-label"></asp:Label>
                                <asp:Label runat="server" id="selectedItemLbl" forecolor="White" Text=""></asp:Label>
                            </div>
                            <div class="form-group row">
                                <asp:Label runat="server" Text="Package Description: " CssClass="col-xs-3 col-form-label"></asp:Label>
                                <asp:TextBox runat="server" ID="pkgDesc" TextMode="MultiLine"></asp:TextBox>
                            </div>
                            <div class="form-group row">
                                <asp:Label runat="server" Text="Package Price ($): " CssClass="col-xs-3 col-form-label"></asp:Label>
                                <asp:TextBox runat="server" ID="pkgPrice"></asp:TextBox>
                                <asp:RegularExpressionValidator 
                                    ID="priceValidator" runat="server" 
                                    ErrorMessage="* Enter up to 2 decimal places only" ValidationExpression="^[0-9]{0,6}(\.[0-9]{1,2})?$"
                                    ControlToValidate="pkgQuantity" ForeColor="Red">
                               </asp:RegularExpressionValidator>
                            </div>
                            <div class="form-group row">
                                <asp:Label runat="server" Text="Quantity: " CssClass="col-xs-3 col-form-label"></asp:Label>
                                <asp:TextBox runat="server" ID="pkgQuantity"></asp:TextBox>
                                <asp:RegularExpressionValidator 
                                    ID="quantityValidator" runat="server" 
                                    ErrorMessage="* Enter whole numbers only" ValidationExpression="^\d+$"
                                    ControlToValidate="pkgQuantity" ForeColor="Red">
                               </asp:RegularExpressionValidator>
                            </div>
                            <asp:Button runat="server" ID="addPackage" CssClass="btn btn-default" OnClick="btnAddPackage_Click" Text="Add Package" />
                            <br /><br />
                        </div>
                    </div>

                    <div class="tab-pane fade" id="tab3default">
                        <asp:DataList ID="GPUList" runat="server" RepeatColumns="3" RepeatLayout="Table" Width="500px">
                            <ItemTemplate>
                                <asp:Label ID="itemName" runat="server" Text='<%#Eval("ItemName") %>' ForeColor="White" Font-Size="Large"></asp:Label>
                                <br />
                                <asp:Image ID="itemImg" runat="server" 
                                    Width="200px" Height="200px"     
                                    ImageUrl='<%#Eval("ItemPic")%>'/>
                            </ItemTemplate>
                        </asp:DataList>
                    </div>

                    <div class="tab-pane fade" id="tab4default">
                        <asp:DataList ID="ProcessList" runat="server" RepeatColumns="3" RepeatLayout="Table" Width="500px">
                            <ItemTemplate>
                                <asp:Label ID="itemName" runat="server" Text='<%#Eval("ItemName") %>' ForeColor="White" Font-Size="Large"></asp:Label>
                                <br />
                                <asp:Image ID="itemImg" runat="server" 
                                    Width="200px" Height="200px"     
                                    ImageUrl='<%#Eval("ItemPic")%>'/>
                            </ItemTemplate>
                        </asp:DataList>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
</asp:Content>
