
import 'package:flutter/material.dart';
import 'package:my_first_app/app_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() {
    return HomePageState();
  }
}

class HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: AnimatedBuilder(
          animation: AppController.instance,
          builder: (context, child) {
            return Text('Home Page - ${AppController.instance.value}');
          },
        ),
        actions: const [
          CustomSwitcher()
        ],
      ),
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedBuilder(
              animation: AppController.instance,
              builder: (context, child) {
                return Text('Counter: ${AppController.instance.value}');
              },
            ),
            Container(height: 10),
            const CustomSwitcher(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                AnimatedBuilder(
                  animation: AppController.instance,
                  builder: (context, child) {
                    return Container(
                      width: AppController.instance.value,
                      height: AppController.instance.value,
                      color: Colors.blue,
                    );
                  },
                ),
                AnimatedBuilder(
                  animation: AppController.instance,
                  builder: (context, child) {
                    return Container(
                      width: AppController.instance.value,
                      height: AppController.instance.value,
                      color: Colors.black,
                    );
                  },
                ),
                AnimatedBuilder(
                  animation: AppController.instance,
                  builder: (context, child) {
                    return Container(
                      width: AppController.instance.value,
                      height: AppController.instance.value,
                      color: Colors.green,
                    );
                  },
                ),
              ],
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => AppController.instance.onCounter(),
        child: const Icon(Icons.add)
      ),
    );
  }
}

class CustomSwitcher extends StatelessWidget {
  const CustomSwitcher({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: AppController.instance, 
      builder: ((context, child) {
        return Switch(
          value: AppController.instance.isDarkTheme,
          onChanged: (value) => AppController.instance.changeTheme(),
        );
      }),
    );
  }
}
