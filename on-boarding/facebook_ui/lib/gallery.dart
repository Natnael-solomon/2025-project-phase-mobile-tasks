import 'package:flutter/material.dart';

class Gallery extends StatelessWidget {
  const Gallery({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0), 
        child: Column(
          children: [
            // Row for the icon container (search icon)
            Row(
              children: [
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.deepPurple,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),   // Top-left corner
                      bottomLeft: Radius.circular(20), // Bottom-left corner
                    ),
                  ),
                  child: Icon(
                    Icons.search,
                    size: 30,  // Size of the icon
                    color: Colors.grey,  
                  ),
                ),

                Container(
                  width: 350, 
                  child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Search File',
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 80), 

            Center(
              child: Column(
                children: [
                  Text(
                    'Photos',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 26,
                    ),
                  ),
                  SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.only(right: 350.0),
                    child: Text(
                      'November',
                      style: TextStyle(
                        color: Colors.blueGrey,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 10), 

            Expanded(
              child: GridView.count(
                primary: true, 
                padding: const EdgeInsets.all(10),
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                crossAxisCount: 2, 
                children: List.generate(8, (index) {
                  // List of image paths
                  List<String> imagePaths = [
                    'assets/images/ai-generated-nature-landscapes-background-free-photo.jpg',
                    'assets/images/depositphotos_36220949-stock-photo-beautiful-landscape.jpg',
                    'assets/images/images.jpg',
                    'assets/images/images (1).jpg',
                    'assets/images/Images (2).jpg',
                    'assets/images/istockphoto-1413416824-612x612.jpg',
                    'assets/images/images (3).jpg',
                    'assets/images/images (4).jpg',
                  ];

                  return Container(
                    padding: const EdgeInsets.all(8), 
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10), 
                      color: Colors.grey[200], 
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 4,
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10), 
                      child: Image.asset(
                        imagePaths[index], 

                        fit: BoxFit.cover, 
                      ),
                    ),
                  );
                }),
              ),
            ),
          ],
        ),
      ),

      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.photo_library),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.camera),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.video_library),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.more_vert),
            label: "",
          ),
        ],
        backgroundColor: Colors.deepPurple,  
        selectedItemColor: Colors.grey,  
        unselectedItemColor: Colors.grey, 
        showSelectedLabels: true,  
        showUnselectedLabels: true,  
      ),
    );
  }
}
