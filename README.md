# Definex Languagex Project

A Languagex project created in flutter using Provider.

## How to Use

**Step 1:**

Go to project root and execute the following command in console to get the required dependencies:

```
flutter pub get 
```

**Step 2:**

This project uses `inject` library that works with code generation, execute the following command to generate files:

```
flutter packages pub run build_runner build --delete-conflicting-outputs
```

or watch command in order to keep the source code synced automatically:

```
flutter packages pub run build_runner watch
```

**Step 3:**

This project uses the "inject" library that works with code generation, follow the steps below to generate the files:

don't forget to run this command before this file is created: 

``` 
flutter packages pub run build_runner build --delete-conflicting-outputs 
``` 

go to service_api.g.dart and replace the all line
``` 
final _data = body; 
```
to
``` 
final _data = JsonMapper.serialize(body); 
``` 

!!!Remember, you must do this again after running the build_runner command!!! 

!!!Do not forget to run the build_runner code after making changes under the services folder!!!

## Hide Generated Files

In-order to hide generated files, navigate to `Android Studio` -> `Preferences` -> `Editor` -> `File Types` and paste the below lines under `ignore files and folders` section:

```
*.inject.summary;*.inject.dart;*.g.dart;.Rgr.dart;
```

In Visual Studio Code, navigate to `Preferences` -> `Settings` and search for `Files:Exclude`. Add the following patterns:
```
**/*.inject.summary
**/*.inject.dart
**/*.g.dart
**/*.gr.dart
```

### Folder Structure
Here is the core folder structure which flutter provides.

```
flutter-app/
|- .vscode
|- android
|- assets
|- ios
|- lib
```

Here is the folder structure we have been using in this project

```
lib/
|- core/
|- ui/
```

```
core/
|- constant/
|- enums/
|- extensions/
|- model/
|- resources/
|- services/
|- settings/
|- utils/
```

```
ui/
|- animations/
|- base/
|- bs/
|- fragments/
|- packages/
|- views/
|- vms/
|- vms_fragment/
|- widgets/
```