//  Created by Tobias Conradi on 18.07.13.
//  Copyright (c) 2013 apploft GmbH. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface APLObject : NSObject

//! Uses runtime-magic to create a debug description containing all properties and their value
- (NSString *)autoDebugDescription;

@end
