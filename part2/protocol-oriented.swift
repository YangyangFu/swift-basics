/* This is enum type: enum cannot contain stored properties
Exampes are built based on https://colab.research.google.com/github/tensorflow/swift/blob/main/docs/site/tutorials/protocol_oriented_generics.ipynb#scrollTo=zCN0Uc0w-gng.
*/
enum Color: String {
    case red = "red"
    case green = "green"
    case blue = "blue"
    // a computed property. note that enums cannot contain stored properties.
    var hint: String {
        switch self {
            case .red:
                return "Roses are this color"
            case .green:
                return "Grass is this color"
            case .blue:
                return "Ocean is this color"
        }
    }
    // the following declaration will not work
    //var hint: String 

    // an initializer like for classes
    init?(color: String) {
        switch color {
            case "red":
                self = .red
            case "green":
                self = .green
            case "blue":
                self = .blue
            default:
                return nil
        }
    }

}

// extend this enum
extension Color{
    // add a method: get a hint
    func hintFunc() -> String{
        return self.hint
    }
}

// run some tests
let c = Color.red
print("Give me a hint for c: \(c.hintFunc())")

let invalidColor = Color(color:"orange")
print("Is valid color?: \(invalidColor==nil)")

/*
This is for struct type: struct cannot be inherited, and seems a "let" constant

*/
struct FastCar {
    // can have variables and constants as stored properties
    var color: Color 
    let horsePower: Int
    var watts: Float{
        return Float(horsePower)*745.7
    } 
    // The following declaration doesnt work: property initializer run before "self" is available.
    //var watts: Float = Float(horsePower)*745.7

    // can have lazy variables like in classes!
    lazy var titleCaseColorString: String = {
        let colorString = color.rawValue
        return colorString.prefix(1).uppercased() + colorString.lowercased().dropFirst()
    }()
    // a function
    func description() -> String {
        return "This is a \(color) car with \(horsePower) horsepower!"
    }

    // can create a variety of initializers
    init(color: Color, horsePower: Int){
        self.color = color
        self.horsePower = horsePower
    }
    // can define extra initializers othe than the default one: 
    // if the initial color is given as a string instead of Color class, then convert it to a Color class.
    init?(color: String, horsePower: Int){
        guard let enumColor = Color(color:color) else {
            return nil
        }
        self.color = enumColor
        self.horsePower = horsePower
    }
}

// the extension of a struct 
extension FastCar{
    // add a method to convert watts to kilowatts
    func getkW() -> Float {
        return self.watts/1000
    }
}

var car = FastCar(color: .red, horsePower:250)
print(car.description())
print("Horse power in watts: \(car.watts)")
print("Horse power in kilowatts: \(car.getkW())")
print(car.titleCaseColorString)

/*
A class: we have no problem modifying a constant class with variable properties
*/
class A {
    var a = "a"
}

func foo(_ a: A) {
    a.a = "foo"
}

var a = A()
print(a.a)
foo(a)
print(a.a)
/*
func modify(car: FastCar, toColor color: Color) ->Void{
    car.color = color
}

car = FastCar(color: .red, horsePower:250)
print(car.description())
modify(car: &car, toColor: .blue)
print(car.description())
*/

/*
Then we can work on protocols: inheritence supported
*/

protocol Car {
    var color: Color {get set}
    var price: Int {get}
    func turnOn()
    mutating func drive()
}

protocol Electric {
    mutating func recharge()
    var batteryLevel: Int {get set}
}

protocol Gas {
    mutating func refill()
    var gasLevelLiters: Int {get set}
}

/*
In an object-oriented world (with no multiple inheritance), 
you may have made Electric and Gas abstract classes 
then used class inheritance to make both inherit from Car, and then have a specific car model be a base class.

But, in swift, both are completely separate protocols with zero coupling.

Let's define a Tesla
*/

struct TeslaModelS: Car, Electric {
    var color: Color // nees to be a var since 'Car' has a getter and setter
    let price: Int
    var batteryLevel: Int 

    func turnOn() {
        print("starting all system")
    }

    mutating func drive() {
        print("self-driving engaged!")
        batteryLevel -= 8
    }

    mutating func recharge(){
        print("Recharging the battery...")
        batteryLevel = 100
    } 
}

var mytesla = TeslaModelS(color: .red, price: 110000, batteryLevel:100)

struct Mustang: Car, Gas {
    var color: Color 
    let price: Int
    var gasLevelLiters: Int 

    func turnOn() {
        print("Starting all system")
    }

    mutating func drive(){
        print("Step on gas")
        gasLevelLiters -= 1
    }

    mutating func refill() {
        print("Filling the tank...")
        gasLevelLiters = 25
    }
}

var mymustang = Mustang(color: .red, price: 30000, gasLevelLiters: 25)

