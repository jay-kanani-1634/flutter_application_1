import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ProfilePage(),
    );
  }
}

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String _imagePath = "https://via.placeholder.com/150";
  String _userName = "Kanani Jay6145";
  String _email = "@KananiJay6145";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('Profile', style: TextStyle(color: Colors.white)),
        actions: [
          IconButton(
            icon: Icon(Icons.menu),
            onPressed: () {
              _showMenu(context);
            },
          ),
        ],
      ),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 250,
            floating: false,
            pinned: true,
            backgroundColor: Colors.black,
            flexibleSpace: FlexibleSpaceBar(
              background: Stack(
                children: [
                  Positioned(
                    top: 40,
                    left: MediaQuery.of(context).size.width / 2 - 50,
                    child: GestureDetector(
                      onTap: () {
                        // Implement profile image change functionality here
                        _pickImage();
                      },
                      child: CircleAvatar(
                        radius: 50,
                        backgroundColor: Colors.purple,
                        backgroundImage: NetworkImage(_imagePath),
                        child: _imagePath.isEmpty
                            ? Icon(Icons.camera_alt,
                                size: 40, color: Colors.white)
                            : null,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 20,
                    left: MediaQuery.of(context).size.width /
                        4, // Centered alignment
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          _userName,
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                        Text(
                          _email,
                          style: TextStyle(color: Colors.grey, fontSize: 14),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        Text(
                          'Wallpapers(9)',
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                        Container(
                          height: 2,
                          width: 60,
                          color: Colors.pink,
                        )
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 15),
                // Wallpaper Grid
                GridView.builder(
                  padding: EdgeInsets.all(10),
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    childAspectRatio: 0.6, // Vertical rectangle
                  ),
                  itemCount: 9,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        // Open wallpaper in a new page
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => WallpaperPage(index: index),
                          ),
                        );
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image:
                                AssetImage('assets/wallpaper${index + 1}.jpg'),
                            fit: BoxFit.cover,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    );
                  },
                ),
                SizedBox(height: 20),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _pickImage() {
    setState(() {
      _imagePath =
          "https://via.placeholder.com/150/0000FF/808080?Text=New+Image";
    });
  }

  void _showMenu(BuildContext context) {
    showMenu(
      context: context,
      position: RelativeRect.fromLTRB(100.0, 100.0, 0.0, 0.0),
      items: [
        PopupMenuItem(
          child: Text('Edit Profile'),
          value: 'edit_profile',
        ),
        PopupMenuItem(
          child: Text('Settings'),
          value: 'settings',
        ),
        PopupMenuItem(
          child: Text('Logout'),
          value: 'logout',
        ),
      ],
    ).then((value) {
      if (value == 'edit_profile') {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => EditProfilePage(imagePath: _imagePath),
          ),
        );
      } else if (value == 'logout') {
        // Implement logout functionality
      }
    });
  }
}

class WallpaperPage extends StatelessWidget {
  final int index;

  WallpaperPage({required this.index});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('Wallpaper ${index + 1}',
            style: TextStyle(color: Colors.white)),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        elevation: 0,
      ),
      body: Center(
        child: Image.asset(
          'assets/wallpaper${index + 1}.jpg', // Open the wallpaper based on index
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class EditProfilePage extends StatefulWidget {
  final String imagePath;

  EditProfilePage({required this.imagePath});

  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  String _userName = "Kanani Jay6145";
  String _email = "@KananiJay6145";
  List<String> _interests = [];
  List<String> allInterests = [
    "Car",
    "Nature",
    "Animals",
    "Technology",
    "Travel"
  ];
  String? _imagePath;

  @override
  void initState() {
    super.initState();
    _imagePath = widget.imagePath;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('Edit Profile', style: TextStyle(color: Colors.white)),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            GestureDetector(
              onTap: () {
                // Implement profile image picker
                // _pickImage();
              },
              child: CircleAvatar(
                radius: 50,
                backgroundColor: const Color.fromARGB(255, 255, 218, 116),
                backgroundImage:
                    _imagePath != null ? NetworkImage(_imagePath!) : null,
                child: _imagePath == null
                    ? Icon(Icons.camera_alt, size: 40, color: Colors.white)
                    : null,
              ),
            ),
            SizedBox(height: 20),
            TextField(
              decoration: InputDecoration(
                labelText: 'Name',
                labelStyle: TextStyle(color: Colors.grey),
                filled: true,
                fillColor: Colors.white10,
                border: OutlineInputBorder(),
              ),
              style: TextStyle(color: Colors.white),
              controller: TextEditingController(text: _userName),
              onChanged: (value) {
                _userName = value;
              },
            ),
            SizedBox(height: 10),
            TextField(
              decoration: InputDecoration(
                labelText: 'Username',
                labelStyle: TextStyle(color: Colors.grey),
                filled: true,
                fillColor: Colors.white10,
                border: OutlineInputBorder(),
              ),
              style: TextStyle(color: Colors.white),
              controller: TextEditingController(text: _email),
              onChanged: (value) {
                _email = value;
              },
            ),
            SizedBox(height: 10),
            Text(
              "Interests",
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
            ...allInterests.map((interest) {
              return CheckboxListTile(
                title: Text(interest, style: TextStyle(color: Colors.white)),
                value: _interests.contains(interest),
                onChanged: (bool? value) {
                  setState(() {
                    if (value == true) {
                      _interests.add(interest);
                    } else {
                      _interests.remove(interest);
                    }
                  });
                },
                checkColor: Colors.black,
                activeColor: Colors.blue,
                controlAffinity: ListTileControlAffinity.leading,
              );
            }).toList(),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Handle profile update logic
                // For example, save the new information and interests
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 255, 195, 215)),
              child: Text('Update'),
            ),
          ],
        ),
      ),
    );
  }
}
