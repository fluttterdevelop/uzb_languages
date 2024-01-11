import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:uzb_languages/generated/codegen_loader.g.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  /// Commands for running easy localization and generating code

  /// flutter pub run easy_localization:generate -o codegen_loader.g.dart -S lib/assets/strings
  /// flutter pub run easy_localization:generate -f keys -o locale_keys.g.dart -S lib/assets/strings

  runApp(EasyLocalization(
      supportedLocales: const [
        Locale('uz'),
        Locale('ru'),
        Locale('en'),
      ],
      path: 'assets/translations/',
      fallbackLocale: const Locale('uz'),
      saveLocale: true,
      assetLoader: const CodegenLoader(),
      child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Animals Names',
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List keys = [
    "rabbit",
    "dog",
    "cat",
    "horse",
    "giraffe",
    "crocodile",
    "bat",
    "cow",
    "lion",
    "bird",
    "tiger",
    "zebra",
    "fox",
    "bear",
    "elephant",
    "monkey",
    "kangaroo",
    "penguins",
    "snake",
    "dolphin",
    "cheetah",
    "hippopotamus",
    "panda",
    "wolf",
    "gorilla",
    "rhinoceros",
    "ostrich",
    "turtle",
    "octopus",
    "gazelle",
    "seagull",
    "swan",
    "polar_bear",
    "peacock",
    "porcupine",
    "camel",
    "hedgehog",
    "lemur",
    "panther",
    "parrot",
    "orangutan",
    "hyena",
    "bison",
    "armadillo",
    "platypus",
    "chipmunk",
    "jaguar",
    "sloth",
    "chameleon",
    "quokka",
    "dromedary",
    "meerkat",
    "pangolin",
    "lynx",
    "albatross",
    "raccoon",
    "dragonfly",
    "otter",
    "butterfly",
    "snail",
    "mouose",
    "crab",
    "puffin",
    "wombat",
    "fennec_fox",
    "lemming",
    "jellyfish",
    "skunk",
    "cockatoo",
    "koala",
    "weasel",
    "quail",
    "shark",
    "iguana",
    "beaver",
    "tarantula",
    "woodpecker",
    "bald_eagle",
    "manta_ray",
    "anteater",
    "walrus",
    "goldfish",
    "gopher",
    "macaw",
    "moose",
    "whale",
    "toucan",
    "rhinoceros_beetle",
    "jaguarundi",
    "sheep",
    "kookaburra",
    "pelican",
    "antelope",
  ];

  
  // List<String> imagePaths = List.generate(100, (index) => 'assets/$index.png');

  List<String> imagePaths = List.generate(100, (index) => 'assets/lion.png');

  @override
  Widget build(BuildContext context) {
    final PageController controller = PageController();

    return Builder(builder: (context) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.brown,
          title: const Text('Localization '),
        ),
        body: PageView.builder(
          controller: controller,
          itemCount: 50,
          itemBuilder: (BuildContext context, int index) {
            int imageIndex = index % imagePaths.length;
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    context.tr(keys[index]),
                    //  context.tr(widget.keys[index]),
                    // salom
                    // birinchi usul
                    // 'welcome'.tr(),

                    // 2 usuli
                    // context.tr('welcome'),

                    style: GoogleFonts.aladin(
                        backgroundColor: Colors.blue,
                        fontSize: 70,
                        fontWeight: FontWeight.w700),

                    // TextStyle(fontSize: 70, fontWeight:FontWeight.w700),
                  ),
                  Container(
                    width: 300, // Set the width of the container
                    height: 300,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                      image: AssetImage(imagePaths[imageIndex]),
                    )),
                  ),
                ],
              ),
            );
          },
        ),
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            FloatingActionButton.large(
              onPressed: () {
                context.setLocale(const Locale('uz'));
              },
              child: const Text('Uzbekcha'),
            ),
            FloatingActionButton.large(
                onPressed: () {
                  context.setLocale(const Locale('ru'));
                },
                child: const Text('Ruscha')),
            FloatingActionButton.large(
                onPressed: () {
                  context.setLocale(const Locale('en'));
                },
                child: const Text('Inglizcha')),
          ],
        ),
      );
    });
  }
}
