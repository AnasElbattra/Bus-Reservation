import 'package:flutter/material.dart';
import 'package:gobusss/screens/sign_up_screen.dart';
import 'package:provider/provider.dart';
import '../model/book_now_manager.dart';
import 'tickets.dart';
import 'account_screen.dart';
import 'book_now.dart';
import 'more_screen.dart';

class HomeLayout extends StatefulWidget {
  const HomeLayout({Key? key}) : super(key: key);

  @override
  _HomeLayoutState createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
  List<Widget> screens = [
    BookNow(),
    const Tickets(),
    const AccountScreen(),
    const MoreScreen(),

  ];
  List<Widget> title = [
    const Text('Book Your Bus Trip Now'),
    const Text('My Tickets'),
    const Icon(Icons.login,color: Colors.deepOrange,),
    const Text('More'),
  ];

  @override
  Widget build(BuildContext context) {
    final bookNowManager = context.watch<BookNowManager>();
    final controller = PageController(
      initialPage: 0,
    );
    final pageView = PageView(
      controller: controller,
      onPageChanged: (value) {
       bookNowManager.goToTap(value);
      },
      children: screens,
    );
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.indigo,
        title: Center(
          child:title[bookNowManager.selectedTap],
         ),
      ),
      body: pageView,
      bottomNavigationBar: BottomNavigationBar(
        // enableFeedback:false ,

        currentIndex: context.watch<BookNowManager>().selectedTap,
        onTap: (index) {
          context.read<BookNowManager>().goToTap(index);
          controller.animateToPage(context.read<BookNowManager>().selectedTap,
              duration: const Duration(
                milliseconds: 200,
              ),
              curve: Curves.linear);
        },

        selectedItemColor: Colors.deepOrangeAccent,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.directions_bus
                // departure_board ,
                ),
            label: 'Book Now',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.confirmation_num,
            ),
            label: 'Tickets',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.assignment_ind,
            ),
            label: 'Account',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.more_horiz,
            ),
            label: 'More',
          ),
        ],
      ),
    );
  }
}
