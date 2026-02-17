//Navigator.push - позволяет добавить маршрут в стек 
//Navigator.pop - позволяет удалить маршрут и стека вызовов и вернуться назад
/// Navigator.pushReplacement - позволяет заменить текущий маршрут в стеке на новый, что не дает нам возможность вернуться назада на предыдущую страницу 
/// Navigator.pushAndRemoveUntil- позволяет добавить новый маршрут в стек и удалить предыдущие пока не будет выполнено условия(например авторизация )
///Navigator.popUntill - позволяет убрать несколько маршрутов в стеке навигации(пока не будет достигнут определенны ймаршрут)
///Navigator.maybePop - проверяет можно ли закрыть текущий маршрут(если нет то ничего не происходит)
///Navigator.canPop - порверяет можно ли удалить верхний маршрут в стеке вызовов, не закрывая приложение.
///Navigator.of - используется для доступа к текущему навигатору в контексе

import 'package:flutter/material.dart';





class NavigatorTest extends StatelessWidget {
  const NavigatorTest({super.key});

  @override
  Widget build(BuildContext context) {
    return const _FirstPage();
  }
}



class _FirstPage extends StatelessWidget {
  const _FirstPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(onPressed: () { 
        Navigator.push(context, PageRouteBuilder(pageBuilder: (context, animation, secondaryAnimation)=>_SecondPage(),
        transitionsBuilder: (
          context,
          animation,
          secondaryAnimation,
          child
        ){
   final tween = Tween<double>(begin: 0.0, end: 1.0);
      final curvedAnimation = CurvedAnimation(
        parent: animation,
        curve: Curves.easeInOut,
      );

          return ScaleTransition(scale: tween.animate(curvedAnimation), child: child,);
        }
        
        ));
       },
      child: Text('Go')),
    );
  }
}



class _SecondPage extends StatelessWidget {
  const _SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(onPressed: () { 
          Navigator.pop(context);
         },
        child: Text('go third')),
      ),
    );
  }
}

class _ThirdPage extends StatelessWidget {
  const _ThirdPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(onPressed: () { 
          Navigator.maybePop(context);
         },
        child: Text('go first')),
      ),
    );
  }
}