Imports Microsoft.VisualBasic
Imports System
Imports System.Data
Imports System.Configuration
Imports System.Web
Imports System.Web.Security
Imports System.Web.UI
Imports System.Web.UI.WebControls
Imports System.Web.UI.WebControls.WebParts
Imports System.Web.UI.HtmlControls
Imports DevExpress.Web.ASPxGridView
Imports DevExpress.Web.ASPxEditors

Partial Public Class _Default
	Inherits System.Web.UI.Page
	Protected Sub Page_Load(ByVal sender As Object, ByVal e As EventArgs)

	End Sub
	Protected Sub grid_CustomUnboundColumnData(ByVal sender As Object, ByVal e As DevExpress.Web.ASPxGridView.ASPxGridViewColumnDataEventArgs)
		If e.Column.FieldName = "UrlText" Then
			Dim url As String = e.GetListSourceFieldValue("NavigateUrl").ToString()
			e.Value = url
		End If
	End Sub

	Protected Sub cb_Callback(ByVal source As Object, ByVal e As DevExpress.Web.ASPxCallback.CallbackEventArgs)
		e.Result = GetText(e.Parameter)
	End Sub

	Protected Function GetText(ByVal key As Object) As String
		Dim hfKey As String = String.Format("grid{0}", key)
		Dim showLong As Boolean = False
		Dim text As String = grid.GetRowValuesByKeyValue(key, "Text").ToString()

		If hf.Contains(hfKey) Then
			showLong = Convert.ToBoolean(hf(hfKey))
		End If

		Dim start As Int32 = text.IndexOf("<br")

		If showLong Then
			Return text
		End If

		Return String.Format("{0} <a href=""javascript:void(0);"">more...</a>", text.Substring(0, start))
	End Function
End Class
