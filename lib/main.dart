import 'package:flutter/material.dart';
import 'package:instagram_clone/profilSayfasi.dart';
import 'gonderiKarti.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Instagram Clone',
      theme: ThemeData(primaryColor: Colors.grey[100], cardColor: Colors.red),
      home: Scaffold(body: Anasayfa()),
    );
  }
}

class Anasayfa extends StatelessWidget {
  const Anasayfa({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.menu),
          color: Colors.grey,
          iconSize: 35,
          onPressed: () {},
        ),
        title: Text(
          'Instagram',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              showModalBottomSheet(
                  context: context,
                  builder: (BuildContext context) {
                    return Column(
                      children: [
                        bildirimGoster('Ahmet seni takip etti', '2 saat önce'),
                        bildirimGoster('Ayşe sana mesaj attı', '3 saat önce'),
                        bildirimGoster('Ali seni sildi', '5 saat önce'),
                      ],
                    );
                  });
            },
            icon: Icon(Icons.notifications),
            color: Colors.purple,
            iconSize: 30,
          )
        ],
      ),
      body: ListView(
        children: [
          Container(
            height: 100,
            decoration: BoxDecoration(color: Colors.grey[100], boxShadow: [
              BoxShadow(color: Colors.grey, offset: Offset(0, 7), blurRadius: 5)
            ]),
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                profilKartiOlustur(
                    context,
                    'Sercan',
                    'https://cdn.pixabay.com/photo/2021/06/15/16/11/man-6339003_960_720.jpg',
                    'Sercan Ozbek',
                    'https://cdn.pixabay.com/photo/2015/06/19/21/24/avenue-815297_960_720.jpg'),
                profilKartiOlustur(
                    context,
                    'Melike',
                    'https://cdn.pixabay.com/photo/2016/11/22/21/42/woman-1850703_960_720.jpg',
                    'Melike ER',
                    'https://cdn.pixabay.com/photo/2013/07/25/01/31/forest-166733_960_720.jpg'),
                profilKartiOlustur(
                    context,
                    'Enver',
                    'https://cdn.pixabay.com/photo/2016/03/26/22/13/man-1281562_960_720.jpg',
                    'Enver Cek',
                    'https://cdn.pixabay.com/photo/2018/01/30/22/50/forest-3119826_960_720.jpg'),
                profilKartiOlustur(
                    context,
                    'Noze',
                    'https://cdn.pixabay.com/photo/2017/04/06/19/34/girl-2209147_960_720.jpg',
                    'Noze Ozbek',
                    'https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885_960_720.jpg'),
                profilKartiOlustur(
                    context,
                    'Aysel',
                    'https://cdn.pixabay.com/photo/2017/09/21/07/47/girl-2771001_960_720.jpg',
                    'Aysel Elma',
                    'https://cdn.pixabay.com/photo/2018/01/30/22/50/forest-3119826_960_720.jpg')
              ],
            ),
          ),
          GonderiKarti(
            profilResimLinki:
                'https://cdn.pixabay.com/photo/2021/06/15/16/11/man-6339003_960_720.jpg',
            adSoyad: 'Sercan Özbek',
            aciklama: 'Geçen Sene Tatilden Kalma',
            gecenSure: '1 Sene Önce',
            gonderiResimLinki:
                'https://cdn.pixabay.com/photo/2015/09/09/16/05/forest-931706_960_720.jpg',
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
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.purple,
        onPressed: () {},
        child: Icon(
          Icons.camera_alt_sharp,
          color: Colors.white,
        ),
      ),
    );
  }

  Padding bildirimGoster(String isim, String zaman) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(isim,
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 18)),
          Text(zaman,
              style: TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                  fontSize: 15))
        ],
      ),
    );
  }
}

Widget profilKartiOlustur(BuildContext context, String userName,
    String imageUrl, String nickName, String backgroundImage) {
  return Material(
    child: InkWell(
      onTap: () async {
        var donenVeri = Navigator.push(
            context,
            MaterialPageRoute(
                builder: (BuildContext context) => ProfilSayfasi(
                      isimSoyad: userName,
                      profilResimLinki: imageUrl,
                      kullaniciAdi: nickName,
                      kapakResimLinki: backgroundImage,
                    )));
        print(await donenVeri);
      },
      child: Padding(
        padding: const EdgeInsets.only(left: 8.0, right: 8.0),
        child: Column(
          children: [
            Stack(
              alignment: Alignment.topRight,
              children: [
                Hero(
                  tag: userName,
                  child: Container(
                    width: 70,
                    height: 70,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.grey, width: 2.0),
                      borderRadius: BorderRadius.circular(35),
                      image: DecorationImage(
                          image: NetworkImage(imageUrl), fit: BoxFit.cover),
                    ),
                  ),
                ),
                Container(
                  width: 20,
                  height: 20,
                  decoration: BoxDecoration(
                      color: Colors.green,
                      border: Border.all(width: 2, color: Colors.white),
                      borderRadius: BorderRadius.circular(35)),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Text(
                userName,
                style: TextStyle(fontSize: 15, color: Colors.black),
              ),
            )
          ],
        ),
      ),
    ),
  );
}
