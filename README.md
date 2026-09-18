# Olist Fulfillment Risk Monitor

## Why I built this

I wanted to look at a simple product question:

> **If an order is going to be late, can we identify the problem early enough to do something about it?**

Instead of only looking at how many orders were late, I wanted to understand **where delays were happening, what was associated with them, how customers reacted, and what a product team could actually do with that information.**

This project uses the Olist Brazilian E-Commerce dataset to explore that problem and turn the analysis into a small product concept for fulfillment operations.

---

## The journey I looked at

I mapped the order journey as:

**Customer places order → Seller handles order → Carrier receives it → Order reaches customer → Customer leaves a review → Customer may purchase again**

I used SQL to investigate each part of this journey and look for patterns in delivery performance.

---

## What I found

The dataset contains around 100K orders, with approximately 96K delivered orders.

A few findings stood out:

- **8.11%** of delivered orders were late.
- When seller handling took **more than 10 days**, the historical late-delivery rate was **33.72%**.
- When carrier transit took **more than 14 days**, the historical late-delivery rate was **37.13%**.
- When both seller handling and carrier transit were prolonged, the late-delivery rate was **28.56%**, compared with **0.78%** for orders without either bottleneck.
- Late orders had an average review score of **2.57**, compared with **4.29** for early/on-time orders.

These relationships are based on historical data and should not be interpreted as proof of causation.

---

## From analysis to product idea

The interesting part for me was that simply saying *"8% of orders are late"* doesn't really help an operations team.

So I translated the analysis into a product concept:

### Olist Fulfillment Risk Monitor

The idea is to give an operations team a way to answer:

**Which orders need attention, why are they at risk, and what should we do about them?**

The proposed workflow is:

**Monitor fulfillment → Identify bottleneck → Assign risk → Prioritize → Intervene → Measure outcome**

For example:

| Problem detected | Suggested action |
|---|---|
| Seller-side delay | Seller follow-up |
| Carrier-side delay | Carrier escalation + ETA review |
| Both | Priority operations intervention |
| No major signal | Continue monitoring |

I also added order value as a prioritization signal so that the team can distinguish between a large number of alerts and the orders that may deserve immediate attention.

---

## Testing the idea

I created a prototype risk rule and tested it against the historical orders.

The rule flagged **18,994 orders** as critical and:

- Captured **85.98%** of historically late orders
- Had **35.42% precision**

This is a historical validation of the prototype rules, rather than a deployed prediction model.

The next step in a real product would be to calculate risk using only information available **while an order is still being fulfilled**, rather than using completed delivery times.

---

## Measuring whether the product actually works

I also designed an experiment rather than assuming that the monitor would improve outcomes.

### Control
Normal fulfillment process

### Treatment
Risk-based intervention for high-risk orders

### Primary metric
**Late delivery rate**

### Other metrics
- Seller handling time
- Carrier transit time
- Low review rate
- Intervention / alert volume

The goal would be to reduce late deliveries without creating so many alerts that the operations team cannot act on them.

---

## Tools

- **SQL / DuckDB** — analysis, joins, segmentation and KPI calculation
- **Python / Pandas** — data preparation and monitor creation
- **Google Sheets** — intervention queue, executive summary and experiment tracker

---

## Dataset

This project uses the **Brazilian E-Commerce Public Dataset by Olist**, containing anonymized e-commerce data from 2016–2018.

Dataset: https://www.kaggle.com/datasets/olistbr/brazilian-ecommerce

---

## Files

- `sql_project1.ipynb` — complete analysis and workflow
- `intervention_queue.csv` — prioritized historical intervention queue
- `risk_summary.csv` — risk and bottleneck summary

The accompanying Google Sheet contains the executive summary, intervention queue and experiment tracker.

---

## What this project demonstrates

I wanted this project to go beyond simply building a dashboard.

The overall thought process was:

**Find a business problem → understand the customer journey → investigate the data → identify a meaningful signal → turn it into a product idea → decide how the team would use it → define how to measure whether it works.**
