//
//  main.swift
//  FocusStartHomework-2
//
//  Created by Monday MeoW. on 24.10.2020.
//

import Foundation

var array = ThreadSafeArray<Int>()

let group = DispatchGroup()
group.enter()
DispatchQueue.global(qos: .userInteractive).async {
	for number in 0...1000{
		array.append(number)
	}
	group.leave()
}
group.enter()
DispatchQueue.global(qos: .userInteractive).async {
	for number in 0...1000{
		array.append(number)
	}
	group.leave()
}
group.wait()
print(array.count)


