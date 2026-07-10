-- Databricks notebook source
select
  *
from
  read_files('/Volumes/idp/default/end_to_end_idp_project')

-- COMMAND ----------

create or replace table parsed_data as 
SELECT PATH,
ai_parse_document(content) as parsed_content
from read_files('/Volumes/idp/default/end_to_end_idp_project')

-- COMMAND ----------

create or replace table pretty_data as
select path,
concat_ws('\n',
transform(try_cast(parsed_content:document:elements as ARRAY<VARIANT>),
e -> coalesce(try_cast(e:content as STRING),''))
) as doc_text
from parsed_data

-- COMMAND ----------

create or replace table classified_data as
select *,
 ai_classify(doc_text, array('Invoice', 'Purchase Order', 'Receipt', 'Other')) as doc_classification
 from pretty_data

-- COMMAND ----------

CREATE OR REPLACE TABLE invoice_data as
select *,
ai_extract(doc_text, ARRAY('Vender_Name', 
'Invoice_Number', 
'Invoice_Date', 
'Due_Date',
'Payment_Method','Total')) as extracted
 from classified_data
where doc_classification = 'Invoice'

-- COMMAND ----------

CREATE SCHEMA IF NOT EXISTS idp.finance

-- COMMAND ----------

create or replace table idp.finance.invoices as
SELECT PATH,
extracted.Vender_Name AS Vendor,
extracted.Invoice_Number as Invoice_Number,
extracted.Invoice_Date as Invoice_Date,
extracted.Due_Date as Due_Date,
extracted.Payment_Method as Payment_Method,
extracted.Total as Total
 FROM invoice_data

-- COMMAND ----------

select * from idp.finance.invoices

-- COMMAND ----------

CREATE OR REPLACE TABLE purchase_order_data as
select *,
ai_extract(doc_text, ARRAY('Marchant_Name', 
'PO_Number', 
'Purchase_Order_Date', 
'Total')) as extracted
 from classified_data
where doc_classification = 'Purchase Order'

-- COMMAND ----------

select * from purchase_order_data

-- COMMAND ----------

CREATE OR REPLACE TABLE idp.finance.purchase_orders as
select path,
extracted.Marchant_Name as Merchant,
extracted.PO_Number as PO_Number,
extracted.Purchase_Order_Date as Purchase_Order_Date,
extracted.Total as Total
 FROM purchase_order_data

-- COMMAND ----------

SELECT * FROM idp.finance.purchase_orders

-- COMMAND ----------

CREATE OR REPLACE TABLE receipts as
select *,
ai_extract(doc_text, ARRAY('Marchant_Name', 
'Receipt_Number', 
'Transaction_Date',
'Total')) as extracted
 from classified_data
where doc_classification = 'Receipt'

-- COMMAND ----------

CREATE OR REPLACE TABLE idp.finance.receipts as
select path,
extracted.Marchant_Name as Merchant,
extracted.Receipt_Number as Receipt_Number,
extracted.Transaction_Date as Transaction_Date,
extracted.Total as Total
from  receipts

-- COMMAND ----------

select * from idp.finance.receipts

-- COMMAND ----------

