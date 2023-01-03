
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
      drawer: Drawer(
        child: Column(
          children: [
            UserAccountsDrawerHeader(
              currentAccountPicture: ClipRRect(
                borderRadius: BorderRadius.circular(40),
                child: Image.network(
                  'https://media.licdn.com/dms/image/C4E03AQFPtg3rTWbMKA/profile-displayphoto-shrink_800_800/0/1631744512129?e=1678320000&v=beta&t=YBLYZB5YG4TU18ubQiFAi81PQNZgC5Q1sdablk2eQE4'
                ),
              ),
              accountName: const Text('test'), 
              accountEmail: const Text('teste@email.com')
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Inicio'),
              subtitle: const Text('tela de inicio'),
              onTap: (() {
                print('home');
              }),
            ),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text('Logout'),
              subtitle: const Text('Finalizar sessão'),
              onTap: (() {
                Navigator.of(context).pushReplacementNamed('/');
              }),
            )
          ],
        ),
      ),
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
