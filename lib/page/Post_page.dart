import 'package:busca_cep/models/Post_Model.dart';
import 'package:busca_cep/page/Commets_page.dart';
import 'package:busca_cep/repositories/posts_Repository.dart';
import 'package:flutter/material.dart';

import '../repositories/posts/impl/Post_Dio_Repository.dart';
import '../repositories/posts/impl/post_Http_Repository.dart';

class PostsPage extends StatefulWidget {
  const PostsPage({super.key});

  @override
  State<PostsPage> createState() => _PostsPageState();
}

class _PostsPageState extends State<PostsPage> {
  PostRepository postRepository = PostsDioRepository();
  var posts = <PostModel>[];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    carregarDados();
  }

  carregarDados() async {
    posts = await postRepository.getPosts();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            title: Text('Post'),
          ),
          body: posts.length == 0
              ? Center(child: CircularProgressIndicator())
              : ListView.builder(
                  itemCount: posts.length,
                  itemBuilder: (_, index) {
                    var postagem = posts[index];
                    return Container(
                      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      child: InkWell(
                        onTap: () {
                          print(postagem.id);
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) =>
                                      CommetsPage(PostId: postagem.id)));
                          setState(() {});
                        },
                        child: Card(
                            child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              postagem.title,
                              style: TextStyle(fontWeight: FontWeight.w700),
                            ),
                            Text(postagem.body),
                          ],
                        )),
                      ),
                    );
                  })),
    );
  }
}
