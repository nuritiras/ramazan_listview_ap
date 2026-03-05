
---

# 🌙 Ramazan İmsakiyesi 2026

Bu proje, Flutter kullanılarak geliştirilmiş, 2026 yılı Ramazan ayı için vakitleri listeleyen şık ve modern bir mobil uygulama arayüzüdür. Kullanıcı dostu bir tasarıma sahip olup, Material 3 standartlarına uygun olarak geliştirilmiştir.

## 🚀 Özellikler

* **Modern Arayüz:** `Material 3` tasarımı ve `deepPurple` renk paleti ile göz yormayan estetik görünüm.
* **Dinamik Liste:** `ListView.builder` kullanılarak optimize edilmiş performanslı liste yapısı.
* **Görsel Detaylar:** Gradyan arka plan (`LinearGradient`) ve her vakit için özel ikonlar.
* **Etkileşim:** Her vakit kartına tıklandığında geri bildirim veren `onTap` mekanizması.

## 🛠️ Kullanılan Teknolojiler

* **Framework:** [Flutter](https://flutter.dev)
* **Dil:** Dart
* **Widget Yapısı:** `StatelessWidget`

## 📸 Ekran Görüntüsü Yapısı

Uygulama aşağıdaki bileşenlerden oluşmaktadır:

| Bileşen | Açıklama |
| --- | --- |
| **AppBar** | Başlık ve kurumsal renk temasını içerir. |
| **ListView** | Vakitlerin (İmsak, İftar vb.) sıralandığı kaydırılabilir alan. |
| **Card** | Her namaz vaktini ayıran, gölgelendirilmiş şık kutucuklar. |

---

## 💻 Kurulum ve Çalıştırma

Projeyi yerel makinenizde çalıştırmak için şu adımları izleyin:

1. **Depoyu Klonlayın:**
```bash
git clone https://github.com/kullaniciadi/ramazan-imsakiyesi-2026.git

```


2. **Proje Dizinine Gidin:**
```bash
cd ramazan-imsakiyesi-2026

```


3. **Bağımlılıkları Yükleyin:**
```bash
flutter pub get

```


4. **Uygulamayı Çalıştırın:**
```bash
flutter run

```



---

## 📝 Gelecek Planları

* [ ] Gerçek bir API (Diyanet vb.) üzerinden canlı veri çekilmesi.
* [ ] Şehre göre vakit seçme özelliği.
* [ ] İftar ve Sahur vakitleri için geri sayım sayacı (Countdown Timer).
* [ ] Vakitlerde bildirim/hatırlatıcı özelliği.

---

**Katkıda Bulunma:** Eğer bu projeyi geliştirmek isterseniz, lütfen bir `Pull Request` gönderin veya karşılaştığınız sorunlar için `Issue` açın.

---