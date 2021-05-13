import 'package:bilgi_testi/soru.dart';

class TestVeri {
  int _soruIndex = 0;

  // TestVeri() {
  //   karistir(_soruBankasiTR);
  // }

  List<Soru> _soruBankasiTR = [
    Soru(
        soruMetni: "Titanic gelmiş geçmiş en büyük gemidir", soruYaniti: false),
    Soru(
        soruMetni: "Dünyadaki tavuk sayısı insan sayısından fazladır",
        soruYaniti: true),
    Soru(soruMetni: "Kelebeklerin ömrü bir gündür", soruYaniti: false),
    Soru(soruMetni: "Dünya düzdür", soruYaniti: false),
    Soru(
        soruMetni: "Kaju fıstığı aslında bir meyvenin sapıdır",
        soruYaniti: true),
    Soru(
        soruMetni: "Fatih Sultan Mehmet hiç patates yememiştir",
        soruYaniti: true),
    Soru(soruMetni: "Fransızlar 80 demek için, 4 - 20 der", soruYaniti: true),
    Soru(soruMetni: "Barcelona, İspanyanın başkentidir.", soruYaniti: false),
    Soru(soruMetni: "Alanya Antalya'nın bir ilçesidir.", soruYaniti: true),
    Soru(soruMetni: "Türkiye, Avrupa Birliği ülkesidirç", soruYaniti: false),
    Soru(soruMetni: "İstanbul 14. yüzyılda fethedilmiştir.", soruYaniti: false),
    Soru(soruMetni: "Her doğal sayı tam sayıdır.", soruYaniti: true),
    Soru(soruMetni: "Afrika bir ülke değildir.", soruYaniti: true),
    Soru(
        soruMetni: "Her yıl 12 Mayıs Anneler Günü olarak kutlanır.",
        soruYaniti: false),
    Soru(
        soruMetni:
            "Adnan Menderes bir uçak kazasından sağ olarak kurtulmuştur.",
        soruYaniti: true),
  ];

  String getSoruMetni() {
    return _soruBankasiTR[_soruIndex].soruMetni;
  }

  bool getSoruYaniti() => _soruBankasiTR[_soruIndex].soruYaniti;

  void sonrakiSoru() {
    if (_soruIndex < _soruBankasiTR.length - 1) {
      _soruIndex++;
    } else {
      _soruIndex = 0;
    }
  }

  bool soruSayisiniKontrolEt() {
    if (_soruIndex >= _soruBankasiTR.length - 1) {
      return true;
    } else {
      return false;
    }
  }

  void testiSifirla() => _soruIndex = 0;
  // void karistir(List<Soru> soruBankasi) {
  //   soruBankasi.shuffle();
  // }

  int getToplamSoru() => _soruBankasiTR.length;
}
