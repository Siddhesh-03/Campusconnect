import 'package:flutter/material.dart';
import 'SearchScreen/searchscreen.dart';
import 'eventscreen.dart';
import 'notificationscreen.dart';
import 'profilescreen.dart';
import 'chatscreen.dart'; // ✅ Import Chat Screen

class HomeFeedScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildHeader(context),
        SizedBox(height: 10),
        _buildStorySection(context), // Story Section
        _shadedDivider(), // 🔹 Shaded Divider
        _buildPostSection(context), // Post Section
      ],
    );
  }

  // 🔹 Header (App Title + Chat Icon)
  Widget _buildHeader(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Home',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          IconButton(
            icon: Icon(Icons.chat, color: Colors.white),
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => ChatScreen()),
            ),
          ),
        ],
      ),
    );
  }

  // 🔹 Story Section
  Widget _buildStorySection(BuildContext context) {
    return Container(
      color: Colors.deepPurple.shade100.withOpacity(0.2), // Background
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              'Trending Stories',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: Colors.white),
            ),
          ),
          SizedBox(height: 8),
          SizedBox(
            height: 190,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                _buildStoryItem(context, 'News', 'assets/images/news.png'),
                _buildStoryItem(context, 'Event at MiT', 'assets/images/event_mit.png'),
                _buildStoryItem(context, 'Event', 'assets/images/event.png'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // 🔹 Story Item Widget
  Widget _buildStoryItem(BuildContext context, String title, String imagePath) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        children: [
          Card(
            elevation: 3,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: SizedBox(
              width: 120,
              height: 160,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(
                  imagePath,
                  fit: BoxFit.cover,
                  errorBuilder: (ctx, error, stacktrace) {
                    debugPrint('Error loading image: $error');
                    return _errorImagePlaceholder(context);
                  },
                ),
              ),
            ),
          ),
          SizedBox(height: 5),
          Text(title, style: TextStyle(color: Colors.white)),
        ],
      ),
    );
  }

  // 🔹 Shaded Divider (Gradient Effect)
  Widget _shadedDivider() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8),
      height: 4,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.transparent, Colors.white38, Colors.transparent],
        ),
      ),
    );
  }

  // 🔹 Post Section
  Widget _buildPostSection(BuildContext context) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.only(top: 10),
        color: Colors.black.withOpacity(0.05),
        child: ListView.builder(
          itemCount: 3, // Simulating multiple posts
          itemBuilder: (context, index) => _buildPost(context, index),
        ),
      ),
    );
  }

  // 🔹 Post Widget
  Widget _buildPost(BuildContext context, int index) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(radius: 20, backgroundColor: Colors.purple),
                SizedBox(width: 10),
                Text('User_$index', style: TextStyle(fontWeight: FontWeight.bold)),
              ],
            ),
            SizedBox(height: 10),
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                'assets/images/home.png',
                width: double.infinity,
                height: 200,
                fit: BoxFit.cover,
                errorBuilder: (ctx, error, stacktrace) => _errorImagePlaceholder(context),
              ),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(icon: Icon(Icons.thumb_up, color: Colors.grey), onPressed: () {}),
                IconButton(icon: Icon(Icons.comment, color: Colors.grey), onPressed: () {}),
                IconButton(icon: Icon(Icons.share, color: Colors.grey), onPressed: () {}),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // 🔹 Error Placeholder for Images
  Widget _errorImagePlaceholder(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 160,
      color: Colors.grey[300],
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.error, color: Colors.red),
          SizedBox(height: 8),
          Text('Image not found', style: TextStyle(fontSize: 12)),
        ],
      ),
    );
  }
}
