import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _isColor = false;
  bool _isWidthExpanded = false;
  bool _isRotation = false;
  bool _isTransition = false;
  bool _isScale = false;
  bool _isSkew = false;
  bool _isTransitionAndScale = false;

  double _rotationValue = 0;
  double _translationValue = 0;
  double _scaleValue = 1;
  double _combinationScaleValue = 1;
  double _combinationTranslationValue = 0;

  double _skewValue = 0;

  double _width = 0;
  double _height = 0;




  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(onPressed: _onTap),
        body: Center(
          child: SingleChildScrollView(
            // padding: EdgeInsets.symmetric(horizontal: 160),
            child: Column(
              children: [
                SizedBox(width: double.infinity, height: 20,),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _isColor = !_isColor;
                    });
                  },
                  child: AnimatedContainer(
                    color: _isColor == false ? Colors.yellow : Colors.red,
                    width: 100,
                    height: 100,
                    duration: Duration(seconds: 1),
                    child: Center(child: Text("色変更")),
                  ),
                ),
                SizedBox(width: double.infinity, height: 20,),
                GestureDetector(
                  onTap: (){
                    setState(() {
                      _isWidthExpanded = !_isWidthExpanded;
                    });
                  },
                  child: AnimatedContainer(
                    color: Colors.blue,
                    width: _isWidthExpanded == false ? 100 : 200,
                    height:  100,
                    duration: Duration(seconds: 1),
                    child: Center(child: Text("横幅変更")),
                  ),
                ),
                // GestureDetector(
                //   onTap: (){
                //     setState(() {
                //       _isGo = !_isGo;
                //     });
                //   },
                //   child: AnimatedContainer(
                //
                //     color: Colors.blue,
                //     width: 100 ,
                //     height:  100,
                //     duration: Duration(seconds: 1),
                //     child: Center(child: Text("GOTOLEFT")),
                //   ),
                // ),
                SizedBox(width: double.infinity, height: 20,),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _isRotation = !_isRotation;
                      _isRotation ? _rotationValue = 1 : _rotationValue = 0;
                      // _rotationValue = 40;
                    });
                  },
                  child: AnimatedContainer(
                    color: Colors.blueAccent,
                    width: 100,
                    height: 100,
                    duration: Duration(seconds: 1),
                    // transform: Matrix4.rotationX(_isColor == false ? 0 : 40), //横軸に回転
                    // transform: Matrix4.rotationY(_isColor == false ? 0 : 40), //縦軸に回転
                    transform: Matrix4.rotationZ(_rotationValue),
                    // transform: Matrix4.rotationZ(_rotationValue),
                    //斜め軸に回転
                    child: Center(child: Text("回転（Rotation）")),
                  ),
                ),
                SizedBox(width: double.infinity, height: 20,),
                GestureDetector(
                  onTap: (){
                    setState(() {
                      _isSkew = !_isSkew;
                      _isSkew ? _translationValue = 40 : _translationValue = 0;
                      // _translationValue = 40;
                    });
                  },
                  child: AnimatedContainer(
                    color: Colors.blueAccent,
                    width: 100 ,
                    height:  100,
                    duration: Duration(seconds: 1),
                    transform: Matrix4.translationValues(_translationValue, _translationValue, 0), //(x, y, z)の座標に移動
                    child: Center(child: Text("移動(translation)")),
                  ),
                ),
                SizedBox(width: double.infinity, height: 20,),
                GestureDetector(
                  onTap: (){
                    setState(() {
                      _isSkew = !_isSkew;
                      _isSkew ? _skewValue = 10 : _skewValue = 0;
                      // _skewValue = 10;
                    });
                  },
                  child:  AnimatedContainer(
                      width: 100,
                      height: 100,
                      color: Colors.blueAccent,
                      duration: Duration(seconds: 1),
                      transform: Matrix4.skewX(_skewValue), //(x, y, z)の座標に拡大縮小、_scaleValueは0だと機能しない
                    child: Center(child: Text("斜め(Skew)")),
                  ),
                ),
                SizedBox(width: double.infinity, height: 20,),
                GestureDetector(
                  onTap: (){
                    setState(() {
                      _isScale = !_isScale;
                      _isScale ? _scaleValue = 1.5 : _scaleValue = 1.0;
                      // _scaleValue = 1.5;
                    });
                  },
                  child:  AnimatedContainer(
                    width: 100,
                    height: 100,
                    color: Colors.blueAccent,
                    duration: Duration(seconds: 1),
                    transform: Matrix4.diagonal3Values(_scaleValue, _scaleValue, 1) ,//(x, y, z)の座標に拡大縮小、_scaleValueは0だと機能しない。何倍に増やすか減らすか
                    child: Center(child: Text("拡大(Scale)")),

                  ),
                ),
                SizedBox(width: double.infinity, height: 20,),
                GestureDetector(
                  onTap: (){
                    setState(() {
                      _isTransitionAndScale = !_isTransitionAndScale;
                      _isTransitionAndScale ? _combinationTranslationValue = 40 : _combinationTranslationValue = 0;
                      _isTransitionAndScale ? _combinationScaleValue = 2 : _combinationScaleValue = 1;
                      // _translationValue = 40;
                    });
                  },
                  child: AnimatedContainer(
                    color: Colors.blueAccent,
                    width: _width,
                    // width: 100,
                    height:  _height,
                    // height:  100,
                    duration: Duration(milliseconds: 1200),
                    // duration: Duration(seconds: 1),
                    transform: Matrix4.translationValues(_combinationTranslationValue, _combinationTranslationValue, 0)..scale(_combinationScaleValue,_combinationScaleValue,1), //(x, y, z)の座標に移動
                    child: Center(child: Text("Fabで大きさ０から拡大移動(translation_scale)")),
                  ),
                ),
                GestureDetector(
                  onTap: (){
                    setState(() {
                      _isTransitionAndScale = !_isTransitionAndScale;
                      _isTransitionAndScale ? _combinationTranslationValue = 40 : _combinationTranslationValue = 0;
                      _isTransitionAndScale ? _combinationScaleValue = 2 : _combinationScaleValue = 1;
                      // _translationValue = 40;
                    });
                  },
                  child: AnimatedContainer(
                    color: Colors.blueAccent,
                    // width: _width,
                    width: 100,
                    // height:  _height,
                    height:  100,
                    duration: Duration(milliseconds: 200),
                    // duration: Duration(seconds: 1),
                    transform: Matrix4.translationValues(_combinationTranslationValue, _combinationTranslationValue, 0)..scale(_combinationScaleValue,_combinationScaleValue,1), //(x, y, z)の座標に移動
                    child: Center(child: Text("移動＋拡大(translation_scale)")),
                  ),
                ),
                Container(height: 100,),
                // GestureDetector(
                //   onTap: (){
                //     setState(() {
                //       _isTransitionAndScale = !_isTransitionAndScale;
                //       _isTransitionAndScale ? _combinationTranslationValue = 40 : _combinationTranslationValue = 0;
                //       _isTransitionAndScale ? _combinationScaleValue = 2 : _combinationScaleValue = 1;
                //       // _translationValue = 40;
                //     });
                //   },
                //   child: AnimatedContainer(
                //     color: Colors.blueAccent,
                //     width: 100 ,
                //     height:  100,
                //     duration: Duration(milliseconds: 200),
                //     // duration: Duration(seconds: 1),
                //     transform: Matrix4.translationValues(_combinationTranslationValue, _combinationTranslationValue, 0)..scale(_combinationScaleValue,_combinationScaleValue,1), //(x, y, z)の座標に移動
                //     child: Container(
                //       height: 20,
                //       width: 20,
                //       color: Colors.green
                //     ),
                //   ),
                // ),
                SizedBox(height: 500,)
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _onTap() {
    setState(() {
      _width = 100;
      _height = 100;
      _isTransitionAndScale = !_isTransitionAndScale;
      _isTransitionAndScale ? _combinationTranslationValue = 40 : _combinationTranslationValue = 0;
      _isTransitionAndScale ? _combinationScaleValue = 2 : _combinationScaleValue = 1;
      // _translationValue = 40;
    });
  }
}
