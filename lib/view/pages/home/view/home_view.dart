import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getxstarted/viewmodel/api_viewmodel.dart';

class HomeViewPage extends StatefulWidget {
  @override
  _HomeViewPageState createState() => _HomeViewPageState();
}

class _HomeViewPageState extends State<HomeViewPage> {
  final ApiViewModel apiViewModel = Get.find();
  @override
  void initState() {
    apiViewModel.getAllPosts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<ApiViewModel>(
        builder: (value) {
          return RefreshIndicator(
            onRefresh: () async {
              value.getAllPosts();
            },
            child: value.getPostEnum == GetPostEnum.Loading
                ? Center(
                    child: Text('Loading...'),
                  )
                : value.getPostEnum == GetPostEnum.Error
                    ? Center(
                        child: Text('Error...'),
                      )
                    : value.getPostEnum == GetPostEnum.Inital
                        ? Center(
                            child: Text('İnitiall..'),
                          )
                        : ListView.builder(
                            itemCount: value.myList.length,
                            itemBuilder: (context, index) {
                              return Card(
                                child: ListTile(
                                  leading: Icon(
                                    Icons.person,
                                  ),
                                  title: Text(
                                    value.myList[index].title,
                                  ),
                                  subtitle: Text(
                                    value.myList[index].userId.toString(),
                                  ),
                                ),
                              );
                            },
                          ),
          );
        },
      ),
    );
  }
}
