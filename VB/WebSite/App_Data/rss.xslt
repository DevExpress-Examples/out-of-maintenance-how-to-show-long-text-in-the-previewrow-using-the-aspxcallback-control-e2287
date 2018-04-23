<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:template match="/">
    <items>
      <xsl:for-each select="//item">
        <item Name="{position()}" HeaderText="{title}" Text="{description}" NavigateUrl="{link}" Date="{pubDate}" />
      </xsl:for-each>
    </items>
  </xsl:template>
</xsl:stylesheet>