import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:riverpod2/model/user_model.dart';

class DetailsScreen extends StatelessWidget {
  final UserModel e;
  const DetailsScreen({Key? key,required this.e}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            children: [
              Center(
                child: CircleAvatar(
                  maxRadius: 60,
                  backgroundImage: NetworkImage(e.avatar),
                ),
              ),
              Text(
                e.firstname + " " + e.lastname
              ),
              Text(e.email),
            ],
          ),
        ),
      ),
    );
  }
}
