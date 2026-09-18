# olist-fulfillment-risk-monitor

# Olist Fulfillment Risk Monitor

A product analytics project that uses SQL and Python to identify e-commerce fulfillment risks, understand their impact on customers, and translate the findings into an operations-focused product solution.

## Problem

Late deliveries can negatively affect customer experience, but simply tracking late orders after they happen does not help operations teams intervene early.

This project asks:

> **Where in the fulfillment journey are delays emerging, what signals are associated with late delivery, and how can those signals be turned into actionable interventions?**

## Dataset

The project uses the **Brazilian E-Commerce Public Dataset by Olist**, containing approximately 100K orders from 2016–2018.

The dataset includes information about:

- Customers
- Orders
- Order items
- Sellers
- Products
- Payments
- Reviews
- Geolocation

Dataset: [Olist Brazilian E-Commerce Public Dataset](https://www.kaggle.com/datasets/olistbr/brazilian-ecommerce)

## Tools

- **SQL (DuckDB)** — data exploration, joins, segmentation, KPI analysis and risk-rule validation
- **Python / Pandas** — data preparation and product-monitoring dataset creation
- **Google Sheets** — operations-facing intervention queue and experiment tracker

## Key Analysis

The analysis examined the fulfillment journey:

**Order → Seller handling → Carrier transit → Customer delivery → Review → Repeat purchase**

Key findings from approximately 96K delivered orders:

- Overall late-delivery rate: **8.11%**
- Orders with seller handling above 10 days had a **33.72%** late-delivery rate.
- Orders with carrier transit above 14 days had a **37.13%** late-delivery rate.
- Orders with both prolonged seller handling and carrier transit had a **28.56%** late-delivery rate, compared with **0.78%** for orders without either bottleneck.
- Late orders had an average review score of **2.57**, compared with **4.29** for early/on-time orders.

These are historical associations in the dataset and do not establish causality.

## Product Solution

Based on the analysis, I designed an **Olist Fulfillment Risk Monitor** for operations teams.

The proposed workflow:

1. Monitor fulfillment-stage signals
2. Identify potential bottlenecks
3. Classify orders by risk level
4. Identify whether the signal is primarily seller-side, carrier-side, or both
5. Prioritize high-risk orders
6. Route orders to an appropriate operational intervention
7. Measure whether interventions improve outcomes

### Example interventions

| Bottleneck | Proposed action |
|---|---|
| Seller | Seller follow-up |
| Carrier | Carrier escalation + ETA review |
| Both | Priority operations intervention |
| Healthy | Continue monitoring |

## Risk Validation

A prototype critical-risk rule was tested against historical outcomes.

- **18,994** orders were flagged as critical
- **85.98% recall** — captured 85.98% of historically late orders
- **35.42% precision** — 35.42% of flagged orders were historically late

This is a historical validation of the prototype rule, not a deployed predictive model.

## Experiment Design

To measure whether the proposed product actually improves fulfillment outcomes, I designed a control/treatment experiment.

### Control
Normal fulfillment process

### Treatment
Risk-based intervention for high-risk orders

### Primary KPI
- Late delivery rate

### Secondary KPIs
- Seller handling time
- Carrier transit time
- Low review rate

### Guardrail KPI
- Intervention / alert volume

The experiment framework is included in the project deliverables; no treatment results are fabricated.

## Project Deliverables

- `sql_project1.ipynb` — complete analysis and SQL/Python workflow
- `intervention_queue.csv` — historically identified high-risk orders and recommended actions
- `risk_summary.csv` — risk-level and bottleneck summary
- Google Sheets — executive summary, intervention queue and experiment tracker

## Product Thinking

The project follows the product analytics workflow:

**Business problem → KPI → User journey → Root-cause analysis → Segmentation → Product intervention → Prioritization → Experiment design → Measurement**

The goal was not just to identify that deliveries were late, but to translate operational data into a **decision-making workflow for a product/operations team**.
