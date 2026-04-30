/* PROJECT SIGMA: OPERATIONAL DIAGNOSTICS & AUDIT
Description: This script performs deep-dive analysis on the 21,900-row 
performance dataset to identify linguistic bottlenecks and validate 
the Q3 Resource Pivot strategy.
*/

-- ==========================================================
-- SPRINT 1: DATA INTEGRITY & HEADCOUNT AUDIT
-- Verification of the 17-worker per language distribution logic.
-- ==========================================================

SELECT 
    Language, 
    Team,
    COUNT(DISTINCT Worker_ID) AS Unique_Headcount
FROM sigma_performance_logs
GROUP BY Language, Team;


-- ==========================================================
-- SPRINT 2: IDENTIFYING THE BOTTLENECK (Q1 ANALYSIS)
-- Diagnostic to find why Hindi quality was failing contractual SLAs.
-- ==========================================================

SELECT 
    Error_Type,
    COUNT(*) AS Incident_Count,
    ROUND(AVG(Error_Pct), 2) AS Avg_Error_Rate
FROM sigma_performance_logs
WHERE Quarter = 'Q1' 
  AND Language = 'Hindi'
  AND Hierarchy = 'Critical'
GROUP BY Error_Type
ORDER BY Incident_Count DESC;


-- ==========================================================
-- SPRINT 3: CALCULATING NORMALIZED SLA ATTAINMENT
-- SQL logic to mirror the Excel "Calculated Field" for hover-over tooltips.
-- ==========================================================

SELECT 
    Quarter,
    Language,
    SUM(Actual_Output) AS Quarterly_Throughput,
    SUM(Target) AS Quarterly_Target,
    ROUND((SUM(Actual_Output) / SUM(Target)) * 100, 2) AS SLA_Attainment_Pct
FROM sigma_performance_logs
GROUP BY Quarter, Language
ORDER BY Quarter ASC;


-- ==========================================================
-- SPRINT 4: IMPACT VALIDATION (POST-PIVOT ANALYSIS)
-- Comparing Q1 (Crisis) vs Q4 (Stabilization) for Hindi Quality.
-- ==========================================================

SELECT 
    Language,
    Quarter,
    AVG(Error_Pct) AS Mean_Error_Rate,
    CASE 
        WHEN AVG(Error_Pct) < 5 THEN 'Exceeding'
        WHEN AVG(Error_Pct) BETWEEN 5 AND 8 THEN 'Stable'
        ELSE 'Critical'
    END AS Quality_Health_Status
FROM sigma_performance_logs
WHERE Language = 'Hindi'
GROUP BY Language, Quarter;