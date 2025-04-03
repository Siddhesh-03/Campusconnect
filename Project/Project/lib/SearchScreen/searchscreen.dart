import 'package:flutter/material.dart';
import 'Profilescreenuser.dart'; // ✅ Import Profile Screen

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController _searchController = TextEditingController();
  List<String> allUsers = ['Vedant Chaudhari', 'Siddhesh Hule', 'John Doe', 'Jane Smith'];
  List<String> filteredUsers = [];

  @override
  void initState() {
    super.initState();
    filteredUsers = allUsers;
  }

  void _filterUsers(String query) {
    setState(() {
      filteredUsers = allUsers.where((user) => user.toLowerCase().contains(query.toLowerCase())).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search'),
        backgroundColor: Colors.deepPurple,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search),
                hintText: 'Search users...',
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(30), borderSide: BorderSide.none),
              ),
              onChanged: _filterUsers,
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filteredUsers.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Colors.purple,
                    child: Text(filteredUsers[index][0]), // First letter as avatar
                  ),
                  title: Text(filteredUsers[index]),
                  onTap: () {
                    // ✅ Navigate to Profile Screen with user name
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProfileScreenuser(userName: filteredUsers[index]),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
