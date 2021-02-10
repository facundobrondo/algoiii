!classDefinition: #CartTest category: 'TusLibros'!
TestCase subclass: #CartTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!CartTest methodsFor: 'as yet unclassified' stamp: 'ao 2/10/2021 01:29:53'!
test01ANewCartIsEmpty

	| aCart |
	aCart := OrderedCollection new.
	
	self assert: aCart isEmpty! !

!CartTest methodsFor: 'as yet unclassified' stamp: 'ao 2/10/2021 01:55:58'!
test02ABookCanBeAddedToACart

	| aCart |
	aCart := OrderedCollection new.
	
	aCart add: '1234'.
		
	self deny: aCart isEmpty.! !


!classDefinition: #Cart category: 'TusLibros'!
Object subclass: #Cart
	instanceVariableNames: 'clientId password contents'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!Cart methodsFor: 'as yet unclassified' stamp: 'ao 2/8/2021 21:40:15'!
addItem: anItem

	contents add: anItem ! !

!Cart methodsFor: 'as yet unclassified' stamp: 'ao 2/8/2021 21:29:53'!
initializeWithClientId: aClientId andPassword: aPassword

	clientId := aClientId.
	password := aPassword.
	contents := OrderedCollection new.! !


!Cart methodsFor: 'inspecting' stamp: 'ao 2/8/2021 21:31:29'!
isEmpty
	
	^ contents isEmpty.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Cart class' category: 'TusLibros'!
Cart class
	instanceVariableNames: ''!

!Cart class methodsFor: 'as yet unclassified' stamp: 'ao 2/8/2021 21:29:34'!
createWithClientId: aClientId andPassword: aPassword

	^ self new initializeWithClientId: aClientId andPassword: aPassword.! !
