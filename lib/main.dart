import 'package:bilgi_testi/testVeri.dart';

import 'package:flutter/material.dart';

import 'constants.dart';

void main() => runApp(BilgiTesti());

class BilgiTesti extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.indigo[700],
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: SoruSayfasi(),
          ),
        ),
      ),
    );
  }
}

class SoruSayfasi extends StatefulWidget {
  @override
  _SoruSayfasiState createState() => _SoruSayfasiState();
}

class _SoruSayfasiState extends State<SoruSayfasi> {
  List<Widget> secimler = [];
  int dogruSayisi = 0;
  int yanlisSayisi = 0;

  TestVeri test_1 = TestVeri();

  void butonFonksiyonu(bool buttontype) {
    if (test_1.soruSayisiniKontrolEt()) {
      addIcon(buttontype);
      _showAlert();
    } else {
      addIcon(buttontype);
      test_1.sonrakiSoru();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 4,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                test_1.getSoruMetni(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Wrap(
          alignment: WrapAlignment.center,
          runSpacing: 2,
          spacing: 2,
          children: secimler,
        ),
        Expanded(
          flex: 1,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 6.0),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 6),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.all(12),
                          onPrimary: Colors.white,
                          primary: Colors.green),
                      onPressed: () {
                        butonFonksiyonu(true);
                      },
                      child: Icon(Icons.thumb_up, size: 30.0),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 6),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.all(12), primary: Colors.red),
                      child: Icon(Icons.thumb_down, size: 30.0),
                      onPressed: () {
                        butonFonksiyonu(false);
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }

  void addIcon(bool buttontype) {
    if (!(test_1.getToplamSoru() == secimler.length)) {
      setState(() {
        if (test_1.getSoruYaniti() == buttontype) {
          dogruSayisi++;
          secimler.add(kDogruIcon);
        } else {
          yanlisSayisi++;
          secimler.add(kYanlisIcon);
        }
      });
    }
  }

  void _showAlert() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Tebrikler'),
          content: Text('Tüm soruları yanıtladın \n Skorun :  ' +
              dogruSayisi.toString() +
              '/' +
              (dogruSayisi + yanlisSayisi).toString()),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(2.0))),
          actions: [
            TextButton(
              onPressed: () {
                setState(() {
                  dogruSayisi = 0;
                  yanlisSayisi = 0;
                  test_1.testiSifirla();
                  secimler.clear();
                  Navigator.of(context).pop();
                });
              },
              child: Text('Yeniden oyna.'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Kapat'),
            )
          ],
        );
      },
    );
  }
}
