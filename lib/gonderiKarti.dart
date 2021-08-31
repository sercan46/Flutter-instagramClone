import 'package:flutter/material.dart';

class GonderiKarti extends StatelessWidget {
  final String profilResimLinki;
  final String adSoyad;
  final String gecenSure;
  final String gonderiResimLinki;
  final String aciklama;
  GonderiKarti({
    required this.profilResimLinki,
    required this.adSoyad,
    required this.aciklama,
    required this.gecenSure,
    required this.gonderiResimLinki,
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Material(
        elevation: 20,
        borderRadius: BorderRadius.circular(20),
        child: Container(
          width: double.infinity,
          height: 380,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(20)),
          padding: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(35),
                            image: DecorationImage(
                                image: NetworkImage(profilResimLinki),
                                fit: BoxFit.cover)),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              adSoyad,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                  fontSize: 15),
                            ),
                            Text(gecenSure)
                          ],
                        ),
                      ),
                    ],
                  ),
                  Icon(Icons.more_vert)
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Text(
                  aciklama,
                  style: TextStyle(color: Colors.grey[800], fontSize: 18),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Image.network(
                  gonderiResimLinki,
                  width: double.infinity,
                  height: 200,
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 12.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    // CustomIconButton(
                    //     iconData: Icons.favorite,
                    //     iconText: 'Beğen',
                    //     fonksiyonum: () {
                    //       print('Beğen');
                    //     }),
                    // CustomIconButton(
                    //     iconData: Icons.comment,
                    //     iconText: 'Yorum Yap',
                    //     fonksiyonum: () {
                    //       print('Yorum Yap');
                    //     }),
                    // CustomIconButton(
                    //     iconData: Icons.share,
                    //     iconText: 'Paylaş',
                    //     fonksiyonum: () {
                    //       print('Paylaş');
                    //     }),
                    TextButton.icon(
                        onPressed: () {
                          print('Beğen');
                        },
                        icon: Icon(Icons.favorite),
                        label: Text('Beğen')),
                    TextButton.icon(
                        onPressed: () {
                          print('Yorum Yap');
                        },
                        icon: Icon(Icons.comment),
                        label: Text('Yorum Yap')),
                    TextButton.icon(
                        onPressed: () {
                          print('Paylaş');
                        },
                        icon: Icon(Icons.share),
                        label: Text('Paylaş'))
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class CustomIconButton extends StatelessWidget {
  final IconData iconData;
  final String iconText;
  final fonksiyonum;
  CustomIconButton(
      {required this.iconData,
      required this.iconText,
      required this.fonksiyonum});
  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        onTap: fonksiyonum,
        child: Row(
          children: [
            Icon(
              iconData,
              color: Colors.grey,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Text(iconText,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.grey,
                  )),
            )
          ],
        ),
      ),
    );
  }
}
