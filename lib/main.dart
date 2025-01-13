import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart'; // Add the image_picker package to pubspec.yaml

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
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
          icon: Icon(Icons.edit, color: Colors.white),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => EditProfilePage(imagePath: _imagePath)),
            );
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.menu, color: Colors.white),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MenuPage()),
              );
            },
          ),
        ],
        elevation: 0,
      ),
      backgroundColor: Colors.black,
      body: Column(
        children: [
          GestureDetector(
            onTap: () {
              // Implement profile image change functionality here
              _pickImage();
            },
            child: CircleAvatar(
              radius: 50,
              backgroundColor: Colors.purple,
              backgroundImage: NetworkImage(_imagePath),
              child: _imagePath.isEmpty
                  ? Icon(Icons.camera_alt, size: 40, color: Colors.white)
                  : null,
            ),
          ),
          SizedBox(height: 10),
          Text(
            _userName,
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
          Text(
            _email,
            style: TextStyle(color: Colors.grey, fontSize: 14),
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  Text(
                    'Wallpapers',
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
          Expanded(
            child: Center(
              child: Text(
                'No Posts!',
                style: TextStyle(color: Colors.grey, fontSize: 16),
              ),
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
}

class MenuPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('Menu', style: TextStyle(color: Colors.white)),
        leading: BackButton(color: Colors.white),
        elevation: 0,
      ),
      body: ListView(
        children: [
          ListTile(
            leading: Icon(Icons.star, color: Colors.white),
            title: Text('Buy Premium', style: TextStyle(color: Colors.white)),
          ),
          ListTile(
            leading: Icon(Icons.wallpaper, color: Colors.white),
            title: Text('Wallpapers', style: TextStyle(color: Colors.white)),
          ),
          ListTile(
            leading: Icon(Icons.view_carousel, color: Colors.white),
            title: Text('Setups', style: TextStyle(color: Colors.white)),
          ),
          ListTile(
            leading: Icon(Icons.download, color: Colors.white),
            title:
                Text('Downloaded Walls', style: TextStyle(color: Colors.white)),
          ),
          ListTile(
            leading: Icon(Icons.clear, color: Colors.white),
            title: Text('Clear All Downloads',
                style: TextStyle(color: Colors.white)),
          ),
          ListTile(
            leading: Icon(Icons.rate_review, color: Colors.white),
            title: Text('Review Status', style: TextStyle(color: Colors.white)),
          ),
          ListTile(
            leading: Icon(Icons.color_lens, color: Colors.white),
            title: Text('Themes', style: TextStyle(color: Colors.white)),
          ),
          ListTile(
            leading: Icon(Icons.share, color: Colors.white),
            title: Text('Share Your Profile',
                style: TextStyle(color: Colors.white)),
          ),
        ],
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
        leading: BackButton(color: Colors.white),
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
                backgroundColor: Colors.purple,
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
                activeColor: Colors.pink,
                controlAffinity: ListTileControlAffinity.leading,
              );
            }).toList(),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Handle profile update logic
                // For example, save the new information and interests
              },
              style: ElevatedButton.styleFrom(backgroundColor: Colors.pink),
              child: Text('Update'),
            ),
          ],
        ),
      ),
    );
  }

  // Future<void> _pickImage() async {
  //   final picker = ImagePicker();
  //   final pickedFile = await picker.pickImage(source: ImageSource.gallery);

  //   if (pickedFile != null) {
  //     setState(() {
  //       _imagePath = pickedFile.path;
  //     });
  //   }
  // }
}
