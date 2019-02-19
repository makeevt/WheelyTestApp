

import Foundation

protocol CounterModelDelegate: class {
    func counterModelDidChangeValue(_ counterModel: CounterModel, newValue: Int)
}

protocol CounterModel {
    var value: Int {get}
    var delegate: CounterModelDelegate? {get set}
    func increment()
}

class CounterModelImpl: CounterModel {
    
    private var valueInternal = Synchronized<Int>(value: 0)
    
    weak var delegate: CounterModelDelegate?
    
    var value: Int {
        return self.valueInternal.value
    }
    
    func increment() {
        var newValue: Int!
        self.valueInternal.execute({ value in
            value += 1
            newValue = value
        })
        self.delegate?.counterModelDidChangeValue(self, newValue: newValue)
    }
    
}
