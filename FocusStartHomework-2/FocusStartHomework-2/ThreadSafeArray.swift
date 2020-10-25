//
//  ThreadSafeArray.swift
//  FocusStartHomework-2
//
//  Created by Monday MeoW. on 24.10.2020.
//

import Foundation

final class ThreadSafeArray <T> {
	private var items = [T]()
	var count: Int {
		self.items.count
	}
	var isEmpty: Bool {
		self.items.isEmpty
	}

	let isolationQueue = DispatchQueue (label: "com.FocusStartHomework2.isolation",
										attributes: .concurrent)

	func append(_ item: T) {
		isolationQueue.async(flags: .barrier){
			self.items.append(item)
		}
	}

	func remove(at index:Int) {
		isolationQueue.async(flags: .barrier){
			self.items.remove(at: index)
		}
	}
	subscript(_ index : Int) -> T{
		var item = self.items[0]
		isolationQueue.async(flags: .barrier){
			item = self.items[index]
		}
		return item
	}
}

extension ThreadSafeArray where T: Equatable {
	func contains(_ element: T) -> Bool {
		var contain: Bool = false
		isolationQueue.async(flags: .barrier){
			contain = self.items.contains(element)
		}
		return contain
	}
}
