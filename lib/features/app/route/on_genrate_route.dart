import 'package:chat_generator/features/app/app_conts/page_const.dart';
import 'package:chat_generator/features/text_completion/presentation/pages/text_compeletion_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class OnGenerateRoute{
  static Route<dynamic> route(RouteSettings setting){
    final args = setting.arguments;
    switch(setting.name){
      case "/" :
        {
          return materialBuilder(
            widget: ErrorPage(),
          );
        }
      case PageConst.textGenerationPage:
        {
          return materialBuilder(
            widget: TextGenerationPage(),
          );
        }
      default:
        return materialBuilder(
          widget : ErrorPage(),
        );
    }
  }
}
class ErrorPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Error"),
      ),
      body: Center(
        child: Text("Error"),
      ),
    );
  }
}

MaterialPageRoute materialBuilder({required Widget widget}){
  return MaterialPageRoute(builder: (_) => widget);
}