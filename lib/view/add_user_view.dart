import 'package:date_time_flutter/di/di.dart';
import 'package:date_time_flutter/repository/user_repository.dart';
import 'package:flutter/material.dart';

import '../model/user.dart';

class AddUserView extends StatefulWidget {
  const AddUserView({super.key});

  @override
  State<AddUserView> createState() => _AddUserViewState();
}

class _AddUserViewState extends State<AddUserView> {
  final gap = const SizedBox(height: 15);
  var id = '';
  var name = '';

  TimeOfDay? time = TimeOfDay.now();
  DateTime? date = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Add Users'),
          elevation: 0,
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              TextFormField(
                onChanged: (text) {
                  id = text;
                },
                decoration: const InputDecoration(hintText: "User ID"),
              ),
              gap,
              TextFormField(
                onChanged: (text) {
                  name = text;
                },
                decoration: const InputDecoration(hintText: "Username"),
              ),
              gap,
              Row(
                children: [
                  Text(
                    'Select Date : ',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  // const Spacer(),
                  ElevatedButton(
                    onPressed: () async {
                      DateTime? newDate = await showDatePicker(
                        context: context,
                        initialDate: date!,
                        firstDate: DateTime(2000),
                        lastDate: DateTime(2025),
                      );
                      if (newDate != null) {
                        setState(() {
                          date = newDate;
                        });
                      }
                    },
                    child: Text('${date!.day}/${date!.month}/${date!.year}'),
                  ),
                ],
              ),
              gap,
              Row(
                children: [
                  Text(
                    'Select Time :  ',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  // const Spacer(),
                  ElevatedButton(
                    onPressed: () async {
                      TimeOfDay? newTime = await showTimePicker(
                        context: context,
                        initialTime: time!,
                      );
                      if (newTime != null) {
                        setState(() {
                          time = newTime;
                        });
                      }
                    },
                    child: Text('${time!.hour}:${time!.minute}'),
                  ),
                ],
              ),
              gap,
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: (){
                    User user = User(
                      id: id,
                      name: name, 
                      date: date,
                      time: time,
                    );
                    getIt<UserRepository>().addUser(user);

                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("User added successfully!"),
                        duration: Duration(seconds: 3),
                        behavior: SnackBarBehavior.floating,
                        backgroundColor: Colors.green,
                      )
                    );
                  }, 
                  child: const Text("Add User")
                ),
              ),
              gap,
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: (){
                    Navigator.pushNamed(context, '/displayUser');
                  }, 
                  child: const Text("Display Users")
                ),
              ),
            ],
          ),
        ));
  }
}
