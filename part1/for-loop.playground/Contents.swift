let closedRange = 0...5
let halfclosedRange = 0..<5

var sum = 0
let count = 10
for i in 1...count{
    sum += i
}
print("sum is \(sum)")


for _ in 0..<count{
    print("No iterative index")
}

for i in 1...count {
    if i%2 == 0 {
        print("\(i) is an odd number")
    }
}

// break a for loop
var i_last = 0
for i in 1...count {
    print(i)
    if i == 3 {
        break
    }
    i_last = i
}
print("break the loop at \(i_last)!!")

// continue a for loop
for i in 1...count {
    print("i is ")
    if i == 3 {
        continue
    }
    print(i)
}

for row in 1...3 {
    for col in 1...3 {
        print("\(col)", terminator: ";")
    }
    print("\n")
}
