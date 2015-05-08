<xsl:stylesheet version="1.0" 
   xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
   xmlns:q="http://zakupki.gov.ru/oos/export/1"
   xmlns:oos="http://zakupki.gov.ru/oos/types/1">
<xsl:output method="xml" indent="yes"/>
<xsl:template match="/q:export">
    <lots>
     <xsl:for-each select="*[not(contains(name(),'Cancel'))]//oos:lot">
        <lot>
            <notificationNumber><xsl:value-of select="../../oos:notificationNumber" /></notificationNumber>
            <id><xsl:value-of select="oos:sid"/></id>
            <ordinalNumber><xsl:value-of select="oos:ordinalNumber"/></ordinalNumber>
            <subject><xsl:value-of select="oos:subject"/></subject>
            <currency><xsl:value-of select="oos:currency/oos:code"/></currency>
            <priceNotSet><xsl:value-of select="oos:priceNotSet"/></priceNotSet>
            <customerRequirements>
            <xsl:for-each select="oos:customerRequirements/oos:customerRequirement">
             <customerRequirement>
                <lotId><xsl:value-of select="../../oos:sid"/></lotId>
                <Id><xsl:value-of select="oos:sid"/></Id>                 
                <quantity><xsl:value-of select="oos:quantity"/></quantity>
                <maxPrice><xsl:value-of select="oos:maxPrice"/></maxPrice>
                <deliveryTerm><xsl:value-of select="oos:deliveryTerm"/></deliveryTerm>
                <guaranteeAppAmount><xsl:value-of select="oos:guaranteeApp/oos:amount"/> </guaranteeAppAmount>
                 <guaranteeContractAmount><xsl:value-of select="oos:guaranteeContract/oos:amount"/> </guaranteeContractAmount>
            </customerRequirement> 
            </xsl:for-each>
            </customerRequirements> 
           <productsCount><xsl:value-of select="count(oos:products/oos:product)"/></productsCount>
            <products>
            <xsl:for-each select="oos:products/oos:product">
            <product>
                 <lotId><xsl:value-of select="../../oos:sid"/></lotId>
                <prodCode><xsl:value-of select="oos:code"/></prodCode>
            </product> 
            </xsl:for-each>
            </products>
        </lot>
    </xsl:for-each>
    </lots>
</xsl:template>
</xsl:stylesheet>