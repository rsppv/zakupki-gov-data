<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output indent="yes" method="xml"/>
	<xsl:template match="export">
		<export>
			<xsl:for-each select="contractSign">
				<contractSign>
					<xsl:copy-of select="id"/>
					<xsl:copy-of select="number"/>
					<xsl:copy-of select="signDate"/>
					<xsl:copy-of select="foundation/order/notificationNumber"/>
					<xsl:copy-of select="foundation/order/foundationProtocolNumber"/>
					<xsl:copy-of select="customer/regNum"/>
					<xsl:copy-of select="customer/fullName"/>
					<xsl:copy-of select="protocolDate"/>
					<suppliersCount>
						<xsl:value-of select="count(suppliers/supplier)"/>
					</suppliersCount>
					<suppliers>
						<xsl:for-each select="suppliers/supplier">
							<supplier>
								<xsl:copy-of select="participantType"/>
								<xsl:copy-of select="inn"/>
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
								<xsl:copy-of select="country/countryCode"/>
								<xsl:copy-of select="country/countryFullName"/>
								<xsl:copy-of select="factualAddress"/>
							</supplier>
						</xsl:for-each>
					</suppliers>
				</contractSign>
			</xsl:for-each>
			<xsl:for-each select="contract">
				<contract>
					<xsl:copy-of select="number"/>
					<xsl:copy-of select="signDate"/>
					<xsl:copy-of select="protocolDate"/>
					<xsl:copy-of select="price"/>
					<xsl:copy-of select="currency/code"/>
					<xsl:copy-of select="href"/>
					<xsl:copy-of select="currentContractStage"/>
					<xsl:copy-of select="foundation//notificationNumber"/>
					<xsl:copy-of select="foundation//lotNumber"/>
					<xsl:copy-of select="foundation//placing"/>
					<xsl:copy-of select="customer/regNum"/>
					<xsl:copy-of select="customer/fullName"/>
					<singleCustomerReasonID>
						<xsl:value-of select="singleCustomerReason/id"/>
					</singleCustomerReasonID>
					<executionYear>
						<xsl:value-of select="execution/year"/>
					</executionYear>
					<executionMonth>
						<xsl:value-of select="execution/month"/>
					</executionMonth>
					<xsl:copy-of select="finances/financeSource"/>
					<extrabudgetCode>
						<xsl:value-of select="finances/extrabudget/code"/>
					</extrabudgetCode>
					<extrabudgetName>
						<xsl:value-of select="finances/extrabudget/name"/>
					</extrabudgetName>
					<extrabudgetaryMonth>
						<xsl:value-of select="finances/extrabudgetary/month"/>
					</extrabudgetaryMonth>
					<extrabudgetaryYear>
						<xsl:value-of select="finances/extrabudgetary/year"/>
					</extrabudgetaryYear>
					<extrabudgetaryKOGSU>
						<xsl:value-of select="finances/extrabudgetary/KOGSU"/>
					</extrabudgetaryKOGSU>
					<extrabudgetaryPrice>
						<xsl:value-of select="finances/extrabudgetary/price"/>
					</extrabudgetaryPrice>
					<suppliersCount>
						<xsl:value-of select="count(suppliers/supplier)"/>
					</suppliersCount>
					<suppliers>
						<xsl:for-each select="suppliers/supplier">
							<supplier>
								<xsl:copy-of select="participantType"/>
								<xsl:copy-of select="inn"/>
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
								<xsl:copy-of select="country/countryCode"/>
								<xsl:copy-of select="country/countryFullName"/>
								<xsl:copy-of select="factualAddress"/>
							</supplier>
						</xsl:for-each>
					</suppliers>
					<productsCount>
						<xsl:value-of select="count(products/product)"/>
					</productsCount>
					<products>
						<xsl:for-each select="products/product">
							<product>
								<contractReqNum>
									<xsl:value-of select="../../regNum"/>
								</contractReqNum>
								<OKPD>
									<xsl:value-of select="OKDP/code"/>
								</OKPD>
								<xsl:copy-of select="country/countryCode"/>
								<xsl:copy-of select="country/countryFullName"/>
								<xsl:copy-of select="name"/>
								<xsl:copy-of select="price"/>
								<xsl:copy-of select="quantity"/>
								<OKEI>
									<xsl:value-of select="OKEI/code"/>
								</OKEI>
								<xsl:copy-of select="sum"/>
							</product>
						</xsl:for-each>
					</products>
				</contract>
			</xsl:for-each>
			<xsl:for-each select="contractCancel">
				<contractCancel>
					<xsl:copy-of select="regNum"/>
					<xsl:copy-of select="cancelDate"/>
					<xsl:copy-of select="currentContractStage"/>
				</contractCancel>
			</xsl:for-each>
			<xsl:for-each select="contractProcedure">
				<contractProcedure>
					<xsl:copy-of select="id"/>
					<xsl:copy-of select="regNum"/>
					<xsl:copy-of select="publishDate"/>
					<xsl:copy-of select="cancelDate"/>
					<xsl:copy-of select="status"/>
					<xsl:copy-of select="currentContractStage"/>
					<terminationsCount>
						<xsl:value-of select="count(terminations/termination)"/>
					</terminationsCount>
					<terminations>
						<xsl:for-each select="terminations/termination">
							<termination>
								<contractProcedureID>
									<xsl:value-of select="../../id"/>
								</contractProcedureID>
								<paid>
									<xsl:value-of select="paid"/>
								</paid>
								<terminationDate>
									<xsl:value-of select="terminationDate"/>
								</terminationDate>
								<terminationReason>
									<xsl:value-of select="terminationReason/id"/>
								</terminationReason>
							</termination>
						</xsl:for-each>
					</terminations>
					<executionsCount>
						<xsl:value-of select="count(executions/execution)"/>
					</executionsCount>
					<executionsStageYear>
						<xsl:value-of select="executions/stage/year"/>
					</executionsStageYear>
					<executionsStageMonth>
						<xsl:value-of select="executions/stage/month"/>
					</executionsStageMonth>
					<executionsPaid>
						<xsl:value-of select="sum(executions/execution/paid)"/>
					</executionsPaid>
					<executions>
						<xsl:for-each select="executions/execution">
							<execution>
								<contractProcedureID>
									<xsl:value-of select="../../id"/>
								</contractProcedureID>
								<paid>
									<xsl:value-of select="paid"/>
								</paid>
								<executionDate>
									<xsl:value-of select="execDate"/>
								</executionDate>
								<documentDate>
									<xsl:value-of select="documentDate"/>
								</documentDate>
								<product>
									<xsl:value-of select="product"/>
								</product>
							</execution>
						</xsl:for-each>
					</executions>
					<penaltiesCount>
						<xsl:value-of select="count(penalties/penalty)"/>
					</penaltiesCount>
					<penalties>
						<xsl:for-each select="penalties/penalty">
							<penalty>
								<contractProcedureID>
									<xsl:value-of select="../../id"/>
								</contractProcedureID>
								<contractParty>
									<xsl:value-of select="contractParty"/>
								</contractParty>
								<penaltyType>
									<xsl:value-of select="penaltyType"/>
								</penaltyType>
								<accrualDecisionDate>
									<xsl:value-of select="penaltyAccrual/accrualDecisionDate"/>
								</accrualDecisionDate>
								<accrualAmount>
									<xsl:value-of select="penaltyAccrual/accrualAmount"/>
								</accrualAmount>
								<collectedAmount>
									<xsl:value-of select="penaltyAccrual/penaltyFact/collectedAmount"/>
								</collectedAmount>
								<penaltyChangeType>
									<xsl:value-of select="penaltyChange/penaltyChangeType"/>
								</penaltyChangeType>
								<changeDecisionDate>
									<xsl:value-of select="penaltyChange/changeDecisionDate"/>
								</changeDecisionDate>
								<returnedAmount>
									<xsl:value-of select="penaltyChange/penaltyChangeFact/returnedAmount"/>
								</returnedAmount>
							</penalty>
						</xsl:for-each>
					</penalties>
				</contractProcedure>
			</xsl:for-each>
		</export>
	</xsl:template>
</xsl:stylesheet>