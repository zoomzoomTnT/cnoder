import "dart:core";
import "package:flutter/material.dart";
import "package:flutter_redux/flutter_redux.dart";
import "package:redux/redux.dart";
import "../store/model/root_state.dart";
import "../store/model/topic.dart";
import "../config/application.dart";

class TopicDetail extends StatelessWidget {
  @override
    Widget build(BuildContext context) {
      return new Scaffold(
        appBar: new AppBar(
          title: new Text("详情"),
          leading: new BackButton(),
        ),
        body: new StoreConnector<RootState, Topic>(
          converter: (Store<RootState> store)=> store.state.topic,
          builder: (BuildContext context, Topic topic) => _renderTopic(context, topic),
        ),
      );
    }

    Widget _renderTopic(BuildContext context, Topic topic) {
      ListTile title = new ListTile(
        leading: new Image.network(topic.authorAvatar.startsWith('//') ? 'http:${topic.authorAvatar}' : topic.authorAvatar),
        title: new Text(topic.authorName),
        subtitle: new Row(
          children: <Widget>[
            new Text(DateTime.parse(topic.lastReplyAt).toString().split('.')[0]),
            new Text('share')
          ],
        ),
        trailing: new Text('${topic.replyCount}/${topic.visitCount}'),
      );
      return new Column(
        children: <Widget>[
          title,
          new Container(
            padding: const EdgeInsets.all(10.0),
            alignment: Alignment.centerLeft,
            child: new Text(topic.title),
          ),
          // new Container(
          //   padding: const EdgeInsets.all(10.0),
          //   alignment: Alignment.centerLeft,
          //   child: new Text(topic.content),
          // )
        ],
      );
    }
}