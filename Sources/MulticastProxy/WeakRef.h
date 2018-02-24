//
//  WeakRef.h
//  MulticastProxy
//
//  Created by Dmitry on 2/24/18.
//  Copyright © 2018 intervain. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WeakRef : NSObject

@property (nonatomic, weak) id value;

- (instancetype)initWithValue:(id)value;

@end
