import 'package:flutter/material.dart';

import 'package:instagram_clone/pages/HomeSectionView.dart';
import 'package:instagram_clone/pages/SearchSectionView.dart';
import 'package:instagram_clone/pages/PostImageSectionView.dart';
import 'package:instagram_clone/pages/FavouritesSectionView.dart';
import 'package:instagram_clone/pages/AccountSectionView.dart';

void main() => runApp(HomePage());

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Instagram Clone",
      debugShowCheckedModeBanner: false,
      home: TopSection(),
      theme: ThemeData(
        fontFamily: "Raleway",
      ),
    );
  }
}

class TopSection extends StatefulWidget {
  @override
  _TopSectionState createState() => _TopSectionState();
}

class _TopSectionState extends State<TopSection> {

  int _currentIndex = 2;

  void _setIndex(int index){
    setState(() {
      _currentIndex = index;
    });
  }

  Widget _setPageView(){
    switch(_currentIndex){
      case 0 : return HomeSectionView();
      case 1 : return SearchSectionView();
      case 2 : return PostImageSectionView();
      case 3 : return FavouritesSectionView();
      case 4 : return AccountSectionView();
      default: return PostImageSectionView();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.black,
        title: Text("Instagram",style: TextStyle(fontSize: 32,letterSpacing: 1.7,fontFamily: "Billabong"),),
        leading: Icon(Icons.camera_alt, color: Colors.white,size: 30,),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Transform.rotate(angle: -0.6,child: Icon(Icons.send,color: Colors.white,size: 28,),),
          )
        ],
      ),
      body: _setPageView(),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        iconSize: 30,
        fixedColor: Colors.black,
        type: BottomNavigationBarType.fixed,
        onTap: _setIndex,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
            ),
            title: Container(),
          ),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.search,
              ),
              title: Container()
          ),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.add_circle_outline,
              ),
              title: Container()
          ),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.favorite_border,
              ),
              title: Container()
          ),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.insert_emoticon,
              ),
              title: Container()
          ),
        ],
      ),
    );
  }
}