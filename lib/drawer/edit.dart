// import 'dart:io';
//
// import 'package:driver/userdata.dart';
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
//
// import 'package:shared_preferences/shared_preferences.dart';
//
// import '../screenapp/screen.dart';
//
// class Edit extends StatefulWidget {
//   @override
//   _EditState createState() => _EditState();
// }
//
// class _EditState extends State<Edit> {
//   UserData _userData = UserData(email: '', name: '', phoneNumber: '');
//   TextEditingController _nameController = TextEditingController();
//   TextEditingController _emailController = TextEditingController();
//   TextEditingController _phoneNumberController = TextEditingController();
//   @override
//   void initState() {
//     super.initState();
//     _loadDataFromPreferences();
//   }
//
//   Future<void> _loadDataFromPreferences() async {
//     final prefs = await SharedPreferences.getInstance();
//     final savedImagePath = prefs.getString('imagePath');
//     final savedName = prefs.getString('name') ?? '';
//     final savedEmail = prefs.getString('email') ?? '';
//     final savedPhoneNumber = prefs.getString('phoneNumber') ?? '';
//
//     setState(() {
//       _userData = UserData(
//         imagePath: savedImagePath,
//         name: savedName,
//         email: savedEmail,
//         phoneNumber: savedPhoneNumber,
//       );
//
//       _nameController.text = savedName;
//       _emailController.text = savedEmail;
//       _phoneNumberController.text = savedPhoneNumber;
//     });
//   }
//
//   Future<void> _updateImage(String? imagePath) async {
//     setState(() {
//       if (!mounted) {
//         return;
//       }
//
//       _userData.imagePath = imagePath;
//     });
//   }
//
//   Future<void> _updateDetails() async {
//     final prefs = await SharedPreferences.getInstance();
//     prefs.setString('name', _nameController.text);
//     prefs.setString('email', _emailController.text);
//     prefs.setString('phoneNumber', _phoneNumberController.text);
//   }
//
//   void _showSnackBar(BuildContext context) {
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(
//         content: Text('Details updated!'),
//       ),
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             InkWell(
//               onTap: () {
//                 _showImageOptionsDialog();
//               },
//               child: Container(
//                 margin: EdgeInsets.only(top: 10),
//                 padding: EdgeInsets.only(top: 0),
//                 child: CircleAvatar(
//                   backgroundImage: _userData.imagePath != null
//                       ? FileImage(File(_userData.imagePath!))
//                       : null,
//                   radius: 50,
//                   child: _userData.imagePath == null
//                       ? Icon(Icons.add_a_photo)
//                       : null,
//                 ),
//               ),
//             ),
//             Container(
//               height: 50,
//               width: double.infinity,
//               alignment: Alignment.center,
//               margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
//               decoration: const BoxDecoration(),
//               child: TextFormField(
//                 controller: _nameController,
//                 decoration: const InputDecoration(
//                     prefixIcon: Icon(Icons.person),
//                     hintText: 'Enter your Name',
//                     enabledBorder: OutlineInputBorder(
//                       borderRadius: BorderRadius.all(Radius.circular(10)),
//                       borderSide: BorderSide(color: Colors.black, width: 2),
//                     ),
//                     focusedBorder: OutlineInputBorder(
//                         borderRadius: BorderRadius.all(Radius.circular(10)),
//                         borderSide: BorderSide(color: Colors.black, width: 2))),
//               ),
//             ),
//             Container(
//               height: 50,
//               width: double.infinity,
//               alignment: Alignment.center,
//               margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
//               decoration: const BoxDecoration(),
//               child: TextFormField(
//                 controller: _nameController,
//                 decoration: const InputDecoration(
//                     prefixIcon: Icon(Icons.mail_outline_outlined),
//                     hintText: 'Enter your Gmail',
//                     enabledBorder: OutlineInputBorder(
//                       borderRadius: BorderRadius.all(Radius.circular(10)),
//                       borderSide: BorderSide(color: Colors.black, width: 2),
//                     ),
//                     focusedBorder: OutlineInputBorder(
//                         borderRadius: BorderRadius.all(Radius.circular(10)),
//                         borderSide: BorderSide(color: Colors.black, width: 2))),
//               ),
//             ),
//             Container(
//               height: 50,
//               width: double.infinity,
//               alignment: Alignment.center,
//               margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
//               decoration: const BoxDecoration(),
//               child: TextFormField(
//                 controller: _phoneNumberController,
//                 keyboardType: TextInputType.number,
//                 decoration: const InputDecoration(
//                     prefixIcon: Icon(Icons.phone),
//                     hintText: 'Enter your Phone Number',
//                     enabledBorder: OutlineInputBorder(
//                       borderRadius: BorderRadius.all(Radius.circular(10)),
//                       borderSide: BorderSide(color: Colors.black, width: 2),
//                     ),
//                     focusedBorder: OutlineInputBorder(
//                         borderRadius: BorderRadius.all(Radius.circular(10)),
//                         borderSide: BorderSide(color: Colors.black, width: 2))),
//               ),
//             ),
//             InkWell(
//               onTap: () async {
//                 _updateDetails();
//                 _showSnackBar(context);
//                 Navigator.of(context).pop();
//               },
//               child: Container(
//                   alignment: Alignment.center,
//                   margin: const EdgeInsets.symmetric(
//                     horizontal: 50,
//                     vertical: 60,
//                   ),
//                   height: 50,
//                   width: double.infinity,
//                   decoration: BoxDecoration(
//                       color: Colors.blueAccent,
//                       borderRadius: BorderRadius.circular(60)),
//                   child: const Text(
//                     "Update Profile",
//                     style: TextStyle(
//                         fontWeight: FontWeight.bold,
//                         fontSize: 20,
//                         color: Colors.white),
//                   )),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   Future<void> _showImageOptionsDialog() async {
//     await showDialog(
//       context: context,
//       builder: (context) => AlertDialog(
//         title: Text('Choose Image Source'),
//         content: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             ListTile(
//               leading: Icon(Icons.camera),
//               title: Text('Camera'),
//               onTap: () {
//                 _getImageFromCamera();
//                 Navigator.of(context).pop();
//               },
//             ),
//             ListTile(
//               leading: Icon(Icons.image),
//               title: Text('File Manager'),
//               onTap: () {
//                 _getImageFromGallery();
//                 Navigator.of(context).pop();
//               },
//             ),
//             if (_userData.imagePath != null)
//               ListTile(
//                 leading: Icon(Icons.delete),
//                 title: Text('Remove Photo'),
//                 onTap: () {
//                   _removeImage();
//                   Navigator.of(context).pop();
//                 },
//               ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   Future<void> _getImageFromCamera() async {
//     final imagePicker = ImagePicker();
//     final image = await imagePicker.pickImage(source: ImageSource.camera);
//
//     if (image != null) {
//       _updateImage(image.path);
//     }
//   }
//
//   Future<void> _getImageFromGallery() async {
//     final imagePicker = ImagePicker();
//     final image = await imagePicker.pickImage(source: ImageSource.gallery);
//
//     if (image != null) {
//       _updateImage(image.path);
//     }
//   }
//
//   Future<void> _removeImage() async {
//     _updateImage(null);
//   }
// }
import 'package:driver/drawer/myaccount.dart';
import 'package:driver/screenapp/screen.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Edit extends StatefulWidget {
  final String? initialName;
  final String? initialEmail;
  final String? initialPhone;
  final String? initialImage;

  Edit({
    this.initialName,
    this.initialEmail,
    this.initialPhone,
    this.initialImage,
  });

  @override
  State<Edit> createState() => _EditState();
}

class _EditState extends State<Edit> {
  String? _selectedImage;
  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _selectedImage = widget.initialImage;
    _nameController.text = widget.initialName ?? '';
    _emailController.text = widget.initialEmail ?? '';
    _phoneController.text = widget.initialPhone ?? '';
  }

  Future<void> _getImage(ImageSource source) async {
    final imagePicker = ImagePicker();
    final pickedFile = await imagePicker.pickImage(source: source);

    if (pickedFile != null) {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('avatar_image', pickedFile.path);

      setState(() {
        _selectedImage = pickedFile.path;
      });
    }
  }

  Future<void> _clearImage() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('avatar_image');

    setState(() {
      _selectedImage = null;
    });
  }

  Future<void> _saveData() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('name', _nameController.text);
    prefs.setString('email', _emailController.text);
    prefs.setString('phone', _phoneController.text);

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Myaccount(
          data: {
            'name': _nameController.text,
            'email': _emailController.text,
            'phone': _phoneController.text,
            'imagePath': _selectedImage,
          },
        ),
      ),
    );

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Account(
          data: {
            'name': _nameController.text,
            'email': _emailController.text,
            'phone': _phoneController.text,
            'imagePath': _selectedImage,
          },
        ),
      ),
    );
    final snackBar = SnackBar(
      content: Text('Profile Updated'),
      duration: Duration(seconds: 2),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          color: Colors.black,
          onPressed: () => Navigator.of(context).pop(),
        ),
        bottomOpacity: 0,
        elevation: 0,
        title: const Text(
          "Edit Profile",
          style: TextStyle(
            color: Colors.black,
            fontSize: 25,
          ),
        ),
      ),
      body: ListView(children: [
        CircleAvatar(
          radius: 80,
          backgroundImage:
              _selectedImage != null ? FileImage(File(_selectedImage!)) : null,
        ),
        Align(
          alignment: Alignment.center,
          child: InkWell(
            onTap: () {
              _showImageOptionsDialog();
            },
            child: Container(
              child: Icon(Icons.linked_camera_sharp),
            ),
          ),
        ),
        Container(
          height: 50,
          width: double.infinity,
          alignment: Alignment.center,
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          decoration: const BoxDecoration(),
          child: TextFormField(
            controller: _nameController,
            decoration: const InputDecoration(
                prefixIcon: Icon(Icons.person),
                hintText: 'Enter your Name',
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  borderSide: BorderSide(color: Colors.black, width: 2),
                ),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide(color: Colors.black, width: 2))),
          ),
        ),
        Container(
          height: 60,
          width: double.infinity,
          alignment: Alignment.center,
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          decoration: const BoxDecoration(),
          child: TextFormField(
            controller: _emailController,
            decoration: const InputDecoration(
                prefixIcon: Icon(Icons.mail_outline_outlined),
                hintText: 'Enter your Gmail',
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  borderSide: BorderSide(color: Colors.black, width: 2),
                ),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide(color: Colors.black, width: 2))),
          ),
        ),
        Container(
          height: 50,
          width: double.infinity,
          alignment: Alignment.center,
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          decoration: const BoxDecoration(),
          child: TextFormField(
            controller: _phoneController,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
                prefixIcon: Icon(Icons.phone),
                hintText: 'Enter your Phone Number',
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  borderSide: BorderSide(color: Colors.black, width: 2),
                ),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide(color: Colors.black, width: 2))),
          ),
        ),
        InkWell(
          onTap: _saveData,
          child: Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.symmetric(
                horizontal: 50,
                vertical: 60,
              ),
              height: 50,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Colors.blueAccent,
                  borderRadius: BorderRadius.circular(60)),
              child: const Text(
                "Update Profile",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.white),
              )),
        ),
      ]),
    );
  }

  Future<void> _showImageOptionsDialog() async {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Select an option'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ListTile(
                leading: Icon(Icons.camera),
                title: Text('Take Photo'),
                onTap: () {
                  Navigator.of(context).pop();
                  _getImage(ImageSource.camera);
                },
              ),
              ListTile(
                leading: Icon(Icons.photo_library),
                title: Text('Choose from Gallery'),
                onTap: () {
                  Navigator.of(context).pop();

                  _getImage(ImageSource.gallery);
                },
              ),
              if (_selectedImage != null)
                ListTile(
                  leading: Icon(Icons.delete),
                  title: Text('Remove Photo'),
                  onTap: () {
                    Navigator.of(context).pop();
                    _clearImage();
                  },
                ),
            ],
          ),
        );
      },
    );
  }
}
