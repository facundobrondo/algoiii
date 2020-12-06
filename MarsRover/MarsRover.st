!classDefinition: #MarsRoverTest category: 'MarsRover'!
TestCase subclass: #MarsRoverTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'ao 12/6/2020 16:40:30'!
should: anInvalidBlock raise: error asserting: aBlockToTest

	[ anInvalidBlock value . self fail. ]
	on: error
	do: [ :anError | aBlockToTest value: anError ].

	! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'ao 12/6/2020 16:17:03'!
test0
	
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

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'ao 12/6/2020 16:17:29'!
test13
	
	| marsRover |
	marsRover := MarsRover createOn: (0@0) pointingTo: #N.
	
	marsRover processCommand: 'l'.
	
	self assert: ( marsRover isAt: (0@0) ).
	self assert: (marsRover isPointingTo: #O )! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'ao 12/6/2020 16:18:47'!
test14
	
	| marsRover |
	marsRover := MarsRover createOn: (0@0) pointingTo: #E.
	
	marsRover processCommand: 'l'.
	
	self assert: ( marsRover isAt: (0@0) ).
	self assert: (marsRover isPointingTo: #N )! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'ao 12/6/2020 16:19:57'!
test15
	
	| marsRover |
	marsRover := MarsRover createOn: (0@0) pointingTo: #S.
	
	marsRover processCommand: 'l'.
	
	self assert: ( marsRover isAt: (0@0) ).
	self assert: (marsRover isPointingTo: #E )! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'ao 12/6/2020 16:20:48'!
test16
	
	| marsRover |
	marsRover := MarsRover createOn: (0@0) pointingTo: #O.
	
	marsRover processCommand: 'l'.
	
	self assert: ( marsRover isAt: (0@0) ).
	self assert: (marsRover isPointingTo: #S )! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'ao 12/6/2020 17:09:17'!
test17
	
	| marsRover |
	marsRover := MarsRover createOn: (0@0) pointingTo: #O.
	
	self should: [ marsRover processCommand: 'a' ] 
	raise: Error 
	asserting: [ :anError | self assert: anError messageText = MarsRover invalidCommand ].
	
	! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'ao 12/6/2020 17:46:14'!
test18
	
	| marsRover |
	marsRover := MarsRover createOn: (0@0) pointingTo: #N.
	
	marsRover processCommands: 'fl'.	
	
	self assert: ( marsRover isAt: (0@1) ).
	self assert: ( marsRover isPointingTo: #O ).
	
	
	! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'PDG 12/6/2020 18:05:07'!
test19
	
	| marsRover |
	marsRover := MarsRover createOn: (0@0) pointingTo: #O.
	
	
	self should: [ marsRover processCommands: 'flarb' ] 
	raise: Error 
	asserting: [ :anError | self assert: anError messageText = MarsRover invalidCommand ].
	
	self assert: ( marsRover isAt: (-1@0) ).
	self assert: ( marsRover isPointingTo: #S ).
	
	! !

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
	instanceVariableNames: 'point cardinalPoint'
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

!MarsRover methodsFor: 'as yet unclassified' stamp: 'ao 12/6/2020 17:02:09'!
processCommand: command

	command = 'f' ifTrue: [ 
		cardinalPoint = #N ifTrue: [^point := point + (0@1)].
		cardinalPoint = #E ifTrue: [^point := point + (1@0)].
		cardinalPoint = #O ifTrue: [^point := point + (-1@0)].
		cardinalPoint = #S ifTrue: [^point := point + (0@-1)].
	].
	command = 'b' ifTrue: [
		cardinalPoint = #N ifTrue: [^point := point + (0@-1)		 ].
		cardinalPoint = #E ifTrue: [^point := point + (-1@0)		 ].
		cardinalPoint = #O ifTrue: [^point := point + (1@0)		 ].
		cardinalPoint = #S ifTrue: [^point := point + (0@1)		 ].
	].
	command = 'r' ifTrue: [
		cardinalPoint = #N ifTrue: [ ^cardinalPoint := #E ].
		cardinalPoint = #E ifTrue: [ ^cardinalPoint := #S ].
		cardinalPoint = #S ifTrue: [ ^cardinalPoint := #O ].
		cardinalPoint = #O ifTrue: [ ^cardinalPoint := #N ].
	].
	command = 'l' ifTrue: [
		cardinalPoint = #N ifTrue: [ ^cardinalPoint := #O ].
		cardinalPoint = #E ifTrue: [ ^cardinalPoint := #N ].
		cardinalPoint = #S ifTrue: [ ^cardinalPoint := #E ].
		cardinalPoint = #O ifTrue: [ ^cardinalPoint := #S ].
	].
	command = '' ifTrue: [^nil].	
	self signalInvalidCommand.
		! !

!MarsRover methodsFor: 'as yet unclassified' stamp: 'ao 12/6/2020 17:32:11'!
processCommands: aStreamOfCommands

	^ aStreamOfCommands do: [ :aCommand | self processCommand: aCommand asString ]! !

!MarsRover methodsFor: 'as yet unclassified' stamp: 'ao 12/6/2020 16:50:51'!
signalInvalidCommand

	self error: self class invalidCommand.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRover class' category: 'MarsRover'!
MarsRover class
	instanceVariableNames: ''!

!MarsRover class methodsFor: 'as yet unclassified' stamp: 'ao 12/6/2020 14:49:40'!
createOn: aPoint pointingTo: aCardinalPoint
	
	^ self new initializeOn: aPoint  pointingTo: aCardinalPoint! !

!MarsRover class methodsFor: 'as yet unclassified' stamp: 'ao 12/6/2020 16:50:19'!
invalidCommand
	
	^ 'The command is invalid'! !
