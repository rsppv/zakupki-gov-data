<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output indent="yes" method="xml"/>

<xsl:template match="/export">
<export>
	<xsl:for-each select="//order[not(placer/regNum=preceding::order/placer/regNum)]">
        <organization>
	    	<regNum>
	    		<xsl:value-of select="placer/regNum"/>
	    	</regNum>
	    	<fullName>
	    		<xsl:value-of select="placer/fullName"/>
	    	</fullName>
			<placerOrgType>
				<xsl:value-of select="placerOrgType"/>
			</placerOrgType>
			<orgFactAddress>
				<xsl:value-of select="following-sibling::contactInfo/orgFactAddress"/>
			</orgFactAddress>
	  	</organization>
	</xsl:for-each>
</export>
</xsl:template>

</xsl:stylesheet>