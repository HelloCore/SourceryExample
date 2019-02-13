//
//  RxCocoaExtension.swift
//  CodeGenTemplate
//
//  Created by Akkharawat Chayapiwat on 2/13/19.
//  Copyright © 2019 Akkharawat Chayapiwat. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

private let errorMessage = "`drive*` family of methods can be only called from `MainThread`.\n" +
"This is required to ensure that the last replayed `Driver` element is delivered on `MainThread`.\n"

extension ObservableType {
    
    public func asDriverIgnoreError() -> Driver<E> {
        return self.asDriver(onErrorDriveWith: Driver.never())
    }
    
    public func subscribeWeakly<T: AnyObject>(_ capturedTarget: T,
                                              onNext: ((T, E) -> Void)? = nil,
                                              onError: ((T, Error) -> Void)? = nil,
                                              onCompleted: ((T) -> Void)? = nil,
                                              onDisposed: ((T) -> Void)? = nil) -> Disposable {
        
        let wrappedOnNext = ObservableUtil.wrappedClosure(capturedTarget, closure: onNext)
        let wrappedOnError = ObservableUtil.wrappedClosure(capturedTarget, closure: onError)
        let wrappedOnCompleted = ObservableUtil.wrappedClosure(capturedTarget, closure: onCompleted)
        let wrappedOnDisposed = ObservableUtil.wrappedClosure(capturedTarget, closure: onDisposed)
        
        return self.subscribe(onNext: wrappedOnNext,
                              onError: wrappedOnError,
                              onCompleted: wrappedOnCompleted,
                              onDisposed: wrappedOnDisposed)
    }
    
}

extension Single {
    public func asDriverIgnoreError() -> Driver<Element> {
        
        return self.asDriver(onErrorDriveWith: Driver.never())
    }
}

extension SharedSequenceConvertibleType where SharingStrategy == DriverSharingStrategy {
    
    /**
     Creates new subscription and sends elements to `PublishRelay`.
     This method can be only called from `MainThread`.
     
     - parameter relay: Target relay for sequence elements.
     - returns: Disposable object that can be used to unsubscribe the observer from the relay.
     */
    public func drive(_ relay: PublishRelay<E>) -> Disposable {
        MainScheduler.ensureExecutingOnScheduler(errorMessage: errorMessage)
        return drive(onNext: { e in
            relay.accept(e)
        })
    }
    
    
    /**
     Creates new subscription and sends elements to `PublishRelay`.
     This method can be only called from `MainThread`.
     
     - parameter relay: Target relay for sequence elements.
     - returns: Disposable object that can be used to unsubscribe the observer from the relay.
     */
    public func drive(_ relay: PublishRelay<E?>) -> Disposable {
        MainScheduler.ensureExecutingOnScheduler(errorMessage: errorMessage)
        return drive(onNext: { e in
            relay.accept(e)
        })
    }
    
    
    public func driveWeakly<T: AnyObject>(_ capturedTarget: T,
                                          onNext: ((T, E) -> Void)? = nil,
                                          onCompleted: ((T) -> Void)? = nil,
                                          onDisposed: ((T) -> Void)? = nil) -> Disposable {
        let wrappedOnNext = ObservableUtil.wrappedClosure(capturedTarget, closure: onNext)
        let wrappedOnCompleted = ObservableUtil.wrappedClosure(capturedTarget, closure: onCompleted)
        let wrappedOnDisposed = ObservableUtil.wrappedClosure(capturedTarget, closure: onDisposed)
        
        return self
            .drive(onNext: wrappedOnNext,
                   onCompleted: wrappedOnCompleted,
                   onDisposed: wrappedOnDisposed)
    }
    
    
}

class ObservableUtil {
    
    fileprivate static func wrappedClosure<T: AnyObject, E>(_ target: T, closure: ((T, E) -> Void)? ) -> ((E) -> Void)? {
        guard let closure = closure else { return nil }
        return { [weak target] (e) in
            guard let target = target else { return }
            closure(target, e)
        }
    }
    
    fileprivate static func wrappedClosure<T: AnyObject>(_ target: T, closure: ((T) -> Void)? ) -> (() -> Void)? {
        guard let closure = closure else { return nil }
        return { [weak target]  in
            guard let target = target else { return }
            closure(target)
        }
    }
}
