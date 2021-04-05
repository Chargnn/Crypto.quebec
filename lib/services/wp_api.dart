import 'dart:convert';
import 'package:crypto_quebec/models/Image.dart';
import 'package:crypto_quebec/models/Post.dart';
import 'package:http/http.dart' as http;

class WP_API {
  static String _authority = 'crypto.quebec';

  Future<List<Post>> getPosts() async {
    List<Post> posts = [];
    var client = http.Client();
    final _path = "/wp-json/wp/v2/posts";
    var response = await client.get(Uri.https(_authority, _path, {}));

    if (response.statusCode == 200) {
      var jsonString = response.body;
      var jsonMap = json.decode(jsonString);

      for (int i = 0; i < jsonMap.length; i++) {
        posts.add(Post.fromJson(jsonMap[i]));
      }
    }

    return posts;
  }

  Future<Post> getPost(int id) async {
    Post post;
    var client = http.Client();
    final _path = "/wp-json/wp/v2/posts/" + id.toString();
    var response = await client.get(Uri.https(_authority, _path, {}));

    if (response.statusCode == 200) {
      var jsonString = response.body;
      var jsonMap = json.decode(jsonString);

      post = Post.fromJson(jsonMap);
    }

    return post;
  }

  Future<String> getImage(int imageId) async {
    Image path;
    var client = http.Client();
    final _path = "/wp-json/wp/v2/media/" + imageId.toString();
    var response = await client.get(Uri.https(_authority, _path, {}));

    if (response.statusCode == 200) {
      var jsonString = response.body;
      var jsonMap = json.decode(jsonString);

      path = Image.fromJson(jsonMap);
    }

    return path.guid.rendered;
  }
}
