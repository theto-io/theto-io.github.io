<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:template match="/">
		<table id="workers-table">
			<thead>
				<tr>
					<th id="th1">Title</th>
					<th id="th2">Time</th>
					<th id="th3">Creator</th>
					<th id="th4">Description</th>
					<th id="th5">Comments</th>
					<th id="th6">Links</th>
				</tr>
			</thead>
			<tbody>
				<xsl:for-each select="root/groups/group">
					<tr>
						<td class="caption" colspan="6">
							<xsl:value-of select="name" />
						</td>
					</tr>
					<xsl:for-each select="items/item">
						<tr>
							<td id="td1"><xsl:value-of select="title"/></td>
							<td id="td2"><xsl:value-of select="time/begin"/><br/><xsl:value-of select="time/end"/></td>
							<td id="td3">
								<a class="account">
									<xsl:attribute name="href">
										<xsl:value-of select="creator/url" />
									</xsl:attribute>
									<xsl:value-of select="creator/name" />
								</a>
								<xsl:if test="creator/forum">
									<xsl:value-of select="concat(' (',creator/forum,')')" />
								</xsl:if>
							</td>
							<td id="td4">
								<xsl:choose>
									<xsl:when test="description/p">
										<xsl:for-each select="description/p">
											<p><xsl:value-of select="current()"/></p>
										</xsl:for-each>
									</xsl:when>
									<xsl:otherwise><xsl:value-of select="description"/></xsl:otherwise>
								</xsl:choose>
							</td>
							<td id="td5"><xsl:value-of select="comment"/></td>
							<td id="td6">
								<xsl:for-each select="links/link">
									<a class="link">
										<xsl:attribute name="href">
											<xsl:value-of select="url" />
										</xsl:attribute>
										<xsl:value-of select="label" />
									</a>
								</xsl:for-each>
							</td>
						</tr>
					</xsl:for-each>
				</xsl:for-each>
			</tbody>
		</table>
	</xsl:template>
</xsl:stylesheet>