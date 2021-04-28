# Flutter Wiki

Welcome to Flutter Wiki we will take here about some important topics you as a developer you should do when building Flutter application.


## Table of content:
- [Flutter Best practices](#flutter-best-practices)
- [Testing](#testing)
- [State management](#state-management)
- [Dependency Injection](#dependency-inejction)
- [Shared Preferences](#shared-preferences)
- [Platform-specific code](#platform-specific-code)
- [Handling exceptions](#handling-exceptions)
- [Splash Screen](#splash-screen)
- [Localization](#localization)
- [Responsive UI](#responsive-ui)
- [Themes](#themes)
- [Navigation and routing](#navigation-and-routing)
- [Definition of Done checklist for Release](#definition-of-done-checklist-for-release)
- [Flutter Flavors](#flutter-flavors)
- [Continuous Integration/Delivery](#continuous-integration/delivery)
- [Desired App Features](#desired-app-features)
- [FAQ and resources](#faq-and-resources)
- [Top Flutter-related YouTube Channels](#top-flutter-related-youtube-channels)

## Flutter Best Practices

1. Create a file for each screen/route.
1. Page widgets need to be clean and easy to understand.
1. Try to refactor widgets into reusable widgets when possible.
1. Keep your colors and styles in a separate file.
1. Use theme when possible, instead of adding the same color to every widget.
1. Separate concerns even among widgets. remember (SOLID) ?
1. Avoid repetitive and costly work in build() methods since build() can be invoked frequently when ancestor Widgets rebuild.
1. Avoid overly large single Widgets with a large build() function. Split them into different Widgets based on encapsulation.
1. try to make each file not more than 4 Methods + your Build functions.
1. Use effects carefully, as they can be expensive. Some of them invoke saveLayer() behind the scenes, which can be a relatively expensive operation.
1. Avoid using the Opacity widget, and particularly avoid it in an animation.
1. Avoid clipping in an animation. If possible, pre-clip the image before animating it.
1. Theming your app will make it easier for you to reference the properties of your theme in other parts of your application.
1. Use `const` Widgets
   1. This is similar to caching widgets that won’t get rebuilt. Some of the widgets that can be declared as `const` include Text, Padding, and Icons

   2. ``` dart
        Container(
        child: Row(children: <Widget>[
        const Text(‘Use Const widgets’,),
        const Padding(
        padding: EdgeInsets.all(10),
        child: const Icon(Icons.date_range,)
        ),]),);
      ```

1. Remove Unused Resources
1. Try to use Stateless Widgets if you can, don't overuse stateful widgets for everything if you want to fetch some data you can do that using Stateless widget with FutureBuilder / StreamBuilder or in a provider.
1. in case you need to change Widget state you can do that using Stateless Widget with Provider without any need to use Stateful widget unless it's local state in which case StatefulWidget is the way to go.

## Testing

The more features your app has, the harder it is to test manually. Automated tests help ensure that your app performs correctly before you publish it while retaining your feature and bug-fix velocity.

### Automated testing falls into a few categories

1. A unit test tests a single function, method, or class.

1. A widget test (in other UI frameworks referred to as component test) tests a single widget -which can be a full screen since everything is a widget in flutter -.

1. An integration test tests a complete app or a large part of an app.

1. Golden test for comparing your widget/UI to a snapshot -image file- to give a percentage of pixel-perfection and whether they match or not. 

so you need to build tests for your application and the question now from where you should stare? the answer is.

1. Flutter official website  <https://flutter.dev/docs/testing>

1. Add Unit Tests to Your App <https://www.youtube.com/watch?v=h0IbAIHAwnk>
1. Flutter: Deep Dive with Widget Tests and Mockito <https://www.youtube.com/watch?v=75i5VmTI6A0>
1. Write 3X Better Unit Tests using Abstraction <https://www.youtube.com/watch?v=oZW3Eb3J9s0>
1. Mobile DevOps pipeline using Google Flutter [Arabic] <https://www.youtube.com/watch?v=_kIV3lhke8s>

## State Management

Our state management choice is Riverpod <https://pub.dev/packages/riverpod> which is a rewrite of Provider to solve its shortcomings.

Please note that the API for Riverpod can change as it didn't launch as 1.0 yet at the time of writing this.

the resources you can learn it from

1. The official documentation <https://riverpod.dev/docs/getting_started>
1. Flutter Riverpod: The Essential Guide <https://www.youtube.com/watch?v=J2iFYZUabVM>
1. State Management Like A Pro - Flutter Riverpod <https://www.youtube.com/watch?v=GVspNESSess>

1. Flutter Riverpod Tutorial - The Better Provider <https://www.youtube.com/watch?v=atwWbkBdepE>

## Dependency Injection

Dependency Injection is a very important concept in Software development and one of SOLID - D stands for Dependency Inversion - rules to write clean code the best video to under stand what is it by watching this video <https://www.youtube.com/watch?v=IKD2-MAkXyQ>

To know about it in Flutter:

**NOTE:** We use Riverpod as well for dependency injection -it really simplified DI-, the below videos are outdated but can give you a glimpse and idea about the history of dependency injection in flutter.

1. Flutter Dependency Injection For Beginners <https://www.youtube.com/watch?v=vBT-FhgMaWM>
1. Dependency Injection Principles & Meaning <https://www.youtube.com/watch?v=5bEi-F1YBUw>
1. ProxyProvider for Dependency Injection <https://www.youtube.com/watch?v=VgrK_LlQRJ4&t=1076s>
 
## Shared Preferences

If you have a relatively small collection of key-values to save, you can use the [shared_preferences](https://pub.dev/packages/shared_preferences) plugin.
and it allows you to save data even the user closed the application

### Important note

Be careful about the Data you are saving if there is any sensitive Data you must use encryption and there are many packages that allows you to do that like:

1. Flutter secure storage <https://pub.dev/packages/flutter_secure_storage>
1. Hive <https://pub.dev/packages/hive>
1. Sembast <https://pub.dev/packages/sembast>
1. XXTEA <https://pub.dev/packages/xxtea>

### How to use  Shared Preferences with Provider

You can achieve a great data support if you mixed between Shared Preferences and Provider for example you are saving user settings and want to load it before the application run or allows the user any time to change those settings life and to do that watch those resources

1. Shared Preferences In 5 Minutes <https://www.youtube.com/watch?v=uyz0HrGUamc>
1. Dynamic Persistent Theme Switcher using Provider and Shared Preferences <https://www.youtube.com/watch?v=1t5SbwHscMs>

**NOTE:** Even though we use Riverpod instead of Provider, they are really similar and the same concepts apply to both.

## Platform-specific code

In some case, if we need to use Libraries that are not available in Flutter like ID reader or any new sensors flutter provides a way to write custom code ( Swift - Java - Kotlin ) and send messages between Flutter side => native side and vice versa, here are some resources you can learn from how to do that

  1. Writing custom platform-specific code <https://flutter.dev/docs/development/platform-integration/platform-channels>

  1. Flutter - Native Platform Interactions <https://www.youtube.com/watch?v=0nJrGKyRlPQ>
  1. Implementing iOS Barometer Plugin <https://www.youtube.com/watch?v=yC7JncDNIsA>
  1. How to call platform specific code in Flutter <https://www.youtube.com/watch?v=nDPwaP4nYPk>
  1. Flutter Platform Channels @ Cross-platformxWRO <https://www.youtube.com/watch?v=OUVt9HBLvio>

  1. Using Plugins to Interface with Android or iOS  <https://www.youtube.com/watch?v=XwAHX1qTNB4>

## Handling exceptions

It's very important when writing code that depends on another resource to wrap your code with Try/Catch block and listen to that error and display meaningful information to the user, and to do that you need to do some important things

  1. Catch Flutter global red screen error
    
  2. Override the red screen error with custom error widget

Return empty container when an error happens

``` dart
void main() {
    ErrorWidget.builder = (FlutterErrorDetails details) => CustomErrorWidget();
    ...
}
```

*Or you can*

Change ErrorWidget backgroundColor and textStyle.

``` dart
import 'dart:ui' as ui;
void main() {
    RenderErrorBox.backgroundColor = Colors.transparent;
    RenderErrorBox.textStyle = ui.TextStyle(color: Colors.transparent);
}
```

Use `runZonedGuarded` to run your app and catch uncaught error, afterwards you can send send them to an error logging service like [Crashlytics](https://firebase.google.com/products/crashlytics), [Sentry](https://sentry.io/) or a custom service using REST API for example.

``` dart
runZonedGuarded(() {
    runApp(MyApp());
  }, (Object error, StackTrace stackTrace) {
    sentry.captureException(
      error,
      stackTrace: stackTrace,
    );
  });
```

## Splash Screen

there is two different splash screen

1. Native splash before the app launch which mainly will be PNG image with some background and you can check here to do that <https://flutter.dev/docs/development/ui/splash-screen/android-splash-screen>  also this video has iOS & Android <https://www.youtube.com/watch?v=BjV4RMkVY6w>
2. Flutter splash screen which is a normal screen but will be displayed for some amount of time and you can do that in many different ways
   1. if the screen is Rive (Flare) animation you can use <https://pub.dev/packages/flare_splash_screen>
   2. Make Stateful widget and inside its `initState` write a timer to move the user to the next screen

``` dart
 @override
  void initState() {
    Timer(Duration(seconds: 5), () {
        Navigator.of(context).pushReplacementNamed(Somepage.routeName);
    });
    super.initState();
  }
```

3. You can add a splash-screen for Flutter Web in the `index.html` file
``` html
<body>
  <div class="logo-container">
    <span class="helper"></span><img src="img/sadan-logo.png" class="logo" />
...
```
and style it in `styles.css` as in the following example:
``` css
body {
    min-height: 100%;
}

.logo-container {
    height: 100%;      /* Equals maximum image height */
    width: 100%;
    white-space: nowrap; /* This is required unless you put the helper span closely near the img */
    text-align: center;
    margin: 0;
}

.helper {
    display: inline-block;
    height: 80%;
    vertical-align: middle;
}

.logo {
    max-width: 18%;
    height: auto;
    vertical-align: middle;
}
```

## Localization

There are many plugins that allow you to build a powerful localized app and we prefer to use this plugin <hhttps://pub.dev/packages/easy_localization>, you can watch this video to understand how translations work in Flutter <https://www.youtube.com/watch?v=lDfbbTvq4qM> but please use the previous package with the way explained on the video

## Responsive UI

Building responsive UI is very important in the Mobile world and as Flutter expands into more platforms as there are many different sizes and screens and devices, you can do that through many ways.

  1. Using Flutter native Classes like
     1. AspectRatio
     1. CustomSingleChildLayout
     1. CustomMultiChildLayout
     1. FittedBox
     1. FractionallySizedBox
     1. LayoutBuilder
     1. MediaQuery
     1. MediaQueryData
     1. OrientationBuilder

and you can get more information from here <https://flutter.dev/docs/development/ui/layout/responsive> also there is a lot of great resources explaining how to achieve that

  1. The Best Flutter Responsive UI Pattern <https://www.filledstacks.com/post/the-best-flutter-responsive-ui-pattern/>
  1. Building a Responsive UI Architecture in Flutter <https://www.filledstacks.com/post/building-a-responsive-ui-architecture-in-flutter/>
  1. Responsive Design for flutter <https://blog.francium.tech/responsive-design-for-flutter-5c0af7a058c8>

  1. Using a package to do that <https://pub.dev/packages/responsive_builder> or <https://pub.dev/packages/responsive>

## Themes

 Themes are very important and to share colors and font styles throughout an app, use themes. You can either define app-wide themes or use Theme widgets that define the colors and font styles for a particular part of the application. In fact, app-wide themes are just Theme widgets created at the root of an app by the MaterialApp.

 you can check this link to do that <https://flutter.dev/docs/cookbook/design/themes>

 and the best way to have dynamic themes on your app by using Provider package for that you can check these videos

 1. Flutter: Dynamic Dark/Light Theme with Provider <https://www.youtube.com/watch?v=G7gV89hnooM>
 1. Flutter Tutorial - Flutter Theme <https://www.youtube.com/watch?v=ju1fr9C4g4U>

## Navigation and routing

There are many different ways to  do routing in flutter starting from the native support that Navigator object provide

  1. Navigate to a new screen and back <https://flutter.dev/docs/cookbook/navigation/navigation-basics>
  2. Navigate with named routes <https://flutter.dev/docs/cookbook/navigation/named-routes>
and for more information about others cases please check this link <https://flutter.dev/docs/development/ui/navigation>

### The best way to handle Routes

We advise you to use AutoRoute package to handle routes on your application which allows you to use the native Navigator object with more advanced ways you can check it from here <https://pub.dev/packages/auto_route> and you can watch this video for more information <https://www.youtube.com/watch?v=nyvwx7o277U>

## Definition of Done checklist for Release

As a developer how you can say the task you are working on is done? and the release is ready to publish?

1. Code Complete
1. Environments are prepared for release
1. All unit & functional tests are green
1. All the acceptance criteria are met
1. QA is done & all issues resolved
1. All “To Do” annotations must have been resolved
1. OK from the team: UX designer, developer, software architect, project manager, product owner, QA, etc.
1. Check that no unintegrated work in progress has been left in any development or staging environment.
1. Check that TDD and continuous integration is verified and working

## Flutter Flavors

Environments in Flutter called flavors which means you can make different app settings based on your environment ( Development / Production /etc. ..) to understand it please read the articles that mentioned on this link <https://flutter.dev/docs/deployment/flavors> 


This package makes flavoring easier in Dart [Flutter Flavor](https://pub.dev/packages/flutter_flavor)

Also please watch these videos:

1. MVP Architecture | Design Pattern | Dependency Injection | Flavors <https://www.youtube.com/watch?v=I2AgSDAEZSE>
1. Flutter Flavors - Separating Build Environment in Flutter <https://www.youtube.com/playlist?list=PLUiueC0kTFqLdkuj4j8FNy1qlzcI0nyCu>

## Continuous Integration/Delivery

You had to apply DevOps cycle and use CI/CD process to deliver a new version from the application you are working on and you can do that

1. Use CodeMagic platform which allows you yo deliver app easily to the test teams <https://codemagic.io/start/>

1. Use Firebase App Distribution <https://firebase.google.com/products/app-distribution>

1. Using Fastlane to upload Beta test version through the store or firebase app distribution <https://flutter.dev/docs/deployment/cd> also you can watch this video for live demo <https://www.youtube.com/watch?v=_kIV3lhke8s>

## Desired App Features

Good application means well-tested application and to do that you had to implement 2 important features in your app

1. Firebase Crashlytics to get errors and crashes log about your application <https://firebase.google.com/docs/crashlytics/get-started>

1. It's very important to implement Google Analytics in your application <https://firebase.google.com/docs/analytics>

## FAQ and resources
###  What is the best resource to get latest Flutter tools

The best resource to find Tutorials & packages & articles about Flutter is awesome flutter repo <https://github.com/Solido/awesome-flutter>

Also the [Flutter Gems website](https://fluttergems.dev/) is a good place for such tools


###  Where I can find the best resources to build UI

The best resource for Flutter UI tricks is Raja UI series repo <https://www.youtube.com/playlist?list=PLgGjX33Qsw-FIWxoI2IJf7zsHyxzuFfK5>

### Where I can find resources for clean architecture

The best resource for Flutter architecture is  <https://www.youtube.com/playlist?list=PLB6lc7nQ1n4iYGE_khpXRdJkJEp9WOech>

### Important software development resources

1. Test Driven Development <https://apiumhub.com/tech-blog-barcelona/advantages-of-test-driven-development/>

1. SOLID principles <https://apiumhub.com/tech-blog-barcelona/solid-principles/>

1. Continuous Integration <https://apiumhub.com/tech-blog-barcelona/benefits-of-continuous-integration/>

1. DOD Definition of Done <https://apiumhub.com/tech-blog-barcelona/definition-of-done-examples-software-projects/>

## Top Flutter-related YouTube Channels

1. [Flutter Official Channel](https://www.youtube.com/channel/UCwXdFgeE9KYzlDdR7TG9cMw)
1. [FilledStacks](https://www.youtube.com/channel/UC2d0BYlqQCdF9lJfydl_02Q)
1. [Code With Andrea](https://www.youtube.com/channel/UCrTnsT4OYZ53l0QGKqLeD5Q)
1. [Fireship](https://www.youtube.com/channel/UCsBjURrPoezykLs9EqgamOA)
1. [Robert Brunhage](https://www.youtube.com/channel/UCSLIg5O0JiYO1i2nD4RclaQ)
1. [React Bits (Damodar Lohani)](https://www.youtube.com/channel/UCcG2wiL2veARLHpq-I-wZGA)
1. [Raja Yogan](https://www.youtube.com/channel/UCjBxAm226XZvgrkO-JyjJgQ)
1. [Tensor Programming](https://www.youtube.com/playlist?list=PLJbE2Yu2zumDqr_-hqpAN0nIr6m14TAsd)
1. [MTECHVIRAL](https://www.youtube.com/playlist?list=PLR2qQy0Zxs_WAho9MWS1e36xF9PKLdM5w)
1. [Dahabit](https://www.youtube.com/user/h3boh3bo/)
