/* This is an example of
 swift tuples
 */

let coordinates: (Int, Int) = (2,3)
let coordinates_int_alternative = (2,3)

// double tuples
let coordinatesDouble = (2.1, 3.2)

// mixed
let coordinatesMixed = (2.1, 6)

// tuple index
let x1 = coordinates.0
let x2 = coordinates.1

// name the elements in a tuple
let coordinatesNamed = (x:2, y:3)
let x = coordinatesNamed.x
let y = coordinatesNamed.y


// 3d tuple
let coordinates3D = (x:1, y:2, z:3)
let (x3,z3,y3) = coordinates3D
x3
y3
z3

let (x4,y4,_) = coordinates3D
x4
y4

