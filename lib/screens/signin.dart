import 'package:flutter/material.dart';
import 'package:cbnu_restaurant/store/store.dart';
import 'package:provider/provider.dart';



class Signin extends StatefulWidget {
  @override
  _Signin createState() => _Signin();
}

class _Signin extends State<Signin> {
  final formKey = GlobalKey<FormState>();

  String? _phone;
  String? _password;

  void validateAndSave() {
    final form = formKey.currentState;
    if (form!.validate()) {
      form.save();
      print('Form is valid Email: $_phone, password: $_password');
      Navigator.pop(context);
    } else {
      print('Form is invalid Email: $_phone, password: $_password');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('로그인'),
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
                    return '빈칸 안된다';
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
              TextFormField(
                obscureText: true,
                decoration: InputDecoration(labelText: '비밀번호'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return '빈칸 안된다';
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
                onSaved: (value) => _password = value!,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: (){ print('awdawd');},
                    child: Text('비밀번호찾기'),
                  ),
                ],
              ),
              ElevatedButton(
                style:
                    ElevatedButton.styleFrom(primary: Colors.indigo.shade300),
                child: Text(
                  '로그인',
                  style: TextStyle(fontSize: 25.0),
                ),
                onPressed: validateAndSave,
              ),
              ElevatedButton(
                style:
                    ElevatedButton.styleFrom(primary: Colors.indigo.shade300),
                child: Text(
                  '임시 로그인',
                  style: TextStyle(fontSize: 25.0),
                ),
                onPressed: () {
                  context.read<Store>().currentLogin(true);
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
