import 'package:flutter/material.dart';
import 'package:flutter_app_bate_ponto/configuration/app_colors.dart';
import 'package:flutter_app_bate_ponto/pages/inicio_page.dart';
import 'package:flutter_app_bate_ponto/pages/para_mim_page.dart';
import 'package:flutter_app_bate_ponto/pages/ponto_page.dart';
import 'package:flutter_app_bate_ponto/widgets/third_party/adaptive_scaffold.dart';

class CustomNavigationBar extends StatefulWidget {
  const CustomNavigationBar({super.key});

  @override
  State<CustomNavigationBar> createState() => _AdaptativeNavigationBarState();
}

/*
* ADAPTATIVE NAVIGATION BAR
*/
class _AdaptativeNavigationBarState extends State<CustomNavigationBar> {
  int currentPageIndex = 0;

  static Widget _pageAtIndex(int index) {
    if (index == 0) {
      return const InicioPage();
    }

    if (index == 1) {
      return const PontoPage();
    }

    return const ParaMimPage();
  }

  _mostrarInformacoes() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Informações'),
          content: const Text(
              'Este aplicativo e um desenvolvimento de Henrique Biondo Nicolli Soares \nWhats (43) 99630-9395'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Fecha o Dialog
              },
              child: Text('Fechar'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return AdaptiveScaffold(
        title: const Row(
          children: [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(
                Icons.timelapse,
                color: AppColors.secondaryColor,
              ),
            ),
            Text(
              'Bate Ponto',
              style: TextStyle(
                  fontFamily: 'NotoSans',
                  fontWeight: FontWeight.bold,
                  color: AppColors.secondaryColor),
            ),
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
              icon: const Icon(
                Icons.info,
                color: AppColors.secondaryColor,
              ),
              onPressed: () => _mostrarInformacoes(),
            ),
          )
        ],
        currentIndex: currentPageIndex,
        destinations: const [
          AdaptiveScaffoldDestination(title: 'inicio', icon: Icons.home),
          AdaptiveScaffoldDestination(title: 'ponto', icon: Icons.access_time),
          AdaptiveScaffoldDestination(
              title: 'para mim', icon: Icons.emoji_emotions_outlined),
        ],
        body: _pageAtIndex(currentPageIndex),
        onNavigationIndexChange: (newIndex) {
          setState(() {
            currentPageIndex = newIndex;
          });
        });
  }
}
