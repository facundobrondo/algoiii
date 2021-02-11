!classDefinition: #CartTest category: 'TusLibros'!
TestCase subclass: #CartTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!CartTest methodsFor: 'tests' stamp: 'ao 2/10/2021 21:26:33'!
test01ANewCartIsEmpty

	| aCart |
	aCart := Cart new.
	
	self assert: aCart isEmpty! !

!CartTest methodsFor: 'tests' stamp: 'ao 2/10/2021 22:09:41'!
test02ABookInACatalogCanBeAddedToACart

	| aCart Catalog book1 book2 book3 |
	aCart := Cart new.
	Catalog := OrderedCollection new.
	book1 := '0000000000001'.
	book2 := '0000000000002'	.
	book3 := '0000000000003'.
	
	Catalog add: book1 ; add: book2; add: book3.
	
	aCart addBook: book1 inCatalog: Catalog.
		
	self deny: aCart isEmpty.
	self assert: aCart includes: book1.! !

!CartTest methodsFor: 'tests' stamp: 'ao 2/10/2021 22:21:41'!
test03ABookNotInACatalogCannotBeAddedToACart

	| aCart Catalog book1 book2 book3 book4 |
	aCart := Cart new.
	Catalog := OrderedCollection new.
	book1 := '0000000000001'.
	book2 := '0000000000002'	.
	book3 := '0000000000003'.
	book4 := '0000000000004'.
	
	Catalog add: book1 ; add: book2; add: book3.
		
	self should: [ aCart addBook: book4 inCatalog: Catalog ]
	raise: Error
	withExceptionDo: [ :anError | self assert: anError messageText equals: Cart cannotAddABookNotInCatalog ]
	! !

!CartTest methodsFor: 'tests' stamp: 'ao 2/10/2021 23:09:47'!
test04ACartContentsCanBeListed

	| aCart catalog listOfAddedBooks book1 book2 book3|
	aCart := Cart new.
	catalog := OrderedCollection new.
	book1 := '0000000000001'.
	book2 := '0000000000002'	.
	book3 := '0000000000003'.
	
	catalog add: book1 ; add: book2; add: book3.
	aCart addBook: book1 inCatalog: catalog.
	aCart addBook: book2 inCatalog: catalog.
	
	listOfAddedBooks := OrderedCollection with: book1 with: book2.
	
	
	self assert: aCart showContents equals: listOfAddedBooks
	
	! !


!classDefinition: #Cart category: 'TusLibros'!
Object subclass: #Cart
	instanceVariableNames: 'contents'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!Cart methodsFor: 'inspecting' stamp: 'ao 2/10/2021 21:34:06'!
initialize

	contents := OrderedCollection new! !

!Cart methodsFor: 'inspecting' stamp: 'ao 2/10/2021 21:32:58'!
isEmpty
	
	^ contents isEmpty.! !


!Cart methodsFor: 'action' stamp: 'ao 2/10/2021 22:25:40'!
addBook: aBook inCatalog: aCatalog

	(aCatalog includes: aBook ) ifTrue: [ ^ contents add: aBook ].
	self error: Cart cannotAddABookNotInCatalog
	
	
	
	! !


!Cart methodsFor: 'accessing' stamp: 'ao 2/10/2021 22:10:57'!
includes: aBook
	
	^ contents includes: aBook! !

!Cart methodsFor: 'accessing' stamp: 'ao 2/10/2021 22:46:09'!
showContents
	
	^ contents ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Cart class' category: 'TusLibros'!
Cart class
	instanceVariableNames: ''!

!Cart class methodsFor: 'as yet unclassified' stamp: 'ao 2/10/2021 22:22:56'!
cannotAddABookNotInCatalog

	^ 'Cannot add a Book that is not in catalog'! !
