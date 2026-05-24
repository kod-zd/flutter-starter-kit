import 'package:flutter/material.dart';

class ZIOPage extends StatefulWidget {
  const ZIOPage({super.key});

  @override
  State<ZIOPage> createState() => _ZIOPageState();
}

class _ZIOPageState extends State<ZIOPage> {
  String selectedQuality = "1080p";
  bool processing = false;
  bool done = false;

  List<String> qualities = ["360p", "720p", "1080p", "4K"];

  void startEnhance() async {
    setState(() {
      processing = true;
      done = false;
    });

    await Future.delayed(const Duration(seconds: 3));

    setState(() {
      processing = false;
      done = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            const Text(
              "ZIO",
              style: TextStyle(
                fontSize: 42,
                color: Colors.red,
                fontWeight: FontWeight.bold,
                letterSpacing: 4,
              ),
            ),

            const SizedBox(height: 30),

            DropdownButton<String>(
              value: selectedQuality,
              dropdownColor: Colors.black,
              items: qualities.map((q) {
                return DropdownMenuItem(
                  value: q,
                  child: Text(q, style: const TextStyle(color: Colors.white)),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  selectedQuality = value!;
                });
              },
            ),

            const SizedBox(height: 40),

            GestureDetector(
              onTap: processing ? null : startEnhance,
              child: Container(
                width: 180,
                height: 180,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: const RadialGradient(
                    colors: [Colors.red, Colors.black],
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.red.withOpacity(0.5),
                      blurRadius: 25,
                    )
                  ],
                ),
                child: processing
                    ? const Center(child: CircularProgressIndicator())
                    : const Icon(Icons.auto_awesome, size: 70, color: Colors.white),
              ),
            ),

            const SizedBox(height: 20),

            if (done)
              const Text(
                "Enhanced Successfully ✨",
                style: TextStyle(color: Colors.green),
              ),
          ],
        ),
      ),
    );
  }
}
