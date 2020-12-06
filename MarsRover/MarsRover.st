!classDefinition: #MarsRoverTest category: 'MarsRover'!
TestCase subclass: #MarsRoverTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'ao 12/6/2020 16:11:20'!
test00
	
	| marsRover |
	marsRover := MarsRover createOn: (0@0) pointingTo: #N.
	
	marsRover processCommand: ''.
	
	self assert: ( marsRover isAt: (0@0) ).
	self assert: ( marsRover isPointingTo: #N )! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'ao 12/6/2020 15:12:28'!
test1
	
	| marsRover |
	marsRover := MarsRover createOn: (0@0) pointingTo: #N.
	
	marsRover processCommand: 'f'.
	
	self assert: ( marsRover isAt: (0@1) ).
	self assert: (marsRover isPointingTo: #N )! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'ao 12/6/2020 16:03:38'!
test10
	
	| marsRover |
	marsRover := MarsRover createOn: (0@0) pointingTo: #E.
	
	marsRover processCommand: 'r'.
	
	self assert: ( marsRover isAt: (0@0) ).
	self assert: (marsRover isPointingTo: #S )! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'ao 12/6/2020 16:09:56'!
test11
	
	| marsRover |
	marsRover := MarsRover createOn: (0@0) pointingTo: #S.
	
	marsRover processCommand: 'r'.
	
	self assert: ( marsRover isAt: (0@0) ).
	self assert: (marsRover isPointingTo: #O )! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'ao 12/6/2020 16:10:30'!
test12
	
	| marsRover |
	marsRover := MarsRover createOn: (0@0) pointingTo: #O.
	
	marsRover processCommand: 'r'.
	
	self assert: ( marsRover isAt: (0@0) ).
	self assert: (marsRover isPointingTo: #N )! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'ao 12/6/2020 15:22:25'!
test2
	
	| marsRover |
	marsRover := MarsRover createOn: (0@0) pointingTo: #E.
	
	marsRover processCommand: 'f'.
	
	self assert: ( marsRover isAt: (1@0) ).
	self assert: (marsRover isPointingTo: #E )! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'ao 12/6/2020 15:25:16'!
test3
	
	| marsRover |
	marsRover := MarsRover createOn: (0@0) pointingTo: #O.
	
	marsRover processCommand: 'f'.
	
	self assert: ( marsRover isAt: ( -1@0) ).
	self assert: (marsRover isPointingTo: #O )! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'ao 12/6/2020 15:25:59'!
test4
	
	| marsRover |
	marsRover := MarsRover createOn: (0@0) pointingTo: #S.
	
	marsRover processCommand: 'f'.
	
	self assert: ( marsRover isAt: ( 0@-1) ).
	self assert: (marsRover isPointingTo: #S )! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'ao 12/6/2020 15:48:08'!
test5
	
	| marsRover |
	marsRover := MarsRover createOn: (0@0) pointingTo: #N.
	
	marsRover processCommand: 'b'.
	
	self assert: ( marsRover isAt: (0@-1) ).
	self assert: (marsRover isPointingTo: #N )! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'ao 12/6/2020 15:55:09'!
test6
	
	| marsRover |
	marsRover := MarsRover createOn: (0@0) pointingTo: #E.
	
	marsRover processCommand: 'b'.
	
	self assert: ( marsRover isAt: (-1@0) ).
	self assert: (marsRover isPointingTo: #E )! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'ao 12/6/2020 15:56:48'!
test7
	
	| marsRover |
	marsRover := MarsRover createOn: (0@0) pointingTo: #O.
	
	marsRover processCommand: 'b'.
	
	self assert: ( marsRover isAt: (1@0) ).
	self assert: (marsRover isPointingTo: #O )! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'ao 12/6/2020 15:57:49'!
test8
	
	| marsRover |
	marsRover := MarsRover createOn: (0@0) pointingTo: #S.
	
	marsRover processCommand: 'b'.
	
	self assert: ( marsRover isAt: (0@1) ).
	self assert: (marsRover isPointingTo: #S )! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'ao 12/6/2020 15:59:43'!
test9
	
	| marsRover |
	marsRover := MarsRover createOn: (0@0) pointingTo: #N.
	
	marsRover processCommand: 'r'.
	
	self assert: ( marsRover isAt: (0@0) ).
	self assert: (marsRover isPointingTo: #E )! !


!classDefinition: #MarsRover category: 'MarsRover'!
Object subclass: #MarsRover
	instanceVariableNames: 'position facingTo point cardinalPoint'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!MarsRover methodsFor: 'initialization' stamp: 'ao 12/6/2020 14:56:55'!
initializeOn: aPoint pointingTo: aCardinalPoint 

	point := aPoint.
	cardinalPoint := aCardinalPoint.! !


!MarsRover methodsFor: 'as yet unclassified' stamp: 'ao 12/6/2020 15:05:43'!
isAt: aPoint 

	^ point = aPoint! !

!MarsRover methodsFor: 'as yet unclassified' stamp: 'ao 12/6/2020 15:11:49'!
isPointingTo: aCardinalPoint

	^ cardinalPoint = aCardinalPoint ! !

!MarsRover methodsFor: 'as yet unclassified' stamp: 'ao 12/6/2020 16:10:49'!
processCommand: command

	command = 'f' ifTrue: [ 
		cardinalPoint = #N ifTrue: [point := point + (0@1)].
		cardinalPoint = #E ifTrue: [point := point + (1@0)].
		cardinalPoint = #O ifTrue: [point := point + (-1@0)].
		cardinalPoint = #S ifTrue: [point := point + (0@-1)].
	].
	command = 'b' ifTrue: [
		cardinalPoint = #N ifTrue: [point := point + (0@-1)		 ].
		cardinalPoint = #E ifTrue: [point := point + (-1@0)		 ].
		cardinalPoint = #O ifTrue: [point := point + (1@0)		 ].
		cardinalPoint = #S ifTrue: [point := point + (0@1)		 ].
	].
	command = 'r' ifTrue: [
		cardinalPoint = #N ifTrue: [ ^cardinalPoint := #E ].
		cardinalPoint = #E ifTrue: [ ^cardinalPoint := #S ].
		cardinalPoint = #S ifTrue: [ ^cardinalPoint := #O ].
		cardinalPoint = #O ifTrue: [ ^cardinalPoint := #N ].
	]! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRover class' category: 'MarsRover'!
MarsRover class
	instanceVariableNames: ''!

!MarsRover class methodsFor: 'as yet unclassified' stamp: 'ao 12/6/2020 14:49:40'!
createOn: aPoint pointingTo: aCardinalPoint
	
	^ self new initializeOn: aPoint  pointingTo: aCardinalPoint! !
