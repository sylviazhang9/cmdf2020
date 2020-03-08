import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class Api extends StatefulWidget {
  @override
  ApiState createState() => ApiState();
}

class ApiState extends State<Api> {
   final client = http.Client();
   String result;
  
  final String url = 'https://qna-workshop.azurewebsites.net/qnamaker/knowledgebases/bd41b64b-4cdb-4a92-978a-767b4ed1a20a/generateAnswer';

  @override
  void didChangeDependencies() {
    getAPI();
  }

  Future<void> getAPI() async {
    try {
      final response = await client.post(url,
        headers: {
          'Authorization': 'EndpointKey xx',
          'Content-Type': 'application/json',
        },
        body: jsonEncode({'question':'<Your question>'})
      );
      final parsedResponse = json.decode(response.body);
      result = parsedResponse.toString();
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Widget build(BuildContext context) {
    return Container(
      child: Text(result == null ? "" : result),
    );
  }
}