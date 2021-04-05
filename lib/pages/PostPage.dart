import 'package:crypto_quebec/models/Post.dart';
import 'package:crypto_quebec/services/wp_api.dart';
import 'package:flutter/material.dart';
import 'package:html/parser.dart';
import 'package:flutter_html/flutter_html.dart';

class PostPage extends StatefulWidget {
  final int _id;

  PostPage(this._id);

  @override
  _PostPageState createState() => _PostPageState(_id);
}

class _PostPageState extends State<PostPage> {
  final int _id;
  Future<Post> _post;

  _PostPageState(this._id);

  @override
  void initState() {
    super.initState();
    _post = WP_API().getPost(_id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Crypto.québec'),
      ),
      body: Container(
        child: FutureBuilder<Post>(
          future: _post,
          builder: (context, snapshot) {
            if (snapshot.connectionState != ConnectionState.done) {
              return Center(child: CircularProgressIndicator());
            }

            if (!snapshot.hasData) {
              return Text(snapshot.toString());
            }

            Post post = snapshot.data;

            return new Center(
              child: SingleChildScrollView(
                child: Html(
                  data: post.content.rendered,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
