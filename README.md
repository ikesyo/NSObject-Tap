NSObject-Tap
============

`tap:` method for Objective-C borrowed from [Ruby](http://ruby-doc.org/core-2.0/Object.html#method-i-tap).

## Setup

Let's use [CocoaPods](http://cocoapods.org/).

```ruby
# Podfile
pod 'NSObject+Tap', :git => 'https://github.com/ikesyo/NSObject-Tap.git'
```

```sh
$ pod install
```

or copy two files `NSObject+Tap.{h,m}` to your project.

Then, import the header file.

```objc
#import "NSObject+Tap.h"
```

## Examples

Initilization:

```objc
NSArray *array = [[NSMutableArray array] tap:^(NSMutableArray *me) {
    [me addObject:@1];
    [me addObject:@2];
    [me addObject:@3];
}];
```

```objc
Person *person = [[[Person alloc] init] tap:^(Person *me) {
    me.name = @"Your Name";
    me.age = 20;
    me.address = @"Kyoto, Japan";
}];
```

Shorter codes, reduce local variables:

```objc
// NSUserDefaults

// before 1
[[NSUserDefaults standardUserDefaults] setObject:@1 forKey:@"1"];
[[NSUserDefaults standardUserDefaults] setObject:@2 forKey:@"2"];
[[NSUserDefaults standardUserDefaults] setObject:@3 forKey:@"3"];

// before 2
NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
[defaults setObject:@1 forKey:@"1"];
[defaults setObject:@2 forKey:@"2"];
[defaults setObject:@3 forKey:@"3"];

// after
[[NSUserDefaults standardUserDefaults] tap:^(NSUserDefaults *me) {
    [me setObject:@1 forKey:@"1"];
    [me setObject:@2 forKey:@"2"];
    [me setObject:@3 forKey:@"3"];
}];


// NSNotificationCenter
[[NSNotificationCenter defaultCenter] tap:^(id me) {
    [me addObserver:self
           selector:@selector(willEnterForeground:)
               name:UIApplicationWillEnterForegroundNotification
             object:nil];
    [me addObserver:self
           selector:@selector(didEnterBackground:)
               name:UIApplicationDidEnterBackgroundNotification
             object:nil];
}]
```
