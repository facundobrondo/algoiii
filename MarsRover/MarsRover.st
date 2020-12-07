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

!MarsRover methodsFor: 'as yet unclassified' stamp: 'ao 12/6/2020 22:50:41'!
newOrientation: aCardinalPoint

	cardinalPoint := aCardinalPoint ! !

!MarsRover methodsFor: 'as yet unclassified' stamp: 'ao 12/6/2020 22:45:13'!
newPosition: aPosition

	point := aPosition ! !

!MarsRover methodsFor: 'as yet unclassified' stamp: 'ao 12/6/2020 22:41:31'!
orientation

	^cardinalPoint ! !

!MarsRover methodsFor: 'as yet unclassified' stamp: 'ao 12/6/2020 22:44:35'!
position

	^point ! !

!MarsRover methodsFor: 'as yet unclassified' stamp: 'ao 12/6/2020 22:57:05'!
processCommand: aCommand

	| command |
	
	command := MarsRoverCommands createFor: aCommand.
	command executeCommandFor: self.

	"command = 'f' ifTrue: [ 
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
	self signalInvalidCommand."
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


!classDefinition: #MarsRoverCommands category: 'MarsRover'!
Object subclass: #MarsRoverCommands
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRoverCommands class' category: 'MarsRover'!
MarsRoverCommands class
	instanceVariableNames: ''!

!MarsRoverCommands class methodsFor: 'as yet unclassified' stamp: 'ao 12/6/2020 23:06:04'!
createFor: aCommand

	|subClassToInstantiate|

	subClassToInstantiate := self allSubclasses detect: [ :aSubclass | aSubclass canHandle: aCommand ].
	^subClassToInstantiate new
	! !


!classDefinition: #GoBackward category: 'MarsRover'!
MarsRoverCommands subclass: #GoBackward
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!GoBackward methodsFor: 'as yet unclassified' stamp: 'ao 12/6/2020 23:45:24'!
executeCommandFor: marsRover

	"cardinal := Cardinal create: marsRover orientation 
	cardinal xxxx: marsRover"
	marsRover orientation = #N ifTrue: [ ^marsRover newPosition: marsRover position + (0@-1)	 ].
	marsRover orientation = #E ifTrue: [ ^marsRover newPosition: marsRover position + (-1@0)	 ].
	marsRover orientation = #O ifTrue: [ ^marsRover newPosition: marsRover position + (1@0)	 ].
	marsRover orientation = #S ifTrue: [ ^marsRover newPosition: marsRover position + (0@1)	 ].! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'GoBackward class' category: 'MarsRover'!
GoBackward class
	instanceVariableNames: ''!

!GoBackward class methodsFor: 'as yet unclassified' stamp: 'ao 12/6/2020 23:24:38'!
canHandle: aCommand

	^ aCommand = 'b'! !


!classDefinition: #GoForward category: 'MarsRover'!
MarsRoverCommands subclass: #GoForward
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!GoForward methodsFor: 'as yet unclassified' stamp: 'ao 12/6/2020 23:30:34'!
executeCommandFor: marsRover
	marsRover orientation = #N ifTrue: [ ^marsRover newPosition: marsRover position + (0@1)	 ].
	marsRover orientation = #E ifTrue: [ ^marsRover newPosition: marsRover position + (1@0)	 ].
	marsRover orientation = #O ifTrue: [ ^marsRover newPosition: marsRover position + (-1@0)	 ].
	marsRover orientation = #S ifTrue: [ ^marsRover newPosition: marsRover position + (0@-1)	 ].! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'GoForward class' category: 'MarsRover'!
GoForward class
	instanceVariableNames: ''!

!GoForward class methodsFor: 'as yet unclassified' stamp: 'ao 12/6/2020 23:25:02'!
canHandle: aCommand

	^ aCommand = 'f'! !


!classDefinition: #InvalidCommand category: 'MarsRover'!
MarsRoverCommands subclass: #InvalidCommand
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!InvalidCommand methodsFor: 'as yet unclassified' stamp: 'ao 12/6/2020 22:52:04'!
executeCommandFor: marsRover
	marsRover signalInvalidCommand! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'InvalidCommand class' category: 'MarsRover'!
InvalidCommand class
	instanceVariableNames: ''!

!InvalidCommand class methodsFor: 'as yet unclassified' stamp: 'ao 12/6/2020 23:25:12'!
canHandle: aCommand

	^ (( 'fbrl' includes: aCommand ) not ) and:[ ( '' ~= aCommand )]! !


!classDefinition: #NullCommand category: 'MarsRover'!
MarsRoverCommands subclass: #NullCommand
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!NullCommand methodsFor: 'as yet unclassified' stamp: 'ao 12/6/2020 22:53:50'!
executeCommandFor: marsRover
! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'NullCommand class' category: 'MarsRover'!
NullCommand class
	instanceVariableNames: ''!

!NullCommand class methodsFor: 'as yet unclassified' stamp: 'ao 12/6/2020 23:25:18'!
canHandle: aCommand

	^ aCommand = ''! !


!classDefinition: #TurnLeft category: 'MarsRover'!
MarsRoverCommands subclass: #TurnLeft
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!TurnLeft methodsFor: 'as yet unclassified' stamp: 'ao 12/6/2020 23:29:40'!
executeCommandFor: marsRover
	marsRover orientation = #N ifTrue: [ ^marsRover newOrientation: #O ].
	marsRover orientation = #E ifTrue: [ ^marsRover newOrientation: #N ].
	marsRover orientation = #O ifTrue: [ ^marsRover newOrientation: #S ].
	marsRover orientation = #S ifTrue: [ ^marsRover newOrientation: #E ].! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TurnLeft class' category: 'MarsRover'!
TurnLeft class
	instanceVariableNames: ''!

!TurnLeft class methodsFor: 'as yet unclassified' stamp: 'ao 12/6/2020 23:25:25'!
canHandle: aCommand

	^ aCommand = 'l'! !


!classDefinition: #TurnRight category: 'MarsRover'!
MarsRoverCommands subclass: #TurnRight
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!TurnRight methodsFor: 'as yet unclassified' stamp: 'ao 12/6/2020 23:29:50'!
executeCommandFor: marsRover
	marsRover orientation = #N ifTrue: [ ^marsRover newOrientation: #E ].
	marsRover orientation = #E ifTrue: [ ^marsRover newOrientation: #S ].
	marsRover orientation = #O ifTrue: [ ^marsRover newOrientation: #N ].
	marsRover orientation = #S ifTrue: [ ^marsRover newOrientation: #O ].! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TurnRight class' category: 'MarsRover'!
TurnRight class
	instanceVariableNames: ''!

!TurnRight class methodsFor: 'as yet unclassified' stamp: 'ao 12/6/2020 23:25:39'!
canHandle: aCommand

	^ aCommand = 'r'! !
