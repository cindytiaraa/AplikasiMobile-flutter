import 'package:flutter/material.dart';

// UI MODUL 2
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DashboardPage(),
    );
  }
}

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Dashboard UI/UX"),
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [

            // 🔵 CONTAINER
            Container(
              margin: const EdgeInsets.all(16),
              padding: const EdgeInsets.all(16),
              height: 100,
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Center(
                child: Text(
                  "Container Example",
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
            ),

            // 🔵 ROW
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                boxItem("A", Colors.red),
                boxItem("B", Colors.green),
                boxItem("C", Colors.orange),
              ],
            ),

            const SizedBox(height: 20),

            // 🔵 STACK
            Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  height: 120,
                  width: 120,
                  color: Colors.grey,
                ),
                const Text(
                  "STACK",
                  style: TextStyle(color: Colors.white),
                )
              ],
            ),

            const SizedBox(height: 20),

            // 🔵 GRIDVIEW
            GridView.count(
              crossAxisCount: 2,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              children: List.generate(
                4,
                (index) => Card(
                  child: Center(
                    child: Text("Grid ${index + 1}"),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 20),

            // 🔵 LISTVIEW
            ListView.builder(
              itemCount: 5,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return ListTile(
                  leading: const Icon(Icons.person),
                  title: Text("Item ${index + 1}"),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget boxItem(String text, Color color) {
    return Container(
      height: 60,
      width: 60,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
        child: Text(
          text,
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}