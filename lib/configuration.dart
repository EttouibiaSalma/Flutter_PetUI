import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

const kTitleStyle = TextStyle(
  fontSize: 20.0,
  color: Color(0xFF746F67),
  fontWeight: FontWeight.bold,
);

const kSubtitleStyle = TextStyle(
  fontSize: 18.0,
  color: Color(0xFF746F67),
);
const kSubtitleStyle3 = TextStyle(
  fontSize: 10.0,
  color: Color(0xFF746F67),
);

const kSubtitle2Style = TextStyle(
  fontSize: 13.0,
  color: Colors.black45,
);

Color primaryGreen = Color(0xff416d6d);
List<BoxShadow> shadowList = [
  BoxShadow(color: Colors.grey[300], blurRadius: 30, offset: Offset(0, 10))
];

List<Map> categories = [
  {'name': 'Cats', 'iconPath': 'images/cat.png','color':Color(0xff416d6d)},
  {'name': 'Dogs', 'iconPath': 'images/dog.png','color':Colors.white},
  {'name': 'Bunnies', 'iconPath': 'images/rabbit.png','color':Colors.white},
  {'name': 'Parrots', 'iconPath': 'images/parrot.png','color':Colors.white},
  {'name': 'Horses', 'iconPath': 'images/horse.png','color':Colors.white}
];

List<Map> drawerItems=[
  {
    'icon': FontAwesomeIcons.paw,
    'title' : 'Adoption'
  },
  {
    'icon': Icons.mail,
    'title' : 'Donation'
  },
  {
    'icon': FontAwesomeIcons.plus,
    'title' : 'Add pet'
  },
  {
    'icon': Icons.favorite,
    'title' : 'Favorites'
  },
  {
    'icon': Icons.mail,
    'title' : 'Messages'
  },
  {
    'icon': FontAwesomeIcons.userAlt,
    'title' : 'Profile'
  },
];

List<Map> petItems=[
  {
    'name': 'Cat 1',
    'type' : 'Cats',
    'age': 1,
    'distance' : '10',
    'adress': 'Morocco',
    'isMale' : true,
    'userImage': '',
    'userName' : 'Salma',
    'datetime': DateTime.now(),
    'description' : 'A little cat born in Agadir',
    'image': 'images/cat.png'
  }
];