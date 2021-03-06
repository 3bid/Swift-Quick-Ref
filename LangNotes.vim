Declarations
------------
Constants: let
           let someThing = 10 //value of someThing cannot be changed, is "immutable"
Variables: var
           var someThing = 0 //value of someThing may be changed, is "mutable"


Data Types
----------
String; Int; Float; Double; Bool // Double has higher level of accuracy than Float
Date() (let today=Date() - part of framework Foundation so must "import Foundation")
       Date() is known as an initializer - you use an initializer to create a new instance
       of a particular type - every type as at least one initializer
Every type has an API.
currentValue = Int(slider.value) // slider.value is of type Float; this statement converts
                                 // the Float value to integer which is the Type of
                                 // currentValue
slider.value = Float(currentValue) // convert Int to Float
targetLabel.text = String(targetValue) // Int to String
FileManager.default // a data type that lets us work with the filesystem
Bundle.main.resourcePath // Bundle: representation of the code and resources stored in a bundle
			 // directory on disk - directory containing program and all assets;
			 // main: returns the bundle object that contains the
			 // current executable; resourcePath: full pathname of the bundle’s
			 // subdirectory containing resources
  

System Methods & Keywords
-------------------------
viewDidLoad() // is called as soon as ViewController.swift loads its interface from 
              // Main.storyboard, when the screen has loaded and ready for you to customize
tableView // UITableViewController class method; tells the data source to return the number of rows
	  // in a given section of a table view; reports zero rows in table by default
myRandomNumber = Int.random(in: 1...100) // generate random # in inclusive range
Int.max // largest possible integer
stride(from:to:by:) / stride(from:through:by:) // step over values between two boundaries
stride(from: 10, to: 0, by: -2)
stride(from:through:by:) // overload function with different output
override // means "I know this method was implemented by my parent class, but I want to change
	 // it for this subclass." Having the override keyword is helpful, because it makes your intent
	 // clear. It also allows Swift to check your code: if you don't use override Swift won't let you
	 // change a method you got from your superclass, or if you use override and there wasn't anything
	 // to override, Swift will point out your error
super // calls superclass method and after it finishes executing, runs local method of the same name


Type Annotation (for when you don't want to rely on type inference)
---------------
var welcomeMessage: String // space before ":" won't generate error but avoid doing this
var aVariable, bVariable, cVariable: String
var welcomeMessage: String = "Welcome!!!"
let annotatedDouble: Double = 20


Type Inference
--------------
- anything within double quotes is typed as a String
- whole numbers are typed as Int
- decimal numbers are typed as Double


functions (are called methods when they belong to a class/object)
---------
declaration:  func hello(name: String) { } // "name" is called a parameter name
	      func hello(firstName: String, lastName: String) { }
	      func spaceAvailable(eachDuration: Int, numberVideos: Int) -> String { }

calls:  hello(name: "Maria") // "name" in this function call is called argument label
	hello(firstName: "John", lastName: "Candy")
        reciever.methodName(parameters) // format used when calling a method on an object
                                        // "receiver" is who you're sending message to;
        self.startNewRound()            // "self" is default receiver so usually not listed

Parameter names must match the argument labels. You can create multiple parameter names to
make your code more readable (note the 2 parameter names in the function declaration):

   func printHello(to name: String) {
	print("Hello " + name)
   }
   printHello(to: "Chris")

   func countLettersInString(myString str: String) {
        print("The string \(str) has \(str.count) letters.")
    }
    countLettersInString(myString: "Hello")

Underscore instead of argument label in function declaration allows you to call function
without an argument label:

   func printHelloTo(_ name: String) {
	print("Hello " + name)
   }
   printHelloTo("Maya") // because of the _, you don't need to specify an argument label

   func countLettersInString(_ str: String) {
        print("The string \(str) has \(str.count) letters.")
   }
   countLettersInString("Hello")

   // This form is better than the above
   func countLetters(in string: String) {
        print("The string \(string) has \(string.count) letters.")
   }
   countLetters(in: "Hello")

Function parameters can be assigned default values:

   func printMultipleOf(number: Int, multiplier: Int = 1) { }

When you call this function, only an argument for number is required; not passing in an 
argument for multiplier will cause the function to use the default value.

Function return values:

   func albumIsTaylor(name: String) -> Bool {
       if name == "Taylor Swift" { return true }
       if name == "Fearless" { return true }
       if name == "Speak Now" { return true }
       if name == "Red" { return true }
       if name == "1989" { return true }

       return false
   }
   if albumIsTaylor(name: "Red") {
       print("That's one of hers!")
   } else {
       print("Who made that?!")
   }
   if albumIsTaylor(name: "Blue") {
       print("That's one of hers!")
   } else {
       print("Who made that?!")
   }


Overload function rules:
   Valid overloads must have at leeast one of these differences:
      1. different number of parameters
      2. different parameter types
      3. different argument labels
      4. different return types

   Guidelines:
      1. overloads should be related and have similar functionality
      2. instead of using overloads, prefer to use a single function but with default values
      3. overloads that differ only in retun types - you will lose type inference and so will
         be forced to explicitly declare type - not recommended to be used

Variadic parameters in functions allow you to specify passing of 0 or more parameters (like print()).
Insice the function, the variadic parameter list is an array.  You cannot pass in an array instead of
a list of parameters.

When you pass a value into a function, it creates a copy of it and that local copy is by default a
constant - it cannot be changed within the function.  You can override this by the use of "inout".

This is illegal:

   func incrementAndPrint(_ value: Int) {
	   value += 1
	   print(value)
   }

You can make the above work by doing this:

   func incrementAndPrint(_ value: inout Int) {
	   value += 1
	   print(value)
   }

   incrementAndPrint(&count) // note the required "&" for inout functions

Don't forget that now when the function returns, the value of the value paramether has been changed.


Initializers
------------
let rightNow = Date() // value: current month, day, year, "at", time
let emptyString = String() // value: ""
let falseBool = Bool() // value: false
let zero = Int() // value: 0
let oneHourLater = Date(timeIntervalSinceNow: 3600) // value: a date that is the # of seconds
                                                              in the future from current time


Instance Methods // method is a function built in to each instance of a type; a function that belongs
---------------- // to an object
Instance Methods of functions cannot be called without an instance and cannot be used on an instance
of the wrong type.

String:
   let introduction = "It was a dark and stormy night"
   func hasPrefix(_ prefix: String) -> Bool // does a string begin with another string?
   introduction.hasPrefix("It was") // value: true; known as calling a method on the instance - 
                                       hasPrefix() was called on introduction

   hasSuffix(suffix: String)
   removeAll() //empties the string
   lowercased() //converts all to lower case

UIView:
   myColorView.backgroundColor = .black // paint background color black

UISwitch:
   @IBAction func switchChanged(_ sender: UISwitch) {
		if sender.isOn {
			colorView.backgroundColor = .red
		} else {
			colorView.backgroundColor = .black
		}
   }

UISlider:
   @IBOutlet weak var slider: UISlider!
   let roundedValue = slider.value.rounded() // value is slider's current value; rounded rounds current value

UILabel:
   @IBOutlet weak var targetLabel: UILabel!
   targetLabel.text = String(targetValue) // text is string value of what's displayed in label
   

Closures
--------
In Swift, alerts are asynchrous - an alert is displayed by present() and code execution continues
immediately with the next statement even though there may be an "OK" button on the alert that the
user must tap.

let action = UIAlertAction(title: "OK", style: .default, handler: {
			action in
			self.startNewRound()
		})

To get around this, because you probably don't want your view to update until after the button is
tapped, you use Closures - the "handler" in statement above.

Properties of Closures:
 1.  functions assigned to a variable, function called using that variable, and even passed into other
     functions as parameters

	let driving = {
           print("I'm driving in my car") // function assigned to driving
	}
	driving() // call function

 2.  Closures can also accept parameters

	let driving = { (place: String) in // "in" tells Swift the main body of the Closure is starting
	   print("I'm going to \(place) in my car")
	}
	driving("London")

 3.  you don't use parameter labels when calling closures

 4.  Closures can return values
 
 	The closure in #1 above is actually this if written out explicitly:

	let driving:() -> () = {
	   print("I'm driving in my car")
	}

	or:

	let driving:() -> Void = {
	   print("I'm driving in my car")
	}

	let drivingWithReturn = { (place: String) -> String in
	   return "I'm going to \(place) in my car"
	}
	let message = drivingWithReturn("London")
	print(message)

5.  Passing closure into function

	let driving = {
	   print("I'm driving in my car")
	}
	func travel(action: () -> Void) {
	   print("I'm getting ready to go.")
	   action()
	   print("I arrived!")
	}
	travel(action: driving)

6.  Trailing Closures Syntax - when the last parameter to a function is a closure

	Using the above function, since the last parameter is a closure, you can simplify call to:

	travel() { // don't need to define a driving variable, pass it in directly
	   print("I'm driving in my car")
	}

	Because there aren't any other parameters, you can eliminate the parens entirely:

	travel {
	   print("I'm driving in my car")
	}

7.  A closure you pass into a function can also accept its own parameters

	Function that accepts a closure as its only parameter, and that closure in turn accepts a string:

	func travel(action: (String) -> Void) {
	   print("I'm getting ready to go.")
	   action("London")
	print("I arrived!")
	}

	Call travel using trailing closure syntax:

	travel { (place: String) in
	   print("I'm going to \(place) in my car")
	}


Properties // property is a constant or variable built in to each instance of a type, can't pass arguments to a property
----------
Each instance of a variable has information associated with it, known as a property. Cannot be used
without an instance and cannot be used on an instance of the wrong type. You can't pass arguments to
a property. Properties are for getting values from an instance, or setting values.

String:
   var isEmpty: Bool { get } //does the string contain any characters; "get" means it's a read-
                               only property
   let something = "It was the best of times"
   something.isEmpty //value: false

   count // returns count of number of characters in string
   append // add string to end of string variable or element in string array
   list.insert("Kumquat", at: 0) // add string into specific position in array
   numbers.remove(at: 2) // remove element 2 of array
   numbers.removeFirst() // remove first element of array
   numbers.removeLast()
   numbers.removeAll()
   contains // does the string exist within another string; must import Foundation framework
   uppercased // convert all letters to uppercase


Int:
   count // returns count of elements in array; this is a calculated property


string operations
-----------------
print("This is a \(testVariable)")
print("Your age is \(age + 5)")

let cafe1 = "Cafe\u{301}" // Unicode scalar value "\u{301}" modifies the preceding character to include an accent,
			     so "e\u{301}" has the same canonical representation as the single Unicode scalar value "é"

let name = "Marie Curie"
let firstSpace = name.firstIndex(of: " ") ?? name.endIndex
let firstName = name[..<firstSpace]
print("\(name)'s first name has \(firstName.count) letters.")

let cafe = "Cafe\u{301} du 🌍"
print(cafe)
// Prints "Café du 🌍"
print(cafe.count)
// Prints "9"
print(Array(cafe))
// Prints "["C", "a", "f", "é", " ", "d", "u", " ", "🌍"]"
print(cafe.unicodeScalars.count)
// Prints "10"
print(Array(cafe.unicodeScalars))
// Prints "["C", "a", "f", "e", "\u{0301}", " ", "d", "u", " ", "\u{0001F30D}"]"
print(cafe.unicodeScalars.map { $0.value })
// Prints "[67, 97, 102, 101, 769, 32, 100, 117, 32, 127757]"
print(cafe.utf16.count)
// Prints "11"
print(Array(cafe.utf16))
// Prints "[67, 97, 102, 101, 769, 32, 100, 117, 32, 55356, 57101]"


Complex Types
-------------
1. Arrays, sets, tuples, and dictionaries let you store a group of items under a single value. They each do
   this in different ways, so which you use depends on the behavior you want.
2. Arrays store items in the order you add them, and you access them using numerical positions.
3. Sets store items without any order, so you can’t access them using numerical positions.
4. Tuples are fixed in size, and you can attach names to each of their items. You can read items using numerical
   positions or using your names.
5. Dictionaries store items according to a key, and you can read items using those keys.
6. Enums are a way of grouping related values so you can use them without spelling mistakes.
   You can attach raw values to enums so they can be created from integers or strings, or you can add associated
   values to store additional information about each case.


arrays
------
Once a mutable array is declared, it can only hold values of the types in the original declaration

var list = [String]() or var list: [String] = [] // declare mutable empty array that will
                                                 // hold strings - the array will be created

var list: [String] // declare mutable array only, don't create it
list[0] = "Shake it Off” // this line will generate error because you had told Swift to not create the array yet

var results = [Int]()
var results = Array<Int>()
list.append("Banana") // add item to array

var flavors = ["Chocolate", "Vanilla", "Strawberry", "Pistachio", "Rocky Road"]
flavors[0] = "Fudge Ripple" // replace Chocolate with Fudge Ripple in array flavors, you can't add or remove
                            // elements from an array using subscripts

var songs: [Any] // to declare an array of mixed types

If you add ("+") 2 arrays, they will be combined.  Can also use "+=" on arrays.


sets
----
Sets are collections of values just like arrays, except they have two differences:
1. Items aren’t stored in any order and Swift makes no guarantees about its order
2. No item can appear twice in a set; all items must be unique

You can create sets directly from arrays, like this:

   let colors = Set(["red", "green", "blue"])

Because they are unordered, you can’t read values from a set using numerical positions like you can with arrays.

If you try to insert a duplicate item into a set, the duplicates get ignored. For example:

   let colors2 = Set(["red", "green", "blue", "red", "blue"])

The final colors2 set will still only include red, green, and blue once.

Declare empty set:

   var words = Set<String>()
   var numbers = Set<Int>()


tuples
------
Tuples allow you store several values together in a single value. That might sound like arrays, but tuples are different:

- You can’t add or remove items from a tuple; they are fixed in size
- You can’t change the type of items in a tuple; they always have the same types they were created with
- You can access items in a tuple using numerical positions or by naming them, but Swift won’t let you read numbers or
  names that don’t exist

Tuples are created by placing multiple items into parentheses, like this:

   var name = (first: "Taylor", last: "Swift")

You then access items using numerical positions starting from 0:

   name.0

Or you can access items using their names:

   name.first

You can change the values inside a tuple after you create it, but not the types of values

let coodinates: (Int, Int) = (2, 3) or let coordinates: = (2, 3)
to reference a tupal: let x1 = coordinates.0; let x2 = coordinates.1
tupals can be of mixed type
naming tupals: let coordinates = (x: 1, y: 2); let xValue = coordinates.x
let coordinates3D = (x: 2, y: 3, z: 1)
let (x3, y3, z3) = coordinates3D // 3 new variables created and values from above assigned
let (x4, y4, _) = coordinates3D // saying you don't care about the 3rd value


dictionaries
------------
Collections of values just like arrays, but rather than storing things with an integer position you can access them
using anything you want.

The most common way of storing dictionary data is using strings. For example, we could create a dictionary that
stores the height of singers using their name:

   let heights = [
       "Taylor Swift": 1.78,
       "Ed Sheeran": 1.73
   ]

Just like arrays, dictionaries start and end with brackets and each item is separated with a comma. However, we
also use a colon to separate the value you want to store (e.g. 1.78) from the identifier you want to store it under
(e.g. “Taylor Swift”).

These identifiers are called keys, and you can use them to read data back out of the dictionary:

   heights["Taylor Swift"]

Note: When using type annotations, dictionaries are written in brackets with a colon between your identifier and
value types. For example, [String: Double] and [String: String].

If you try to read a value from a dictionary using a key that doesn’t exist, Swift will send you back nil. While
this might be what you want, there’s an alternative: we can provide the dictionary with a default value to use if we
request a missing key.

To demonstrate this, let’s create a dictionary of favorite ice creams for two people:

   let favoriteIceCream = [
       "Paul": "Chocolate",
       "Sophie": "Vanilla"
   ]

We can read Paul’s favorite ice cream like this:

   favoriteIceCream["Paul"]

But if we tried reading the favorite ice cream for Charlotte, we’d get back nil, meaning that Swift doesn’t have a
value for that key:

   favoriteIceCream["Charlotte"]

We can fix this by giving the dictionary a default value of “Unknown”, so that when no ice cream is found for
Charlotte we get back “Unknown” rather than nil:

   favoriteIceCream["Charlotte", default: "Unknown"]

Declaring an empty dictionary:

   var scores = Dictionary<String, Int>()
   var teams = [String: String]()
   teams["Paul"] = "Red" # add entry


enums
-----
enum Result {
   case success
   case failure
}
let someresult = Result.success

enums can also store associated values attached to each case:

enum Activity {
    case bored
    case running(destination: String)
    case talking(topic: String)
    case singing(volume: Int)
}

Now you can be more precise: let talking = Activity.talking(topic: "football")

Swift will assign enums a number beginning with 0:

enum Planet: Int {
    case mercury
    case venus
    case earth
    case mars
}

In the above, mercury is assinged 0, venus 1, etc.

let myearth = Planet(rawValue: 2)

enum Planet: Int {
    case mercury = 1
    case venus
    case earth
    case mars
}

The above will force Swift to start with 1 instead of 0 and increment from there. So now

let myearth = Planet(rawValue: 3) refers to earth.


struct
------
structs are complex data types (have multiple values).  You then create an instance of a struct and
fill in its values - you then pass this struct, with its multiple values, around in your code as a
single value.  A struct is a value type.

struct Song {
    let title: String
    let artist: String
    let duration: Int
}
let song = Song(title: "No, no, no", artist: "Fizz", duration: 150) // song is an instance of Song
                                                                    // this is called a memberwise
                                                                    // initializer
song.title
song.artist
song.duration

struct Song {
    let title: String
    let artist: String
    let duration: Int
    var rating: Int // mutable property
}
var song = Song(title: "No, no, no", artist: "Fizz", duration: 150, rating: 0)
song.rating = 4

struct Song {
    let title: String
    let artist: String
    let duration: Int
    
    var formattedDuration: String { // calcualted property
        let minutes = duration / 60
        // The modulus (%) operator gives the remainder
        let seconds = duration % 60
        return "\(minutes)m \(seconds)s"
    }
}
let song = Song(title: "No, no, no", artist: "Fizz", duration: 150)
song.formattedDuration // value: 2m 30s

struct Rectangle { // struct with instance method
    let width: Int
    let height: Int
    
    func biggerThan(_ rectangle: Rectangle) -> Bool {
        let areaOne = width * height
        let areaTwo = rectangle.width * rectangle.height
        return areaOne > areaTwo
    }
}
let rectangle = Rectangle(width: 10, height: 10)
let otherRectangle = Rectangle(width: 10, height: 20)
rectangle.biggerThan(otherRectangle) // value: false
otherRectangle.biggerThan(rectangle) // value: true

A function inside a struct is called a method.


Classes
-------
class Singer {
    var name: String
    var age: Int

    init(name: String, age: Int) { // "init" is a special method
        self.name = name // use "self" because parameter names being passed in are the same as
			 // the names of the properties we want to assign, i.e., the name
			 // property of this object should be set to the name parameter that
			 // was passed in; you wouldn't need self if you did "var xxx = name"
        self.age = age
    } // *** Swift requires all non-optional properties have a value by the end of the initializer
      //     or by the time the initializer calls any other method, whichever comes first

    func sing() {
        print("La la la la")
    }
}

Another complex data type like structs but differences are:
1. no memberwise initializers - you have to write your own - see init above - the non-optimal
   options to writing an initializer are: i) make the 2 values optional strings (but this introduces
   optionals in your code where they don't need to be), ii) assign two values a default value
   (sub-optimal if default values are never used)
2. can define a class as being based off another class but adding any new things you want
3. when you create an instance of a class, it's called an object; if you copy that object,
   both copies point at the same data by default - change one and the other changes too
4. is a reference type - passing a class object around program is actually passing a reference
   to the object


Built-In Functions
------------------
abs() // converts a value, if negative, to positive - in Foundation


loops
-----
break - break out of loop
continue - jump to next execution of loop

for...in - for i in 1...10 {}; for _ in 1...10 {} // use "_" when you don't nned to know what number you're on
           for i in 1..<5 {} will run from 1 to 4
           for _ in 0...count where count > 100 {}
           for song in songs {}
           let friends = ["Name", "Name2", "Name3", "Name4", "Name5"]
           for friend in friends {
               print(friend)
           }
           print("Done, all friends have been printed.")

           floors: for floor in 12...15 {
              rooms: for room in 11...16 {
                 if room == 13 {
                    print("Not going to do room 13")
                    continue floors
                 }
                 print("Clean room \(floor)\(room)")
              }
           }
	   var people = ["players", "haters", "heart-breakers", "fakers"]
	   var actions = ["play", "hate", "break", "fake"]
	   for i in 0 ..< people.count {
	      print("\(people[i]) gonna \(actions[i])")
	   }

while - while <condition> { <loop code> }

repeat - repeat { <loop code> } while <condition>

let number = Int.max
let numberDescription: String
switch number {
case 0:
   numberDescription = "Zero"
case 1...9:
   numberDescription = "Between 1 and 9"
case let negativeNumber where negativeNumber < 0
   numberDescription = "Negative Number"
case _ where number > .max / 2:
   numberDescription = "Very Large"
default:
   numberDescroiption = "No Description"
}

switch number % 2 {
case 0:
   ...
default:
   ...
}

let animalString = "Elephant"
let isHousePet: Bool
switch animalString {
case "Dog", "Cat", "Gerbil":
   isHousePet = true
default:
   isHousePet = false
}

let coordinates = (0.0, 0.0) // implied type set to Double since deciml points were used
let pointCategory: String
switch coordinates {
case (0,0): // can leave off the ".0" decimal portion since compiler already knows they are type Double
   pointCategory = "Origin"
case (let x, 0):
   pointCategory = "On the x-axis at \(x)"
case (0, let y):
   pointCategory = "On the y-axis at \(y)"
case let (x, y) where y == x * x"
   pointCategory = "Along y = x ^ 2"
case (x, y):
   pointCategory = "No zero coordinates - x = \(x), y = \(y)"
}


comments
--------
// A single line comment
/* A multi-
   line comment */
//: [Previous](@previous) - link comments, viewable when Playground is rendered
//: [Next](@next)


unary operators
---------------
!


binary (infix) operators
------------------------
+


ternary operators
-----------------
? // condition - <condition> ? <true value> : <false value>


special operators
-----------------
score += 2 is the same as score = score + 2 // for strings, operator will append
score -= 2 is the same as score = score - 2
score *= -1 is the same as score = score * -1
score = -score is the same as above
== // comparison operator
! // not operator
!= // not equal comparison operator
%  // modulus/remainder operator - 5 % 2 evaluates to 1
... // Closed Range Operator - used in for loops & case statements
..< // Half Open Range Operator - used in for loops & case statements
?? // nil coalescing operator
betterStudent = samGrade > chrisGrade ? "Sam" : "Chris" // Ternary Conditional Operator


special characters
------------------


Xcode
-----
View -> Libraries -> Show Library // show object library
Cmd-Shift-L // show object library
Alt-Cmd-Shift-L // show object library in floating window

View -> Utilities -> Show Identity Inspector
Alt-Cmd-3 // activate identity inspector

Command-Option-Enter // open an assistant editor toggle
Command-Ctrl-t // open editor side by side; will keep adding more editors
Command-Option-Ctrl-t // open editor below current
Command-j // followed by arrow keys to cycle through open editors
Command-Option-Ctrl-w // close editor

Shift-Ctrl and click in multiple lines // multi-line edits
Option and drag // contiguous multi-line edits
Shift-Ctrl-up/down arrow // same as above but don't need to use the mouse

Ctrl-Space // Code Completion dropdown toggle

Option-Command-Right/Left Square Bracket // move entire line up or down

Cmd-/ // comment line or selection toggle

Ctrl-i // balance indentation of line or selection

Ctrl-Cmd-Right/Left arrow keys // forward or rewind to previously visited Xcode files
Ctrl-Cmd-J or Click // jump to definition
Shift-Ctrl-Cmd-f // find selected symbol in workspace
Shift-Ctrl-Cmd-h // same as above but focus is on methods
Shift-Cmd-o // jump to any source location in project
Cmd-l // jump to specific line
Ctrl-6 // drop down menu of symbols
Cmd-hover over minimap // same as above


Command-t // open new tab
Editor -> Edit all in Scope // edit multiple at once
Click on item on first line & Ctrl-Shift-Click on remaining lines // add text to multiple
Option-<click> on a variable, type, method or property to pull up documentation
Option-<click> on file will pull up Assistant Editor; Command-<enter> to remove
Command-<b> to build project
Command + number will cycle through navigator icons
Command-<0> Command-Option-<0> toggle on/off left and right panes
Highlight code segment and Control-<i> to autofix indenting
Command-<+> Command-<-> to adjust code window font size
Command and hover over bracket will show you begin/end
Highlight section of code, Command-</> to comment out, toggle switch
Command-Shift-<o> for quick navigation
Command-Contol-<e> to edit within scope only
View > Utilities > Show Quick Help Inspector from the menu
Window > “Documentation and API Reference”
View Controller's job is to manage a single screen in your app or part of a screen - for
every screen there will be a View Controller. Each View Controller has a storyboard with
associated code file.
To display alert pop-up boxes, create UIAlertController and UIAlertAction for every button
you want to add to the alert.
The Class that controls a View Controller is the ViewController Class.
Connectiions: Outlets - connect varaibles in code to objects on storyboard
                        ("@IBOutlet weak" will appear in code which tells Xcode
                        the property is an Outlet; "UIView!" - UIView is the basic
                        view type used in all iOS apps; "!" means if the outlet is not
                        connected and you try to use it, your application will crash)
              Actions - connect controls (switches, buttons, etc.) to methods in code
                        (tapping a button runs method)
