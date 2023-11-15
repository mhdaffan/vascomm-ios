//
//  ExtensionObservable.swift
//  VascommMobile
//
//  Created by Muhammad Affan on 16/11/23.
//

import RxSwift
import RxCocoa

extension Observable {
    
    func subscribe(scheduler: ImmediateSchedulerType, onNext: ((Element) -> Void)?, onError: ((Error) -> Void)? = nil) -> Disposable {
        return observe(on: scheduler).subscribe(onNext: onNext, onError: onError)
    }
    
    func subscribeOnMainThread(onNext: ((Element) -> Void)?, onError: ((Error) -> Void)? = nil) -> Disposable {
        return observe(on: MainScheduler.asyncInstance).subscribe(onNext: onNext, onError: onError)
    }
}
