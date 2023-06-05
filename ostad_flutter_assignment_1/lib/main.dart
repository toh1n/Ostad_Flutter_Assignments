import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with SingleTickerProviderStateMixin {
  int _currentIndex = 0;
  late TabController _tabController;

  List<Color> colorList = [
    Colors.orangeAccent,
    Colors.redAccent,
    Colors.blueAccent,
  ];
  List<String> pageNo = [
    "Page 1",
    "Page 2",
    "Page 3",
  ];
  onTap(int index) {
    setState(() {
      _currentIndex = index;
      _tabController.index = index;
    });
  }

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: 3,
      vsync: this,
    );
    _tabController.addListener(_handleTabChange);
  }

  void _handleTabChange() {
    setState(() {
      _currentIndex = _tabController.index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: colorList[_currentIndex],
          title: Text(pageNo[_currentIndex]),
          centerTitle: true,
          bottom: TabBar(
            controller: _tabController,
            tabs: [
              Tab(text: 'Page 1'),
              Tab(text: 'Page 2'),
              Tab(text: 'Page 3'),
            ],
          ),
        ),
        drawer: Drawer(
          backgroundColor: colorList[_currentIndex],
          child: ListView(
            children: [
              DrawerHeader(
                child: Text("Change Pages"),
              ),
              ListTile(
                leading: const Icon(
                  Icons.home,
                ),
                title: const Text('Page 1'),
                onTap: () {
                  onTap(0);
                },
              ),
              ListTile(
                leading: const Icon(
                  Icons.message,
                ),
                title: const Text('Page 2'),
                onTap: () {
                  onTap(1);
                },
              ),
              ListTile(
                leading: const Icon(
                  Icons.settings,
                ),
                title: const Text('Page 3'),
                onTap: () {
                  onTap(2);
                },
              ),
            ],
          ),
        ),
        body: TabBarView(
          controller: _tabController,
          children: const [
            Center(
              child: Text("Page 1"),
            ),
            Center(
              child: Text("Page 2"),
            ),
            Center(
              child: Text("Page 3"),
            ),
          ],
        ),
        bottomNavigationBar: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(text: 'Page 1'),
            Tab(text: 'Page 2'),
            Tab(text: 'Page 3'),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          backgroundColor: colorList[_currentIndex],
          child: Icon(
            Icons.add,
          ),
        ),
      ),
    );
  }
}
