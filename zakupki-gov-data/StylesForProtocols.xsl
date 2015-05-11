<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output indent="yes" method="xml"/>
	<xsl:template match="/export">
		<export>
			<xsl:for-each select="child::*">
				<xsl:choose>
					<xsl:when test="name()='protocolCancel'">
						<protocolCancel>
							<xsl:copy-of select="notificationNumber"/>
							<xsl:copy-of select="protocolNumber"/>
							<publishDate><xsl:value-of select="publishDate"/></publishDate>
							<href><xsl:value-of select="href"/></href>
							<protocolLots>
								<xsl:for-each select="self::*/protocolLots/protocolLot">
									<protocolLot>
										<xsl:copy-of select="ancestor::protocolCancel/protocolNumber"/>
										<xsl:copy-of select="lotNumber"/>
									</protocolLot>
								</xsl:for-each>
							</protocolLots>
						</protocolCancel>
					</xsl:when>
					<xsl:when test="name()='protocolEvasion'">
						<protocolEvasion>
							<xsl:copy-of select="notificationNumber"/>
							<xsl:copy-of select="protocolNumber"/>
							<xsl:copy-of select="protocolDate"/>
							<xsl:copy-of select="signDate"/>
							<publishDate><xsl:value-of select="publishDate"/></publishDate>
							<href><xsl:value-of select="href"/></href>
							<applications>
								<xsl:for-each select="descendant::application">
									<application>
										<xsl:copy-of select="ancestor::protocolEvasion/protocolNumber"/>
										<xsl:copy-of select="ancestor::protocolLot/lotNumber"/>
										<xsl:copy-of select="journalNumber"/>
									</application>
								</xsl:for-each>
							</applications>
							<refusalFoundations>
								<xsl:for-each select="descendant::refusalFact">
									<refusalFoundation>
										<xsl:copy-of select="ancestor::protocolEvasion/protocolNumber"/>
										<foundationId>
											<xsl:value-of select="foundation/id"/>
										</foundationId>
										<foundationName>
											<xsl:value-of select="foundation/name"/>
										</foundationName>
									</refusalFoundation>
								</xsl:for-each>
							</refusalFoundations>
						</protocolEvasion>
    				</xsl:when>
    				<xsl:when test="name()='protocolOK1'">
    					<protocolOK1>
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
							<commissionMemberCount>
								<xsl:value-of select="count(self::*//protocolCommissionMembers/protocolCommissionMember)"/>
							</commissionMemberCount>
							<protocolCommissionMembers>
								<xsl:for-each select="self::*//commission/protocolCommissionMembers/protocolCommissionMember">
									<protocolCommissionMember>
										<xsl:copy-of select="ancestor::*[child::protocolNumber]/protocolNumber"/>
										<commissionRegNumber>
											<xsl:value-of select="ancestor::commission/regNumber"/>
										</commissionRegNumber>
										<xsl:copy-of select="id"/>
										<xsl:copy-of select="name"/>
										<xsl:copy-of select="role/roleId"/>
										<xsl:copy-of select="present"/>
									</protocolCommissionMember>
								</xsl:for-each>
							</protocolCommissionMembers>
							<lotCount>
								<xsl:value-of select="count(self::*//protocolLots/protocolLot)"/>
							</lotCount>
							<criteriasNIR>
								<xsl:value-of select="self::*//criterias/NIR"/>
							</criteriasNIR>
							<manualCriteriaCount>
								<xsl:value-of select="count(descendant::criterias/manual)"/>
							</manualCriteriaCount>
							<autoCriteriaCount>
								<xsl:value-of select="count(descendant::criterias/auto)"/>
							</autoCriteriaCount>
							<childrenCriteraiCount>
								<xsl:value-of select="count(descendant::criterias//childrenCriteria)"/>
							</childrenCriteraiCount>
							<applicationCount>
								<xsl:value-of select="count(self::*//applications/application)"/>
							</applicationCount>
							<applications>
								<xsl:for-each select="self::*//applications/application">
									<application>
										<xsl:copy-of select="ancestor::*[child::protocolNumber]/protocolNumber"/>
										<xsl:copy-of select="journalNumber"/>
										<xsl:copy-of select="ancestor::protocolLot/lotNumber"/>
										<xsl:copy-of select="appFormat"/>
										<xsl:copy-of select="appDate"/>
										<xsl:copy-of select="price"/>
										<contractConditionCount>
											<xsl:value-of select="count(self::*//contractConditions/contractCondition)"/>
										</contractConditionCount>
										<noOfferContractConditionCount>
											<xsl:value-of select="count(self::*//contractConditions/contractCondition[child::noOffer])"/>
										</noOfferContractConditionCount>
										<criteriaCountPerLot>
											<xsl:value-of select="count(ancestor::protocolLot/descendant::nsiEvalCriterion)+count(ancestor::protocolLot/descendant::childrenCriteria)"/>
										</criteriaCountPerLot>
										<satisfiedRequirementComplianceCount>
											<xsl:value-of select="count(descendant::requirementCompliance[child::availabilityType[text()='A']])"/>
										</satisfiedRequirementComplianceCount>
										<unsatisfiedRequirementComplianceCount>
											<xsl:value-of select="count(descendant::requirementCompliance[child::availabilityType[text()='U']])"/>
										</unsatisfiedRequirementComplianceCount>
										<otherRequirementComplianceCount>
											<xsl:value-of select="count(descendant::requirementCompliance[child::availabilityType[text()='O']])"/>
										</otherRequirementComplianceCount>
									</application>
								</xsl:for-each>
							</applications>

							<applicationParticipantCount>
								<xsl:value-of select="count(self::*//applicationParticipants/applicationParticipant)"/>
							</applicationParticipantCount>
							<applicationParticipants>
								<xsl:for-each select="self::*//applicationParticipants/applicationParticipant">
									<applicationParticipant>
										<xsl:copy-of select="ancestor::*[child::protocolNumber]/protocolNumber"/>
										<applicationJournalNumber>
											<xsl:value-of select="ancestor::application/journalNumber"/>
										</applicationJournalNumber>
										<xsl:copy-of select="ancestor::protocolLot/lotNumber"/>
										<xsl:copy-of select="participantType"/>
										<xsl:copy-of select="inn"/>
										<xsl:copy-of select="organizationForm"/>
										<xsl:copy-of select="organizationName"/>
										<legalFormCode>
											<xsl:value-of select="legalForm/code"/>
										</legalFormCode>
										<legalFormName>
											<xsl:value-of select="legalForm/singularName"/>
										</legalFormName>
										<status>
											<xsl:value-of select="status"/>
										</status>
										<countryCode>
											<xsl:value-of select="country/countryCode"/>
										</countryCode>
										<countryFulName>
											<xsl:value-of select="country/countryFullName"/>
										</countryFulName>
										<xsl:copy-of select="factualAddress"/>
									</applicationParticipant>
								</xsl:for-each>
							</applicationParticipants>
						</protocolOK1>
    				</xsl:when>
    				<xsl:when test="name()='protocolOK2'">
    					<protocolOK2>
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
							<commissionMemberCount>
								<xsl:value-of select="count(self::*//protocolCommissionMembers/protocolCommissionMember)"/>
							</commissionMemberCount>
							<protocolCommissionMembers>
								<xsl:for-each select="self::*//commission/protocolCommissionMembers/protocolCommissionMember">
									<protocolCommissionMember>
										<xsl:copy-of select="ancestor::*[child::protocolNumber]/protocolNumber"/>
										<commissionRegNumber>
											<xsl:value-of select="ancestor::commission/regNumber"/>
										</commissionRegNumber>
										<xsl:copy-of select="id"/>
										<xsl:copy-of select="name"/>
										<xsl:copy-of select="role/roleId"/>
										<xsl:copy-of select="present"/>
									</protocolCommissionMember>
								</xsl:for-each>
							</protocolCommissionMembers>
							<lotCount>
								<xsl:value-of select="count(self::*//protocolLots/protocolLot)"/>
							</lotCount>
							<applicationCount>
								<xsl:value-of select="count(self::*//applications/application)"/>
							</applicationCount>
							<applications>
								<xsl:for-each select="self::*//applications/application">
									<application>
										<xsl:copy-of select="ancestor::*[child::protocolNumber]/protocolNumber"/>
										<xsl:copy-of select="journalNumber"/>
										<xsl:copy-of select="ancestor::protocolLot/lotNumber"/>
										<xsl:copy-of select="addmited"/>

										<admissionResults>
											<xsl:for-each select="admissionResults/admissionResult">
												<admissionResult>
													<xsl:copy-of select="ancestor::*[child::protocolNumber]/protocolNumber"/>
													<applicationJournalNumber>
														<xsl:value-of select="ancestor::application/journalNumber"/>
													</applicationJournalNumber>								
													<protocolCommissionMemberId>
														<xsl:value-of select="protocolCommissionMember/id"/>
													</protocolCommissionMemberId>
													<xsl:copy-of select="admitted"/>
													<nsiRejectReasonId>
														<xsl:copy-of select="appRejectedReason/nsiRejectReason/id"/>
													</nsiRejectReasonId>
												</admissionResult>
											</xsl:for-each>
										</admissionResults>

										<featuresCorrespondences>
											<xsl:for-each select="featuresCorrespondences/featuresCorrespondence">
												<featuresCorrespondence>
													<xsl:copy-of select="ancestor::*[child::protocolNumber]/protocolNumber"/>
													<applicationJournalNumber>
														<xsl:value-of select="ancestor::application/journalNumber"/>
													</applicationJournalNumber>								
													<prefValue>
														<xsl:value-of select="notificationFeature/prefValue"/>
													</prefValue>
													<compatible>
														<xsl:value-of select="compatible"/>
													</compatible>
													<placementFeatureCode>
														<xsl:copy-of select="notificationFeature/placementFeature/code"/>
													</placementFeatureCode>
												</featuresCorrespondence>
											</xsl:for-each>
										</featuresCorrespondences>

									</application>
								</xsl:for-each>
							</applications>

    					</protocolOK2>
    				</xsl:when>
    				<xsl:when test="name()='protocolOK3'">
    					<protocolOK3>
    					</protocolOK3>
    				</xsl:when>
    				<xsl:when test="name()='protocolEF1'">
    					<protocolEF1>
    					</protocolEF1>
    				</xsl:when>
    				<xsl:when test="name()='protocolEF2'">
    					<protocolEF2>
    					</protocolEF2>
    				</xsl:when>
     				<xsl:when test="name()='protocolEF3'">
    					<protocolEF3>
    					</protocolEF3>
    				</xsl:when>
     				<xsl:when test="name()='protocolZK1'">
    					<protocolZK1>
    					</protocolZK1>
    				</xsl:when>
    				<xsl:when test="name()='protocolZK5'">
    					<protocolZK5>
    					</protocolZK5>
    				</xsl:when>
     				<xsl:when test="name()='protocolPO1'">
    					<protocolPO1>
    					</protocolPO1>
    				</xsl:when>

					<xsl:otherwise>
					</xsl:otherwise>

				</xsl:choose>
			</xsl:for-each>
		</export>
	</xsl:template>
</xsl:stylesheet>
