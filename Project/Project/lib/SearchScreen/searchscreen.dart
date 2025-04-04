import 'package:flutter/material.dart';
import 'Profilescreenuser.dart'; // ✅ Import Profile Screen

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController _searchController = TextEditingController();
  List<Map<String, String>> allUsers = [
    {
      'name': 'Vedant Chaudhari',
      'bio': 'Flutter Developer',
      'profileImage': 'assets/images/default_avatar.png',
      'resumeUrl': 'assets/resumes/vedant_resume.pdf'
    },
    {
      'name': 'Siddhesh Hule',
      'bio': 'Software Engineer',
      'profileImage': 'assets/images/default_avatar.png',
      'resumeUrl': 'assets/resumes/siddhesh_resume.pdf'
    },
    {
      'name': 'John Doe',
      'bio': 'Tech Enthusiast',
      'profileImage': 'assets/images/default_avatar.png',
      'resumeUrl': 'assets/resumes/john_resume.pdf'
    },
    {
      'name': 'Jane Smith',
      'bio': 'UI/UX Designer',
      'profileImage': 'assets/images/default_avatar.png',
      'resumeUrl': 'assets/resumes/jane_resume.pdf'
    },
  ];
  List<Map<String, String>> filteredUsers = [];

  @override
  void initState() {
    super.initState();
    filteredUsers = allUsers;
  }

  void _filterUsers(String query) {
    setState(() {
      filteredUsers = allUsers
          .where((user) => user['name']!.toLowerCase().contains(query.toLowerCase()))
          .toList();
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
                    backgroundImage: AssetImage(filteredUsers[index]['profileImage']!),
                  ),
                  title: Text(filteredUsers[index]['name']!),
                  onTap: () {
                    // ✅ Navigate to UserProfileScreen with user details
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => UserProfileScreen(
                          userName: filteredUsers[index]['name']!,
                          bio: filteredUsers[index]['bio']!,
                          profileImage: filteredUsers[index]['profileImage']!,
                          resumeUrl: filteredUsers[index]['resumeUrl']!, // ✅ Now passing resumeUrl
                        ),
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
