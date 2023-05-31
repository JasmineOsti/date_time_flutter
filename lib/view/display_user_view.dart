import 'package:date_time_flutter/di/di.dart';
import 'package:date_time_flutter/repository/user_repository.dart';
import 'package:flutter/material.dart';

import '../model/user.dart';

class DisplayUserView extends StatefulWidget {
  const DisplayUserView({super.key});

  @override
  State<DisplayUserView> createState() => _DisplayUserViewState();
}

class _DisplayUserViewState extends State<DisplayUserView> {
  final List<User> lstUser = getIt<UserRepository>().getUsers();

    @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Display Users'),
        elevation: 0,
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: lstUser.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            child: Container(
              color: Colors.blue, 
              height: 150,
              width: double.infinity,
              margin: const EdgeInsets.all(8),
              child: Container(
                color: Colors.yellow, 
                padding: const EdgeInsets.all(16),
                child: Center(
                  child: Text(
                    " Id: ${lstUser[index].id} \n Name: ${lstUser[index].name} \n DOB: ${lstUser[index].date!.year}/${lstUser[index].date!.month}/${lstUser[index].date!.day} \n Time of birth: ${lstUser[index].time!.hour}:${lstUser[index].time!.minute}",
                    style: const TextStyle(
                      color: Colors.black, 
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}