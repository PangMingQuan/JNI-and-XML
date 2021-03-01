<?xml version="1.0" encoding="UTF-8" ?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<?xml-stylesheet type="text/xsl" href="FoodLai.xsl"?>

	<xsl:template match="/">
		<html>
			<head>
				<meta charset="utf-8" />
				<title>Home @ FoodLai</title>
				
				<style>
				body {
						border: double;
						padding: 10px;						
					}
					
				.title {
					text-align:center;
				}
				
				.restaurant {
						border: double;
						padding: 10px;
					}	
				</style>
			</head>
			<body class="title">
				<div id="FoodLaiHeader">
					<h1>Welcome to FoodLai</h1>
					<xsl:for-each select="//FoodLaiSlogan">
						<h2><xsl:value-of select="." /></h2>
					</xsl:for-each>
				</div>
			</body>
			<body class="title">
				<div id="FoodLaiAboutUs">
					<div><h3>About us</h3></div>
					<div>
						<span>Company Name: </span>
						<span><xsl:value-of select="FoodLai/FoodLaiMalaysia/CompanyName" /></span>
					</div>
					<div>
						<span>Company Address: </span>
						<address><xsl:value-of select="FoodLai/FoodLaiMalaysia/CompanyAddress" /></address>
					</div>
					<div>
						<span>Customer Service Email: </span>
						<span><xsl:value-of select="FoodLai/FoodLaiMalaysia/CustomerServiceEmail" /></span>
					</div>
					<div>
						<span>Customer Service Contact: </span>
						<span><xsl:value-of select="FoodLai/FoodLaiMalaysia/CustomerServiceContact" /></span>
					</div>
				</div>
			</body>
			<body>
				<div id="FoodLaiUser">
					<div><h3>FoodLai User List</h3></div>
					<div>
						<table border="" cellspacing="" cellpadding="">
							<tr>
								<th>User ID</th>
								<th>Name</th>
								<th>E-mail</th>
								<th>Contact</th>
								<th>Address</th>
							</tr>
							<xsl:for-each select="//User[@UserID]">
								<tr>
									<td><xsl:value-of select="@UserID" /></td>
									<td><xsl:value-of select="UserName" /></td>
									<td><xsl:value-of select="UserEmail" /></td>
									<td><xsl:value-of select="UserContact" /></td>
									<td><xsl:value-of select="UserAddress" /></td>
								</tr>
							</xsl:for-each>
						</table>
					</div>
				</div>
			</body>
			<body>
				<div id="FoodLaiRestaurant" >
					<div><h3>FoodLai Restaurant List</h3></div>
					<xsl:for-each select="//Restaurant[@RestaurantID]">
						<div class="restaurant">
							<span>Restaurant ID: </span><span><xsl:value-of select="@RestaurantID" /><br/></span>
							<span>Restaurant Name: </span><span><xsl:value-of select="RestaurantName" /><br/></span>
							<span>Restaurant E-mail: </span><span><xsl:value-of select="RestaurantEmail" /><br/></span>
							<span>Restaurant Contact: </span><span><xsl:value-of select="RestaurantContact" /><br/></span>
							<span>Restaurant Address: </span><span><xsl:value-of select="RestaurantAddress" /><br/></span>
							<span>Restaurant Permit: </span><span><xsl:value-of select="RestaurantPermit" /><br/></span>
							<span>Restaurant Permit Expired Date: </span><span><xsl:value-of select="RestaurantPermitExpired" /></span>
							<div>
								<xsl:for-each select="./RestaurantMenu[@Type]">
									<span><br/>Restaurant Menu Type: </span><span><xsl:value-of select="@Type" /></span>
									<table border="" cellspacing="" cellpadding="">
										<tr>
											<th>Dish ID</th>
											<th>Dish Description</th>
											<th>Dish Price</th>
										</tr>
										<xsl:for-each select="./Dish[@DishID]">
											<tr>
												<td><xsl:value-of select="@DishID" /></td>
												<td><xsl:value-of select="DishDescription" /></td>
												<td><xsl:value-of select="DishPrice/@Currency" /><xsl:value-of select="DishPrice" /></td>
											</tr>
										</xsl:for-each>
									</table>
								</xsl:for-each>
							</div>
							<span>Restaurant Commission Rate (per-order): </span><span><xsl:value-of select="./RestaurantCommission/CommissionRate" />%</span>
						</div>
					</xsl:for-each>
				</div>	
			</body>
			<body>
				<div id="FoodLaiRider">
					<div><h3>FoodLai Rider List</h3></div>
					<div>
						<table border="" cellspacing="" cellpadding="">
							<tr>
								<th>Rider ID</th>
								<th>Nick Name</th>
								<th>Full Name</th>
								<th>IC No.</th>
								<th>Passport No.</th>
								<th>E-mail</th>
								<th>Contact</th>
								<th>Address</th>
							</tr>
							<xsl:for-each select="//Rider[@RiderID]">
								<tr>
									<td><xsl:value-of select="@RiderID" /></td>
									<td><xsl:value-of select="RiderName" /></td>
									<td><xsl:value-of select="RiderFullName" /></td>
									<xsl:choose>
										<xsl:when test="not(RiderIC)"><td>-</td></xsl:when>
										<xsl:otherwise><td><xsl:value-of select="RiderIC" /></td></xsl:otherwise>
									</xsl:choose>
									<xsl:choose>
										<xsl:when test="not(RiderPassport)"><td>-</td></xsl:when>
										<xsl:otherwise><td><xsl:value-of select="RiderPassport" /></td></xsl:otherwise>
									</xsl:choose>
									<td><xsl:value-of select="RiderEmail" /></td>
									<td><xsl:value-of select="RiderContact" /></td>
									<td><xsl:value-of select="RiderAddress" /></td>
								</tr>
							</xsl:for-each>
						</table>
					</div>
				</div>
			</body>
			<body>
				<div id="FoodLaiDiscount">
					<div><h3>FoodLai Discount Code List</h3></div>
					<div>
						<ul>
							<xsl:for-each select="//Discount[@DiscountCode]">
								<li>
									<dl>
										<dt>Discount Code: <xsl:value-of select="@DiscountCode" /></dt>
										<dd>Discount Description: <xsl:value-of select="DiscountDescription" /></dd>
										<dd>Discount Total: <xsl:value-of select="DiscountTotal/@Currency" /><xsl:value-of select="DiscountTotal" /></dd>
										<dd>Discount Requirement: <xsl:value-of select="DiscountRequirement/@Currency" /><xsl:value-of select="DiscountRequirement" /></dd>
									</dl>
								</li>
							</xsl:for-each>
						</ul>
					</div>
				</div>
			</body>
			<body>
				<div id="FoodLaiEmployee">
					<table border="" cellspacing="" cellpadding="">
						<tr>
							<th>Staff Position</th>
							<th>Staff ID</th>
							<th>Staff Name</th>
							<th>Staff Month Salary</th>
							<th>Staff IC</th>
							<th>Staff Passport</th>
							<th>Staff E-mail</th>
							<th>Staff Contact</th>
							<th>Staff Address</th>
						</tr>
						<xsl:for-each select="//*[@StaffID]">
							<tr>
								<xsl:variable name="tempStaffID" select="@StaffID"></xsl:variable>
								<td><xsl:value-of select="//Employee[@EmployeeID = $tempStaffID]/Position" /></td>
								<td><xsl:value-of select="@StaffID" /></td>
								<td><xsl:value-of select="StaffName" /></td>
								<td>
									<xsl:value-of select="//Employee[@EmployeeID = $tempStaffID]/MonthSalary/@Currency" />
									<xsl:value-of select="//Employee[@EmployeeID = $tempStaffID]/MonthSalary" />
								</td>
								<xsl:choose>
									<xsl:when test="not(StaffIC)"><td>-</td></xsl:when>
									<xsl:otherwise><td><xsl:value-of select="StaffIC" /></td></xsl:otherwise>
								</xsl:choose>
								<xsl:choose>
									<xsl:when test="not(StaffPassport)"><td>-</td></xsl:when>
									<xsl:otherwise><td><xsl:value-of select="StaffPassport" /></td></xsl:otherwise>
								</xsl:choose>
								<td><xsl:value-of select="StaffEmail" /></td>
								<td><xsl:value-of select="StaffContact" /></td>
								<td><xsl:value-of select="StaffAddress" /></td>
							</tr>
						</xsl:for-each>
					</table>
				</div>
				<div id="FoodLaiFooter">
					
				</div>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>
