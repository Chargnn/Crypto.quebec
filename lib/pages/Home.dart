import 'package:crypto_quebec/models/Post.dart';
import 'package:crypto_quebec/pages/PostPage.dart';
import 'package:crypto_quebec/services/wp_api.dart';
import 'package:flutter/material.dart';
import 'package:html/parser.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Future<List<Post>> _posts;

  @override
  void initState() {
    super.initState();
    _posts = WP_API().getPosts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Crypto.québec'),
      ),
      body: Container(
        child: FutureBuilder<List<Post>>(
          future: _posts,
          builder: (context, snapshot) {
            if (snapshot.connectionState != ConnectionState.done) {
              return Center(child: CircularProgressIndicator());
            }

            if (!snapshot.hasData) {
              return Text(snapshot.toString());
            }

            List<Post> posts = snapshot.data ?? [];

            return ListView.builder(
                itemCount: posts.length,
                itemBuilder: (context, index) {
                  Post post = posts[index];
                  return Container(
                    child: Row(
                      children: <Widget>[buildPostCard(post, context)],
                    ),
                  );
                });
          },
        ),
      ),
    );
  }
}

Widget buildPostCard(Post post, context) => Card(
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: () {
          Navigator.push(
              context,
              new MaterialPageRoute(
                builder: (context) => PostPage(post.id),
              ));
        },
        child: Container(
          width: MediaQuery.of(context).size.width - 10,
          padding: EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                parse(post.title.rendered).documentElement.text,
                maxLines: 2,
                style: TextStyle(fontSize: 24),
              ),
              Text(
                parse(post.excerpt.rendered).documentElement.text,
                maxLines: 4,
                overflow: TextOverflow.ellipsis,
              )
            ],
          ),
        ),
      ),
    );
