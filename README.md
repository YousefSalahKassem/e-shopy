# Thawani Mobile Application

Welcome to Thawani mobile application before writing any code please read the instructions below. and for the Wiki and in details tech rules please go to [Wiki Page](https://github.com/thawani-technologies/MobileAppAlpha/blob/master/wiki.md)

## Architecture

As we use Provider as the main state management solutions on our app we had to follow Provider architecture structure and it should looks like bellow

## Folder structure

```shell
Thawani_app
├── android
├── ios
├── assets
│   └── fonts
│   └── images
│   └── animations
│   └── json
│   └── i18n
│       └── ar.json
│       └── en.json
├── lib
│   ├── screens
│       └── home_screen
│           └── index.dart
│           └── user_info.dart
│           └── slider.dart
│       └── another_screen.dart
│       └── profile_screen.dart
│   ├── widgets
│   ├── models
│   ├── repositories
│   ├── providers
│   ├── services
│   ├── helpers
│   ├── exceptions
│   ├── utils
│   └── themes
│   ├── constant
│   ├── data  // all data related files
│   │     └── local
│   │     └── remote
│   └── main.dart
└── pubspec.yaml
└── README.md
```

## Dealing with Assets

Please note that if you load all assets at once that can effect your application size

Not recommended practice

```dart
flutter:
  assets:
    - assets/images/
```

Why ?
because this means you are telling Flutter to load all assets inside this folder even if you don't use them on your code, and when you are developing your application many times you are changing your assets and may forget to delete them or add a big image that can affect your app size

Recomended

```dart
flutter:
  assets:
    - images/my_icon.png
    - images/background.png
```

## Use  S.O.L.I.D principles when you are coding

## SOLID Principles

1. Single Responsibility Principle
1. Open/Closed Principle
1. Liskov Substitution Principle
1. Interface Segregation Principle
1. Dependency Inversion Principle

## To know more about SOLID preinciples in Dart please read this [Article](https://medium.com/flutter-community/s-o-l-i-d-the-first-5-principles-of-object-oriented-design-with-dart-f31d62135b7e)

### General resources about SOLID Principles

1. [Hackernoon](https://hackernoon.com/solid-principles-made-easy-67b1246bcdf)
1. [Freecodecamp](https://medium.freecodecamp.org/my-crypto-coins-app-series-part-1-36fe781a75c1)
1. [Medium](https://medium.com/mindorks/solid-principles-explained-with-examples-79d1ce114ace)

## How to write Effective code

## Design

### *DO use terms consistently.*

Use the same name for the same thing, throughout your code. If a precedent already exists outside your API that users are likely to know, follow that precedent.

good

```Dart
    pageCount         // A field.
    updatePageCount() // Consistent with pageCount.
    toSomething()     // Consistent with Iterable's toList().
    asSomething()     // Consistent with List's asMap().
    Point             // A familiar concept.
```

bad

```Dart
    renumberPages()      // Confusingly different from pageCount.
    convertToSomething() // Inconsistent with toX() precedent.
    wrappedAsSomething() // Inconsistent with asX() precedent.
    Cartesian            // Unfamiliar to most users.
```

### *CONSIDER making the code read like a sentence.*

When in doubt about naming, write some code that uses your API, and try to read it like a sentence.

good

```Dart
    // "If errors is empty..."
    if (errors.isEmpty) ...

    // "Hey, subscription, cancel!"
    subscription.cancel();

    // "Get the monsters where the monster has claws."
    monsters.where((monster) => monster.hasClaws);
```

bad

```Dart
    // Telling errors to empty itself, or asking if it is?
    if (errors.empty) ...

    // Toggle what? To what?
    subscription.toggle();

    // Filter the monsters with claws *out* or include *only* those?
    monsters.filter((monster) => monster.hasClaws);
```

### *AVOID describing the parameters in the function’s or method’s name.*

The user will see the argument at the callsite, so it usually doesn’t help readability to also refer to it in the name itself.

good

```dart

    list.add(element);
    map.remove(key);

```

bad

```dart
    list.addElement(element)
    map.removeKey(key)

```

## For More info about language design, please [Click here](https://dart.dev/guides/language/effective-dart/design)

## Style

## Identifiers

Identifiers come in three flavors in Dart.

* `UpperCamelCase` names capitalize the first letter of each word, including
    the first.

* `lowerCamelCase` names capitalize the first letter of each word, *except*
    the first which is always lowercase, even if it's an acronym.

* `lowercase_with_underscores` use only lowercase letters, even for acronyms,
    and separate words with `_`.

### DO name types using `UpperCamelCase`

Classes, enums, typedefs, and type parameters should capitalize the first letter
of each word (including the first word), and use no separators.

good

```dart
class SliderMenu { ... }

class HttpRequest { ... }

typedef Predicate<T> = bool Function(T value);
```

This even includes classes intended to be used in metadata annotations.

good

```dart
class Foo {
  const Foo([arg]);
}

@Foo(anArg)
class A { ... }

@Foo()
class B { ... }
```

### DO name extensions using `UpperCamelCase`

Like types, extensions should capitalize the first letter of each word
(including the first word),
and use no separators.

good

```dart

extension MyFancyList<T> on List<T> { ... }

extension SmartIterable<T> on Iterable<T> { ... }
```

## DO name libraries, packages, directories, and source files using `lowercase_with_underscores`

Some file systems are not case-sensitive, so many projects require filenames to
be all lowercase. Using a separating character allows names to still be readable
in that form. Using underscores as the separator ensures that the name is still
a valid Dart identifier, which may be helpful if the language later supports
symbolic imports.

good

```dart

library peg_parser.source_scanner;

import 'file_system.dart';
import 'slider_menu.dart';
```

bad

```dart
library pegparser.SourceScanner;

import 'file-system.dart';
import 'SliderMenu.dart';
```

### DO name import prefixes using `lowercase_with_underscores`

good

```dart
import 'dart:math' as math;
import 'package:angular_components/angular_components'
    as angular_components;
import 'package:js/js.dart' as js;
```

bad

```dart
import 'dart:math' as Math;
import 'package:angular_components/angular_components'
    as angularComponents;
import 'package:js/js.dart' as JS;
```

## DO name other identifiers using `lowerCamelCase`

Class members, top-level definitions, variables, parameters, and named
parameters should capitalize the first letter of each word *except* the first
word, and use no separators.

good

```dart
var item;

HttpRequest httpRequest;

void align(bool clearItems) {
  // ...
}
```

### PREFER using `lowerCamelCase` for constant names

In new code, use `lowerCamelCase` for constant variables, including enum values.

good

```dart
const pi = 3.14;
const defaultTimeout = 1000;
final urlScheme = RegExp('^([a-z]+):');

class Dice {
  static final numberGenerator = Random();
}
```

bad

```dart
const PI = 3.14;
const DefaultTimeout = 1000;
final URL_SCHEME = RegExp('^([a-z]+):');

class Dice {
  static final NUMBER_GENERATOR = Random();
}
```

## DO capitalize acronyms and abbreviations longer than two letters like words

Capitalized acronyms can be hard to read, and
multiple adjacent acronyms can lead to ambiguous names.
For example, given a name that starts with `HTTPSFTP`, there's no way
to tell if it's referring to HTTPS FTP or HTTP SFTP.

To avoid this, acronyms and abbreviations are capitalized like regular words,
except for two-letter acronyms. (Two-letter *abbreviations* like
ID and Mr. are still capitalized like words.)

good

```dart
HttpConnectionInfo
uiHandler
IOStream
HttpRequest
Id
DB
```

bad

```dart
HTTPConnection
UiHandler
IoStream
HTTPRequest
ID
Db
```

## DON'T use a leading underscore for identifiers that aren't private

Dart uses a leading underscore in an identifier to mark members and top-level
declarations as private. This trains users to associate a leading underscore
with one of those kinds of declarations. They see "_" and think "private".

## Ordering

To keep the preamble of your file tidy, we have a prescribed order that
directives should appear in. Each "section" should be separated by a blank line.

A single linter rule handles all the ordering guidelines:

### DO place "dart:" imports before other imports

good

```dart
import 'dart:async';
import 'dart:html';

import 'package:bar/bar.dart';
import 'package:foo/foo.dart';
```

### DO place "package:" imports before relative imports

good

```dart
import 'package:bar/bar.dart';
import 'package:foo/foo.dart';

import 'util.dart';
```

### PREFER placing external "package:" imports before other imports. {#prefer-placing-third-party-package-imports-before-other-imports}

If you have a number of "package:" imports for your own package along with other
external packages, place yours in a separate section after the external ones.

good

```dart
import 'package:bar/bar.dart';
import 'package:foo/foo.dart';

import 'package:my_package/util.dart';
```

### DO specify exports in a separate section after all imports

good

```dart
import 'src/error.dart';
import 'src/foo_bar.dart';

export 'src/error.dart';
```

bad

```dart
import 'src/error.dart';
export 'src/error.dart';
import 'src/foo_bar.dart';
```

### DO sort sections alphabetically

good

```dart
import 'package:bar/bar.dart';
import 'package:foo/foo.dart';

import 'foo.dart';
import 'foo/foo.dart';
```

bad

```dart
import 'package:foo/foo.dart';
import 'package:bar/bar.dart';

import 'foo/foo.dart';
import 'foo.dart';
```

## Formatting

Like many languages, Dart ignores whitespace. However, *humans* don't. Having a
consistent whitespace style helps ensure that human readers see code the same
way the compiler does.

### DO use curly braces for all flow control statements

good

```dart

if (isWeekDay) {
  print('Bike to work!');
} else {
  print('Go dancing or read a book!');
}
```

**Exception:** When you have an `if` statement with no `else` clause and the
whole `if` statement fits on one line, you can omit the braces if you prefer:

good

```dart
if (arg == null) return defaultValue;
```

If the body wraps to the next line, though, use braces:

good

```dart
if (overflowChars != other.overflowChars) {
  return overflowChars < other.overflowChars;
}
```

bad

```dart
if (overflowChars != other.overflowChars)
  return overflowChars < other.overflowChars;
```

## For More info about Dart Style, please [Click here](https://dart.dev/guides/language/effective-dart/stylen)

## Comments

The following tips apply to comments that you don't want included in the
generated documentation.

### DO format comments like sentences

good

```dart
// Not if there is nothing before it.
if (_chunks.isEmpty) return false;
```

Capitalize the first word unless it's a case-sensitive identifier. End it with a
period (or "!" or "?", I suppose). This is true for all comments: doc comments,
inline stuff, even TODOs. Even if it's a sentence fragment.

### DON'T use block comments for documentation

good

```dart
greet(name) {
  // Assume we have a valid name.
  print('Hi, $name!');
}
```

bad

```dart
greet(name) {
  /* Assume we have a valid name. */
  print('Hi, $name!');
}
```

You can use a block comment (`/* ... */`) to temporarily comment out a section
of code, but all other comments should use `//`.

## Doc comments

Doc comments are especially handy because [dartdoc][] parses them and generates
[beautiful doc pages][docs] from them. A doc comment is any comment that appears
before a declaration and uses the special `///` syntax that dartdoc looks for.

[dartdoc]: https://github.com/dart-lang/dartdoc
[docs]: {{site.dart_api}}/{{site.data.pkg-vers.SDK.channel}}

### DO use `///` doc comments to document members and types

Using a doc comment instead of a regular comment enables [dartdoc][] to find it
and generate documentation for it.

good

```dart
/// The number of characters in this chunk when unsplit.
int get length => ...
```

bad

```dart
// The number of characters in this chunk when unsplit.
int get length => ...
```

### PREFER writing doc comments for public APIs

You don't have to document every single library, top-level variable, type, and
member, but you should document most of them.

### DO start doc comments with a single-sentence summary

Start your doc comment with a brief, user-centric description ending with a
period. A sentence fragment is often sufficient. Provide just enough context for
the reader to orient themselves and decide if they should keep reading or look
elsewhere for the solution to their problem.

good

```dart

/// Deletes the file at [path] from the file system.
void delete(String path) {
  ...
}
```

bad

```dart
/// Depending on the state of the file system and the user's permissions,
/// certain operations may or may not be possible. If there is no file at
/// [path] or it can't be accessed, this function throws either [IOError]
/// or [PermissionError], respectively. Otherwise, this deletes the file.
void delete(String path) {
  ...
}
```

### DO separate the first sentence of a doc comment into its own paragraph

Add a blank line after the first sentence to split it out into its own
paragraph. If more than a single sentence of explanation is useful, put the
rest in later paragraphs.

This helps you write a tight first sentence that summarizes the documentation.
Also, tools like Dartdoc use the first paragraph as a short summary in places
like lists of classes and members.

good

```dart
/// Deletes the file at [path].
///
/// Throws an [IOError] if the file could not be found. Throws a
/// [PermissionError] if the file is present but could not be deleted.
void delete(String path) {
  ...
}
```

bad

```dart
/// Deletes the file at [path]. Throws an [IOError] if the file could not
/// be found. Throws a [PermissionError] if the file is present but could
/// not be deleted.
void delete(String path) {
  ...
}
```

### PREFER starting function or method comments with third-person verbs

The doc comment should focus on what the code *does*.

good

```dart
/// Returns `true` if every element satisfies the [predicate].
bool all(bool predicate(T element)) => ...

/// Starts the stopwatch if not already running.
void start() {
  ...
}
```

### PREFER starting variable, getter, or setter comments with noun phrases

The doc comment should stress what the property *is*. This is true even for
getters which may do calculation or other work. What the caller cares about is
the *result* of that work, not the work itself.

good

```dart
/// The current day of the week, where `0` is Sunday.
int weekday;

/// The number of checked buttons on the page.
int get checkedCount => ...
```

### CONSIDER including code samples in doc comments

good

```dart
/// Returns the lesser of two numbers.
///
/// ```dart
/// min(5, 3) == 3
/// ```
num min(num a, num b) => ...
```

Humans are great at generalizing from examples, so even a single code sample
makes an API easier to learn.

### DO use square brackets in doc comments to refer to in-scope identifiers

If you surround things like variable, method, or type names in square brackets,
then dartdoc looks up the name and links to the relevant API docs. Parentheses
are optional, but can make it clearer when you're referring to a method or
constructor.

good

```dart
/// Throws a [StateError] if ...
/// similar to [anotherMethod()], but ...
```

To link to a member of a specific class, use the class name and member name,
separated by a dot:

good

```dart
/// Similar to [Duration.inDays], but handles fractional days.
```

The dot syntax can also be used to refer to named constructors. For the unnamed
constructor, put parentheses after the class name:

good

```dart
/// To create a point, call [Point()] or use [Point.polar()] to ...
```

### DO use prose to explain parameters, return values, and exceptions

Other languages use verbose tags and sections to describe what the parameters
and returns of a method are.

bad

```dart
/// Defines a flag with the given name and abbreviation.
///
/// @param name The name of the flag.
/// @param abbr The abbreviation for the flag.
/// @returns The new flag.
/// @throws ArgumentError If there is already an option with
///     the given name or abbreviation.
Flag addFlag(String name, String abbr) => ...
```

The convention in Dart is to integrate that into the description of the method
and highlight parameters using square brackets.

good

```dart
/// Defines a flag.
///
/// Throws an [ArgumentError] if there is already an option named [name] or
/// there is already an option using abbreviation [abbr]. Returns the new flag.
Flag addFlag(String name, String abbr) => ...
```

## For More info about language documentation, please [Click here](https://dart.dev/guides/language/effective-dart/documentation)
