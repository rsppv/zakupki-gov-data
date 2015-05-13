<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output indent="yes" method="xml"/>
	<xsl:template match="/export">
		<root>
			<xsl:for-each select="child::*[name() != 'protocolCancel' | name() != 'protocolEvasion']">
				<protocol>
					<xsl:copy-of select="self::*//notificationNumber"/>
					<xsl:copy-of select="self::*//protocolNumber"/>
					<foundationProtocolNumber>
						<xsl:value-of select="self::*//foundationProtocolNumber"/>
					</foundationProtocolNumber>
					<xsl:copy-of select="self::*//protocolDate"/>
					<xsl:copy-of select="self::*//signDate"/>
					<xsl:copy-of select="self::*//href"/>
					<commissionRegNumber>
						<xsl:value-of select="self::*//commission/regNumber"/>
					</commissionRegNumber>
					<protocolType>
						<xsl:value-of select="substring(name(),9)"/>
					</protocolType>
				</protocol>
			</xsl:for-each>
			<xsl:for-each select="descendant::protocolCommissionMembers/protocolCommissionMember">
				<xsl:copy-of select="ancestor::*[child::protocolNumber]/protocolNumber"/>
				<id>
					<xsl:value-of select="id"/>
				</id>
				<name>
					<xsl:value-of select="name"/>
				</name>
				<role>
					<xsl:value-of select="role/roleId"/>
				</role>
				<present>
					<xsl:value-of select="present"/>
				</present>
			</xsl:for-each>
			<xsl:for-each select="descendant::applications/application">
				<xsl:copy-of select="ancestor::*[child::notificationNumber]/notificationNumber"/>
				<journanalNumber>
					<xsl:value-of select="journalNumber"/>
				</journanalNumber>
				<xsl:copy-of select="ancestor::protocolLot/lotNumber"/>
				<appFormat>
					<xsl:value-of select="appFormat"/>
				</appFormat>
				<appDate>
					<xsl:value-of select="appDate"/>
				</appDate>
			</xsl:for-each>

			<xsl:for-each select="EF1_apps">
				NotNum
				lotNum
				jNum
				appDate
				admissionResults
				admitted
			</xsl:for-each>
			<xsl:for-each select="EF2_apps">
				jNum
				lastPrice
				PriceOffers
				participantPresent
			</xsl:for-each>
			<xsl:for-each select="EF3_apps">
				jNum
				appPerticipants
				admissionResults
				admitted
				appRating
			</xsl:for-each>
			
			<xsl:for-each select="OK1_apps">
				jNum
				appFormat
				appDate
				price
				increasePrice
				requirementCompiances
				appPartcipants
				contractConditions
			</xsl:for-each>
			<xsl:for-each select="OK2_apps">
				jNum
				admitted
				admissionResults
				featuresCorrespondences
			</xsl:for-each>
			<xsl:for-each select="OK3_apps">
				jNum
				appRating
				resultType
				evalResult
				generalPrefs
				contractConditions
				featuresCorrespondences
			</xsl:for-each>
		</root>
	</xsl:template>
</xsl:stylesheet>