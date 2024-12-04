import 'package:http/http.dart';

abstract class IHttpClient {
  Future get({required String url});
 }

 class HttpClient implements IHttpClient {
 
 final client = Client();

  @override
  Future get({required String url}) async {
   return await client.get(Uri.parse(url));
  }

 }