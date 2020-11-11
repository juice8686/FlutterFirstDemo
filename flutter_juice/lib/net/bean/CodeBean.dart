class CodeBean {
    int data;
    int state;
    Null errorCode;
    Null errorMsg;

    CodeBean({this.data, this.state, this.errorCode, this.errorMsg});

    CodeBean.fromJson(Map<String, dynamic> json) {
    data = json['data'];
    state = json['state'];
    errorCode = json['errorCode'];
    errorMsg = json['errorMsg'];
    }

    Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['data'] = this.data;
    data['state'] = this.state;
    data['errorCode'] = this.errorCode;
    data['errorMsg'] = this.errorMsg;
    return data;
    }

    @override
  String toString() {
    return 'CodeBean{data: $data, state: $state, errorCode: $errorCode, errorMsg: $errorMsg}';
  }
}