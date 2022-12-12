# AveoStorage

AveoStorage is a complete package for offline & online storages predefined functions for the use of storing and retriving data.
  - [Features](#features)
  - [Getting Started](#getting-started)
    - [Android](#android)
    - [IOS](#ios)
  - [Usage](#usage)
    - [Shared Prefrences](#shared-prefrences)
    - [Get Storage](#get-storage)  
  - [Additional information](#additional-information)

    
Currently It contains the below type of storage options:
```
> Shared Prefrences
> Get Storage
> Flutter Secure Storage
> SQFlite
```
## Getting Started

### Android
1 Set the minSdkVersion in android/app/build.gradle:
```groovy
android {
    defaultConfig {
        minSdkVersion 18
    }
}
```
This means that app will only be available for users that run Android SDK 18 or higher.
(Secure Storage need this)

### IOS 
No specific changes required for now


## Usage
We can use diffrent type of structure in the App 

Before we start exploring usage i strongly suggest you guys to use models approah or class approch for every usage we will see this more in example

### Shared Prefrences
We have multiple functions in the shared prefrences to easily store any type of values 
To use the function you need to init function in you main or most preferabley in any initState()
```dart
initState(){
    SharedPref.init();
}
```
To set a value always create a key class so there are no spelling misatake or naming error 
```dart
class StoreKeys{
    static String NAME = "NAME";
    static String EMAIL = "EMAIL";
    static String DOUBLE_VALUE = "DOUBLE_VALUE";
}

storageFunctionExample(){
    SharedPref.setString(StoreKeys.NAME, "Example Name");
    SharedPref.setDouble(StoreKeys.NAME, 1.75);
}
```
It has many 
### Get Storage
Get Storage is basically shared prefrences but it provides a different kind feature where we can work on multiple box structure 
To use the function you need to init function in you main or most preferabley in any main()
```dart

late GetPrefStorage userBox;
late GetPrefStorage appBox;

main(){
    userBox = GetPrefStorage.init(containerName= "UserBox");
    appBox = GetPrefStorage.init(containerName= "AppBox");
}
```
To set a value always create a key class so there are no spelling misatake or naming error 
```dart
class StoreKeys{
    static String NAME = "NAME";
    static String EMAIL = "EMAIL";
    static String DOUBLE_VALUE = "DOUBLE_VALUE";
}

storageFunctionExample(){
userBox.store(StoreKeys.Name, "Example Name");
appBox.store(StoreKeys.DOUBLE_VALUE, 1.75);
}
```

Be carefull when you are using multiple boxes as the value could be null when reading and storing on diffrent boxes


## Additional information

TODO: Tell users more about the package: where to find more information, how to 
contribute to the package, how to file issues, what response they can expect 
from the package authors, and more.
