/*
 Examples of scope: the codes or variabels defined in {}
 */


var hoursWorked = 45
var price = 0
if hoursWorked > 40 {
    let hoursOver40 = hoursWorked - 40
    price = hoursOver40*50
    hoursWorked -= hoursOver40
}

price += hoursWorked * 25
print(price)
print(hoursOver40)

