!classDefinition: #MarsRoverTest category: 'MarsRover'!
TestCase subclass: #MarsRoverTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!MarsRoverTest methodsFor: 'test-utils' stamp: 'ao 12/6/2020 16:40:30'!
should: anInvalidBlock raise: error asserting: aBlockToTest

	[ anInvalidBlock value . self fail. ]
	on: error
	do: [ :anError | aBlockToTest value: anError ].

	! !


!MarsRoverTest methodsFor: 'tests' stamp: 'PDG 12/7/2020 10:04:59'!
test00MarsRoverDoesNothingWhenIssuedNoCommands
	
	| marsRover |
	marsRover := MarsRover createOn: (0@0) pointingTo: #N.
	
	marsRover processCommand: ''.
	
	self assert: ( marsRover isAt: (0@0) ).
	self assert: ( marsRover isPointingTo: #N )! !

!MarsRoverTest methodsFor: 'tests' stamp: 'PDG 12/7/2020 10:07:03'!
test01ForwardCommandMovesMarsRoverNorthWhenPointingToNorth
	
	| marsRover |
	marsRover := MarsRover createOn: (0@0) pointingTo: #N.
	
	marsRover processCommand: 'f'.
	
	self assert: ( marsRover isAt: (0@1) ).
	self assert: (marsRover isPointingTo: #N )! !

!MarsRoverTest methodsFor: 'tests' stamp: 'PDG 12/7/2020 10:07:23'!
test02ForwardCommandMovesMarsRoverEastWhenPointingToEast
	
	| marsRover |
	marsRover := MarsRover createOn: (0@0) pointingTo: #E.
	
	marsRover processCommand: 'f'.
	
	self assert: ( marsRover isAt: (1@0) ).
	self assert: (marsRover isPointingTo: #E )! !

!MarsRoverTest methodsFor: 'tests' stamp: 'PDG 12/7/2020 10:07:45'!
test03ForwardCommandMovesMarsRoverWestWhenPointingToWest
	
	| marsRover |
	marsRover := MarsRover createOn: (0@0) pointingTo: #O.
	
	marsRover processCommand: 'f'.
	
	self assert: ( marsRover isAt: ( -1@0) ).
	self assert: (marsRover isPointingTo: #O )! !

!MarsRoverTest methodsFor: 'tests' stamp: 'PDG 12/7/2020 10:08:12'!
test04ForwardCommandMovesMarsRoverSouhtWhenPointingToSouth
	
	| marsRover |
	marsRover := MarsRover createOn: (0@0) pointingTo: #S.
	
	marsRover processCommand: 'f'.
	
	self assert: ( marsRover isAt: ( 0@-1) ).
	self assert: (marsRover isPointingTo: #S )! !

!MarsRoverTest methodsFor: 'tests' stamp: 'PDG 12/7/2020 10:08:47'!
test05BackwardCommandMovesMarsRoverSouthWhenPointingToNorth
	
	| marsRover |
	marsRover := MarsRover createOn: (0@0) pointingTo: #N.
	
	marsRover processCommand: 'b'.
	
	self assert: ( marsRover isAt: (0@-1) ).
	self assert: (marsRover isPointingTo: #N )! !

!MarsRoverTest methodsFor: 'tests' stamp: 'PDG 12/7/2020 10:09:07'!
test06BackwardCommandMovesMarsRoverWestWhenPointingToEast
	
	| marsRover |
	marsRover := MarsRover createOn: (0@0) pointingTo: #E.
	
	marsRover processCommand: 'b'.
	
	self assert: ( marsRover isAt: (-1@0) ).
	self assert: (marsRover isPointingTo: #E )! !

!MarsRoverTest methodsFor: 'tests' stamp: 'PDG 12/7/2020 10:09:42'!
test07BackwardCommandMovesMarsRoverEastWhenPointingToWest
	
	| marsRover |
	marsRover := MarsRover createOn: (0@0) pointingTo: #O.
	
	marsRover processCommand: 'b'.
	
	self assert: ( marsRover isAt: (1@0) ).
	self assert: (marsRover isPointingTo: #O )! !

!MarsRoverTest methodsFor: 'tests' stamp: 'PDG 12/7/2020 10:10:21'!
test08BackwardCommandMovesMarsRoverNorthWhenPointingToSouth
	
	| marsRover |
	marsRover := MarsRover createOn: (0@0) pointingTo: #S.
	
	marsRover processCommand: 'b'.
	
	self assert: ( marsRover isAt: (0@1) ).
	self assert: (marsRover isPointingTo: #S )! !

!MarsRoverTest methodsFor: 'tests' stamp: 'PDG 12/7/2020 10:11:14'!
test09RightCommandTurnsMarsRoverEastWhenPointingToNorth
	
	| marsRover |
	marsRover := MarsRover createOn: (0@0) pointingTo: #N.
	
	marsRover processCommand: 'r'.
	
	self assert: ( marsRover isAt: (0@0) ).
	self assert: (marsRover isPointingTo: #E )! !

!MarsRoverTest methodsFor: 'tests' stamp: 'PDG 12/7/2020 10:11:53'!
test10RightCommandTurnsMarsRoverSouthWhenPointingToEast
	
	| marsRover |
	marsRover := MarsRover createOn: (0@0) pointingTo: #E.
	
	marsRover processCommand: 'r'.
	
	self assert: ( marsRover isAt: (0@0) ).
	self assert: (marsRover isPointingTo: #S )! !

!MarsRoverTest methodsFor: 'tests' stamp: 'PDG 12/7/2020 10:12:16'!
test11RightCommandTurnsMarsRoverWestWhenPointingToSouth
	
	| marsRover |
	marsRover := MarsRover createOn: (0@0) pointingTo: #S.
	
	marsRover processCommand: 'r'.
	
	self assert: ( marsRover isAt: (0@0) ).
	self assert: (marsRover isPointingTo: #O )! !

!MarsRoverTest methodsFor: 'tests' stamp: 'PDG 12/7/2020 10:12:49'!
test12RightCommandTurnsMarsRoverNorthWhenPointingToWest
	
	| marsRover |
	marsRover := MarsRover createOn: (0@0) pointingTo: #O.
	
	marsRover processCommand: 'r'.
	
	self assert: ( marsRover isAt: (0@0) ).
	self assert: (marsRover isPointingTo: #N )! !

!MarsRoverTest methodsFor: 'tests' stamp: 'PDG 12/7/2020 10:13:15'!
test13LeftCommandTurnsMarsRoverWestWhenPointingToNorth
	
	| marsRover |
	marsRover := MarsRover createOn: (0@0) pointingTo: #N.
	
	marsRover processCommand: 'l'.
	
	self assert: ( marsRover isAt: (0@0) ).
	self assert: (marsRover isPointingTo: #O )! !

!MarsRoverTest methodsFor: 'tests' stamp: 'PDG 12/7/2020 10:15:49'!
test14LeftCommandTurnsMarsRoverNorthWhenPointingToEast
	
	| marsRover |
	marsRover := MarsRover createOn: (0@0) pointingTo: #E.
	
	marsRover processCommand: 'l'.
	
	self assert: ( marsRover isAt: (0@0) ).
	self assert: (marsRover isPointingTo: #N )! !

!MarsRoverTest methodsFor: 'tests' stamp: 'PDG 12/7/2020 10:16:12'!
test15LeftCommandTurnsMarsRoverEastWhenPointingToSouth
	
	| marsRover |
	marsRover := MarsRover createOn: (0@0) pointingTo: #S.
	
	marsRover processCommand: 'l'.
	
	self assert: ( marsRover isAt: (0@0) ).
	self assert: (marsRover isPointingTo: #E )! !

!MarsRoverTest methodsFor: 'tests' stamp: 'PDG 12/7/2020 10:16:38'!
test16LeftCommandTurnsMarsRoverSouthWhenPointingToWest
	
	| marsRover |
	marsRover := MarsRover createOn: (0@0) pointingTo: #O.
	
	marsRover processCommand: 'l'.
	
	self assert: ( marsRover isAt: (0@0) ).
	self assert: (marsRover isPointingTo: #S )! !

!MarsRoverTest methodsFor: 'tests' stamp: 'PDG 12/7/2020 10:17:24'!
test17MarsRoverRaisesAnErrorWhenIssuedAnInvalidCommand
	
	| marsRover |
	marsRover := MarsRover createOn: (0@0) pointingTo: #O.
	
	self should: [ marsRover processCommand: 'a' ] 
	raise: Error 
	asserting: [ :anError | self assert: anError messageText = MarsRover invalidCommand ].
	
	! !

!MarsRoverTest methodsFor: 'tests' stamp: 'PDG 12/7/2020 10:19:00'!
test18MarsRoverEntirelyProcessesAStreamOfValidCommands
	
	| marsRover |
	marsRover := MarsRover createOn: (0@0) pointingTo: #N.
	
	marsRover processCommands: 'fl'.	
	
	self assert: ( marsRover isAt: (0@1) ).
	self assert: ( marsRover isPointingTo: #O ).
	
	
	! !

!MarsRoverTest methodsFor: 'tests' stamp: 'PDG 12/7/2020 10:21:05'!
test19MarsRoverProcessesAStreamOfCommandsUpToAnInvalidOneAndStopsProcessing
	
	| marsRover |
	marsRover := MarsRover createOn: (0@0) pointingTo: #O.
	
	
	self should: [ marsRover processCommands: 'flarb' ] 
	raise: Error 
	asserting: [ :anError | self assert: anError messageText = MarsRover invalidCommand ].
	
	self assert: ( marsRover isAt: (-1@0) ).
	self assert: ( marsRover isPointingTo: #S ).
	
	! !


!classDefinition: #MarsRover category: 'MarsRover'!
Object subclass: #MarsRover
	instanceVariableNames: 'position cardinalPoint positionOffset'
	classVariableNames: 'CardinalPointsClockwiseList OffsetByCardinal'
	poolDictionaries: ''
	category: 'MarsRover'!

!MarsRover methodsFor: 'initialization' stamp: 'ao 12/7/2020 02:14:53'!
initializeOn: aPoint pointingTo: aCardinalPoint 

	position := aPoint.
	cardinalPoint := aCardinalPoint.
	positionOffset := MarsRover getPositionOffsetBasedOnCardinalPoint: aCardinalPoint.! !


!MarsRover methodsFor: 'querying' stamp: 'ao 12/7/2020 01:17:17'!
isAt: aPoint 

	^ position = aPoint! !

!MarsRover methodsFor: 'querying' stamp: 'ao 12/6/2020 15:11:49'!
isPointingTo: aCardinalPoint

	^ cardinalPoint = aCardinalPoint ! !


!MarsRover methodsFor: 'private' stamp: 'ao 12/6/2020 22:50:41'!
newOrientation: aCardinalPoint

	cardinalPoint := aCardinalPoint ! !

!MarsRover methodsFor: 'private' stamp: 'ao 12/7/2020 01:17:17'!
newPosition: aPosition

	position := aPosition ! !

!MarsRover methodsFor: 'private' stamp: 'ao 12/6/2020 16:50:51'!
signalInvalidCommand

	self error: self class invalidCommand.! !


!MarsRover methodsFor: 'accessing' stamp: 'ao 12/6/2020 22:41:31'!
orientation

	^cardinalPoint ! !

!MarsRover methodsFor: 'accessing' stamp: 'ao 12/7/2020 01:17:17'!
position

	^position ! !


!MarsRover methodsFor: 'action' stamp: 'ao 12/7/2020 02:15:19'!
processCommand: command

	command = 'f' ifTrue: [ 
		^position := position + positionOffset.
	].
	command = 'b' ifTrue: [
		^position := position - positionOffset.		
	].
	command = 'r' ifTrue: [
		cardinalPoint := MarsRover nextCardinalPointToTheRightOf: cardinalPoint.
		^positionOffset := MarsRover getPositionOffsetBasedOnCardinalPoint: cardinalPoint.
	].
	command = 'l' ifTrue: [
		cardinalPoint := MarsRover nextCardinalPointToTheLeftOf: cardinalPoint.
		^positionOffset := MarsRover getPositionOffsetBasedOnCardinalPoint: cardinalPoint.
	].
	command = '' ifTrue: [^nil].	
	self signalInvalidCommand.
		! !

!MarsRover methodsFor: 'action' stamp: 'ao 12/6/2020 17:32:11'!
processCommands: aStreamOfCommands

	^ aStreamOfCommands do: [ :aCommand | self processCommand: aCommand asString ]! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRover class' category: 'MarsRover'!
MarsRover class
	instanceVariableNames: ''!

!MarsRover class methodsFor: 'creation' stamp: 'ao 12/7/2020 02:10:48'!
createOn: aPoint pointingTo: aCardinalPoint

	OffsetByCardinal := Dictionary new.	
	CardinalPointsClockwiseList := #(N E S O) asArray.
	
	OffsetByCardinal add:#N->(0@1); add: #E->(1@0); add: #S->(0@-1); add: #O->(-1@0).
	
	^ self new initializeOn: aPoint  pointingTo: aCardinalPoint! !


!MarsRover class methodsFor: 'querying by cardinal' stamp: 'ao 12/7/2020 02:14:03'!
getPositionOffsetBasedOnCardinalPoint: aCardinalPoint

	^ OffsetByCardinal at: aCardinalPoint

	! !

!MarsRover class methodsFor: 'querying by cardinal' stamp: 'ao 12/7/2020 01:54:36'!
nextCardinalPointToTheLeftOf: cardinalPoint

	^CardinalPointsClockwiseList atWrap: ((CardinalPointsClockwiseList indexOf: cardinalPoint) - 1)! !

!MarsRover class methodsFor: 'querying by cardinal' stamp: 'ao 12/7/2020 01:52:40'!
nextCardinalPointToTheRightOf: cardinalPoint

	^CardinalPointsClockwiseList atWrap: ((CardinalPointsClockwiseList indexOf: cardinalPoint) + 1)! !


!MarsRover class methodsFor: 'private' stamp: 'ao 12/6/2020 16:50:19'!
invalidCommand
	
	^ 'The command is invalid'! !
