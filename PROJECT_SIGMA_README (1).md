# Project SIGMA — Operational Transformation Suite
### Python · SQL · Excel

---

A 60-person transcription team. Two languages. A Q1 in freefall — quality dropping, SLA targets missed, leadership convinced it was a headcount problem.

It wasn't.

---

## What I Did

I built an end-to-end analytics pipeline to find out what was actually going wrong — and prove it with data before recommending anything.

**In Python**, I generated 21,900 rows of daily performance logs simulating the full year: the crisis, the pivot, the recovery. Built with Pandas and NumPy — including a binomial sampling layer to replicate how real QA audits work in production.

**In SQL**, I ran diagnostic queries against that data to isolate the problem. Not just *that* errors were happening — but *where*, *which type*, and *in which stream*. The culprit: orthographic inconsistencies concentrated in the Hindi Review team. A linguistic bottleneck, not a staffing one.

**In Excel**, I built a slicer-driven executive dashboard to tell that story to people who don't have time for a briefing. A Radar Chart to show the error breakdown, a Combo Chart to track output against the SLA target line, and a Language toggle so stakeholders could switch between Hindi and English performance in one click.

---

## What It Found

The fix required zero additional headcount. Senior Hindi reviewers were reallocated to the underperforming segment. By Q3, quality scores jumped 22%. By Q4, SLA attainment was 100%.

The data made the decision obvious. That was the point.

---

| File | What it does |
|---|---|
| `sigma_data_generator.py` | Builds the dataset |
| `sigma_data_extraction.sql` | Runs the diagnosis |
| `Project1_Final.xlsx` | Tells the story |

---

*Based on real work at Sigma.AI, reconstructed with synthetic data for portfolio purposes. Figures are accurate. Identifiers removed.*

**Mekhala Saxena** · [LinkedIn](https://www.linkedin.com/in/saxenamekhala97) · saxena.mekhala97@gmail.com
