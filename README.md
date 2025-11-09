# 🛍️ E-Commerce Sales Analysis using SQL

## 📌 Overview  
Proyek ini merupakan latihan saya dalam memperdalam kemampuan **SQL sebagai calon Data Analyst**.  
Dataset yang digunakan berasal dari **Kaggle – E-Commerce Data**, berisi lebih dari 500.000 transaksi penjualan online.  

Melalui proyek ini, saya belajar bagaimana menggunakan **SQL** untuk mengekstraksi, membersihkan, dan menganalisis data guna menemukan insight bisnis yang relevan.

---

## ⚙️ Tools & Technologies  
- **MySQL** → menjalankan query analisis  
- **Excel** → membuat visualisasi hasil query  
- **Kaggle Dataset:** [E-Commerce Data](https://www.kaggle.com/datasets/carrie1/ecommerce-data)

---

## 🧹 Data Preparation  
Langkah yang saya lakukan:
1. Membuat **database** dan **tabel** di MySQL  
2. Mengimpor data dari file `data.csv`  
3. Melakukan **data cleaning**:
   - Menghapus data kosong (`NULL`)
   - Menghapus transaksi retur (`Quantity <= 0`)
   - Mengonversi tanggal ke format `DATETIME`

---

## 🔍 SQL Analysis  

### 🗓️ 1. Total Pendapatan per Bulan
sql
SELECT 
    DATE_FORMAT(InvoiceDate, '%Y-%m') AS Bulan,
    ROUND(SUM(Quantity * UnitPrice), 2) AS TotalPendapatan
FROM ecommerce_sales
WHERE Quantity > 0
GROUP BY Bulan
ORDER BY Bulan;
Insight: Pendapatan meningkat signifikan menjelang akhir tahun, menunjukkan adanya pola musiman.

🏆 2. Produk Terlaris
SELECT Description, SUM(Quantity) AS TotalTerjual
FROM ecommerce_sales
WHERE Quantity > 0
GROUP BY Description
ORDER BY TotalTerjual DESC
LIMIT 10;
Insight: Produk dekorasi dan hadiah kecil menjadi kategori yang paling banyak dibeli oleh pelanggan.

🌍 3. Negara dengan Penjualan Terbanyak
SELECT Country, COUNT(DISTINCT CustomerID) AS TotalPelanggan
FROM ecommerce_sales
WHERE Quantity > 0
GROUP BY Country
ORDER BY TotalPelanggan DESC
LIMIT 10;
Insight: Inggris menjadi negara dengan pelanggan terbanyak serta volume transaksi tertinggi.

👥 4. Pelanggan dengan Pengeluaran Terbesar
SELECT CustomerID, ROUND(SUM(Quantity * UnitPrice), 2) AS TotalSpending
FROM ecommerce_sales
WHERE Quantity > 0
GROUP BY CustomerID
ORDER BY TotalSpending DESC
LIMIT 10;
Insight: Sekitar 10% pelanggan berkontribusi terhadap lebih dari 60% total pendapatan — menunjukkan adanya pelanggan VIP yang sangat berharga.

💡 Key Insights
📈 Pendapatan meningkat signifikan menjelang akhir tahun
🎁 Produk dekorasi dan hadiah menjadi kategori paling laris
🌍 Pelanggan terbanyak berasal dari Inggris
👥 Sebagian kecil pelanggan menghasilkan mayoritas pendapatan

📘 Portfolio PDF
Untuk melihat hasil visualisasi dan tampilan lengkap analisis, kamu bisa membuka file berikut 👇

👉 E-Commerce Sales Analysis using SQL.pdf

<embed src="E-Commerce Sales Analysis using SQL.pdf" width="100%" height="600px" type="application/pdf">
✨ Author
Rayhan Fadhilah
🎓 Sistem Informasi – Universitas Bina Sarana Informatika
📫 LinkedIn | Kaggle
