NSObject-Tap
============

`tap:` method for Objective-C borrowed from [Ruby](http://ruby-doc.org/core-2.0/Object.html#method-i-tap). It also supports `tapp` for print debugging use case from [the RubyGem](http://rubygems.org/gems/tapp).

## Setup

Let's use [CocoaPods](http://cocoapods.org/).

```ruby
# Podfile
pod 'NSObject-Tap'
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
NSArray *array = [[NSMutableArray array] tap:^(NSMutableArray *x) {
    [x addObject:@1];
    [x addObject:@2];
    [x addObject:@3];
}];
```

```objc
Person *person = [[[Person alloc] init] tap:^(Person *p) {
    p.name = @"Your Name";
    p.age = 20;
    p.address = @"Kyoto, Japan";
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
[[NSUserDefaults standardUserDefaults] tap:^(NSUserDefaults *x) {
    [x setObject:@1 forKey:@"1"];
    [x setObject:@2 forKey:@"2"];
    [x setObject:@3 forKey:@"3"];
}];


// NSNotificationCenter
[[NSNotificationCenter defaultCenter] tap:^(id x) {
    [x addObserver:self
          selector:@selector(willEnterForeground:)
              name:UIApplicationWillEnterForegroundNotification
            object:nil];
    [x addObserver:self
          selector:@selector(didEnterBackground:)
              name:UIApplicationDidEnterBackgroundNotification
            object:nil];
}]
```

Use `tapp`:

```objc
// Outputs "Hello, world!"
NSString *helloWorld = [@"Hello, world!" tapp];

// Outputs like "<NSObject: 0x7ffbf0402f10>"
id object = [[[NSObject alloc] init] tapp];

// Between method chains
NSArray *filtered = [[[@[ @1, @2, @3, @4, @5 ] tapp] filteredArrayUsingPredicate:evenPredicate] tapp];
```
