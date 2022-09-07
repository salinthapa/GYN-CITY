/*
* This class is used to call all the api from the backend 
* there is functions called postData which is used to post data to the backend which takes the url, the data with token as parameters
* there is functions called deleteData which is used to delete data from the backend which takes the url and token as parameters
* postDataWithoutToken- Add data from api without token
* editData - Edit data from api
* getData - Get data from api
* getDataWithoutToken - Get data from api without token
* getChatData - Get chat records from api
* _setHeaders- Set headers for the api
* _getToken - Get token from local storage
* _getUser - Get user from local storage
*/
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class CallApi {
 final initialURL = "http://127.0.0.1";
  String baseUrl = '';
  CallApi() {
    this.baseUrl = this.initialURL + ":8000/api/";
  }
  Future<http.Response> postData(data, apiUrl) async {
    var token = await _getToken();
    var fullUrl = baseUrl + apiUrl;
    return await http.post(fullUrl,
        body: jsonEncode(data), headers: _setHeaders(token));
  }

  Future<http.Response> deleteData(apiUrl, token) async {
    var fullUrl = baseUrl + apiUrl;
    return await http.delete(fullUrl, headers: _setHeaders(token));
  }

  Future<http.Response> postDataWithoutToken(data, apiUrl) async {
    var fullUrl = baseUrl + apiUrl;
    return await http.post(fullUrl, body: jsonEncode(data), headers: {
      'Content-type': 'application/json',
      'Accept': 'application/json',
    });
  }

  Future<http.Response> postDataWithToken(data, apiUrl, token) async {
    var fullUrl = baseUrl + apiUrl;
    return await http.post(fullUrl,
        body: jsonEncode(data), headers: _setHeaders(token));
  }

  Future<http.Response> editData(data, apiUrl, token) async {
    var fullUrl = baseUrl + apiUrl;
    return await http.put(fullUrl,
        body: jsonEncode(data), headers: _setHeaders(token));
  }

  Future<http.Response> getData(apiUrl) async {
    var token = await _getToken();

    var fullUrl = baseUrl + apiUrl;
    return await http.get(fullUrl, headers: _setHeaders(token));
  }

  Future<http.Response> getChatData() async {
    var fullUrl = this.initialURL + ":3000/chats";
    return await http.get(
      fullUrl,
      headers: {
        'Content-type': 'application/json',
        'Accept': 'application/json',
      },
    );
  }



  _setHeaders(token) => {
        'Content-type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer ' + token
      };

  _getToken() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    var token = localStorage.getString('token');
    return token;
  }

  _getUser() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    var user = localStorage.getString('user');
    return json.decode(user);
  }
}