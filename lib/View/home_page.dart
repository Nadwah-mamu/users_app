import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:users_app/Controller/Api.dart';

import '../Controller/provider_class.dart';


class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 2,
        title: Text(
          "Conversations",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 26),
        ),
        actions: [
          Container(
            height: 40,
            width: MediaQuery.sizeOf(context).width * .3,
            margin: EdgeInsets.only(right: 20),
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Icon(
                    Icons.add,
                    color: Colors.red.shade500,
                  ),
                  Text(
                    "Add New",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                  ),
                ],
              ),
            ),
            decoration: BoxDecoration(
                color: Colors.pink.shade100,
                borderRadius: BorderRadius.circular(24)),
          )
        ],
      ),
      body: Column(
        children: [
          TextField(
            showCursor: false,
            controller: searchController,
            decoration: InputDecoration(
                border: OutlineInputBorder(borderSide: BorderSide.none),
                hintText: "Search..",
                hintStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.black38),
                prefixIcon: Icon(Icons.search),
                contentPadding: EdgeInsets.all(10)),
          ),
          FutureBuilder(
              future: fetchData(),
              builder: (context, AsyncSnapshot snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Text("Loading...");
                }
                if (snapshot.hasData) {
                  return Expanded(
                    child: ListView.builder(
                        itemCount: usersList.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            trailing:
                                Text(usersList[index]["address"]["street"],style: TextStyle(fontSize: 14),),
                            leading: CircleAvatar(
                              radius: 30,
                              backgroundImage: NetworkImage(
                                  "https://st2.depositphotos.com/1809585/7376/i/450/depositphotos_73762843-stock-photo-girl-smiling-with-perfect-smile.jpg"),
                            ),
                            subtitle: Text(usersList[index]["username"]),
                            title: Text(usersList[index]["name"],style: TextStyle(fontWeight: FontWeight.bold,fontSize: 19),),
                          );
                        }),
                  );
                } else {
                  return Text("No data to display");
                }
              })
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.red.shade500,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.chat_sharp), label: "Chats"),
          BottomNavigationBarItem(
              icon: Icon(Icons.wifi_channel), label: "Channels"),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_box), label: "Profile")
        ],
        onTap: (v){
          Provider.of<ProviderClass>(context,listen: false).indexChange(v);
        },
        currentIndex: Provider.of<ProviderClass>(context).selectedIndex,

      ),
    );
  }
}
