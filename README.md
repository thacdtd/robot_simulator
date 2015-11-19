## TOY ROBOT SIMULATOR
#### Description
 * The application is a simulation of a toy robot moving on a square tabletop, of dimensions 5 units x 5 units.
 * There are no other obstructions on the table surface.
 * The robot is free to roam around the surface of the table, but must be prevented from falling to destruction. Any movement
that would result in the robot falling from the table must be prevented, however further valid movement commands must still be allowed.
 * Create an application that can read in commands of the following form:
 
``` 
 PLACE X,Y,F
 MOVE
 LEFT
 RIGHT
 REPORT 
```
* PLACE will put the toy robot on the table in position X,Y and facing NORTH,
SOUTH, EAST or WEST.
* The origin (0,0) can be considered to be the SOUTH WEST most corner.
* The first valid command to the robot is a PLACE command, after that, any
sequence of commands may be issued, in any order, including another PLACE
command. The application should discard all commands in the sequence until a
valid PLACE command has been executed.
* MOVE will move the toy robot one unit forward in the direction it is currently
facing.
* LEFT and RIGHT will rotate the robot 90 degrees in the specified direction
without changing the position of the robot.
* REPORT will announce the X,Y and F of the robot. This can be in any form, but
standard output is sufficient.
* A robot that is not on the table can choose the ignore the MOVE, LEFT, RIGHT 
and REPORT commands.

#### Constraints:
* The toy robot must not fall off the table during movement. This also includes
the initial placement of the toy robot.
* Any move that would cause the robot to fall must be ignored.

## ENVIRONMENTS

This application was developed on Mac OSX El Capitan 10.11.1, Ruby 2.2.3.

Compatible/tested environments:
* Ubuntu 15.04, ruby >= 2.0
* Mac OSX 10.1.1, ruby >= 2.0


## SYSTEM DEPENDENCIES & CONFIGURATION

```
ruby => 2.1.0p0
```

To check your version run:

```
$ ruby -v
```

To learn how to install ruby visit https://www.ruby-lang.org/en/installation.

## APPLICATION INSTALLATION INSTRUCTIONS

To install the application, cd to the root directory and invoke:
```
bundle install
```

## USAGE INSTRUCTIONS

To run the application, from the root directory invoke:

```
$ ruby main.rb
```

If you want to run from command line, input one of these command:

``` 
 PLACE X,Y,F
 MOVE
 LEFT
 RIGHT
 REPORT 
```

If you want to run from file, input the command:

```
RUN file
```
*file* is the directory to the input file.

## TESTING INSTRUCTIONS

To test the application, from the root directory run:

```
$ rspec
```

## INPUT AND OUTPUT

```
a)
PLACE 0,0,NORTH
MOVE
REPORT
Output: 0,1,NORTH
```
```
b)
PLACE 0,0,NORTH
LEFT
REPORT
Output: 0,0,WEST
```
```
c)
PLACE 1,2,EAST
MOVE
MOVE
LEFT
MOVE
REPORT
Output: 3,3,NORTH
```
```
d)
RUN test_data/sample3.txt
Output: 3,3,NORTH 
```
## CONTRIBUTORS

This application is made by Thac Do. Reach me at:
* Twitter: @thacdtd
* Email: thacdtd[dot]gmail[dot]com

## LICENSE

Copyright (c) 2015 Thac Do

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
"Software"), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
