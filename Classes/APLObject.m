//  Created by Tobias Conradi on 18.07.13.
//  Copyright (c) 2013 apploft GmbH. All rights reserved.
//

#import "APLObject.h"
#import <objc/runtime.h>

@implementation APLObject

- (NSString *)autoDebugDescription {
    unsigned int propertyCount;
    
    NSMutableDictionary *propertiesDict = [NSMutableDictionary dictionary];
    
    for (Class currentClass = [self class]; [currentClass isSubclassOfClass:[APLObject class]]; currentClass = [currentClass superclass]) {
        objc_property_t *properties = class_copyPropertyList(currentClass, &propertyCount);
        for (unsigned int i = 0; i < propertyCount; i++) {
            objc_property_t aProperty = properties[i];
            const char *propertyName = property_getName(aProperty);
            NSString *name = [NSString stringWithCString:propertyName encoding:NSUTF8StringEncoding];
            id value = [self valueForKey:name];
            propertiesDict[name] = value ?: [NSNull null];
        }
        free(properties);
    }
    
    NSString *className = NSStringFromClass([self class]);
    NSString *description = [NSString stringWithFormat:@"<%@: %p> %@",className, self, [propertiesDict description]];
    return description;
}

- (NSString *)debugDescription {
    return [self autoDebugDescription];
}

@end
