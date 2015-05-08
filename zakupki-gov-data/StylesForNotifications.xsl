<xsl:stylesheet version="1.0" 
   xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
   xmlns:q="http://zakupki.gov.ru/oos/export/1"
   xmlns:oos="http://zakupki.gov.ru/oos/types/1">
<xsl:output method="xml" indent="yes"/>
<xsl:template match="/q:export">
    <notifications>
     <xsl:for-each select="*[not(contains(name(),'Cancel'))]">
        <notification>
            <id><xsl:value-of select="oos:id"/></id>
            <notificationNumber><xsl:value-of select="oos:notificationNumber"/></notificationNumber>
            <placingWay><xsl:value-of select="oos:placingWay/oos:code"/></placingWay>
            <publishDate><xsl:value-of select="oos:publishDate"/></publishDate>
            <createDate><xsl:value-of select="oos:createDate"/></createDate>
            <orderName><xsl:value-of select="oos:orderName"/></orderName>
            <modInitiativeType><xsl:value-of select="oos:modification/oos:initiativeType"/></modInitiativeType>
            <modAuthorityType><xsl:value-of select="oos:modification/oos:authorityType"/></modAuthorityType>
            <organizationRegNum><xsl:value-of select="oos:order/oos:placer/oos:regNum"/></organizationRegNum>
            <url><xsl:value-of select="oos:href"/></url>
            <commissionDate1><xsl:value-of select="oos:notificationCommission/oos:p1Date"/></commissionDate1>
            <commissionDate2><xsl:value-of select="oos:notificationCommission/oos:p2Date"/></commissionDate2>
            <commissionDate3><xsl:value-of select="oos:notificationCommission/oos:p3Date"/></commissionDate3>
           <isCancel>0</isCancel>
           <lotsCount><xsl:value-of select="count(oos:lots/oos:lot)"/></lotsCount>
        </notification>
    </xsl:for-each>
    </notifications>
</xsl:template>
</xsl:stylesheet>           