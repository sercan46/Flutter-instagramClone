import 'package:flutter/material.dart';
import 'package:instagram_clone/gonderiKarti.dart';

class ProfilSayfasi extends StatelessWidget {
  final String isimSoyad;
  final String kullaniciAdi;
  final String kapakResimLinki;
  final String profilResimLinki;

  const ProfilSayfasi(
      {Key? key,
      required this.isimSoyad,
      required this.kullaniciAdi,
      required this.kapakResimLinki,
      required this.profilResimLinki})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        body: ListView(
          children: [
            Stack(
              children: [
                Container(
                  height: 230,
                ),
                Container(
                  height: 180,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(kapakResimLinki),
                          fit: BoxFit.cover)),
                ),
                Positioned(
                  bottom: 0,
                  left: 20,
                  child: Hero(
                    tag: kullaniciAdi,
                    child: Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: NetworkImage(profilResimLinki),
                              fit: BoxFit.cover),
                          borderRadius: BorderRadius.circular(60),
                          border: Border.all(width: 2, color: Colors.white)),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 10,
                  left: 145,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        kullaniciAdi,
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 15),
                      ),
                      Text(
                        isimSoyad,
                        style: TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.bold,
                            fontSize: 15),
                      )
                    ],
                  ),
                ),
                Positioned(
                  top: 120,
                  right: 15,
                  child: Container(
                    width: 100,
                    height: 40,
                    decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: Colors.white, width: 2)),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.add_circle),
                        Text(
                          'Takip Et',
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () {
                    Navigator.pop(context, 'basarili döndüm');
                  },
                  icon: Icon(Icons.arrow_back),
                  color: Colors.black,
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Container(
                height: 80,
                color: Colors.grey.withOpacity(0.5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    sayac('20K', 'Takipçi'),
                    sayac('500', 'Takip'),
                    sayac('75', 'Paylaşım'),
                  ],
                ),
              ),
            ),
            GonderiKarti(
              profilResimLinki:
                  'https://cdn.pixabay.com/photo/2016/11/22/21/42/woman-1850703_960_720.jpg',
              adSoyad: 'Noze Özbek',
              aciklama: 'Doğa Gezisi',
              gecenSure: '2 Saat Önce',
              gonderiResimLinki:
                  'https://cdn.pixabay.com/photo/2017/09/21/01/04/father-2770301_960_720.jpg',
            ),
          ],
        ));
  }

  Column sayac(String sayi, String baslik) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(sayi,
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 20)),
        Text(baslik,
            style: TextStyle(
                color: Colors.grey, fontWeight: FontWeight.bold, fontSize: 15))
      ],
    );
  }
}
