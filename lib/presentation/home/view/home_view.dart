
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import '../../../domain/model/model_container.dart';

import '../../presentation_contatiner.dart';
import '../../screens/tickets.dart';
import '../../screens/more_screen.dart';

class HomeLayout extends StatefulWidget {
  const HomeLayout({Key? key}) : super(key: key);

  @override
  _HomeLayoutState createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {

  List<Widget> screens = [
    BookNow(),
    const Tickets(),
    AccountScreen(),
    const MyStatefulWidget(),
  ];
  List<Widget> title = [
     Text(StringManager.bookTrip.tr()),
 Text(StringManager.myTickets.tr()),
      Icon(
      Icons.login,
      color: ColorManager.deepOrange,
    ),
    Text(StringManager.more.tr()),
  ];

  @override
  Widget build(BuildContext context) {
    final bookNowManager = context.watch< BookNowProvider>();
    final pageController = PageController(initialPage: 0);
    final pageView = PageView(
      physics: BouncingScrollPhysics(),
      controller: pageController,
      onPageChanged: (value) {
        bookNowManager.goToTap(value);
      },
      children: screens,
    );
    return Scaffold(
      appBar: AppBar(
        // elevation: 0,
        // backgroundColor: ColorManager.primary,
        title: Center(
          child: title[bookNowManager.selectedTap],
        ),
      ),
      body: pageView,
      bottomNavigationBar: BottomNavigationBar(
        // enableFeedback:false ,

        currentIndex: bookNowManager.selectedTap,
        onTap: (index) {
          bookNowManager.goToTap(index);
          pageController.animateToPage(bookNowManager.selectedTap,
              duration: const Duration(
                milliseconds: 200,
              ),
              curve: Curves.linear);
        },

        selectedItemColor: Colors.deepOrangeAccent,
        type: BottomNavigationBarType.fixed,
        items:  [
          BottomNavigationBarItem(
            icon: Icon(Icons.directions_bus
                // departure_board ,
                ),
            label: StringManager.bookNow.tr(),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.confirmation_num,
            ),
            label: StringManager.tickets.tr(),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.assignment_ind,
            ),
            label: StringManager.account.tr(),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.more_horiz,
            ),
            label: StringManager.more.tr(),
          ),
        ],
      ),
    );
  }
}
