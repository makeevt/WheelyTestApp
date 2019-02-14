

import Foundation

protocol CounterModel {
    var value: Int {get}
    func increment()
}

class CounterModelImpl: CounterModel {
    
    private var valueInternal = Synchronized<Int>(value: 0)
    
    var value: Int {
        return self.valueInternal.value
    }
    
    func increment() {
        self.valueInternal.execute({ value in
            value += 1
        })
    }
    
}
