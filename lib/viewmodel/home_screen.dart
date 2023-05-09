import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zaigo_infotech_flutter_task/utils/custom_colors.dart';
import 'package:zaigo_infotech_flutter_task/res/provider/home_provider.dart';

import 'package:zaigo_infotech_flutter_task/viewmodel/adress_submission_screen.dart';
import 'package:zaigo_infotech_flutter_task/widgets/exit_dialoge_box.dart';

import '../utils/internet_connection_handler.dart';
import '../widgets/laawyers_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    Future.wait([connectionTask(context)]);
  }

  @override
  Widget build(BuildContext context) {
    final home = Provider.of<HomeProvider>(context);
    // A key to access the RefreshIndicatorState
    final GlobalKey<RefreshIndicatorState> _refreshKey =
        GlobalKey<RefreshIndicatorState>();

    return Scaffold(
      backgroundColor: kBlack,
      appBar: AppBar(
        backgroundColor: Colors.teal,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (_) => AdressSubMissionScreen(),
              ),
            );
          },
          icon: const Icon(Icons.location_on_outlined, color: kWhite),
        ),
        actions: [
          IconButton(
              onPressed: () {
                // Show the dialog when the button is pressed
                showDialog(
                  context: context,
                  builder: (context) {
                    return const ExitPopUpDialog();
                  },
                );
              },
              icon: const Icon(
                Icons.logout,
                color: kWhite,
              ))
        ],
        elevation: 0,
      ),
      body: home.loadingState || home.lawyers.isEmpty
          ? const Center(
              child: SizedBox(
                height: 15,
                width: 15,
                child: CircularProgressIndicator(color: kWhite),
              ),
            )
          : RefreshIndicator(
              key: _refreshKey, // assign the key
              onRefresh: () => connectionTask(context), // assign the callback
              color: Colors.blue, // change the color of the indicator
              displacement: 50.0, // change the displacement of the indicator
              child: ListView.separated(
                itemCount: 5,
                itemBuilder: (context, index) =>
                    LawyersCard(home: home, index: index),
                separatorBuilder: (context, index) =>
                    const Divider(color: kGrey),
              ),
            ),
    );
  }
}

// class RefreshDemo extends StatefulWidget {
//   @override
//   _RefreshDemoState createState() => _RefreshDemoState();
// }

// class _RefreshDemoState extends State<RefreshDemo> {
//   // A list of items to display
//   List<String> items = ['Item 1', 'Item 2', 'Item 3', 'Item 4'];

//   // A key to access the RefreshIndicatorState
//   final GlobalKey<RefreshIndicatorState> _refreshKey =
//       GlobalKey<RefreshIndicatorState>();

//   // A method that simulates fetching new data
//   Future<void> _fetchData() async {
//     await Future.delayed(Duration(seconds: 2)); // simulate network delay
//     setState(() {
//       // update the list with new items
//       items = ['Item A', 'Item B', 'Item C', 'Item D'];
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Refresh Demo'),
//       ),
//       body: RefreshIndicator(
//         key: _refreshKey, // assign the key
//         onRefresh: _fetchData, // assign the callback
//         color: Colors.blue, // change the color of the indicator
//         displacement: 50.0, // change the displacement of the indicator
//         child: ListView.builder(
//           itemCount: items.length,
//           itemBuilder: (context, index) {
//             return ListTile(
//               title: Text(items[index]),
//             );
//           },
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         child: Icon(Icons.refresh),
//         onPressed: () {
//           // show the refresh indicator programmatically
//           _refreshKey.currentState?.show();
//         },
//       ),
//     );
//   }
// }
