<?xml version="1.0" encoding="UTF-8" ?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<?xml-stylesheet type="text/css" href="style.css"?>
	
	<xsl:template match="/">
		<html>
			<head>
				<meta charset="utf-8" />
				<title>Order List @ FoodLai</title>
				<link rel="stylesheet" type="text/css" href="https://www.w3schools.com/w3css/4/w3.css" />
			</head>
			<body>
				<div id="FoodLaiHeader" class="w3-panel w3-pale-red w3-leftbar w3-rightbar w3-border-red">
					<h1>Welcome to FoodLai</h1>
					<h2>Order List @ FoodLai</h2>
				</div>
				<div id="PurchaseOrder">
					<xsl:apply-templates select="//Order[@OrderID]"></xsl:apply-templates>
				</div>
			</body>
		</html>
	</xsl:template>
	<xsl:template match="Order">
		<xsl:variable name="tempOrderID" select="@OrderID"></xsl:variable>
		<div class="w3-card-4 w3-margin"><xsl:copy-of select="$tempOrderID" />
			<header class="w3-container w3-blue w3-margin">
				<h2><xsl:value-of select="//FoodLai/CompanyName" /></h2>
				<span><xsl:value-of select="//FoodLai/CompanyAddress" /></span><br />
				<span>E-mail: </span><span><xsl:value-of select="//FoodLai/CustomerServiceEmail" /></span><br />
				<span>Tel: </span><span><xsl:value-of select="//FoodLai/CustomerServiceContact" /></span>
			</header>
			<div class="w3-container w3-margin">
				<span>Invoice ID: </span><span><xsl:value-of select="./Invoice[@InvoiceID]/@InvoiceID" /></span><br />
				<span>Time: </span><span><xsl:value-of select="./Invoice/InvoiceTime" /></span><br />
				<span>Restaurant ID: </span><span><xsl:value-of select="./OrderRestaurant[@OrderRestaurantID]/@OrderRestaurantID" /></span><br />
				<span>Restaurant Name: </span><span><xsl:value-of select="./OrderRestaurant/OrderRestaurantName" /></span><br />
				<table border="2" cellspacing="2" cellpadding="2">
					<span>Order List: -</span>
					<tr>
						<th>ID</th>
						<th>Description</th>
						<th>Price</th>
						<th>Qty.</th>
						<th>Sub. Total</th>
					</tr>
					<xsl:for-each select="./OrderRestaurant/OrderDish[@OrderDishID]">
						<tr>
							<td><xsl:value-of select="@OrderDishID" /></td>
							<td><xsl:value-of select="OrderDishDescription" /></td>
							<td><xsl:value-of select="OrderDishPrice" /></td>
							<td><xsl:value-of select="OrderDishQuantity" /></td>
							<td><xsl:value-of select="OrderDishSubTotal" /></td>
						</tr>
					</xsl:for-each>
				</table>
				<span>Delivery Fee: </span><span><xsl:value-of select="./Invoice/DeliveryFee/@Currency" /></span><span><xsl:value-of select="./Invoice/DeliveryFee" /></span><br />
				<span>Discount: </span>
				<xsl:choose>
					<xsl:when test="not(./Invoice/OrderDiscount)"><span>-</span></xsl:when>
					<xsl:otherwise>
						<span>
							<xsl:value-of select="./Invoice/OrderDiscount/OrderDiscountTotal/@Currency" />
							<xsl:value-of select="./Invoice/OrderDiscount/OrderDiscountTotal" />
						</span>
					</xsl:otherwise>
				</xsl:choose>
				<br />
				<span>Total: </span>
				<span>
					<xsl:value-of select="./Invoice/PaymentTotal/@Currency" />
					<xsl:value-of select="./Invoice/PaymentTotal" />
					<span> Pay by <xsl:value-of select="./Invoice/PaymentTotal/@Method" /></span>
				</span>
			</div>
			<footer class="w3-container w3-blue w3-margin">
				<span>Rider ID: </span><span><xsl:value-of select="./OrderRider[@OrderRiderID]/@OrderRiderID" /></span><br />
				<span>Rider Name: </span><span><xsl:value-of select="./OrderRider/OrderRiderName" /></span><br />
				<span>Rider H/P: </span><span><xsl:value-of select="./OrderRider/OrderRiderContact" /></span><br /><br />
				<span>Current Order Status: </span><span><xsl:value-of select="./OrderStatus/@Type" /></span>
			</footer>
		</div> 
	</xsl:template>
</xsl:stylesheet>
