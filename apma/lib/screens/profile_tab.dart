import 'package:apma/Boxes/boxes.dart';
import 'package:apma/models/pain_model.dart';
import 'package:apma/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfileData {
  late String name;
  late String age;
  late String gender;
  late String postalCode;

  ProfileData(this.name, this.age, this.gender, this.postalCode);

  void display() {
    print(name);
    print(age);
    print(gender);
    print(postalCode);
  }

  void updateProfileData(
      String name, String age, String gender, String postalCode) {
    this.name = name;
    this.age = age;
    this.gender = gender;
    this.postalCode = postalCode;
  }

  // void updateName(String? name) {
  //   this.name = name;
  // }

  // void updateAge(String? age) {
  //   this.age = age;
  // }

  // void updateGender(String? gender) {
  //   this.gender = gender;
  // }

  // void updatePostalCode(String? postalCode) {
  //   this.postalCode = postalCode;
  // }
}

class ProfileTab extends StatefulWidget {
  const ProfileTab({Key? key}) : super(key: key);

  @override
  State<ProfileTab> createState() => _ProfileTabState();
}

class _ProfileTabState extends State<ProfileTab> {
  // bool isEdit = false;
  late ProfileData profileData;
  late ProfileData initialProfileData;

  // final TextEditingController _nameController = TextEditingController();

  final genderOptions = ["Male", "Female", "Non-binary", "Prefer not to say"];
  String? selectedGender;

  @override
  void initState() {
    super.initState();
    profileData = ProfileData('', '', '', '');
    initialProfileData = ProfileData('', '', '', '');
    // _nameController.text = "";

    // _controller.addListener(() {

    // })
  }

  DropdownMenuItem<String> buildMenuItem(String item) => DropdownMenuItem(
        value: item,
        child: Text(
          item,
        ),
      );

  TextStyle myTextStyle = const TextStyle(
    fontSize: 15,
    // fontWeight: FontWeight.bold,
  );

  @override
  Widget build(BuildContext context) {
    final _userEmail = Provider.of<String>(context, listen: false);

    final user = Boxes.getUsers().get(_userEmail);
    print(user.toString());
    
    profileData.updateProfileData(user!.name, user.age, user.gender,user.postCode);
    
    initialProfileData.updateProfileData(user.name, user.age, user.gender,user.postCode);
    print("initial profile data is::");
    initialProfileData.display();

    // profileData.updateProfileData(
    //     user?.name, user?.age, user?.gender, user?.postCode);

    // print("inside build");
    // profileData.display();

    // selectedGender  = initialProfileData.gender;

    return SingleChildScrollView(
      child: Center(
        child: Column(
          children: <Widget>[
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              // width: MediaQuery.of(context).size.width,
              child: CircleAvatar(
                  radius: 50.0,
                  backgroundColor: Colors.white,
                  child: Image.asset('assets/images/avatar_default.png')),
            ),
            Padding(
              padding: EdgeInsets.all(15.0),
              child: SizedBox(
                  // width: MediaQuery.of(context).size.width,
                  child: Text(
                _userEmail,
                style: TextStyle(fontSize: 30),
              )),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                children: <Widget>[
                  Expanded(
                      child: Text(
                    "Name",
                    style: myTextStyle,
                  )),
                  Expanded(
                      child: TextFormField(
                    initialValue: initialProfileData.name,
                    validator: (value) {
                      if (value == null) {
                        return 'Please enter your name';
                      }
                      return null;
                    },
                    // controller: _nameController,
                    onChanged: (value) => profileData.name = value,
                    decoration: const InputDecoration(
                        border: UnderlineInputBorder(),
                        labelText: "Enter Name"),
                  ))
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                children: <Widget>[
                  Expanded(
                      child: Text(
                    "Age",
                    style: myTextStyle,
                  )),
                  Expanded(
                      child: TextFormField(
                    initialValue: initialProfileData.age,
                    onChanged: (value) {
                      profileData.age = value;
                    },
                    decoration: const InputDecoration(
                        border: UnderlineInputBorder(), labelText: "Enter Age"),
                  ))
                ],
              ),
            ),
            Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(
                  children: <Widget>[
                    Expanded(
                        child: Text(
                      "Gender",
                      style: myTextStyle,
                    )),
                    Expanded(
                        child: DropdownButton<String>(
                            isExpanded: true,
                            hint: const Text("Select gender"),
                            value: selectedGender,
                            onChanged: (value) {
                              profileData.gender = value!;
                              setState(() {
                                selectedGender = value;
                              });
                            },
                            items: genderOptions.map(buildMenuItem).toList()))
                  ],
                )),
            Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(
                  children: <Widget>[
                    Expanded(
                        child: Text(
                      "Postal Code",
                      style: myTextStyle,
                    )),
                    Expanded(
                        child: TextFormField(
                      initialValue: initialProfileData.postalCode,
                      onChanged: (value) => profileData.postalCode = value,
                      decoration: const InputDecoration(
                          border: UnderlineInputBorder(),
                          labelText: "Enter Postal code"),
                    ))
                  ],
                )),
            const SizedBox(
              height: 20,
            ),
            Container(
              padding: const EdgeInsetsDirectional.fromSTEB(24, 0, 24, 0),
              child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: const Color(0xFF671616),
                        onPrimary: Colors.white,
                        shadowColor: Colors.redAccent,
                        elevation: 3,
                        minimumSize: const Size(100, 50),
                      ),
                      child: const Text('Cancel'),
                      onPressed: () {},
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: const Color(0xFF197B0C),
                        onPrimary: Colors.white,
                        shadowColor: Colors.greenAccent,
                        elevation: 3,
                        minimumSize: const Size(100, 50),
                      ),
                      child: const Text('Done'),
                      onPressed: () {
                        print("inside edit profile");
                        profileData.display();

                        profileData.name != initialProfileData.name ?
                          user.name = profileData.name
                          :
                          user.name = initialProfileData.name;

                        profileData.age != initialProfileData.age ?
                          user.age = profileData.age
                          :
                          user.age = initialProfileData.age;
                        
                        profileData.gender != initialProfileData.gender ?
                          user.gender = profileData.gender
                          :
                          user.gender = initialProfileData.gender;
                        profileData.postalCode != initialProfileData.postalCode ?
                          user.gender = profileData.gender
                          :
                          user.gender = initialProfileData.gender;

                        user.save();
                      },
                    )
                  ]),
            ),
          ],
        ),
      ),
    );
  }
}
