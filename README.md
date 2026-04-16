# 🌍 Geospatial Data Analysis using PostGIS & GDAL

## 📌 Overview
This project demonstrates a complete geospatial data pipeline built using PostgreSQL, PostGIS, and GDAL.  
It focuses on ingesting, storing, and analyzing location-based data to extract meaningful insights.

---

## 🚀 Tech Stack
- PostgreSQL
- PostGIS
- GDAL (ogr2ogr)
- SQL
- DBeaver

---

## 📂 Dataset
The project uses:
- GeoJSON file (NYC geographic boundaries)
- Station data (latitude, longitude)
- Trip data (start time, end time, station IDs)

---

## ⚙️ Workflow

```text
GeoJSON / CSV
      ↓
ogr2ogr (GDAL)
      ↓
PostgreSQL + PostGIS
      ↓
SQL Analysis (DBeaver)
```
---
## Key Analysis Performed
- 🚉 Station proximity analysis (buffer zones)
- 🔥 Demand hotspot detection (high trip regions)
- ⏰ Rush hour analysis (time-based patterns)
- 📍 Region-wise activity distribution
- 📌 Trip patterns based on location and time
---
<img width="1486" height="746" alt="Screenshot 2026-04-09 194021" src="https://github.com/user-attachments/assets/74772bac-3d48-405e-9553-3081804d66a7" />
<img width="1298" height="781" alt="Screenshot 2026-04-09 215515" src="https://github.com/user-attachments/assets/79f335a3-c487-4445-a069-3f30ac743c6b" />
<img width="1920" height="1080" alt="Screenshot (194)" src="https://github.com/user-attachments/assets/942db3c4-1b80-4bf2-bde3-1790ad0d4166" />
<img width="1483" height="979" alt="Bike_usage" src="https://github.com/user-attachments/assets/ebdca3dd-779f-4cf4-8058-aca0b5b18c76" />
<img width="1494" height="755" alt="Screenshot 2026-04-09 193926" src="https://github.com/user-attachments/assets/ed0704a4-4094-4036-b84d-50c2e28ac0eb" />



