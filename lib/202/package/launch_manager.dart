import 'package:url_launcher/url_launcher_string.dart';

mixin LunchMixin{//Bunu yanına ör: 'on StatlessWidget' yazınca sadece istediğimiz Widget vey sınıf türetebilir
//sadece bir amaca yönlik yapılan işlemler
//Constructor oluşturulamıyor
void launchUrl(String url) async {
  if (await canLaunchUrlString(url)) {
    await launchUrlString(url);
  }
}
}