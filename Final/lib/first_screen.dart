import 'package:bubble_bottom_bar/bubble_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'login_page.dart';
import 'sign_in.dart';
import 'style.dart';
import 'Widgets/ProductCard.dart';
import 'movie_list.dart';
import 'model/model.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_ml_vision/firebase_ml_vision.dart';
import 'dart:io';




class FirstScreen extends StatefulWidget {
  @override
  FirstScreenState createState() =>
      FirstScreenState(); //เปิดรูปไม่ได้ไม่รู้เป็นอะไร
}

class FirstScreenState extends State<FirstScreen>  {
   int _currentIndex;

  @override
  void initState() {
    super.initState();
    _currentIndex = 3;
  }

  void changePage(int index) {
    setState(() {
      _currentIndex = index;
      if (index == 0) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => HomeRoute()), //ย้ายหน้า
        );
      }
      if(index==2){
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => MovieRoute()), //ย้ายหน้า
        );
      }
    });
  }
  Widget build(BuildContext context) {
 
    
        return Scaffold(
          body: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [Colors.blue[100], Colors.blue[400]],
              ),
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  CircleAvatar(
                    backgroundImage: NetworkImage(
                      imageUrl,
                    ),
                    radius: 60,
                    backgroundColor: Colors.transparent,
                  ),
                  SizedBox(height: 40),
                  Text(
                    'NAME',
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.black54),
                  ),
                  Text(
                    name,
                    style: TextStyle(
                        fontSize: 25,
                        color: Colors.deepPurple,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'EMAIL',
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.black54),
                  ),
                  Text(
                    email,
                    style: TextStyle(
                        fontSize: 25,
                        color: Colors.deepPurple,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 40),
                  RaisedButton(
                    onPressed: () {
                      signOutGoogle();
                      Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) {return LoginPage();}), ModalRoute.withName('/'));
                    },
                    color: Colors.deepPurple,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Sign Out',
                        style: TextStyle(fontSize: 25, color: Colors.white),
                      ),
                    ),
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40)),
                  )
                ],
              ),
            ),
          ),
                bottomNavigationBar: Padding(
            padding: EdgeInsets.only(bottom: 12),
            child: BubbleBottomBar(
              backgroundColor: Colors.transparent,
              opacity: 1,
              elevation: 0,
              currentIndex: _currentIndex,
          onTap: changePage,
          items: <BubbleBottomBarItem>[
            BubbleBottomBarItem(
              backgroundColor: Colors.black,
              icon: Icon(
                Icons.home,
                color: Colors.black,
              ),
              activeIcon: Icon(Icons.home, color: Colors.white),
              title: Text("Home", style: bottomBarItemStyle),
            ),
            BubbleBottomBarItem(
                backgroundColor: Colors.black,
                icon: Icon(
                  Icons.shopping_basket,
                  color: Colors.black,
                ),
                activeIcon: Icon(Icons.shopping_basket, color: Colors.white),
                title: Text("Shop", style: bottomBarItemStyle)),
            BubbleBottomBarItem(
                backgroundColor: Colors.black,
                icon: Icon(
                  Icons.favorite_border,
                  color: Colors.black,
                ),
                activeIcon: Icon(Icons.favorite_border, color: Colors.white),
                title: Text("Favorite", style: bottomBarItemStyle)),
            BubbleBottomBarItem(
                backgroundColor: Colors.black,
                icon: Icon(
                  Icons.person,
                  color: Colors.black,
                ),
                activeIcon: Icon(Icons.person, color: Colors.white),
                title: Text("Profile", style: bottomBarItemStyle))
          ],
        ),
      ),
    );
  }
}

class HomeRoute extends StatefulWidget {
  @override
  HomeRouteState createState() =>
      HomeRouteState(); //เปิดรูปไม่ได้ไม่รู้เป็นอะไร
}

class HomeRouteState extends State<HomeRoute> {
  int _currentIndex;

  @override
  void initState() {
    super.initState();
    _currentIndex = 0;
  }

  void changePage(int index) {
    setState(() {
      _currentIndex = index;
      if (index == 2) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => MovieRoute()), //ย้ายหน้า
        );
      }
            if (index == 3) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => FirstScreen()), //ย้ายหน้า
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFf3f6fb),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding:
                  EdgeInsets.only(left: 16, right: 16, top: 30, bottom: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  IconButton(
                    icon: Icon(Icons.menu),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: Icon(Icons.camera_alt),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => PhotoText()),
                      );
                    },
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 25),
              child: Text("SeeDee", style: headingStyle),
            ),
            SizedBox(
              height: 22,
            ),
            Container(
              width: double.infinity,
              height: 60,
              margin: EdgeInsets.symmetric(horizontal: 22),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black.withOpacity(.12),
                        offset: Offset(0, 10),
                        blurRadius: 30)
                  ]),
              child: Center(
                child: Padding(
                  padding: EdgeInsets.only(left: 18, right: 12),
                  child: TextField(
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Search...",
                        hintStyle: searchBarStyle,
                        suffixIcon: Icon(Icons.search)),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: EdgeInsets.only(left: 25),
              child: Text("Suggest Movie", style: headingStyle),
            ),
            SizedBox(
              height: 16,
            ),
            Container(
              height: 240,
              child: ListView.builder(
                itemCount: products.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  var product = products[index];
                  return ProductCard(
                      imgUrl: product.image,
                      name: product.title,
                      color: product.color);
                },
              ),
            ),
            Container(
              width: double.infinity,
              height: 160,
              margin: EdgeInsets.symmetric(horizontal: 22),
              child: Stack(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(left: 8),
                    child: Text("Hit Movie", style: speakerTitleStyle),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: EdgeInsets.only(left: 10, right: 10, bottom: 10),
                      child: Container(
                        width: double.infinity,
                        height: 100,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black12,
                                  offset: Offset(0, 6),
                                  blurRadius: 6)
                            ]),
                        child: Padding(
                          padding: EdgeInsets.only(left: 22, top: 16),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text("Star Wars : Episode VIII",
                                  style: productTitleStyle),
                              SizedBox(
                                height: 4,
                              ),
                              Text(
                                  "The last Jedi , IMDb : 7.1\n Mark Hamill ,...",
                                  style: speakerdescStyle)
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    right: 15,
                    top: -5,
                    child: Image.asset("assets/image8.jng",
                        fit: BoxFit.cover, width: 150, height: 160),
                  )
                ],
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(bottom: 12),
        child: BubbleBottomBar(
          backgroundColor: Colors.transparent,
          opacity: 1,
          elevation: 0,
          currentIndex: _currentIndex,
          onTap: changePage,
          items: <BubbleBottomBarItem>[
            BubbleBottomBarItem(
              backgroundColor: Colors.black,
              icon: Icon(
                Icons.home,
                color: Colors.black,
              ),
              activeIcon: Icon(Icons.home, color: Colors.white),
              title: Text("Home", style: bottomBarItemStyle),
            ),
            BubbleBottomBarItem(
                backgroundColor: Colors.black,
                icon: Icon(
                  Icons.shopping_basket,
                  color: Colors.black,
                ),
                activeIcon: Icon(Icons.shopping_basket, color: Colors.white),
                title: Text("Shop", style: bottomBarItemStyle)),
            BubbleBottomBarItem(
                backgroundColor: Colors.black,
                icon: Icon(
                  Icons.favorite_border,
                  color: Colors.black,
                ),
                activeIcon: Icon(Icons.favorite_border, color: Colors.white),
                title: Text("Favorite", style: bottomBarItemStyle)),
            BubbleBottomBarItem(
                backgroundColor: Colors.black,
                icon: Icon(
                  Icons.person,
                  color: Colors.black,
                ),
                activeIcon: Icon(Icons.person, color: Colors.white),
                title: Text("Profile", style: bottomBarItemStyle))
          ],
        ),
      ),
    );
  }
}
class MovieRoute extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MovieList(),
    );
  }
}

class PhotoText extends StatefulWidget {
  @override
  PhotoTextState createState() => PhotoTextState();
}

class PhotoTextState extends State<PhotoText> {
  File imageFile;
  bool isImageLoaded = false;
  _openGallery(BuildContext context) async {
    var picture = await ImagePicker.pickImage(source: ImageSource.gallery);
    this.setState(() {
      imageFile = picture;
      isImageLoaded = true;
    });
    Navigator.of(context).pop();
  }

  _openCamera(BuildContext context) async {
    var picture = await ImagePicker.pickImage(source: ImageSource.camera);
    this.setState(() {
      imageFile = picture;
      isImageLoaded = true;
    });
    Navigator.of(context).pop();
  }

  Future<void> showChoiceDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Make a Choice!"),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  GestureDetector(
                    child: Text("Gallery"),
                    onTap: () {
                      _openGallery(context);
                    },
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                  ),
                  GestureDetector(
                    child: Text("Camera"),
                    onTap: () {
                      _openCamera(context);
                    },
                  ),
                ],
              ),
            ),
          );
        });
  }


/* FIREBASE MLKIT ZONE  */
  Future readText() async {
    FirebaseVisionImage ourImage =
        FirebaseVisionImage.fromFile(imageFile); //pickedimage = File
    TextRecognizer recognizeText = FirebaseVision.instance.textRecognizer();
    VisionText readText = await recognizeText
        .processImage(ourImage); //text ที่อ่านได้อยู่ใน readText

    for (TextBlock block in readText.blocks) {
      for (TextLine line in block.lines) {
        print(line.text);
       // sprintf(line.text);
                /*
                for (TextElement word in line.elements) {
                  print(word.text);          
                }*/
              }
            }
          }
        
          /*
          Future decode() async {
            FirebaseVisionImage ourImage = FirebaseVisionImage.fromFile(pickedImage);
            BarcodeDetector barcodeDetector = FirebaseVision.instance.barcodeDetector();
            List barCodes = await barcodeDetector.detectInImage(ourImage);
        
            for (Barcode readableCode in barCodes) {
              print(readableCode.displayValue);
            }
          }
         */
          @override
          Widget build(BuildContext context) {
            return Scaffold(
                body: Column(
              children: <Widget>[
                SizedBox(height: 100.0),
                isImageLoaded
                    ? Center(
                        child: Container(
                            height: 200.0,
                            width: 200.0,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: FileImage(imageFile), fit: BoxFit.cover))),
                      )
                    : Container(),
 
                SizedBox(height: 10.0),
                RaisedButton(
                  onPressed: () {
                    showChoiceDialog(context);
                  },
                  child: Text('Pick an image'),
                ),
                SizedBox(height: 10.0),
                RaisedButton(
                  child: Text('Read Text'),
                  onPressed: readText,
                ),
                /*
                RaisedButton(
                  child: Text('Read Bar Code'),
                  onPressed: decode,
                )*/
              ],
            ));
          }
        }