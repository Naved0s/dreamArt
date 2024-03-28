

import 'package:dio/dio.dart';

String apikey = 'lmwr_sk_nsQXzDCOM7_B9JBTibqWcEP6g9iq3Wpnzwq7M23oi1MEXbTg';
final dio = Dio();
String? urlnew ;
double remaingcredits = 0;

Future<String> request(String prompt)async{
  Response response;
  response = await dio.post('https://api.limewire.com/api/image/generation',data: {
  "prompt": "$prompt",
  "aspect_ratio": "1:1"
},
options: Options(
  headers: {
  "Content-Type": "application/json",
  "X-Api-Version": "v1",
  "Accept": "application/json",
  "Authorization": "Bearer $apikey"
}
));
print('this is the requested data'+response.data.toString());
 if (response.statusCode == 200) {
  remaingcredits = response.data['credits_remaining'];
  print('this much reamins$remaingcredits');
      return response.data['data'][0]['asset_url'];
      //print(urlnew);
    } else {
      // Handle non-200 status codes
      print('Error: HTTP ${response.statusCode}');
      return 'null';
    }
}
