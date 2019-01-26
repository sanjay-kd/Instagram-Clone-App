import 'package:flutter/material.dart';

class HomeSectionView extends StatefulWidget {
  @override
  _HomeSectionViewState createState() => _HomeSectionViewState();
}

class _HomeSectionViewState extends State<HomeSectionView> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          StoriesSection(),
          PostSection(),
        ],
      ),
    );
  }
}

class StoriesSection extends StatefulWidget {
  @override
  _StoriesSectionState createState() => _StoriesSectionState();
}

class _StoriesSectionState extends State<StoriesSection> {

  Widget _myStoryUpdate(BuildContext context) {
    return Column(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Image.asset(
                "assets/icons/user_status_icon.png",
                scale: 2.08,
              ),
              Container(
                child: Icon(
                  Icons.add,
                  color: Colors.white,
                  size: 18,
                ),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.blue
                ),
              )
            ],
            alignment: Alignment.bottomRight,
          ),
          SizedBox(height: 5,),
          Text(
            "Your Story",
            style: TextStyle(
                color: Colors.grey,
                fontSize: 14,
                fontFamily: "Acme",),
          )
        ],
    );
  }

  Widget _othersStoriesUpdates(BuildContext context){
    return Column(
      children: <Widget>[
        Container(
          child: Image.asset(
            "assets/icons/user_status_icon.png",
            scale: 2.3,
          ),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.red, width: 2,),
            borderRadius: BorderRadius.circular(30),
          ),
          padding: EdgeInsets.all(1.3),
        ),
        SizedBox(height: 5,),
        Text(
          "beardguy",
          style: TextStyle(
            color: Colors.black,
            fontSize: 14,
            fontFamily: "Acme",
          ),
        )
      ],
    );
  }

  Widget _buildStoriesListItem(BuildContext context, int index){
    Widget widget;
    if(index ==0){
      widget = _myStoryUpdate(context);
    }
    else{
      widget = _othersStoriesUpdates(context);
    }
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
      child: widget,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
        color: Colors.red,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 7, 0, 4),
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      "Stories",
                      style: TextStyle(
                          fontFamily: "Acme",
                          fontWeight: FontWeight.w500,
                          fontSize: 17),
                    ),
                    GestureDetector(
                        onTap: () {},
                        child: Row(
                          children: <Widget>[
                            Icon(Icons.play_arrow),
                            Text(
                              "Watch all",
                              style: TextStyle(
                                  fontFamily: "Acme",
                                  fontWeight: FontWeight.w500,
                                  fontSize: 17),
                            )
                          ],
                        ))
                  ],
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemBuilder: _buildStoriesListItem,
                  itemCount: 23,
                  scrollDirection: Axis.horizontal,
                ),
              )
            ],
          ),
        ),
    );
  }
}

class PostSection extends StatefulWidget {
  @override
  _PostSectionState createState() => _PostSectionState();
}

class _PostSectionState extends State<PostSection> {

  Widget _PostUI(BuildContext context){
    return Container(
      child: Card(
        margin: const EdgeInsets.all(0.0),
        elevation: 0.0,
        color: Colors.lightGreen,
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Image.asset("assets/icons/user_status_icon.png",scale: 4,),
                        SizedBox(width: 10,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text("sanjayk15", style: TextStyle(fontWeight: FontWeight.w700, fontFamily: "Ace"),),
                            SizedBox(height: 3,),
                            Text("Milan, Italy", style: TextStyle(fontSize: 12),)
                          ],
                        )
                      ],
                    ),
                    Icon(Icons.dehaze, color: Colors.white,)
                  ],
                ),
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height*0.4,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/post_image.jpg"),
                  fit: BoxFit.cover
                ),
              ),
            )
          ],
        ),
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          _PostUI(context),

        ],
      ),
      color: Colors.black,
    );
  }
}
