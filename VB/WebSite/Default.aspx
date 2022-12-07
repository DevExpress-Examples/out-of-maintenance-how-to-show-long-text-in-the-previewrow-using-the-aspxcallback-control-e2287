<%@ Page Language="vb" AutoEventWireup="true" CodeFile="Default.aspx.vb" Inherits="_Default" %>

<%@ Register Assembly="DevExpress.Web.v15.1, Version=15.1.15.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web" TagPrefix="dx" %>




<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>How to show long text in the PreviewRow using the ASPxCallback control</title>

    <script type="text/javascript" language="javascript">
        function TextToggle(key) {
            var hfKey = "grid" + key.toString();

            if (hf.Contains(hfKey))
            {
                var b = hf.Get(hfKey);
                hf.Set(hfKey, !b);                
            }
            else
                hf.Set(hfKey, true);

            cb.PerformCallback(key);
        }

        function OnCallbackComplete(s, e) {
             var pnl = document.getElementById("pnl" + e.parameter);
             pnl.innerHTML = e.result;
        }
    </script>

</head>
<body>
    <form id="form1" runat="server">
        <div>
            <dx:ASPxHiddenField ID="hf" ClientInstanceName="hf" runat="server">
            </dx:ASPxHiddenField>
            <dx:ASPxGridView ID="grid" runat="server" AutoGenerateColumns="False" DataSourceID="xmlds"
                KeyFieldName="Name" OnCustomUnboundColumnData="grid_CustomUnboundColumnData">
                <Columns>
                    <dx:GridViewDataTextColumn VisibleIndex="0" FieldName="Name">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn VisibleIndex="1" FieldName="HeaderText">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn VisibleIndex="2" FieldName="Text" Visible="False">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataHyperLinkColumn FieldName="NavigateUrl" VisibleIndex="2">
                        <PropertiesHyperLinkEdit TextField="UrlText">
                        </PropertiesHyperLinkEdit>
                    </dx:GridViewDataHyperLinkColumn>
                    <dx:GridViewDataDateColumn FieldName="Date" VisibleIndex="3">
                        <PropertiesDateEdit DisplayFormatString="">
                        </PropertiesDateEdit>
                    </dx:GridViewDataDateColumn>
                    <dx:GridViewDataTextColumn FieldName="UrlText" UnboundType="String" Visible="False"
                        VisibleIndex="4">
                    </dx:GridViewDataTextColumn>
                </Columns>
                <Templates>
                    <PreviewRow>
                        <div id='<%#String.Format("pnl{0}", Container.KeyValue)%>' onclick="TextToggle(<%#Container.KeyValue%>);"
                            style="width: 100%;">
                            <%#GetText(Container.KeyValue)%>
                        </div>
                    </PreviewRow>
                </Templates>
                <Settings ShowPreview="True" />
                <SettingsPager PageSize="4">
                </SettingsPager>
            </dx:ASPxGridView>
            <dx:ASPxCallback ID="cb" runat="server" ClientInstanceName="cb" OnCallback="cb_Callback">
                <ClientSideEvents CallbackComplete="OnCallbackComplete" />
            </dx:ASPxCallback>
            <asp:XmlDataSource ID="xmlds" runat="server" DataFile="http://www.devexpress.com/Support/Center/RSS/GetSCFeed?technology=.NET"
                TransformFile="~/App_Data/rss.xslt"></asp:XmlDataSource>
        </div>
    </form>
</body>
</html>