# iOS-Extensions
A library of useful extensions.  Contains a lot of boiler plate code for iOS projects.

## Categories
`UIDevice+isIPAD{.h,.m}`
`UILabel+Font{.h,.m}`
`UIScreen+Frame{.h,.m}`
`UIView+Frame{.h,.m}`
`UIView+Xib{.h,.m}`
`UIViewController+Xib{.h,.m}`
`NSManagedObject+Map{.h,.m}`
`NSString+KeyPath{.h,.m}`

#### UIDevice+isIPAD
This extension makes it easy to check if device is an iPad
```objc
[UIDevice isIPAD];
```

#### UILabel+Font
This extension makes it easy to set/get font and fontSize
```objc
@property (nonatomic) NSString *fontName;
@property (nonatomic) CGFloat fontSize;
```

#### UIScreen+Frame
This extension makes it easy to get the correct screen size based on the device's orientation.
```objc
+ (CGRect) screenRect;
```

#### UIView+Frame
This extension makes it easy to set/get attributes to/from a UIView.
```objc
@property (nonatomic) CGFloat x;
@property (nonatomic) CGFloat y;
@property (nonatomic) CGFloat width;
@property (nonatomic) CGFloat height;
@property (nonatomic, readonly) CGFloat bottom;
@property (nonatomic, readonly) CGFloat right;

@property (nonatomic) CGSize size;

@property (nonatomic) CGFloat centerX;
@property (nonatomic) CGFloat centerY;
```

So why do this:
```objc
CGRect frame = self.view.frame;
frame.origin.x = 50.0f;
self.view.frame = frame;
```

When you can do this:
```objc
self.view.x = 50.0f;
```

#### UIView+Xib
This extension makes it easy to init UIViews from Xibs.
```objc
- (id) initWithNib;
```

#### UIViewController+Xib
Like *UIView+Xib*, This extension *also* makes it easy to init UIViewControllers from Xibs.
```objc
- (id) initWithNib;
```

#### NSManagedObject+Map
This extension makes it easy to parse a JSON Object into Core Data via a NSDictionary mapping.

Use the `.` separator to suggest key path values. See example below.
```objc
//Example of a json response (Taken from foursquare)
/*
 {
            "id":"42377700f964a52024201fe3",
            "name":"Brooklyn Heights Promenade",
            "contact":{

            },
            "location":{
               "address":"Columbia Heights",
               "crossStreet":"btwn Remsen & Orange",
               "lat":40.69829137715981,
               "lng":-73.99663209915161,
               "distance":342,
               "postalCode":"11201",
               "city":"Brooklyn",
               "state":"NY",
               "country":"United States",
               "cc":"US"
            },
            "canonicalUrl":"https:\/\/foursquare.com\/v\/brooklyn-heights-promenade\/42377700f964a52024201fe3",
            "categories":[
               {
                  "id":"4bf58dd8d48988d164941735",
                  "name":"Plaza",
                  "pluralName":"Plazas",
                  "shortName":"Plaza",
                  "icon":{
                     "prefix":"https:\/\/foursquare.com\/img\/categories_v2\/parks_outdoors\/plaza_",
                     "suffix":".png"
                  },
                  "primary":true
               }
            ],
            "verified":false,
            "stats":{
               "checkinsCount":14709,
               "usersCount":6874,
               "tipCount":89
            },
            "specials":{
               "count":0,
               "items":[

               ]
            },
            "hereNow":{
               "count":1,
               "groups":[
                  {
                     "type":"others",
                     "name":"Other people here",
                     "count":1,
                     "items":[

                     ]
                  }
               ]
            },
            "referralId":"v-1373042971"
         }
*/
+ (instancetype) venueWithJSON:(NSArray*)json context:(NSManagedObjectContext*)context {
    
    NSDictionary *map = @{
                          @"id" : kVenuePrimaryKey,
                          @"name": @"name",
                          @"canonicalUrl": @"canonicalUrl",
                          @"verified": @"verified",
                          @"location.address": @"address",
                          @"location.crossStreet": @"crossStreet",
                          @"location.lat": @"latitude",
                          @"location.lng": @"longitude",
                          @"location.distance": @"distance",
                          @"location.postalCode": @"postalCode",
                          @"location.city": @"city",
                          @"location.state": @"state",
                          @"location.country": @"country",
                          @"location.cc": @"cc",
                          };
    
    return [self objectWithJSON:json primaryKey:kVenuePrimaryKey map:map context:context];    
}
```

You can also fetch an object based on its primary key value via:
```objc
+ (instancetype) objectWithPrimaryKey:(NSString*)primaryKey primaryValue:(id)primaryValue context:(NSManagedObjectContext*)context
```

#### NSString+KeyPath
This extension makes it easy to check whether or not a string is a key path or not.  This was really build as a helper method for `NSManagedObject+Map` extension, but you may find it useful in other situations. 

```objc
- (BOOL) isKeyPath;
```
