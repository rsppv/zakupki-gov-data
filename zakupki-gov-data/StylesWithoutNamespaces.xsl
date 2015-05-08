<xsl:stylesheet version="1.0" 
   xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
   xmlns:q="http://zakupki.gov.ru/oos/export/1"
   xmlns:oos="http://zakupki.gov.ru/oos/types/1">
<xsl:output method="xml" indent="yes"/>
  <!-- copy these nodes as is -->
  <xsl:template match="@* | comment() | processing-instruction()">
    <xsl:copy/>
  </xsl:template>
<xsl:template match="*">
    <xsl:element name="{local-name()}">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>
</xsl:stylesheet>