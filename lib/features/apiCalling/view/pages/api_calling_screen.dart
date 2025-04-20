import 'package:cartoontv/features/apiCalling/controller/api_calling_controller.dart';
import 'package:flutter/material.dart';

class ApiCallingScreen extends StatefulWidget {
  const ApiCallingScreen({super.key});

  @override
  State<ApiCallingScreen> createState() => _ApiCallingScreenState();
}

class _ApiCallingScreenState extends State<ApiCallingScreen> {
  late final ApiCallingController _controller;
  @override
  void initState() {
    _controller = ApiCallingController(context: context, reloadData: reloadData);
    super.initState();
    _controller.init();
  }
  void reloadData() {
    setState(() {});
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled){
          return <Widget>[
            SliverAppBar(
              backgroundColor: Colors.blue,
              iconTheme: const IconThemeData(color: Colors.white),
              expandedHeight: 250,
              floating: false,
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                centerTitle: true,
                title: const Text('Api Calling Screen',style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                background: Image.network(
                  'https://miro.medium.com/v2/resize:fit:1400/1*WnPHq_qQY7xISI9kDedikg.jpeg',
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ];
        },
        body: _controller.userList.isEmpty
            ? const Center(child: Text("Oops! No Data Found!"))
            : ListView.builder(
          itemCount: _controller.userList.length,
          padding: const EdgeInsets.all(12),
          itemBuilder: (context, index) {
            final user = _controller.userList[index];
            return Card(
              color: Colors.white,
              elevation: 3,
              margin: const EdgeInsets.symmetric(vertical: 8),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 28,
                      backgroundColor: Colors.blue.shade100,
                      child: Text(
                        user.name.substring(0, 1).toUpperCase(),
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue,
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            user.name,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            user.email,
                            style: const TextStyle(fontSize: 14, color: Colors.grey),
                          ),
                          const SizedBox(height: 8),
                          Row(
                            children: [
                              Chip(
                                label: Text(user.gender),
                                backgroundColor: Colors.blue.shade50,
                                labelStyle: const TextStyle(color: Colors.blue),
                              ),
                              const SizedBox(width: 8),
                              Chip(
                                label: Text(user.status),
                                backgroundColor: user.status == 'active' ? Colors.green.withOpacity(0.1) : Colors.red.withOpacity(0.1),
                                labelStyle: TextStyle(color: user.status == 'active' ? Colors.green : Colors.red),
                              ),
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            );
          },
        ),
      )
    );
  }
}
