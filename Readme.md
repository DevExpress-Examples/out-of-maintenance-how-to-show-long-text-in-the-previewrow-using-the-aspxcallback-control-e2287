<!-- default badges list -->
![](https://img.shields.io/endpoint?url=https://codecentral.devexpress.com/api/v1/VersionRange/128542835/10.1.4%2B)
[![](https://img.shields.io/badge/Open_in_DevExpress_Support_Center-FF7200?style=flat-square&logo=DevExpress&logoColor=white)](https://supportcenter.devexpress.com/ticket/details/E2287)
[![](https://img.shields.io/badge/📖_How_to_use_DevExpress_Examples-e9f6fc?style=flat-square)](https://docs.devexpress.com/GeneralInformation/403183)
<!-- default badges end -->
<!-- default file list -->
*Files to look at*:

* [Default.aspx](./CS/WebSite/Default.aspx) (VB: [Default.aspx](./VB/WebSite/Default.aspx))
* [Default.aspx.cs](./CS/WebSite/Default.aspx.cs) (VB: [Default.aspx.vb](./VB/WebSite/Default.aspx.vb))
<!-- default file list end -->
# How to show long text in the PreviewRow using the ASPxCallback control


<p>This example demonstrates how to load a long text line for the ASPxGridView to show it in the PreviewRow template using the ASPxCallback control. It uses callbacks technology for better performance.</p><p><strong>See Also:</strong><br />
<a href="https://www.devexpress.com/Support/Center/p/E2285">How to dynamically show or hide text within the preview panel</a></p>


<h3>Description</h3>

<p>The following techniques were implemented in this sample:<br />
- the ASPxGridView is bound with the XmlDataSource: <a data-ticket="E2178">How to bind ASPxGridView with XmlDataSource</a>.<br />
- the XmlDataSource gets the RSS feed from the <a href="http://www.devexpress.com/Support/Center/RSS/">DevExpress RSS</a> link (and transforms it to an appropriate format using an XSLT file from the ASPxperience demo);<br />
- by default, long text is truncated and shown in the &lt;div&gt; tag;<br />
- long text is retrieved via the ASPxCallback control;<br />
- the ASPxHiddenField is used to store the expanded row state (this helps avoid the Session usage).</p>

<br/>


