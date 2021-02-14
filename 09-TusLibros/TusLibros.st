!classDefinition: #CartTest category: 'TusLibros'!
TestCase subclass: #CartTest
	instanceVariableNames: 'book1 book2 book3 catalog'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!CartTest methodsFor: 'tests' stamp: 'FB 2/14/2021 03:10:23'!
test01ANewCartIsEmpty

	| aCart |
	
	aCart := Cart new.
	
	self assert: aCart isEmpty! !

!CartTest methodsFor: 'tests' stamp: 'FB 2/14/2021 03:11:45'!
test02ABookInACatalogCanBeAddedToACart

	| aCart |
	aCart := Cart new.
	
	aCart addBook: book1 inCatalog: catalog.
		
	self deny: aCart isEmpty.
	self assert: aCart includes: book1.! !

!CartTest methodsFor: 'tests' stamp: 'FB 2/14/2021 03:22:28'!
test03MoreThanOneCopyOfTheSameBookInCatalogCanBeAddedToACart

	| aCart |
	aCart := Cart new.
	
	aCart add: 3 book: book1 inCatalog: catalog.
		
	self assert: ( aCart countOf: book1 ) equals: 3.! !

!CartTest methodsFor: 'tests' stamp: 'FB 2/14/2021 03:18:14'!
test04ABookNotInACatalogCannotBeAddedToACart

	| aCart book4 |
	aCart := Cart new.
	
	book4 := '0000000000004'.
	
	self assert: aCart 
	isEmptyAfter: [ aCart addBook: book4 inCatalog: catalog ]
	raisesErrorWithMessage: 		Cart cannotAddABookNotInCatalog 
	
	"self should: [ aCart addBook: book4 inCatalog: catalog ]
	raise: Error
	withExceptionDo: [ :anError | self assert: anError messageText equals: Cart cannotAddABookNotInCatalog ]"
! !

!CartTest methodsFor: 'tests' stamp: 'ao 2/11/2021 18:17:29'!
test05ACartContentsCanBeListed

	| aCart listOfAddedBooks|
	aCart := Cart new.
	
	aCart addBook: book1 inCatalog: catalog.
	aCart addBook: book2 inCatalog: catalog.
	
	listOfAddedBooks := OrderedCollection with: book1 with: book2.
	
	
	self assert: aCart showContents equals: listOfAddedBooks! !


!CartTest methodsFor: 'setup' stamp: 'ao 2/11/2021 17:58:40'!
setUp

	book1 := '0000000000001'.
	book2 := '0000000000002'.
	book3 := '0000000000003'.
	
	catalog := OrderedCollection with: book1 with: book2 with: book3

! !


!CartTest methodsFor: 'private' stamp: 'FB 2/14/2021 03:14:58'!
assert: cart isEmptyAfter: blockExpectedToFail raisesErrorWithMessage: errorMessage
	
	self should: blockExpectedToFail raise: Error withExceptionDo: [ :anException |
		self assert: anException messageText equals: errorMessage.
		self assert: cart isEmpty.
	]! !


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


!Cart methodsFor: 'action' stamp: 'FB 2/14/2021 03:33:26'!
add: quantity book: aBook inCatalog: aCatalog

	self assertValideNumberOfCopies: quantity.
	(aCatalog includes: aBook ) ifTrue: [ ^ contents add: aBook withOccurrences: quantity ].
	self error: Cart cannotAddABookNotInCatalog	
	
	"quantity timesRepeat: [ self addBook: aBook inCatalog: aCatalog ]"! !

!Cart methodsFor: 'action' stamp: 'FB 2/14/2021 03:32:27'!
addBook: aBook inCatalog: aCatalog

	self add: 1 book: aBook inCatalog: aCatalog 
	
	
	
	! !

!Cart methodsFor: 'action' stamp: 'FB 2/14/2021 03:30:38'!
assertValideNumberOfCopies: quantity

	^ quantity strictlyPositive ifFalse: [ self error: self class invalidNumberOfCopiesErrorMessage ]! !


!Cart methodsFor: 'accessing' stamp: 'ao 2/11/2021 19:03:39'!
countOf: aBook
	
	^ ( contents select: [ :book | book = aBook ] ) size
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

!Cart class methodsFor: 'as yet unclassified' stamp: 'FB 2/14/2021 03:31:04'!
invalidNumberOfCopiesErrorMessage

	^'Cannot add zero books'! !
