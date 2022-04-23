import 'package:flutter/material.dart';

class ProfileTab extends StatefulWidget {
  const ProfileTab({Key? key}) : super(key: key);

  @override
  State<ProfileTab> createState() => _ProfileTabState();
}

class _ProfileTabState extends State<ProfileTab> {
  final TextEditingController _controller = TextEditingController();

  final genderOptions = ["Male", "Female", "Non-binary", "Prefer not to say"];
  String? selectedGender;

  @override
  void initState() {
    super.initState();
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
            const Padding(
              padding: EdgeInsets.all(15.0),
              child: SizedBox(
                // width: MediaQuery.of(context).size.width,
                child: Text("Name",
                style: TextStyle(
                  fontSize: 30
                ),)
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                children: <Widget>[
                  Expanded(child: Text(
                    "Name",
                    style: myTextStyle,
                    )),
                  Expanded(
                      child: TextFormField(
                    // controller: _controller,
                    decoration: const InputDecoration(
    
                        border: UnderlineInputBorder(), labelText: "Enter Name"),
                  ))
                ],
              ),
            ),
            
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                children: <Widget>[
                  Expanded(child: Text("Age",style: myTextStyle,)),
                  Expanded(
                      child: TextFormField(
                    // controller: _controller,
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
                  Expanded(child: Text("Height",style: myTextStyle,)),
                  Expanded(
                      child: TextFormField(
                    // controller: _controller,
                    decoration: const InputDecoration(
                        border: UnderlineInputBorder(), labelText: "Enter Height"),
                  ))
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                children: <Widget>[
                  Expanded(child: Text("Weight",style: myTextStyle,)),
                  Expanded(
                      child: TextFormField(
                    // controller: _controller,
                    decoration: const InputDecoration(
                        border: UnderlineInputBorder(), labelText: "Enter Weight"),
                  ))
                ],
              ),
            ),
            Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(
                  children: <Widget>[
                    Expanded(child: Text("Gender",style: myTextStyle,)),
                    Expanded(
                        child: DropdownButton<String>(
                            isExpanded: true,
                            hint: const Text("Select gender"),
                            value: selectedGender,
                            onChanged: (value) =>
                                setState(() => this.selectedGender = value),
                            items: genderOptions.map(buildMenuItem).toList()))
                  ],
                )),
            Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(
                  children: <Widget>[
                    Expanded(child: Text("Postal Code",style: myTextStyle,)),
                    Expanded(
                        child: TextFormField(
                      // controller: _controller,
                      decoration: const InputDecoration(
                          border: UnderlineInputBorder(),
                          labelText: "Enter Postal code"),
                    ))
                  ],
                )
              ),
              const SizedBox(height: 20,),
              Container(
                padding: const EdgeInsetsDirectional.fromSTEB(24, 0, 24, 0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget> [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: const Color(0xFF671616),
                        onPrimary: Colors.white,
                        shadowColor: Colors.redAccent,
                        elevation: 3,
                        minimumSize: const Size(100, 50),
                      ),
                      child: const Text('Cancel'),
                      onPressed: (){
                      },
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
                      onPressed: (){
                      },
                    )
                  ]
                ),  
              ),
          ],
        ),
      ),
    );
  }
}
