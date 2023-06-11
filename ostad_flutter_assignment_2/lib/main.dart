import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: const Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Photo Gallery"),
        elevation: 5,
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
              child: const Text(
                "Welcome to My Photo Gallery!",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                textInputAction: TextInputAction.search,
                onTap: () {},
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(),
                  hintText: "Search",
                ),
              ),
            ),
            Wrap(
              spacing: 20,
              runSpacing: 20,
              children: [
                for (int i = 10; i < 16; i++)
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        elevation: 0,
                        padding: EdgeInsets.zero,
                        fixedSize: const Size.square(100),
                        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero)),
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Clicked on photo ${i - 9} !'),
                          backgroundColor: Colors.black,
                          duration: const Duration(milliseconds: 300),
                        ),
                      );
                    },
                    child: Stack(
                      children: [
                        Image(
                          image: NetworkImage(
                              "https://picsum.photos/id/$i/300/300"),
                        ),
                        Positioned(
                          bottom: 0,
                          left: 20,
                          right: 20,
                          child: Container(
                            color: Colors.grey,
                            child: Text(
                              "Photo ${i - 9}",
                              textAlign: TextAlign.center,
                              style: const TextStyle(color: Colors.black),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
              ],
            ),
            ListView.builder(
              shrinkWrap: true,
              physics:  NeverScrollableScrollPhysics(),
              itemCount: 6,
              itemBuilder: (context, index) {
                 return ListTile(
                    contentPadding: EdgeInsets.only(left: 16, right: 16, top: 8),
                    leading: Image(image: NetworkImage("https://picsum.photos/id/${index+10}/300/300"),),
                    title: Text("Sample Photo ${index+1}"),
                    subtitle: Text("Category ${index+1}"),
                  );
              },
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Photos Uploaded Successfully!'),
              backgroundColor: Colors.black,
              duration: Duration(milliseconds: 300),
            ),
          );
        },
        backgroundColor: Colors.blueAccent,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(35)),
        child: const Icon(Icons.cloud_upload),
      ),
    );
  }
}
