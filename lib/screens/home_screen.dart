import 'dart:async';
import 'package:dependency_injection/controller.dart';
import 'package:dependency_injection/locator.dart';
import 'package:dependency_injection/models/post_response_model.dart';
import 'package:dependency_injection/screens/individual_screen.dart';
import 'package:dependency_injection/services/api_service.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  //Step-5
  Future<List<PostResponseModel>> futureposts = PostController.fetchData();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffEFB495),
      appBar: AppBar(
        backgroundColor: const Color(0xffEFB495),
        title: const Text(
          "Posts",
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
      ),
      body: buildBody(),
    );
  }

  Widget buildBody() {
    return FutureBuilder<List<PostResponseModel>>(
      future: futureposts,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<PostResponseModel> posts = snapshot.data ?? [];
          return ListView.builder(
            itemCount: posts.length,
            itemBuilder: (context, index) {
              PostResponseModel post = posts[index];
              return InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              IndividualScreen(body: post.body ?? "")));
                },
                child: Container(
                  decoration: BoxDecoration(
                      color: Color(0xffEF9595),
                      borderRadius: BorderRadiusDirectional.circular(10)),
                  margin:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  child: ListTile(
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 20),
                    minLeadingWidth: 5,
                    title: Text(
                      "Title",
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                    subtitle: Text(
                      post.title ?? "",
                      style: TextStyle(color: Colors.black),
                    ),
                    leading: Text(
                      post.id.toString(),
                      style: TextStyle(fontSize: 20, color: Colors.black),
                    ),
                  ),
                ),
              );
            },
          );
        } else if (snapshot.hasError) {
          return Center(
            child: Text('Error: ${snapshot.error}'),
          );
        }
        return Center(child: CircularProgressIndicator());
      },
    );
  }
}
