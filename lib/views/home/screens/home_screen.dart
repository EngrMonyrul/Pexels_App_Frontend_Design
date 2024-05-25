import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:ncc/common/extensions/context_ext.dart';
import 'package:ncc/common/widgets/loading/loading_widget_screen.dart';
import 'package:pexels_services/pexels_services.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  /*-------------------> method <-------------------*/
  void loadingScreen() async {
    final photosProvider = context.read<PhotosProvider>();
    photosProvider.setLoading(value: true);
    showLoadingDialog(context: context);
    await photosProvider.setPerPage().then((_) {
      photosProvider.setLoading(value: false);
      Navigator.pop(context);
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      loadingScreen();
    });
    super.initState();
  }

  /*-------------------> builder method <-------------------*/
  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    final screenSize = context.screenSize;
    return Scaffold(
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              width: double.infinity,
              height: screenSize.height * .5,
              color: Colors.blue,
            ),
            Positioned(
              top: screenSize.height * .45,
              bottom: 0,
              left: 0,
              right: 0,
              child: SingleChildScrollView(
                child: Container(
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(20),
                      topLeft: Radius.circular(20),
                    ),
                  ),
                  child: Column(
                    children: [
                      const Text("data"),
                      const Text("data"),
                      const Text("data"),
                      const Text("data"),
                      SingleChildScrollView(
                        child: Expanded(
                          child: ListView.builder(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: 100,
                            itemBuilder: (context, index) {
                              return const Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 20),
                                child: Text("Hello"),
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
