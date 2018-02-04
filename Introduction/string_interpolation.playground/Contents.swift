var name = "John Doe"
var age = 25
var latitude = 36.166667

"Your name is \(name)"  // string interpolation
"Your name is " + name  // alternative not efficient when multiple values of different types

"Your name is \(name), your age is \(age), and your latitude is \(latitude)"

"Your age is \(age) years old. In another \(age) years you will be \(age * 2)." // swift handles also expression inside string interpolation

