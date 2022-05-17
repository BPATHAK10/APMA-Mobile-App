import 'package:apma/Boxes/boxes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';

class ProfileData {
  late String name;
  late String age;
  late String gender;
  late String postalCode;
  late List<String> foodIllness;

  ProfileData(this.name, this.age, this.gender, this.postalCode, this.foodIllness);

  void display() {
    print(name);
    print(age);
    print(gender);
    print(postalCode);
    print(foodIllness);
  }

  void updateProfileData(
      String name, String age, String gender, String postalCode, foodIllness) {
    this.name = name;
    this.age = age;
    this.gender = gender;
    this.postalCode = postalCode;
    this.foodIllness = foodIllness;
  }

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

  final _foodIllnessItems = [
    MultiSelectItem("Anemia", "Anemia"),
    MultiSelectItem("Acid reflux", "Acid reflux"),
    MultiSelectItem("Celiac", "Celiac"),
    MultiSelectItem("Colitis", "Colitis"),
    MultiSelectItem("Crohn's disease", "Crohn's disease"),
    MultiSelectItem("Digestive disorders", "Digestive disorders"),
    MultiSelectItem("Eczema", "Eczema"),
    MultiSelectItem("Food allergy", "Food allergy"),
    MultiSelectItem("Food intolerance- Amines", "Food intolerance- Amines"),
    MultiSelectItem("Food intolerance- caffeine", "Food intolerance- caffeine"),
    MultiSelectItem("Food intolerance- dairy", "Food intolerance- dairy"),
    MultiSelectItem("Food intolerance- eggs", "Food intolerance- eggs"),
    MultiSelectItem("Food intolerance- fructose", "Food intolerance- fructose"),
    MultiSelectItem("Food intolerance- gluten", "Food intolerance- gluten"),
    MultiSelectItem("Food intolerance- lactose", "Food intolerance- lactose"),
    MultiSelectItem("Food intolerance- MSG", "Food intolerance- MSG"),
    MultiSelectItem("Food intolerance- salicylates", "Food intolerance- salicylates"),
    MultiSelectItem("Food intolerance- sulfites", "Food intolerance- sulfites"),
    MultiSelectItem("Food intolerance- yeast", "Food intolerance- yeast"),
    MultiSelectItem("Inflammatory Bowel Disease", "Inflammatory Bowel Disease"),
    MultiSelectItem("Irritable bowel syndromw", "Irritable bowel syndrome"),
    MultiSelectItem("Migraine & cluster headaches", "Migraine & cluster headaches"),
    MultiSelectItem("Small intestinal Bacterial Overgrowth", "Small intestinal Bacterial Overgrowth"),
  ];

  @override
  void initState() {
    super.initState();
    profileData = ProfileData('', '', '', '',[]);
    initialProfileData = ProfileData('', '', '','',[]);
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
    // print(user.toString());

    // profileData.updateProfileData(user!.name, user.age, user.gender,user.postCode);

    initialProfileData.updateProfileData(
        user!.name, user.age, user.gender, user.postCode, user.foodIllness);

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
            Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    Expanded(
                        child: Text(
                      "Food Illness",
                      style: myTextStyle,
                    )),
                    Expanded(
                        child: MultiSelectDialogField(
                      items: _foodIllnessItems,
                      title: Text("Select Food Illness"),
                      initialValue: user.foodIllness,
                      selectedColor: Colors.blue.shade200,
                      decoration: BoxDecoration(
                          color: Colors.blue.withOpacity(0.1),
                          borderRadius: BorderRadius.all(Radius.circular(40)),
                          border: Border.all(
                            color: Colors.blue,
                            width: 2,
                          )),
                      buttonIcon: Icon(
                        Icons.food_bank,
                        color: Colors.blue,
                      ),
                      buttonText: Text(
                        "Select Food Illness",
                        style: TextStyle(color: Colors.black),
                      ),
                      itemsTextStyle: TextStyle(color: Colors.black),
                      onConfirm: (results){
                        print(results);
                        profileData.foodIllness = results.map((e) => e.toString()).toList();
                      },
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
                    // ElevatedButton(
                    //   style: ElevatedButton.styleFrom(
                    //     primary: const Color(0xFF671616),
                    //     onPrimary: Colors.white,
                    //     shadowColor: Colors.redAccent,
                    //     elevation: 3,
                    //     minimumSize: const Size(100, 50),
                    //   ),
                    //   child: const Text('Cancel'),
                    //   onPressed: () {},
                    // ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: const Color(0xFF197B0C),
                        onPrimary: Colors.white,
                        shadowColor: Colors.greenAccent,
                        elevation: 3,
                        minimumSize: const Size(100, 50),
                      ),
                      child: const Text('Save'),
                      onPressed: () {
                        print("inside edit profile");
                        profileData.display();

                        profileData.name != initialProfileData.name
                            ? user.name = profileData.name
                            : user.name = initialProfileData.name;

                        profileData.age != initialProfileData.age
                            ? user.age = profileData.age
                            : user.age = initialProfileData.age;

                        profileData.gender != initialProfileData.gender
                            ? user.gender = profileData.gender
                            : user.gender = initialProfileData.gender;

                        profileData.postalCode != initialProfileData.postalCode
                            ? user.postCode = profileData.postalCode
                            : user.postCode = initialProfileData.postalCode;

                        profileData.foodIllness!= initialProfileData.foodIllness
                            ? user.foodIllness= profileData.foodIllness
                            : user.foodIllness= initialProfileData.foodIllness;


                        user.save();
                      
                      ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text(
                          'Profile details saved',
                        ),
                      ),
                    );
                      
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
