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
				<commissionMember>
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
				</commissionMember>
			</xsl:for-each>
			<xsl:for-each select="descendant::applications/application">
				<application>
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
				</application>
			</xsl:for-each>
			<xsl:for-each select="descendant::applicationParticipants/applicationParticipant">
				<supplier>
					<participantType>
						<xsl:value-of select="participantType"/>
					</participantType>
					<inn>
						<xsl:value-of select="inn"/>
					</inn>
					<organizationForm>
						<xsl:value-of select="organizationForm"/>
					</organizationForm>
					<legalForm>
						<xsl:value-of select="okopfType"/>
					</legalForm>
					<organizationName>
						<xsl:value-of select="organizationName"/>
					</organizationName>
					<countryCode>
						<xsl:value-of select="country/countryCode"/>
					</countryCode>
					<countryName>
						<xsl:value-of select="country/countryFullName"/>
					</countryName>
					<factualAddress>
						<xsl:value-of select="factualAddress"/>
					</factualAddress>
					<status>
						<xsl:value-of select="status"/>
					</status>
				</supplier>
			</xsl:for-each>
			<xsl:for-each select="protocolEF1//application">
				<EFAppConsideration>
					<xsl:copy-of select="ancestor::*[child::notificationNumber]/notificationNumber"/>
					<appJournalNumber>
						<xsl:value-of select="journalNumber"/>
					</appJournalNumber>
					<xsl:copy-of select="ancestor::*[child::protocolNumber]/protocolNumber"/>
					<admitted>
						<xsl:value-of select="admitted"/>
					</admitted>
					<admissionResults>
						<xsl:for-each select="admissionResults/admissionResult">
							<admissionResult>
								<xsl:copy-of select="ancestor::*[child::protocolNumber]/protocolNumber"/>
								<memberId>
									<xsl:value-of select="protocolCommissionMember/id"/>
								</memberId>
								<admitted>
									<xsl:value-of select="admitted"/>
								</admitted>
								<appRejectedReasons>
									<xsl:for-each select="appRejectedReason/nsiRejectReason">
										<xsl:copy-of select="ancestor::*[child::notificationNumber]/notificationNumber"/>
										<appJournalNumber>
											<xsl:value-of select="journalNumber"/>
										</appJournalNumber>
										<id>
											<xsl:value-of select="id"/>
										</id>
										<reason>
											<xsl:value-of select="reason"/>
										</reason>
									</xsl:for-each>
								</appRejectedReasons>
							</admissionResult>
						</xsl:for-each>
					</admissionResults>
				</EFAppConsideration>				
			</xsl:for-each>
			<xsl:for-each select="protocolEF2//application">
				<EFAuctionHolding>
					<xsl:copy-of select="ancestor::*[child::protocolNumber]/protocolNumber"/>
					<xsl:copy-of select="ancestor::*[child::notificationNumber]/notificationNumber"/>
					<appJournalNumber>
						<xsl:value-of select="journalNumber"/>
					</appJournalNumber>
					<lastPrice>
						<xsl:value-of select="lastPrice/price"/>
					</lastPrice>
					<dateLastPrice>
						<xsl:value-of select="lastPrice/date"/>
					</dateLastPrice>
					<increaseInitialPrice>
						<xsl:value-of select="lastPrice/increaseInitialPrice"/>
					</increaseInitialPrice>
					<participantPresent>
						<xsl:value-of select="participantPresent"/>
					</participantPresent>
					<priceOffers>
						<xsl:for-each select="PriceOffers/PriceOffer">
							<priceOffer>
								<notificationNumber>
									<xsl:value-of select="ancestor::*[child::notificationNumber]/notificationNumber"/>
								</notificationNumber>
								<appJournalNumber>
									<xsl:value-of select="ancestor::application/journalNumber"/>
								</appJournalNumber>
								<bid>
									<xsl:value-of select="price"/>
								</bid>
								<date>
									<xsl:value-of select="date"/>
								</date>
								<increaseInitialPrice>
									<xsl:value-of select="increaseInitialPrice"/>
								</increaseInitialPrice>
							</priceOffer>
						</xsl:for-each>
					</priceOffers>
				</EFAuctionHolding>
			</xsl:for-each>
			<xsl:for-each select="protocolEF3//application">
				<EFSummingUp>
					<xsl:copy-of select="ancestor::*[child::notificationNumber]/notificationNumber"/>
					<appJournalNumber>
						<xsl:value-of select="journalNumber"/>
					</appJournalNumber>	
					<xsl:copy-of select="ancestor::*[child::protocolNumber]/protocolNumber"/>
					<admitted>
						<xsl:value-of select="admitted"/>
					</admitted>
					<appRating>
						<xsl:value-of select="appRating"/>
					</appRating>				
				</EFSummingUp>
				appParticipants
				admissionResults
			</xsl:for-each>
			<xsl:for-each select="OK1_apps">jNum
				appFormat
				appDate
				price
				increasePrice
				requirementCompiances
				appParticipants
				contractConditions
			</xsl:for-each>
			<xsl:for-each select="OK2_apps">jNum
				admitted
				admissionResults
				featuresCorrespondences
			</xsl:for-each>
			<xsl:for-each select="OK3_apps">jNum
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