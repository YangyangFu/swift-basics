let number = 7
switch number {
case 0:
    print("zero")
case 100:
    print("one hundred")
default:
    print("undefined")
}

// use where in a for loop, so that the loop only execute if the conditions in where is true

for i in 1...number where i%2 == 0 {
    print(i)
}

switch number {
case _ where number%2 == 0:
    print("number is \(number)")
default:
    print("not an odd number")
}


//
let cor = (x:3, y:3, z:0)
switch cor {
case (0,0,0):
    print("origin")
case (let x ,0,0):
    print("on x-axis at x = \(x)")
case (0,let x,0):
    print("on y-axis at y = \(x)")
case (0,0,_):
    print("on z")
case let (x,y,_) where x==y:
    print("on a line where y=x")
default:
    print("somewhere else")
}
