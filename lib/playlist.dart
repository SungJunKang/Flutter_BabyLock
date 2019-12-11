import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class PlayList extends StatefulWidget {
  final String title;
  final String url;

  PlayList({this.title, this.url});

  @override
  _PlayListState createState() => _PlayListState();
}

class _PlayListState extends State<PlayList> {

  Future<List> getData() async {
    final respose = await http.get(widget.url);

    return json.decode(respose.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.bottomCenter,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/playlist/list_background.jpg'),
            fit: BoxFit.cover
          )
        ),
        child: Container(
          margin: const EdgeInsets.only(top: 150.0),
          child: FutureBuilder<List>(
          future: getData(),
          builder: (context, snapshot){
            if(snapshot.hasError) {
              print(snapshot.error);
            }

            return snapshot.hasData ? new ListVideo(list: snapshot.data) : Center(child: CircularProgressIndicator());
          },
        ),
        )
      ),
    );
  }
}

class ListVideo extends StatelessWidget {
  final List list;

  ListVideo({this.list});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: list == null ? 0 : list.length,
      itemBuilder: (context, i) {
        return Container(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: <Widget>[
              GestureDetector(
                onTap: () => Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => VideoPlay(url: "https://youtube.com/embed/${list[i]['contentDetails']['videoId']}")
                )),
                child: Container(
                height: 210.0,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(list[i]['snippet']['thumbnails']['high']['url']), 
                    fit: BoxFit.cover
                  )
                ),
              ),
            ),

              Padding(padding: const EdgeInsets.all(10.0)),

              Text(
                list[i]['snippet']['title'],
                style: TextStyle(fontSize: 18.0),
              ),

              Padding(padding: const EdgeInsets.all(10.0)),

              Divider()
            ],
          ),
        );
      },
    );
  }
}

class VideoPlay extends StatelessWidget {
  final String url;

  VideoPlay({this.url});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: WebviewScaffold(
        url: url,
      ),
    );
  }
}