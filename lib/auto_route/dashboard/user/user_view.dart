import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_next_level/auto_route/dashboard/user/model/user_model.dart';
import 'package:flutter_next_level/product/navigator/app_router.dart';
// ignore: camel_case_types

class UserView extends StatefulWidget {
  const UserView({Key? key}) : super(key: key);

  @override
  State<UserView> createState() => _UserViewState();
}

class _UserViewState extends State<UserView> {
  String avatarUrl='https://loremflickr.com/g/320/240/paris';
  String imageUrl='https://picsum.photos/200/300';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const CircleAvatar(backgroundImage:NetworkImage('https://loremflickr.com/g/320/240/paris') ),
      ),
      body: ListView.builder(
        itemCount: 100,
        itemBuilder: (BuildContext context, int index) {
          
          return TextButton(
            onPressed:()=>{context.router.navigate(UserDetailRoute(model: UserModel(avatarUrl,imageUrl )))}, 
            child: Card(
              child: Image.network(imageUrl),
            ),
          ) ;
        },
      ),
    );
  }
}