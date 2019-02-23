import Foundation

/**
 Multicasts the invocations to all members added
 to notification list.
 
 - author: dmitry.volosach@gismart.com
 */
class MulticastProxy<T>: NSObject where T: AnyObject {
    private var multicaster = Multicaster()
    
    /**
     Adds the invocations receiver to notification list
     
     - parameters:
        - receiver: object to be added from notification list
     */
    func add(receiver: T?) {
        multicaster.addReceiver(receiver)
    }
    
    /**
     Removes the invocations receiver from notification list
     
     - parameters:
        - receiver: object to be removed from notification list
     */
    func remove(receiver: T?) {
        multicaster.removeReceiver(receiver)
    }
    
    override func conforms(to aProtocol: Protocol) -> Bool {
        return multicaster.receivers().first { $0.value?.conforms(to: aProtocol) ?? false } != nil
    }
    
    override func responds(to aSelector: Selector!) -> Bool {
        return multicaster.responds(to: aSelector)
    }
    
    override func forwardingTarget(for aSelector: Selector!) -> Any? {
        return multicaster.responds(to: aSelector) ? multicaster : super.forwardingTarget(for: aSelector)
    }
}
