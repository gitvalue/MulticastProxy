//
//  MulticastProxy.swift
//  MulticastProxy
//
//  Created by Dmitry on 2/24/18.
//  Copyright © 2018 intervain. All rights reserved.
//

import Foundation

public class MulticastProxy: NSObject {
    private var multicaster = Multicaster()
    
    public class func create<T: AnyObject>(_ receivers: [T?]) -> T? {
        return MulticastProxy(receivers: receivers) as? T
    }
    
    private init(receivers: [AnyObject?]) {
        super.init()
        
        receivers.forEach {
            multicaster.addReceiver($0)
        }
    }
    
    override public func conforms(to aProtocol: Protocol) -> Bool {
        return multicaster.receivers().first { $0.value?.conforms(to: aProtocol) ?? false } != nil
    }
    
    override public func responds(to aSelector: Selector!) -> Bool {
        return multicaster.responds(to: aSelector)
    }
    
    override public func forwardingTarget(for aSelector: Selector!) -> Any? {
        return multicaster.responds(to: aSelector) ? multicaster : super.forwardingTarget(for: aSelector)
    }
}
