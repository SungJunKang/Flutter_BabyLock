import 'package:flutter/material.dart';
import 'package:youtube_api/youtube_api.dart';

class PlayList extends StatefulWidget {
  @override
  _PlayListState createState() => _PlayListState();
}

class _PlayListState extends State<PlayList> {
  static String key = "AIzaSyAUXXfz2UgY_C1-mC0DSFdp_tA7RvbKrLA";

  YoutubeAPI youtubeAPI = new YoutubeAPI(key);
  List<YT_API> youtubeResult = [];

  callAPI() async {
    print('UI Called');
    String query = "FLUTTER";
    youtubeResult = await youtubeAPI.search(query);
    setState(() {
      print('UI Updated');
    });
  }

  @override
  void initState() {
    super.initState();
    callAPI();
    print('hello');
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
        child: ListView.builder(
          itemCount: youtubeResult.length,
          itemBuilder: (_, int index) => listItem(index)
        ),
      ),
    );
  }

  Widget listItem(index){
    return new Card(
      child: new Container(
        margin: EdgeInsets.symmetric(vertical: 7.0),
        padding: EdgeInsets.all(12.0),
        child:new Row(
          children: <Widget>[
            new Image.network(youtubeResult[index].thumbnail['default']['url'],),
            new Padding(padding: EdgeInsets.only(right: 20.0)),
            new Expanded(child: new Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                new Text(
                  youtubeResult[index].title,
                  softWrap: true,
                  style: TextStyle(fontSize:18.0),
                ),
                new Padding(padding: EdgeInsets.only(bottom: 1.5)),
                new Text(
                  youtubeResult[index].channelTitle,
                  softWrap: true,
                ),
                new Padding(padding: EdgeInsets.only(bottom: 3.0)),
                new Text(
                  youtubeResult[index].url,
                  softWrap: true,
                ),
              ]
            ))
          ],
        ),
      ),
    );
  }
  
}