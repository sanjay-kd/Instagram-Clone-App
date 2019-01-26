import 'package:flutter/material.dart';

class HomeSectionView extends StatefulWidget {
  @override
  _HomeSectionViewState createState() => _HomeSectionViewState();
}

class _HomeSectionViewState extends State<HomeSectionView> {

  Widget _buildPostUI(BuildContext context, int index){
    return Container(
      padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
      child: Card(
        margin: const EdgeInsets.all(0.0),
        elevation: 0.0,
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
                    Icon(Icons.dehaze, color: Colors.grey,)
                  ],
                ),
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.width*0.8,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/post_image.jpg"),
                    fit: BoxFit.cover
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Icon(Icons.favorite_border, color: Colors.black, size: 32,),
                      SizedBox(width: 10,),
                      Icon(Icons.insert_emoticon, color: Colors.black, size: 32,),
                      SizedBox(width: 10,),
                      Icon(Icons.language, color: Colors.black, size: 32,),
                    ],
                  ),
                  Icon(Icons.bookmark_border, color: Colors.black, size: 32,),
                ],
              ),
            ),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text("Liked by leeviahq and 59 others", style: TextStyle(fontSize: 11),),
                  Text("sanjay15k : Here comes the status...", style: TextStyle(fontSize: 13),)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Container(
          child: StoriesSection(),
          color: Color(0xFFF5F5F5),
        ),
        Container(
          child: ListView.builder(
            shrinkWrap: true,
            physics: ClampingScrollPhysics(),
            itemBuilder: _buildPostUI,
            itemCount: 3,
          ),
          color: Colors.white,
        ),

      ],
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
