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
			<xsl:for-each select="descendant::criterias//nsiEvalCriterion | descendant::criterias//childrenCriteria">
				<criteria>
					<xsl:copy-of select="ancestor::*[child::protocolNumber]/protocolNumber"/>
					<xsl:copy-of select="ancestor::protocolLot/lotNumber"/>
					<id>
						<xsl:value-of select="id"/>
					</id>
					<parentId>
						<xsl:if test="name() = 'childrenCriteria'">
							<xsl:value-of select="parent::*/nsiEvalCriterion/id"/>
						</xsl:if>
					</parentId>
					<name>
						<xsl:value-of select="name"/>
					</name>
					<criterionValue>
						<xsl:choose>
							<xsl:when test="name()='childrenCriteria'">
								<xsl:value-of select="criterionValue"/>
							</xsl:when>
							<xsl:otherwise>
								<xsl:value-of select="following-sibling::criterionValue"/>
							</xsl:otherwise>
						</xsl:choose>
					</criterionValue>
					<order>
						<xsl:value-of select="order"/>
					</order>
				</criteria>
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
								<xsl:copy-of select="ancestor::*[child::notificationNumber]/notificationNumber"/>
								<appJournalNumber>
									<xsl:value-of select="ancestor::application/journalNumber"/>
								</appJournalNumber>
								<xsl:copy-of select="ancestor::*[child::protocolNumber]/protocolNumber"/>
								<memberId>
									<xsl:value-of select="protocolCommissionMember/id"/>
								</memberId>
								<admitted>
									<xsl:value-of select="admitted"/>
								</admitted>
								<appRejectedReasons>
									<xsl:for-each select="appRejectedReason/nsiRejectReason">
										<appRejectedReason>
											<xsl:copy-of select="ancestor::*[child::notificationNumber]/notificationNumber"/>
											<appJournalNumber>
												<xsl:value-of select="ancestor::application/journalNumber"/>
											</appJournalNumber>
											<xsl:copy-of select="ancestor::*[child::protocolNumber]/protocolNumber"/>
											<memberId>
												<xsl:value-of select="preceding::protocolCommissionMember/id"/>
											</memberId>
											<reasonId>
												<xsl:value-of select="id"/>
											</reasonId>
											<reasonName>
												<xsl:value-of select="reason"/>
											</reasonName>
										</appRejectedReason>
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
					<appParticipants>
						<xsl:for-each select="applicationParticipants/applicationParticipant">
							<appParticipant>
								<xsl:copy-of select="ancestor::*[child::notificationNumber]/notificationNumber"/>
								<appJournalNumber>
									<xsl:value-of select="ancestor::application/journalNumber"/>
								</appJournalNumber>
								<inn>
									<xsl:value-of select="inn"/>
								</inn>
								<organizationName>
									<xsl:value-of select="organizationName"/>
								</organizationName>
							</appParticipant>
						</xsl:for-each>
					</appParticipants>
					<admissionResults>
						<xsl:for-each select="admissionResults/admissionResult">
							<admissionResult>
								<xsl:copy-of select="ancestor::*[child::notificationNumber]/notificationNumber"/>
								<appJournalNumber>
									<xsl:value-of select="ancestor::application/journalNumber"/>
								</appJournalNumber>
								<xsl:copy-of select="ancestor::*[child::protocolNumber]/protocolNumber"/>
								<memberId>
									<xsl:value-of select="protocolCommissionMember/id"/>
								</memberId>
								<admitted>
									<xsl:value-of select="admitted"/>
								</admitted>
								<appRejectedReasons>
									<xsl:for-each select="appRejectedReason/nsiRejectReason">
										<appRejectedReason>
											<xsl:copy-of select="ancestor::*[child::notificationNumber]/notificationNumber"/>
											<appJournalNumber>
												<xsl:value-of select="ancestor::application/journalNumber"/>
											</appJournalNumber>
											<xsl:copy-of select="ancestor::*[child::protocolNumber]/protocolNumber"/>
											<memberId>
												<xsl:value-of select="preceding::protocolCommissionMember/id"/>
											</memberId>
											<reasonId>
												<xsl:value-of select="id"/>
											</reasonId>
											<reasonName>
												<xsl:value-of select="reason"/>
											</reasonName>
										</appRejectedReason>
									</xsl:for-each>
								</appRejectedReasons>
							</admissionResult>
						</xsl:for-each>
					</admissionResults>				
				</EFSummingUp>
			</xsl:for-each>
			<xsl:for-each select="protocolOK1//application">
				<OKEnvelopesOpening>
					<xsl:copy-of select="ancestor::*[child::notificationNumber]/notificationNumber"/>
					<appJournalNumber>
						<xsl:value-of select="journalNumber"/>
					</appJournalNumber>
					<xsl:copy-of select="ancestor::*[child::protocolNumber]/protocolNumber"/>
					<price>
						<xsl:value-of select="price"/>
					</price>
					<increasePrice>
						<xsl:value-of select="increasePrice"/>
					</increasePrice>
					<requirementComplied>
						<xsl:choose>
							<xsl:when test="count(descendant::requirementCompliance[child::availabilityType[text()='U']]) > 0">0</xsl:when>
							<xsl:otherwise>1</xsl:otherwise>
						</xsl:choose>
					</requirementComplied>
					<criteriasNIR>
						<xsl:value-of select="preceding::criterias/NIR"/>
					</criteriasNIR>
					<appParticipants>
						<xsl:for-each select="applicationParticipants/applicationParticipant">
							<appParticipant>
								<xsl:copy-of select="ancestor::*[child::notificationNumber]/notificationNumber"/>
								<appJournalNumber>
									<xsl:value-of select="ancestor::application/journalNumber"/>
								</appJournalNumber>
								<inn>
									<xsl:value-of select="inn"/>
								</inn>
								<organizationName>
									<xsl:value-of select="organizationName"/>
								</organizationName>
							</appParticipant>
						</xsl:for-each>
					</appParticipants>
					<contractConditions>
						<xsl:for-each select="contractConditions/contractCondition">
							<contractCondition>
								<xsl:copy-of select="ancestor::*[child::protocolNumber]/protocolNumber"/>
								<xsl:copy-of select="ancestor::protocolLot/lotNumber"/>
								<xsl:copy-of select="ancestor::*[child::notificationNumber]/notificationNumber"/>
								<id>
									<xsl:value-of select="criterion/id"/>
								</id>
								<appJournalNumber>
									<xsl:value-of select="ancestor::application/journalNumber"/>
								</appJournalNumber>
								<condValue>
									<xsl:if test="condValue">1</xsl:if>
									<xsl:if test="not(condValue)">0</xsl:if>
								</condValue>
								<noOffer>
									<xsl:value-of select="noOffer"/>
								</noOffer>
							</contractCondition>
						</xsl:for-each>
					</contractConditions>
				</OKEnvelopesOpening>
			</xsl:for-each>
			<xsl:for-each select="protocolOK2//application">
				<OKAppConsideration>
					<xsl:copy-of select="ancestor::*[child::notificationNumber]/notificationNumber"/>
					<appJournalNumber>
						<xsl:value-of select="journalNumber"/>
					</appJournalNumber>
					<xsl:copy-of select="ancestor::*[child::protocolNumber]/protocolNumber"/>
					<admitted>
						<xsl:value-of select="admitted"/>
					</admitted>
					<featuresComplied>
						<xsl:choose>
							<xsl:when test="count(descendant::featuresCorrespondence[child::compatible[text()='0']]) > 0">0</xsl:when>
							<xsl:otherwise>1</xsl:otherwise>
						</xsl:choose>
					</featuresComplied>
					<admissionResults>
						<xsl:for-each select="admissionResults/admissionResult">
							<admissionResult>
								<xsl:copy-of select="ancestor::*[child::notificationNumber]/notificationNumber"/>
								<appJournalNumber>
									<xsl:value-of select="ancestor::application/journalNumber"/>
								</appJournalNumber>
								<xsl:copy-of select="ancestor::*[child::protocolNumber]/protocolNumber"/>
								<memberId>
									<xsl:value-of select="protocolCommissionMember/id"/>
								</memberId>
								<admitted>
									<xsl:value-of select="admitted"/>
								</admitted>
								<appRejectedReasons>
									<xsl:for-each select="appRejectedReason/nsiRejectReason">
										<appRejectedReason>
											<xsl:copy-of select="ancestor::*[child::notificationNumber]/notificationNumber"/>
											<appJournalNumber>
												<xsl:value-of select="ancestor::application/journalNumber"/>
											</appJournalNumber>
											<xsl:copy-of select="ancestor::*[child::protocolNumber]/protocolNumber"/>
											<memberId>
												<xsl:value-of select="preceding::protocolCommissionMember/id"/>
											</memberId>
											<reasonId>
												<xsl:value-of select="id"/>
											</reasonId>
											<reasonName>
												<xsl:value-of select="reason"/>
											</reasonName>
										</appRejectedReason>
									</xsl:for-each>
								</appRejectedReasons>
							</admissionResult>
						</xsl:for-each>
					</admissionResults>
				</OKAppConsideration>
			</xsl:for-each>
			<xsl:for-each select="protocolOK3//application">
				<OKEstimation>
					<xsl:copy-of select="ancestor::*[child::notificationNumber]/notificationNumber"/>
					<appJournalNumber>
						<xsl:value-of select="journalNumber"/>
					</appJournalNumber>
					<xsl:copy-of select="ancestor::*[child::protocolNumber]/protocolNumber"/>
					<appRating>
						<xsl:value-of select="appRating"/>
					</appRating>
					<resultType>
						<xsl:value-of select="resultType"/>
					</resultType>
					<evalResult>
						<xsl:value-of select="evalResult"/>
					</evalResult>
					<generalPrefs>
						<xsl:value-of select="generalPrefs"/>
					</generalPrefs>
					<featuresComplied>
						<xsl:choose>
							<xsl:when test="count(descendant::featuresCorrespondence[child::compatible[text()='0']]) > 0">0</xsl:when>
							<xsl:otherwise>1</xsl:otherwise>
						</xsl:choose>
					</featuresComplied>
					<xsl:for-each select="descendant::evaluationResult">
						<contractConditionResult>
							<xsl:copy-of select="ancestor::*[child::protocolNumber]/protocolNumber"/>
							<xsl:copy-of select="ancestor::protocolLot/lotNumber"/>
							<criterionId>
								<xsl:value-of select="parent::*/preceding::criterion/id"/>
							</criterionId>
							<xsl:copy-of select="ancestor::*[child::notificationNumber]/notificationNumber"/>
							<appJournalNumber>
								<xsl:value-of select="ancestor::application/journalNumber"/>
							</appJournalNumber>
							<memberId>
								<xsl:value-of select="protocolCommissionMember/id"/>
							</memberId>
							<evalResult>
								<xsl:value-of select="evalResult"/>
							</evalResult>
						</contractConditionResult>
					</xsl:for-each>
				</OKEstimation>
			</xsl:for-each>

			<xsl:for-each select="protocolZK1//application">
				<ZKAppConsideration>
					<xsl:copy-of select="ancestor::*[child::notificationNumber]/notificationNumber"/>
					<appJournalNumber>
						<xsl:value-of select="journalNumber"/>
					</appJournalNumber>
					<xsl:copy-of select="ancestor::*[child::protocolNumber]/protocolNumber"/>
					<price>
						<xsl:value-of select="price"/>
					</price>
					<increasePrice>
						<xsl:value-of select="increasePrice"/>
					</increasePrice>
					<admitted>
						<xsl:value-of select="admitted"/>
					</admitted>
					<appRating>
						<xsl:value-of select="appRating"/>
					</appRating>
					<resultType>
						<xsl:value-of select="resultType"/>
					</resultType>
					<appParticipants>
						<xsl:for-each select="applicationParticipants/applicationParticipant">
							<appParticipant>
								<xsl:copy-of select="ancestor::*[child::notificationNumber]/notificationNumber"/>
								<appJournalNumber>
									<xsl:value-of select="ancestor::application/journalNumber"/>
								</appJournalNumber>
								<inn>
									<xsl:value-of select="inn"/>
								</inn>
								<organizationName>
									<xsl:value-of select="organizationName"/>
								</organizationName>
							</appParticipant>
						</xsl:for-each>
					</appParticipants>
					<appRejectedReasons>
						<xsl:for-each select="admissionResults/appRejectedReason">
							<appRejectedReason>
								<xsl:copy-of select="ancestor::*[child::notificationNumber]/notificationNumber"/>
								<appJournalNumber>
									<xsl:value-of select="ancestor::application/journalNumber"/>
								</appJournalNumber>
								<xsl:copy-of select="ancestor::*[child::protocolNumber]/protocolNumber"/>
								<reasonId>
									<xsl:value-of select="nsiRejectReason/id"/>
								</reasonId>
								<reasonName>
									<xsl:value-of select="nsiRejectReason/reason"/>
								</reasonName>
							</appRejectedReason>
						</xsl:for-each>
					</appRejectedReasons>
					<featuresComplied>
						<xsl:choose>
							<xsl:when test="count(descendant::featuresCorrespondence[child::compatible[text()='0']]) > 0">0</xsl:when>
							<xsl:otherwise>1</xsl:otherwise>
						</xsl:choose>
					</featuresComplied>
				</ZKAppConsideration>
			</xsl:for-each>

			<xsl:for-each select="protocolPO1//application">
				<POAppConsideration>
					<xsl:copy-of select="ancestor::*[child::notificationNumber]/notificationNumber"/>
					<appJournalNumber>
						<xsl:value-of select="journalNumber"/>
					</appJournalNumber>
					<admitted>
						<xsl:value-of select="admitted"/>
					</admitted>
					<appParticipants>
						<xsl:for-each select="applicationParticipants/applicationParticipant">
							<appParticipant>
								<xsl:copy-of select="ancestor::*[child::notificationNumber]/notificationNumber"/>
								<appJournalNumber>
									<xsl:value-of select="ancestor::application/journalNumber"/>
								</appJournalNumber>
								<inn>
									<xsl:value-of select="inn"/>
								</inn>
								<organizationName>
									<xsl:value-of select="organizationName"/>
								</organizationName>
							</appParticipant>
						</xsl:for-each>
					</appParticipants>
					<appRejectedReasons>
						<xsl:for-each select="admissionResults/appRejectedReason">
							<appRejectedReason>
								<xsl:copy-of select="ancestor::*[child::notificationNumber]/notificationNumber"/>
								<appJournalNumber>
									<xsl:value-of select="ancestor::application/journalNumber"/>
								</appJournalNumber>
								<xsl:copy-of select="ancestor::*[child::protocolNumber]/protocolNumber"/>
								<reasonId>
									<xsl:value-of select="nsiRejectReason/id"/>
								</reasonId>
								<reasonName>
									<xsl:value-of select="nsiRejectReason/reason"/>
								</reasonName>
							</appRejectedReason>
						</xsl:for-each>
					</appRejectedReasons>
				</POAppConsideration>
			</xsl:for-each>

			<xsl:for-each select="protocolZK5//application">
				<ZK5AppConsideration>
					<xsl:copy-of select="ancestor::*[child::notificationNumber]/notificationNumber"/>
					<appJournalNumber>
						<xsl:value-of select="journalNumber"/>
					</appJournalNumber>
					<admitted>
						<xsl:value-of select="admitted"/>
					</admitted>
					<appRating>
						<xsl:value-of select="appRating"/>
					</appRating>
					<resultType>
						<xsl:value-of select="resultType"/>
					</resultType>
					<price>
						<xsl:value-of select="price"/>
					</price>
					<appParticipants>
						<xsl:for-each select="applicationParticipants/applicationParticipant">
							<appParticipant>
								<xsl:copy-of select="ancestor::*[child::notificationNumber]/notificationNumber"/>
								<appJournalNumber>
									<xsl:value-of select="ancestor::application/journalNumber"/>
								</appJournalNumber>
								<inn>
									<xsl:value-of select="inn"/>
								</inn>
								<organizationName>
									<xsl:value-of select="organizationName"/>
								</organizationName>
							</appParticipant>
						</xsl:for-each>
					</appParticipants>
					<appRejectedReasons>
						<xsl:for-each select="admissionResults/appRejectedReason">
							<appRejectedReason>
								<xsl:copy-of select="ancestor::*[child::notificationNumber]/notificationNumber"/>
								<appJournalNumber>
									<xsl:value-of select="ancestor::application/journalNumber"/>
								</appJournalNumber>
								<xsl:copy-of select="ancestor::*[child::protocolNumber]/protocolNumber"/>
								<reasonId>
									<xsl:value-of select="nsiRejectReason/id"/>
								</reasonId>
								<reasonName>
									<xsl:value-of select="nsiRejectReason/reason"/>
								</reasonName>
							</appRejectedReason>
						</xsl:for-each>
					</appRejectedReasons>
				</ZK5AppConsideration>
			</xsl:for-each>

			<xsl:for-each select="protocolZK5">
				<orderName>
					<xsl:value-of select="orderName"/>
				</orderName>
				<placerOrgType>
					<xsl:value-of select="order/placerOrgType"/>
				</placerOrgType>
				<placerRegNum>
					<xsl:value-of select="order/placer/regNum"/>
				</placerRegNum>
				<placerFullName>
					<xsl:value-of select="order/placer/fullName"/>
				</placerFullName>
				<protocolLots>
					
				</protocolLots>
				<products>
					<xsl:for-each select="descendant::product">
						<product>
							<xsl:copy-of select="ancestor::*[child::notificationNumber]/notificationNumber"/>
		                 	<lotId><xsl:value-of select="ancestor::protocolLot/lotNumber"/></lotId>
			                <prodCode><xsl:value-of select="code"/></prodCode>
			                <prodName>
			                	<xsl:value-of select="name"/>
			                </prodName>
			            </product> 
					</xsl:for-each>
				</products>
			</xsl:for-each>
		</root>
	</xsl:template>
</xsl:stylesheet>