import 'package:http/http.dart' as http;
import 'dart:convert';
import "package:flutter/material.dart";

class TransactionDetails {
  String? avatar;
  String? name;
  String? date;
  String? amount;

  TransactionDetails({
    this.avatar,
    this.name,
    this.date,
    this.amount,
  });

  TransactionDetails.fromJson(Map<String, dynamic> json) {
    avatar = json['image'];
    name = json['title'];
    date = json['category'];
    amount = '200';
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['avatar'] = avatar;
    data['name'] = name;
    data['date'] = date;
    data['amount'] = amount;
    return data;
  }
}

class HomePage extends StatelessWidget {
  var title_name = "Catelog App";
  var body_data = 'My Catelog App';

  Future<List<TransactionDetails>> fetchAlbum() async {
    final response = await http
        .get(Uri.parse('https://realvedic-api.andaal.com/search_bar'));

    if (response.statusCode == 200) {
      final List result = json.decode(response.body);
      return result.map((e) => TransactionDetails.fromJson(e)).toList();
    } else {
      throw Exception('Failed to load data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title_name),
      ),
      body: FutureBuilder<List<TransactionDetails>>(
        future: fetchAlbum(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return SingleChildScrollView(
              child: ListView.builder(
                shrinkWrap: true,
                physics: ClampingScrollPhysics(),
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: CircleAvatar(
                      child: Image.network(
                          "https://realvedic-api.andaal.com/${snapshot.data![index].avatar}"),
                    ),
                    title: Text(snapshot.data![index].name.toString()),
                    trailing: Text(snapshot.data![index].amount.toString()),
                    subtitle: Text(snapshot.data![index].date.toString()),
                  );
                },
              ),
            );
          }
          return const CircularProgressIndicator();
        },
      ),
      // body: Center(
      //   child: Container(
      //     child: Text(body_data),
      //   ),
      // ),
      drawer: Drawer(),
    );
  }
}
