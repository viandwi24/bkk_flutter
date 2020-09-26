import 'package:bkk/constants.dart';
import 'package:flutter/material.dart';
import 'package:bkk/screens/welcome/components/slider.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';

class WelcomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => WelcomeScreenState();
}

class WelcomeScreenState extends State<WelcomeScreen> {
  PageController slidePageController = new PageController(initialPage: 4);
  int _currentPage = 0;

  List<Widget> _slidePages = [
    new SlidePage(
      title: 'Cari Pekerjaan',
      image: 'assets/illustrations/job_hunt.svg',
      description: 'Temukan sekumpulan permintaan pekerjaan dengan mudah.'
    ),
    new SlidePage(
      title: 'Buat Lowongan',
      image: 'assets/illustrations/create_job.svg',
      description: 'Buat lowongan pekerjaan untuk mencari pekerja, kerja sama dengan BKK SMKN 1 MOJOKERTO.'
    ),
    new SlidePage(
      title: 'Dapatkan Notifikasi',
      image: 'assets/illustrations/notification.svg',
      description: 'Ikuti terus perkembangan daftar pekerjaan, pemberitahuan, acara penting, dan lainnya.'
    ),
    Container(
      height: 400,
      decoration: BoxDecoration(
        color: Colors.grey[200],
        image: DecorationImage(
          image: AssetImage('assets/images/background_main.png'),
          alignment: Alignment.topCenter,
          fit: BoxFit.fill
        )
      ),
      padding: EdgeInsets.fromLTRB(50, 50, 50, 50),
      child: Container(
        margin: EdgeInsets.fromLTRB(10, 50, 10, 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Column(
              children: <Widget>[
                Text(
                  'Bursa Kerja Khusus',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'SMKN 1 MOJOKERTO',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 26,
                    fontWeight: FontWeight.bold
                  ),
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.fromLTRB(0, 0, 0, 25),
              child: Column(
                children: <Widget>[
                  SignInButton(
                    Buttons.Google,
                    onPressed: () {}
                  ),
                  SignInButton(
                    Buttons.FacebookNew,
                    onPressed: () {}
                  ),
                  SignInButton(
                    Buttons.LinkedIn,
                    onPressed: () {}
                  )
                ],
              ),
            )
          ],
        ),
      ),
    ),
  ];

  void onSlidePageChange(int index) {
    setState(() {
      _currentPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: Container(
        decoration: BoxDecoration(
          color: Colors.white
        ),
        child: Stack(
          children: <Widget>[
            PageView.builder(
              controller: slidePageController,
              onPageChanged: onSlidePageChange,
              itemCount: _slidePages.length,
              itemBuilder: (BuildContext context, int index) {
                return _slidePages[index];
              },
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      (_currentPage != _slidePages.length - 1)
                      ? FlatButton(
                          onPressed: () => slidePageController.animateToPage(
                            _slidePages.length-1,
                            duration: Duration(milliseconds: 100),
                            curve: Curves.bounceIn
                          ),
                          child: Text(
                            'Skip',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold
                            ),
                          ),
                        )
                      : SizedBox(),
                      Row(
                        children: List<Widget>.generate(
                          _slidePages.length,
                          (int index) {
                            return AnimatedContainer(
                              duration: Duration(milliseconds: 100),
                              height: 10,
                              width: (index == _currentPage) ? 30 : 10,
                              margin: EdgeInsets.symmetric(horizontal: 5, vertical: 30),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: (index == _currentPage)
                                    ? kColorPrimary
                                    : kColorPrimary.withOpacity(0.5)
                              )
                            );
                          }
                        ),
                      ),
                      (_currentPage != _slidePages.length - 1)
                      ? FlatButton(
                          onPressed: () => slidePageController.animateToPage(
                            _currentPage+1,
                            duration: Duration(milliseconds: 200),
                            curve: Curves.bounceIn
                          ),
                          child: Text(
                            'Next',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w900,
                              color: kColorPrimary
                            ),
                          ),
                        )
                      : SizedBox(),
                    ]
                  ),
                )
              ],
            )
          ],
        ),
      )
    );
  }
}