//
//  ViewController.swift
//  MultiWrites
//
//  Created by Subbareddy Lankapothu on 4/11/18.
//  Copyright © 2018 Subba. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var result = [String]()
    var first = [String]()
    var second = [String]()
    var third = [String]()
    let serialQueue = DispatchQueue(label: "myQueue")
    let lock = NSLock()
    override func viewDidLoad() {
        super.viewDidLoad()
        for i in 1...10 {
            first.append("\(i)")
            second.append("\(i+10)")
            third.append("\(i+20)")
        }
        addAfter1Sec(first)
        printAfter3Sec()
        addAfter1Sec(second)
        printAfter3Sec()
        addAfter1Sec(third)
        printAfter3Sec()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    private func addAfter1Sec(_ items: [String]) {
//        This works fine
//        self.serialQueue.asyncAfter(deadline: .now() + 1) { [weak self] in
//            self?.result.append(contentsOf: items)
//            print(self?.result)
//        }
        
//          This crashes
//        DispatchQueue.global().asyncAfter(deadline: .now() + 1) { [weak self] in
//                self?.result.append(contentsOf: items)
//                print(self?.result)
//        }
//      This works fine
        DispatchQueue.global().asyncAfter(deadline: .now() + 1) { [weak self] in
            self?.lock.lock()
            self?.result.append(contentsOf: items)
            print(self?.result)
            self?.lock.unlock()
        }
    }
    
    private func printAfter3Sec() {
//      This works fine
        self.serialQueue.asyncAfter(deadline: .now() + 3) { [weak self] in
            print(self?.result)
        }
//        DispatchQueue.global().asyncAfter(deadline: .now() + 1) { [weak self] in
//            self?.lock.lock()
//            print("reader")
//            print(self?.result)
//            self?.lock.unlock()
//        }
    }
}

