using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using DevExpress.Web.ASPxGridView;
using DevExpress.Web.ASPxEditors;

public partial class _Default : System.Web.UI.Page {
    protected void Page_Load(object sender, EventArgs e) {

    }
    protected void grid_CustomUnboundColumnData(object sender, DevExpress.Web.ASPxGridView.ASPxGridViewColumnDataEventArgs e) {
        if (e.Column.FieldName == "UrlText") {
            String url = e.GetListSourceFieldValue("NavigateUrl").ToString();
            e.Value = url ;
        }
    }

    protected void cb_Callback(object source, DevExpress.Web.ASPxCallback.CallbackEventArgs e) {
        e.Result = GetText(e.Parameter);
    }

    protected String GetText(Object key) {
        String hfKey = String.Format("grid{0}", key);
        Boolean showLong = false;
        String text = grid.GetRowValuesByKeyValue(key, "Text").ToString();

        if (hf.Contains(hfKey))
            showLong = Convert.ToBoolean(hf[hfKey]);

        Int32 start = text.IndexOf("<br");

        if (showLong)
            return text;

        return String.Format("{0} <a href=\"javascript:void(0);\">more...</a>", text.Substring(0, start));
    }
}
