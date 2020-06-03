import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pet_ui/configuration.dart';
import 'package:pet_ui/screen2.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  //variables used for toggling drawer screen
  double xOffset = 0;
  double yOffset = 0;
  double scaleFactor = 1;

  bool isDrawerOpen = false; //tell us if the drawer is open or closed

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      transform: Matrix4.translationValues(xOffset, yOffset, 0)
        ..scale(scaleFactor)
        ..rotateY(isDrawerOpen
            ? -0.5
            : 0), //how i want my container to be shifted +scal
      duration:
          Duration(milliseconds: 250), //required field for AnimatedContainer

      decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(isDrawerOpen ? 40 : 0.0)),
      child: SingleChildScrollView(
        child: Column(
          //In main screen everything is aligned vertically
          children: [
            SizedBox(
              height: 50,
            ), //To give margin
            Container(
              margin: EdgeInsets.symmetric(
                  horizontal: 20), //give horizontal margin to container
              child: Row(
                mainAxisAlignment:
                    MainAxisAlignment.spaceBetween, //space between row elements
                children: [
                  //children here is different depending of the state of drawer like an if-else
                  isDrawerOpen
                      ? IconButton(
                          //if the drawer is open the icon is changed and we can return back to home screen
                          icon: Icon(Icons.arrow_back_ios),
                          onPressed: () {
                            setState(() {
                              //is used whenever we re using statefulwidget here we specify
                              xOffset = 0;
                              yOffset = 0;
                              scaleFactor = 1;
                              isDrawerOpen = false;
                            });
                          },
                        )
                      : IconButton(
                          icon: Icon(Icons.menu),
                          onPressed: () {
                            setState(() {
                              xOffset = 230;
                              yOffset = 150;
                              scaleFactor = 0.6;
                              isDrawerOpen = true;
                            });
                          }),
                  Column(
                    children: [
                      Text('Location', style: kSubtitleStyle3),
                      Row(
                        children: [
                          Icon(
                            Icons.location_on,
                            color: primaryGreen,
                          ),
                          Text('Morocco'),
                        ],
                      ),
                    ],
                  ),
                  CircleAvatar()
                ],
              ),
            ),

            Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              margin: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(20)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(Icons.search),
                  Text('Search pet to adopt'),
                  Icon(Icons.settings)
                ],
              ),
            ),

            Container(
              height: 120,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  return Container(
                    child: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.all(10),
                          margin: EdgeInsets.only(left: 20),
                          decoration: BoxDecoration(
                              color: categories[index]['color'],
                              boxShadow:[
                                BoxShadow(
                                  color: Colors.grey,
                                  offset: Offset(0.0, 1.0), //(x,y)
                                  blurRadius: 6.0,
                                )
                              ],
                              borderRadius: BorderRadius.circular(10)),
                          child: Image.asset(
                            categories[index]['iconPath'],
                            height: 50,
                            width: 50,
                            color: Colors.grey[700],
                          ),
                        ),
                        Text(categories[index]['name'])
                      ],
                    ),
                  );
                },
              ),
            ),

            GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Screen2()));
              },
              child: Container(
                height: 240,
                margin: EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    Expanded(
                      child: Stack(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.blueGrey[300],
                              borderRadius: BorderRadius.circular(20),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey,
                                  offset: Offset(0.0, 1.0), //(x,y)
                                  blurRadius: 6.0,
                                )
                              ],
                            ),
                            margin: EdgeInsets.only(top: 50),
                          ),
                          Align(
                            child: Hero(
                                tag: 1,
                                child: Image.asset('images/pet-cat2.png')),
                          )
                        ],
                      ),
                    ),
                    Expanded(
                        child: Container(
                      margin: EdgeInsets.only(top: 60, bottom: 20),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow:[
                                BoxShadow(
                                  color: Colors.grey,
                                  offset: Offset(0.0, 1.0), //(x,y)
                                  blurRadius: 6.0,
                                )
                              ],
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(20),
                              bottomRight: Radius.circular(20))),

                      //*********************** */
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                                'Sola',
                                overflow: TextOverflow.ellipsis,
                                style: kTitleStyle,
                              ),
                              false
                                  ? Icon(
                                      FontAwesomeIcons.mars,
                                      color: Colors.black45,
                                    )
                                  : Icon(
                                      FontAwesomeIcons.venus,
                                      color: Colors.black45,
                                    ),
                            ],
                          ),
                          Text('Abysinian cat', style: kSubtitleStyle),
                          Text("2 years old", style: kSubtitle2Style),
                          Row(
                            children: [
                              Icon(
                                FontAwesomeIcons.mapMarkerAlt,
                                color: Color(0xFF27608D),
                                size: 15,
                              ),
                              SizedBox(width: 5.0),
                              Text(
                                "Distance: 3.6 km",
                                style: kSubtitle2Style,
                              )
                            ],
                          ),
                        ],
                      ),

//******************** */
                    ))
                  ],
                ),
              ),
            ),
            Container(
              height: 240,
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  Expanded(
                    child: Stack(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.orange[100],
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                                BoxShadow(
                                  color: Colors.grey,
                                  offset: Offset(0.0, 1.0), //(x,y)
                                  blurRadius: 6.0,
                                )
                              ],
                          ),
                          margin: EdgeInsets.only(top: 50),
                        ),
                        Align(
                          child: Image.asset('images/pet-cat1.png'),
                        )
                      ],
                    ),
                  ),
                  Expanded(
                      child: Container(
                    margin: EdgeInsets.only(top: 60, bottom: 20),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow:[
                                BoxShadow(
                                  color: Colors.grey,
                                  offset: Offset(0.0, 1.0), //(x,y)
                                  blurRadius: 6.0,
                                )
                              ],
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(20),
                            bottomRight: Radius.circular(20))),
                    //*********************** */
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              'Orion',
                              overflow: TextOverflow.ellipsis,
                              style: kTitleStyle,
                            ),
                            true
                                ? Icon(
                                    FontAwesomeIcons.mars,
                                    color: Colors.black45,
                                  )
                                : Icon(
                                    FontAwesomeIcons.venus,
                                    color: Colors.black45,
                                  ),
                          ],
                        ),
                        Text('Abysinian cat', style: kSubtitleStyle),
                        Text("1.5 years old", style: kSubtitle2Style),
                        Row(
                          children: [
                            Icon(
                              FontAwesomeIcons.mapMarkerAlt,
                              color: Color(0xFF27608D),
                              size: 15,
                            ),
                            SizedBox(width: 5.0),
                            Text(
                              "Distance: 7.8 km",
                              style: kSubtitle2Style,
                            )
                          ],
                        ),
                      ],
                    ),

//******************** */
                  ))
                ],
              ),
            ),
            SizedBox(
              height: 50,
            )
          ],
        ),
      ),
    );
  }
}
