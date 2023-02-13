import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class PageConvert extends StatefulWidget {
  PageConvert({Key? key}) : super(key: key);

  @override
  _PageConvertState createState() => _PageConvertState();
}

class _PageConvertState extends State<PageConvert> {
  TextEditingController input_loan_value = TextEditingController();
  TextEditingController input_loan_month = TextEditingController();
  TextEditingController input_loan_interest = TextEditingController();

  double result_bth = 0.00;
  String display_result_bth = "0.00";

  Widget ImageLogo() {
    return Container(
      width: 80,
      height: 130,
      child: Center(
        child: Image.asset("images/loan.png"),
      ),
      margin: EdgeInsets.fromLTRB(0, 30, 0, 10),
    );
  }

  Widget AppName() {
    return Container(
      child: Center(
        child: Text(
          "คำนวณเงินกู้",
          style: TextStyle(
              fontFamily: 'Roboto',
              fontSize: 25,
              fontWeight: FontWeight.w900,
              color: Color.fromRGBO(90, 100, 49, 0.8)),
        ),
      ),
      margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
    );
  }

  Widget DevName() {
    return Container(
      child: Center(
        child: Text(
          "By Phatcharinphon Saowiang",
          style: TextStyle(
              fontFamily: 'Roboto',
              fontSize: 18,
              fontWeight: FontWeight.w400,
              color: Color.fromRGBO(90, 100, 49, 0.8)),
        ),
      ),
      margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
    );
  }

//จำนวนเงินกู้
  Widget LOANValue() {
    return Container(
      child: TextFormField(
        controller: input_loan_value,
        decoration: InputDecoration(
            labelText: "Loan Amount",
            hintText: "จำนวนเงินที่ต้องการกู้ (บาท)",
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(10.0))),
      ),
      margin: EdgeInsets.fromLTRB(50, 10, 50, 0),
    );
  }

//เดือน
  Widget LOANAmount() {
    return Container(
      child: TextFormField(
        controller: input_loan_month,
        decoration: InputDecoration(
            labelText: "Month",
            hintText: "จำนวนเดือนของการกู้ยืม",
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(10.0))),
      ),
      margin: EdgeInsets.fromLTRB(50, 10, 50, 0),
    );
  }

//ดอกเบี้ย
  Widget InterestAmount() {
    return Container(
      child: TextFormField(
        controller: input_loan_interest,
        decoration: InputDecoration(
            labelText: "Interest",
            hintText: "อัตราดอกเบี้ย %",
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(10.0))),
      ),
      margin: EdgeInsets.fromLTRB(50, 10, 50, 0),
    );
  }

//ปุ่มคำวณ
  Widget ButtonCovert() {
    return Container(
      child: Center(
        child: RaisedButton(
          color: Colors.blue,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(18.0)),
          child: Text(
            "คำนวณ",
            style: TextStyle(
                fontSize: 16, color: Color.fromRGBO(255, 255, 255, 1)),
          ),
          padding: EdgeInsets.fromLTRB(40, 20, 40, 20),
          onPressed: () {
            setState(() {
              print("Click Me");
              print(input_loan_value.text);
              print(input_loan_month.text);
              print(input_loan_interest.text);

              //----คำนวณดอกเบี้ย
              var loan_balance = (double.parse(input_loan_value.text) /
                  double.parse(input_loan_month.text));
              var loan_tax =
                  loan_balance * (double.parse(input_loan_interest.text) / 100);
              result_bth = loan_balance + loan_tax;

              //----คำนวณเงินที่ต้องชำระแต่ละงวด
              var total = ((double.parse(input_loan_value.text) + result_bth) / double.parse(input_loan_month.text));         
              display_result_bth =
                  NumberFormat("#,###,000.00 บาท").format(total);
              print(loan_balance);
              print(loan_tax);
              print(result_bth);
              print(display_result_bth);
              print(total);
            });
          },
        ),
      ),
      margin: const EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 20.0),
    );
  }

  Widget ResultConvert() {
    return Container(
      child: Center(
        child: Text(
          "จำนวนเงินที่ต้องชำระ/เดือน : " + display_result_bth.toString(),
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
        ),
      ),
      margin: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 10.0),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ILOAN"),
      ),
      body: SafeArea(
        child: Center(
          child: ListView(
            children: [
              ImageLogo(),
              AppName(),
              DevName(),
              LOANValue(),
              LOANAmount(),
              InterestAmount(),
              ButtonCovert(),
              ResultConvert(),
            ],
          ),
        ),
      ),
    );
  }
}
