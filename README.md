# <div align="center"><p>Prak2_Probstat2023_C_5025211021</p></div>

## Identitas Diri

| Nama               | NRP        |
| ------------------ | ---------- |
| Daud Dhiya' Rozaan | 5025211021 |

## No 1

Seorang peneliti melakukan penelitian mengenai pengaruh aktivitas 𝐴 terhadap kadar saturasi oksigen pada manusia. Peneliti tersebut mengambil sampel sebanyak 9 responden. Pertama, sebelum melakukan aktivitas 𝐴, peneliti mencatat kadar saturasi oksigen dari 9 responden tersebut. Kemudian, 9 responden tersebut diminta melakukan aktivitas 𝐴. Setelah 15 menit, peneliti tersebut mencatat kembali kadar saturasi oksigen dari 9 responden tersebut. Berikut data dari 9 responden mengenai kadar saturasi oksigen sebelum dan sesudah melakukan aktivitas

| Responden | X   | Y   |
| --------- | --- | --- |
| 1         | 78  | 100 |
| 2         | 75  | 95  |
| 3         | 67  | 70  |
| 4         | 77  | 90  |
| 5         | 70  | 90  |
| 6         | 72  | 90  |
| 7         | 78  | 89  |
| 8         | 70  | 100 |
| 9         | 77  | 100 |

Berdasarkan data pada tabel diatas, diketahui kadar saturasi oksigen dari responden ke-3 ketika belum melakukan aktivitas 𝐴 sebanyak 67, dan setelah melakukan aktivitas 𝐴 sebanyak 70.

- ### Poin A

  Carilah Standar Deviasi dari data selisih pasangan pengamatan tabel diatas

  #### Solusi :

  Untuk mencari standar deviasi, kita bisa menggunakan fungsi `sd()` dengan parameter selisih antar setiap data

  ```r
  X <- c(78, 75, 67, 77, 70, 72, 78, 70, 77)
  Y <- c(100, 95, 70, 90, 90,   90, 89, 100, 100)
  difference <- Y - X
  sd(difference)
  ```

  #### Hasil :

  ![1A](https://github.com/daudhiyaa/Prak2_Probstat2023_C_5025211021/assets/90663569/ee5a97fc-f2e8-41af-981a-5818a96a1636)

- ### Poin B

  Carilah nilai t (p-value)!

  #### Solusi :

  Untuk mendapatkan p-value, dapat menggunakan fungsi `t.test()` dengan parameter yaitu X dan Y

  ```r
  t.test(Y, X, paired = TRUE)
  ```

  #### Hasil :

  ![1B](https://github.com/daudhiyaa/Prak2_Probstat2023_C_5025211021/assets/90663569/95b8fed6-e40c-4e20-be98-2a2033402608)

- ### Poin C

  Tentukanlah apakah terdapat pengaruh yang signifikan secara statistika dalam hal kadar saturasi oksigen , sebelum dan sesudah melakukan aktivitas 𝐴 jika diketahui tingkat signifikansi 𝛼 = 5% serta H0 : “tidak ada pengaruh yang signifikan secara statistika dalam hal kadar saturasi oksigen, sebelum dan sesudah melakukan aktivitas 𝐴”

  #### Jawaban :

  Diketahui `p-value` adalah 0.0001373. Karena nilai nya lebih kacil dari `𝛼 = 0.05`, maka H0 nya ditolak. Sehingga ada pengaruh secara statistika dalam kadar saturasi ooksigen sebelum dan sesudah melakukan aktivitas 𝐴.

## No 2

Diketahui bahwa mobil dikemudikan rata-rata lebih dari 25.000 kilometer per tahun. Untuk menguji klaim ini, 100 pemilik mobil yang dipilih secara acak diminta untuk mencatat jarak yang mereka tempuh. Jika sampel acak menunjukkan rata-rata 23.500 kilometer dan standar deviasi 3.000 kilometer

```r
library(BSDA)
mu <- 25000
n_x <- 100
mean_x <- 23500
sd <- 3000

zsum.test(mean.x = mean_x, sigma.x = sd, n.x = n_x, alternative = "greater", mu = mu, conf.level=0.95)
```

- ### Poin A

  Apakah Anda setuju dengan klaim tersebut? Jelaskan.

  #### Jawaban :

  Saya tidak setuju. Dengan rata-rata 23.500 km dari sampel acak dan `sd` 3.000 km maka lebih besar kemungkinan bahwa klaim tersebut tidak valid. Grafik persebaran data dari distribusi normal akan lebih pekat di daerah kurang dari 25.000 km dengan asumsi nilai tengah grafik adalah nilai rata-rata dari sampel acak yang didapat.

  <!-- 22904.73 - 24095.27 -->

- ### Poin C

  Buatlah kesimpulan berdasarkan p-value yang dihasilkan!

  #### Jawaban :

  Nilai $p\text{-value}$ yang dihasilkan lebih dari significance level $(1 > 0.05)$ maka $H_0$ nya diterima, sehingga didapat kesimpulan bahwa mobil dikemudikan rata-rata tidak lebih dari 25.000 km per tahun.

## No 3

Diketahui perusahaan memiliki seorang data analyst ingin memecahkan permasalahan pengambilan keputusan dalam perusahaan tersebut. Selanjutnya didapatkanlah data berikut dari perusahaan saham tersebut.

| Nama Kota/Atribut      | Bandung | Bali |
| ---------------------- | ------- | ---- |
| Jumlah Saham           | 19      | 27   |
| Sampel Mean            | 3.64    | 2.79 |
| Sampel Standar Deviasi | 1.67    | 1.5  |

- ### Poin A

  H0 dan H1

  #### Jawaban :

  ```
  H0 : μ1 = μ2
  H1 : μ1 ≠ μ2
  ```

- ### Poin B

  Hitung Sampel Statistik

  #### Solusi :

  Menggunakan fungsi `tsum.test()` dengan parameter mean, s, dan mean kedua data kota maka didapat nilai dari sample statistik nya.

  ```r
  library(BSDA)
  tsum.test(mean.x=3.64, s.x = 1.67, n.x = 20,
            mean.y =2.79 , s.y = 1.5, n.y = 27,
            alternative = "two.side", var.equal = TRUE)
  ```

  #### Hasil :

- ### Poin C

  Lakukan Uji Statistik (df =2)!

  #### Solusi :

  Kita menggunakan library `mosaic` dan fungsi `plotDist()` dengan parameter distribusi dan df.

  ```r
  library(mosaic)
  plotDist(dist = 't', df = 2, col = "red")
  ```

  #### Hasil :

  ![3C](https://github.com/daudhiyaa/Prak2_Probstat2023_C_5025211021/assets/90663569/54abd521-ba6c-4627-a95b-fbccf2bde3a1)

- ### Poin D

  Nilai kritikal!

  #### Solusi :

  Untuk mendapatkan nilai kritikal, kita bisa menggunakan fungsi `qt()` dengan parameter p dan df

  ```r
  kritikal_kiri <- qt(p = 0.025, df = 2, lower.tail = TRUE)
  kritikal_kanan <- qt(p = 0.025, df = 2, lower.tail = FALSE)
  ```

  #### Hasil :

- ### Poin E

  Keputusan!

  #### Jawaban :

  Nilai $t$ berada pada rentang nilai kritikal dan $p\text{-value}$ lebih dari significance level $(p\text{-value} > \alpha)$, maka gagal menolak $H_0$

- ### Poin F

  Kesimpulan!

  #### Jawaban :

  Kesimpulan yang didapat yaitu ketika dilihat dari uji statistik bawah tidak ditemukan perbedaan rata-rata, bahwa berdasarkan data yang tersedia dan dengan tingkat signifikansi ($\alpha = 0.05$), tidak terdapat cukup bukti statistik untuk mendukung adanya perbedaan yang signifikan antara rata-rata jumlah saham di Bandung dan Bali.

## No 4

Data yang digunakan merupakan hasil eksperimen yang dilakukan untuk mengetahui pengaruh suhu operasi (100˚C, 125˚C dan 150˚C) dan tiga jenis kaca pelat muka (A, B dan C) pada keluaran cahaya tabung osiloskop.

Percobaan dilakukan sebanyak 27 kali dan didapat data sebagai berikut: [Link Data](https://drive.google.com/file/d/1pICtCrf61DRU86LDPQDJmcKiUMVt9ht4/view)

- ### Poin A

  Buatlah plot sederhana untuk visualisasi data

  #### Solusi :

  1. Install library `readr`, `ggplot2`, `multcomView`, dan `dplyr`.
  2. Masukkan data pada dataset kedalam variabel.
  3. Lakukan observasi pada data dan visualisasikan menggunakan fungsi `qplot()`.

  <br />

  ```r
  library(readr)
  library(ggplot2)
  library(multcompView)
  library(dplyr)

  nama_file <- "GTL.csv"
  GTL <- read_csv(nama_file)
  head(GTL)
  str(GTL)
  qplot(x = Temp, y = Light, geom = "point", data = GTL) + facet_grid(.~Glass, labeller = label_both)
  ```

  #### Hasil :

  ![4A](https://github.com/daudhiyaa/Prak2_Probstat2023_C_5025211021/assets/90663569/c49139f4-eb28-4565-8111-43e939c752ee)

- ### Poin B

  Lakukan uji ANOVA dua arah

  #### Solusi :

  Menggunakan fungsi `aov()` dengan parameter variabel factor dan `anova()` dengan parameter fungsi `model` bisa dilakukan uji ANOVA.

  ```r
  model <- aov(Light ~ Glass*Temp, data = GTL)
  anova(model)
  ```

  #### Hasil :

- ### Poin C

  Tampilkan tabel dengan mean dan standar deviasi keluaran cahaya untuk setiap perlakuan (kombinasi kaca pelat muka dan suhu operasi)!

  #### Solusi :

  Menggunakan fungsi `group_by()` dilanjut fungsi `summarise()` sesuai dengan mean dan standar deviasi.

  ```r
  data_summary <- group_by(GTL, Glass, Temp) %>%
    summarise(mean = mean(Light), sd = sd(Light)) %>%
    arrange(desc(mean))
  print(data_summary)
  ```

  #### Hasil :

  ![4C](https://github.com/daudhiyaa/Prak2_Probstat2023_C_5025211021/assets/90663569/35984b81-e0bc-4b44-900c-077a355575b2)

# <div align="center"><p> Sekian dan Terima Kasih</p></div>
