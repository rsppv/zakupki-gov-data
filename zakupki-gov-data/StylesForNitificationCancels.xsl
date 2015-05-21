<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output indent="yes" method="xml"/>

<xsl:template match="/export">
<export>
	<xsl:for-each select="notificationCancel//lot">
		<lotCancel>
	    	<notificationNumber>
	    		<xsl:value-of select="ancestor::notificationCancel/notificationNumber"/>
	    	</notificationNumber>
	    	<publishDate>
	    		<xsl:value-of select="ancestor::notificationCancel/publishDate"/>
	    	</publishDate>
			<lotOrdinalNumber>
				<xsl:value-of select="ordinalNumber"/>
			</lotOrdinalNumber>
			<url>
				<xsl:value-of select="following::printForm/url"/>
			</url>
			<initiativeType>
				<xsl:value-of select="following::modification/initiativeType"/>
			</initiativeType>
			<authorityType>
				<xsl:value-of select="following::modification/authorityType"/>
			</authorityType>
			<authorityName>
				<xsl:value-of select="following::modification/authorityName"/>
			</authorityName>
	  	</lotCancel>
	</xsl:for-each>
</export>
</xsl:template>

</xsl:stylesheet>