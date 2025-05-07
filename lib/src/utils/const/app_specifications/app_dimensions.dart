import 'package:flutter/cupertino.dart';


class AppDimensions{

 //to access the height page property and width page property
 static var pixelRatio = WidgetsBinding.instance.window.devicePixelRatio;

 //Size in physical pixels
 static var physicalScreenSize = WidgetsBinding.instance.window.physicalSize;
 static var physicalWidth = physicalScreenSize.width;
 static var physicalHeight = physicalScreenSize.height;

 //Size in logical pixels
 static var logicalScreenSize = WidgetsBinding.instance.window.physicalSize / pixelRatio;
 static var logicalWidth = logicalScreenSize.width;
 static var logicalHeight = logicalScreenSize.height;

 //for about page
 static double imageContainer = logicalHeight/2.5;

 static double mainPageFirstContainerChild1 = logicalHeight/3.65;
 static double mainPageFirstContainerChild2 = logicalHeight/6.7 ;



 //height
 double sizeHeightFor8 = 100;
 double sizeHeightFor15 = 55;
 double sizeHeightFor20 = 41;
 double sizeHeightFor30 = 27.4;
 double sizeHeightFor35 = 24;
 double sizeHeightFor40 = 20.9;
 double sizeHeightFor42 = 20;
 double sizeHeightFor50 = 16.5;
 double sizeHeightFor60 = 13.7;
 double sizeHeightFor90 = 9.15;
 double sizeHeightFor100 = 8.3;
 double sizeHeightFor120 = 6.9;//6.6
 double sizeHeightFor150 = 5.55;
 double sizeHeightFor200 = 4.15;
 double sizeHeightFor220 = 3.8;
 //30=27.4; so 35--> 24.5
 //40 = 20.9
 //width
 double sizeWidthFor90 = 4.2;
 double sizeWidthFor100 = 3.9;
 double sizeWidthFor120 = 3.25;
 double sizeWidthFor223 = 1.5;
 // double sizeWidthFor400 = MediaQuery.of(context).size.width+9;

 // height > 100
 static double heightSize500 = logicalHeight/1.6581;
 static double heightSize490 = logicalHeight/1.6920;
 static double heightSize400 = logicalHeight/2.0727;
 static double heightSize350 = logicalHeight/2.3688;
 static double heightSize300 = logicalHeight/2.7636;
 static double heightSize250 = logicalHeight/3.3163;
 static double heightSize220 = logicalHeight/3.7685;
 static double heightSize205 = logicalHeight/4.0443;
 static double heightSize180 = logicalHeight/4.6060;
 static double heightSize150 = logicalHeight/5.5272;
 static double heightSize120 = logicalHeight/6.0900;
 static double heightSize115 = logicalHeight/7.2094;
 static double heightSize114et5 = logicalHeight/7.2409;
 static double heightSize114 = logicalHeight/7.2727;
 static double heightSize113 = logicalHeight/7.3370;
 static double heightSize112 = logicalHeight/7.4025;
 static double heightSize111 = logicalHeight/7.4692;
 static double heightSize100 = logicalHeight/8.2909;

 // width >100

 static double widthSize374 = logicalWidth/1.0500;
 static double widthSize350 = logicalWidth/1.1220;
 static double widthSize228 = logicalWidth/1.7222;
 static double widthSize223 = logicalWidth/1.7611;
 static double widthSize107 = logicalWidth/3.6703;
 static double widthSize186 = logicalWidth/2.1114;
 static double widthSize185 = logicalWidth/2.1228;
 static double widthSize183 = logicalWidth/2.1460;
 static double widthSize137 = logicalWidth/2.8666;
 static double widthSize170 = logicalWidth/2.3101;
 static double widthSize165 = logicalWidth/2.3801;
 static double widthSize160 = logicalWidth/2.4545;
 static double widthSize150 = logicalWidth/2.6181;
 static double widthSize130 = logicalWidth/3.0209;
 static double widthSize100 = logicalWidth/3.9272;


//sizebox height <100

 static double sizeboxHeight90 = logicalHeight/9.2121;
 static double sizeboxHeight80 = logicalHeight/10.3636;
 static double sizeboxHeight60 = logicalHeight/13.8181;
 static double sizeboxHeight66 = logicalHeight/12.5619;
 static double sizeboxHeight55 = logicalHeight/15.0743;
 static double sizeboxHeight50 = logicalHeight/16.5818;
 static double sizeboxHeight48 = logicalHeight/17.2727;
 static double sizeboxHeight45 = logicalHeight/18.4242;
 static double sizeboxHeight40 = logicalHeight/20.7272;
 static double sizeboxHeight39 = logicalHeight/21.2567;
 static double sizeboxHeight35 = logicalHeight/23.6883;
 static double sizeboxHeight30 = logicalHeight/27.6363;
 static double sizeboxHeight25 = logicalHeight/33.1636;
 static double sizeboxHeight22 = logicalHeight/37.6859;
 static double sizeboxHeight20 = logicalHeight/41.4545;
 static double sizeboxHeight18 = logicalHeight/46.0606;
 static double sizeboxHeight17 = logicalHeight/47.7700;
 static double sizeboxHeight15 = logicalHeight/55.2727;
 static double sizeboxHeight13 = logicalHeight/63.7762;
 static double sizeboxHeight12 = logicalHeight/69.0909;
 static double sizeboxHeight10et5 = logicalHeight/78.9610;
 static double sizeboxHeight10 = logicalHeight/82.9090;
 static double sizeboxHeight9 = logicalHeight/92.1212;
 static double sizeboxHeight8 = logicalHeight/103.6363;
 static double sizeboxHeight7 = logicalHeight/118.4415;
 static double sizeboxHeight5 = logicalHeight/165.8181;
 static double sizeboxHeight4 = logicalHeight/162.00;
 static double sizeboxHeight3et5 = logicalHeight/236.8831;
 static double sizeboxHeight3 = logicalHeight/276.3636;
 static double sizeboxHeight2 = logicalHeight/414.5454;


 //sizebox  width <100


 static double sizeboxWidth90 = logicalWidth/4.3636;
 static double sizeboxWidth83 = logicalWidth/4.7316;
 static double sizeboxWidth75 = logicalWidth/5.2362;
 static double sizeboxWidth55 = logicalWidth/7.1404;
 static double sizeboxWidth50 = logicalWidth/7.8545;
 static double sizeboxWidth45 = logicalWidth/8.7272;
 static double sizeboxWidth40 = logicalWidth/9.8181;
 static double sizeboxWidth30 = logicalWidth/13.0909;
 static double sizeboxWidth20 = logicalWidth/19.636;
 static double sizeboxWidth18 = logicalWidth/21.8181;
 static double sizeboxWidth17 = logicalWidth/23.1016;
 static double sizeboxWidth15 = logicalWidth/26.1818;
 static double sizeboxWidth10 = logicalWidth/39.2722;
 static double sizeboxWidth9 = logicalWidth/43.6363;
 static double sizeboxWidth5 = logicalWidth/78.5454;
 static double sizeboxWidth7 = logicalWidth/56.1038;

}