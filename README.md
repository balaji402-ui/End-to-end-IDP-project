# 📄 Intelligent Document Processing (IDP) with Databricks AI

An end-to-end Intelligent Document Processing (IDP) project built using **Databricks AI Functions** to automatically classify and extract information from business documents such as **Invoices, Purchase Orders, and Receipts**.

This project demonstrates how Databricks can transform unstructured PDF documents into structured Delta tables using built-in AI capabilities without requiring external OCR or machine learning models.

---

# 🚀 Project Overview

Organizations process thousands of business documents every day. Manual extraction of information is slow, expensive, and error-prone.

This project automates the entire document processing workflow by:

- Reading PDF documents
- Parsing document contents
- Classifying document types
- Extracting important business fields
- Storing structured data into Delta Tables

---

# 🛠 Tech Stack

- Databricks
- Databricks SQL
- Databricks AI Functions
- Apache Spark
- Delta Lake
- GitHub

---

# 📂 Project Structure

```
IDP-End-to-End-Project/
│
├── Dataset/
│   ├── invoices/
│   ├── purchase_orders/
│   └── receipts/
│
├── SQL/
│   └── final_project.sql
│
├── Images/
│   ├── architecture.png
│   ├── workflow.png
│   └── results.png
│
└── README.md
```

---

# 📑 Workflow

```
Business Documents (PDF)
            │
            ▼
      read_files()
            │
            ▼
   ai_parse_document()
            │
            ▼
 Document Text Extraction
            │
            ▼
    ai_classify()
            │
            ▼
Invoice
Purchase Order
Receipt
            │
            ▼
     ai_extract()
            │
            ▼
Structured Data
            │
            ▼
Delta Tables
            │
            ▼
SQL Analysis
```

---

# 🔄 Processing Pipeline

### Step 1 — Read Documents

The project reads all PDF files stored in a Databricks Volume using:

- `read_files()`

---

### Step 2 — Parse Documents

Documents are parsed using:

- `ai_parse_document()`

This converts PDFs into structured document elements.

---

### Step 3 — Convert to Readable Text

Parsed document elements are combined into readable text for AI processing.

---

### Step 4 — Classify Documents

The project automatically classifies each document into:

- Invoice
- Purchase Order
- Receipt
- Other

using:

- `ai_classify()`

---

### Step 5 — Extract Business Information

Databricks AI extracts important fields using:

- `ai_extract()`

---

# 📄 Invoice Fields

The project extracts:

- Vendor Name
- Invoice Number
- Invoice Date
- Due Date
- Payment Method
- Total Amount

Stored in:

```
idp.finance.invoices
```

---

# 📦 Purchase Order Fields

Extracted fields:

- Merchant Name
- Purchase Order Number
- Purchase Order Date
- Total Amount

Stored in:

```
idp.finance.purchase_orders
```

---

# 🧾 Receipt Fields

Extracted fields:

- Merchant Name
- Receipt Number
- Transaction Date
- Total Amount

Stored in:

```
idp.finance.receipts
```

---

# 📊 Output Tables

The project creates the following Delta tables:

| Table | Description |
|--------|-------------|
| parsed_data | Parsed document output |
| pretty_data | Clean text extracted from documents |
| classified_data | Document classification |
| invoice_data | Invoice extraction |
| purchase_order_data | Purchase Order extraction |
| receipts | Receipt extraction |
| idp.finance.invoices | Final Invoice table |
| idp.finance.purchase_orders | Final Purchase Order table |
| idp.finance.receipts | Final Receipt table |

---

# ⭐ Databricks AI Functions Used

- read_files()
- ai_parse_document()
- ai_classify()
- ai_extract()

---

# 🎯 Business Benefits

- Eliminates manual data entry
- Faster document processing
- Automatic document classification
- Accurate information extraction
- Centralized Delta Lake storage
- Scalable AI-powered document processing

---

# 📚 Learning Outcomes

Through this project, I learned:

- Databricks AI Functions
- SQL in Databricks
- Intelligent Document Processing (IDP)
- Delta Lake
- Document Classification
- Information Extraction
- Data Engineering Workflow

---

# 👨‍💻 Author

**Balaji Shashank K**

- 💼 Aspiring Data Analyst
- 📊 SQL | Power BI | Excel | Databricks | GitHub

---

## ⭐ If you found this project helpful, please consider giving it a Star!
