import 'package:dab/screens/loading_recipe.dart';
import 'package:dab/screens/home_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:image_picker/image_picker.dart';
//import 'package:image_picker_for_web/image_picker_for_web.dart';
import 'dart:io';

class TakePhoto extends StatefulWidget {
  const TakePhoto({super.key});

  @override
  State<TakePhoto> createState() => _TakePhotoState();
}

class _TakePhotoState extends State<TakePhoto> {
  File? _image;
  Uint8List? webImage = Uint8List(8);
  final ImagePicker picker = ImagePicker();

/*  Future getImage(ImageSource imageSource) async {
    final XFile? pickedFile = await picker.pickImage(source: imageSource);
    if (pickedFile != null) {
      setState(() {
        _image = XFile(pickedFile.path);
      });
    }
  }
  */
  Future getImage(ImageSource imageSource) async {
    if (!kIsWeb) {
      XFile? pickedFile = await picker.pickImage(source: imageSource);
      if (pickedFile != null) {
        setState(() {
          _image = File(pickedFile.path);
        });
      } else {
        const Text('Something went wrong.');
      }
    } else {
      XFile? pickedFile = await picker.pickImage(source: imageSource);
      if (pickedFile != null) {
        var f = await pickedFile.readAsBytes();
        setState(() {
          webImage = f;
          _image = File('a');
        });
      } else {
        const Text('Something went wrong.');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return _image != null
        ? const Scaffold(body: LoadingRecipe())
        : Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.black87,
              leading: IconButton(
                icon: Icon(
                  Icons.arrow_back_ios,
                  color: Colors.white.withOpacity(0.5),
                ),
                iconSize: 35,
                onPressed: () => Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const HomeSreen())),
              ),
              actions: [
                IconButton(
                  icon: Icon(Icons.home_filled,
                      color: Colors.white.withOpacity(0.5)),
                  iconSize: 35,
                  onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const HomeSreen()),
                  ),
                ),
              ],
            ),
            body: Container(
              color: Colors.black87,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(height: 50),
                    _buildPhotoArea(),
                    const SizedBox(height: 30),
                    _buildButton(),
                    /*IconButton(
                  icon: Icon(
                    Icons.arrow_circle_right_outlined,
                    size: 45,
                    color: Colors.white.withOpacity(0.5),
                  ),
                  onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Recommendation(query: query)),
                      ).then((returnVal) {
                        if (returnVal != null) {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: const Text(''),
                              action: SnackBarAction(
                                  label: 'label', onPressed: () {})));
                        }
                      })),
                      */
                    const Expanded(child: SizedBox())
                  ],
                ),
              ),
            ),
          );
  }

  Widget _buildPhotoArea() {
    return _image != null
        ? //const LoadingRecipe()
        Container(
            alignment: Alignment.center,
            //height: 400,
            //width: double.infinity,
            width: 350,
            height: 350,
            color: Colors.black87,
            child: SpinKitFadingCube(
                color: Colors.white,
                size: 50.0,
                duration: Durations.long1,
                itemBuilder: (BuildContext context, int index) {
                  return MoveToResult();
                }))
        : Container(
            alignment: Alignment.center,
            width: 350,
            height: 350,
            color: Colors.grey,
            child: Container(
                alignment: Alignment.center,
                width: 70,
                height: 70,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.white.withOpacity(0.6),
                    width: 3,
                  ),
                ),
                child: Icon(Icons.add,
                    color: Colors.white.withOpacity(0.6), size: 50)));
  }

  Widget _buildButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
          onPressed: () {
            getImage(ImageSource.camera);
          },
          child: const Row(
            children: [
              Text('카메라',
                  style: TextStyle(
                    fontSize: 15,
                  )),
              SizedBox(width: 3),
              Icon(
                Icons.camera,
                size: 18,
              )
            ],
          ),
        ),
        const SizedBox(width: 30),
        OutlinedButton(
          style: const ButtonStyle(
            backgroundColor: MaterialStatePropertyAll(Colors.white),
            iconSize: MaterialStatePropertyAll(50),
          ),
          onPressed: () {
            getImage(ImageSource.gallery);
          },
          child: const Row(
            children: [
              Text('갤러리',
                  style: TextStyle(
                    fontSize: 15,
                  )),
              SizedBox(width: 3),
              Icon(
                Icons.filter_sharp,
                size: 18,
              )
            ],
          ),
        )
      ],
    );
  }
}
