# SQL Ecommerce-Database-Project

Walmart Online Shopping Platform Clone

Company Description:

Walmart(fictional) is an online e-commerce platform that operates a chain of hypermarkets (also called supercenters), discount department stores, and grocery stores in the United States. People use Walmart to order food, consumables, and general merchandise assortments such as groceries, everyday essentials, toys, and electronics.

User Requirements:

The below entities comprise overall user requirements and data needs to be recorded for the same:

User

    UserID (Unique Identification for User)
    
    Password (Account Login Password)
    
    First Name
    
    Last Name
    
    Phone Number (user can have more than one phone number)
    
    Email (user can have more than one email)
    
    Address
    
    Date of Birth
    
    Account Type
    

Users have the option to enroll for a  Plus account type to avail benefits on product. Walmart Plus members are entitled to receive discount offers.

Product

    ProductID (Unique Identification of each Product
    
    Product Name
    
    Product Description
    
    Product Price
    
    Product Category

Order

    OrderID (Uniquely Identification for each Order)
    
    Order Date
    
    Order Time
    
    Amount 
    
    Order Status

Payment

    PaymentID (Unique Identification for every payment made by the user)
    
    Payment Date
    
    Payment Time
    
    Payment Amount
    
    Mode of Payment

Seller

    SellerID (Unique Identification of each Seller)
    
    Seller Name
    
    Address
    
    Reviews

Discount

    DiscountCode (Unique Identification of each Discount applied)
    
    Validity
    
    Discount Type

There are 2 discount types: regular (normal day discount offer) and special (seasonal or festive discount offer).


Rules:

Users can select one or multiple products while shopping. One product can be selected by multiple users at the same time.

Users can place one or multiple orders.
Assumption: Only one order should lead to one customer at a given time.

Users can make one or multiple payments for an order. However, at a given time only one payment should be made by one user.

One payment should be associated with only one order.

A Seller can receive none or many orders. At a given time, one order should relate to only one seller.

Multiple products can be sold by one seller. A given product can be sold by various sellers at a given time.

Users can give reviews to none or many products.

Users can give reviews to none or many sellers.

One order can have one or multiple products at a given time.

Discount is applicable only to Walmart Plus members. A regular member is not eligible to receive discount offers.

Users can have 2 account types, Normal or Walmart Plus. Walmart Plus members are entitled to receive discount offers.

At a given time, only one offer can be availed by one Walmart Plus user. It can be a Regular offer or a Special offer depending on user preference.

The following steps were implemented

SQL DDL Statements

Create Table (Create 12 tables based on the relational data model and metadata), Alter Table, Drop Table, Rename Table


SQL DML Statements

Insert Records, Update Records, Delete Records, Select Records


SQL Joins between tables

Natural Join, Inner Join, Left Join, Equi Join

