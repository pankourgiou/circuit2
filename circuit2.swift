import Foundation

// Define a struct for a Resistor
struct Resistor {
    var resistance: Double // in Ohms (Ω)
}

// Define a class for a Series Circuit
class SeriesCircuit {
    var resistors: [Resistor]
    var voltageSource: Double // in Volts (V)

    // Initializer
    init(resistors: [Resistor], voltageSource: Double) {
        self.resistors = resistors
        self.voltageSource = voltageSource
    }
    
    // Calculate the total resistance in the series circuit
    func totalResistance() -> Double {
        return resistors.reduce(0) { $0 + $1.resistance }
    }
    
    // Calculate the current flowing through the circuit using Ohm's Law
    func current() -> Double {
        return voltageSource / totalResistance()
    }
    
    // Calculate the voltage drop across each resistor
    func voltageDropAcrossResistors() -> [Double] {
        let current = self.current()
        return resistors.map { current * $0.resistance }
    }
    
    // Display circuit information
    func displayCircuitInfo() {
        print("Total Voltage Source: \(voltageSource) V")
        print("Total Resistance: \(totalResistance()) Ω")
        print("Current through the circuit: \(current()) A")
        print("Voltage Drop across each Resistor:")
        
        for (index, voltageDrop) in voltageDropAcrossResistors().enumerated() {
            print("  Resistor \(index + 1): \(voltageDrop) V")
        }
    }
}

// Example Usage

// Create resistors
let resistor1 = Resistor(resistance: 100)  // 100 Ω
let resistor2 = Resistor(resistance: 200)  // 200 Ω
let resistor3 = Resistor(resistance: 300)  // 300 Ω

// Create a series circuit with a 12V voltage source
let circuit = SeriesCircuit(resistors: [resistor1, resistor2, resistor3], voltageSource: 12.0)

// Display the circuit details
circuit.displayCircuitInfo()
