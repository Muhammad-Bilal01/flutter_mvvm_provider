import 'package:flutter/material.dart';
import 'package:flutter_mvvm_provider/constant/colors.dart';
import 'package:flutter_mvvm_provider/models/services/api_response.dart';
import 'package:flutter_mvvm_provider/view_model/user_list_provider.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  UserListProvider userListProvider = UserListProvider();

  @override
  void initState() {
    userListProvider.fetchUserList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Screen"),
        automaticallyImplyLeading: false,
      ),
      body: ChangeNotifierProvider<UserListProvider>(
        create: (context) => UserListProvider(),
        child: Consumer<UserListProvider>(
          builder: (context, value, child) {
            switch (value.userList.status) {
              case Status.loading:
                return Center(
                  child: CircularProgressIndicator(
                    color: primaryColor,
                  ),
                );
              case Status.error:
                return Center(
                  child: Text(value.userList.message.toString()),
                );

              case Status.complete:
                return ListView.builder(
                    itemCount: value.userList.data!.data!.length,
                    itemBuilder: (context, index) {
                      final data = value.userList.data!.data![index];
                      return Card(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 3),
                        child: ListTile(
                          leading: CircleAvatar(
                            backgroundImage:
                                NetworkImage(data.avatar.toString()),
                          ),
                          title: Text(data.firstName.toString()),
                          subtitle: Text(data.email.toString()),
                        ),
                      );
                    });

              default:
            }
            return const SizedBox();
          },
        ),
      ),
    );
  }
}
