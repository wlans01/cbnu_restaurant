import 'package:flutter/material.dart';

class Signup extends StatefulWidget {
  @override
  _Signup createState() => _Signup();
}

class _Signup extends State<Signup> {
  final formKey = GlobalKey<FormState>();

  String? _phone;
  String? _authenticationNumber;

  void validateAndSave() {
    final form = formKey.currentState;
    if (form!.validate()) {
      form.save();
      print(
          'Form is valid Email: $_phone, AuthenticationNumber: $_authenticationNumber');
      Navigator.pop(context);
    } else {
      print(
          'Form is invalid Email: $_phone, AuthenticationNumber: $_authenticationNumber');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('login demo'),
      ),
      body: Container(
        padding: EdgeInsets.all(50),
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(
                  labelText: '전화번호',
                ),
                keyboardType: TextInputType.phone,
                textInputAction: TextInputAction.next,
                validator: (value) {
                  if (value!.isEmpty) {
                    return '빈칸 놉';
                  } else {
                    var pattern = r'[0-9]{11}$';
                    RegExp regExp = RegExp(pattern);
                    if (!regExp.hasMatch(value)) {
                      return '형식에 맞는 번호입력';
                    } else {
                      return null;
                    }
                  }
                },
                onSaved: (value) => _phone = value!,
              ),
              ElevatedButton(
                style:
                    ElevatedButton.styleFrom(primary: Colors.indigo.shade300),
                child: Text(
                  '인증번호받기',
                  style: TextStyle(fontSize: 25.0),
                ),
                onPressed: validateAndSave,
              ),
              TextFormField(
                obscureText: true,
                decoration: InputDecoration(labelText: '인증번호'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return '빈칸 놉';
                  } else {
                    var pattern =
                        r'^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?~^<>,.&+=])[A-Za-z\d$@$!%*#?~^<>,.&+=]{8,15}$';
                    RegExp regExp = RegExp(pattern);
                    if (!regExp.hasMatch(value)) {
                      return '특수문자, 대소문자, 숫자 포함 8자 이상 15자 이내로 입력하세요.';
                    } else {
                      return null;
                    }
                  }
                },
                onSaved: (value) => _authenticationNumber = value!,
              ),
              ElevatedButton(
                style:
                    ElevatedButton.styleFrom(primary: Colors.indigo.shade300),
                child: Text(
                  '확인',
                  style: TextStyle(fontSize: 25.0),
                ),
                onPressed: validateAndSave,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
