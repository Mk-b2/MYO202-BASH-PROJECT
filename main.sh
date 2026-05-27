#!/bin/bash

# İsim SOYİSİM: Mehmet Kerem Bıyık
# Öğrenci Numarası: 2420191046

# Sertifika Bağlantıları:
# 1. Docker: https://www.btkakademi.gov.tr/portal/certificate/validate?certificateId=7rptP4BjGy

# 2. Siber Güvenlik: https://www.btkakademi.gov.tr/portal/certificate/validate?certificateId=XV1hWE0OGy

# 3. Linux Bash: https://credsverse.com/credentials/503f6e3f-63a6-4563-8b25-0fe5bb33f5b7

# 1. Günlük dosyasını (report.log) oluştur ve ISO biçiminde tarih yazdır
date -Iseconds > report.log

# 2. Donanım bilgilerini report.log dosyasına ekle
echo "--- Donanim Bilgileri ---" >> report.log
wmic.exe cpu get name >> report.log
wmic.exe memorychip get capacity >> report.log
wmic.exe baseboard get product >> report.log
wmic.exe csproduct get uuid >> report.log
wmic.exe diskdrive get model,size,SerialNumber >> report.log
getmac.exe >> report.log

# 3. Kullanıcıdan parola al
read -p "Lutfen parolanizi giriniz: " PAROLA

# 4. GPG ile AES256 simetrik şifreleme yap
gpg --batch --yes --passphrase "$PAROLA" --symmetric --cipher-algo AES256 -o report.log.gpg report.log

# 5. Sifresiz orijinal report.log dosyasini sil
rm report.log

echo "Islem basariyla tamamlandi! report.log.gpg dosyasi olusturuldu."