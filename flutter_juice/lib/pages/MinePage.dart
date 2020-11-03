import 'package:flutter/material.dart';
class MinePage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new MinePageState();
  }

}

class MinePageState extends State<MinePage>{

  var userName = new TextEditingController(); //初始化给表单赋值
  var password;
  var flag = true;
  var sex = 1;
  @override
  void initState() {
    super.initState();
    userName.text = '我是初始值';
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: <Widget>[
        TextField(
          maxLines: 4, //设置多行文本框
          // obscureText: true, //设置密码框
          decoration: InputDecoration(
              icon: Icon(Icons.add_circle), //左边icon
              hintText: "请输入账号", //占位
              border: OutlineInputBorder(), //边框
              labelText: "账号"),
          controller: this.userName, //初始化的时候给表单赋值
        ),
        TextField(
          decoration: InputDecoration(
            hintText: "请输入密码",
          ),
          // 监听文本框的值变化
          onChanged: (value) {
            setState(() {
              this.password = value;
            });
          },
        ),
        SizedBox(height: 10),
        Checkbox(
            value: this.flag,
            activeColor: Colors.green, //选中颜色
            onChanged: (value) {
              setState(() {
                this.flag = value;
              });
            }),
        // 多个复选框
        CheckboxListTile(
            value: this.flag,
            activeColor: Colors.blueGrey, //选中颜色
            title: Text("标题"),
            subtitle: Text("二级标题"),
            secondary: Icon(Icons.help),
            onChanged: (value) {
              setState(() {
                this.flag = value;
              });
            }),
        Divider(),
        Row(
          children: <Widget>[
            Text("男"),
            Radio(
              value: 1,
              onChanged: (value) {
                setState(() {
                  this.sex = value;
                });
              },
              groupValue: this.sex,
            ),
            Text("女"),
            Radio(
              value: 2,
              onChanged: (value) {
                setState(() {
                  this.sex = value;
                });
              },
              groupValue: this.sex,
            ),
          ],
        ),

        RadioListTile(
          value: 1,
          activeColor: Colors.red, //选中颜色
          title: Text("标题"),
          subtitle: Text("二级标题"),
          onChanged: (value) {
            setState(() {
              this.sex = value;
            });
          },
          groupValue: this.sex,
        ),
        RadioListTile(
          value: 2,
          activeColor: Colors.red, //选中颜色
          title: Text("标题"),
          subtitle: Text("二级标题"),
          secondary: Image.network(
              "http://sucai.suoluomei.cn/sucai_zs/images/20200226173152-1.jpg"),
          onChanged: (value) {
            setState(() {
              this.sex = value;
            });
          },
          groupValue: this.sex,
        ),

        Switch(
          value: this.flag,
          onChanged: (value) {
            setState(() {
              this.flag = value;
            });
          },
        ),
        Container(
          width: double.infinity,
          height: 50,
          child: RaisedButton(
            color: Colors.blue,
            textColor: Colors.white,
            child: Text("登录"),
            onPressed: () {
              // 获取输入的值
              print(this.password);
            },
          ),
        )
      ],
    );
  }
}