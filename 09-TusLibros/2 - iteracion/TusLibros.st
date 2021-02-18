!classDefinition: #CartTest category: 'TusLibros'!
TestCase subclass: #CartTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!CartTest methodsFor: 'tests' stamp: 'LL 1/21/2021 20:09:58'!
test01NewCartIsEmpty

	| cart |
	
	cart := self createCart.
	
	self assert: cart isEmpty.! !

!CartTest methodsFor: 'tests' stamp: 'LL 1/21/2021 20:09:38'!
test02CanAddABookToACart

	| cart |
	cart := self createCart.
	
	cart add: self bookFromTheEditorial.
	
	self deny: cart isEmpty.! !

!CartTest methodsFor: 'tests' stamp: 'LL 1/21/2021 21:25:18'!
test03CannotAddABookNotInCatalog

	| cart bookNotInCatalog |
	cart := self createCart.
	bookNotInCatalog := 'DEF456'.

	self assert: cart isEmptyAfter: [ cart add: bookNotInCatalog ] raisesErrorWithMessage: Cart bookNotInCatalogErrorMessage.
	! !

!CartTest methodsFor: 'tests' stamp: 'LL 1/21/2021 20:12:27'!
test04CanAddTwoCopiesOfABook

	| cart |
	cart := self createCart.
	
	cart add: self bookFromTheEditorial quantity: 2.
	
	self assert: (cart quantityOf: self bookFromTheEditorial) equals: 2.! !

!CartTest methodsFor: 'tests' stamp: 'LL 1/21/2021 21:27:25'!
test05CannotAddNonPositiveNumberOfCopiesOfABook

	| cart |
	cart := self createCart.

	self assert: cart isEmptyAfter: [ cart add: self bookFromTheEditorial quantity: -1 ] raisesErrorWithMessage: Cart invalidNumberOfCopiesErrorMessage.! !

!CartTest methodsFor: 'tests' stamp: 'LL 1/21/2021 21:39:03'!
test06CartRemembersAddedBooks

	| cart |
	cart := self createCart.
	
	cart add: self bookFromTheEditorial quantity: 2.
	cart add: self bookFromTheEditorial quantity: 1.
	
	self assert: (cart includes: self bookFromTheEditorial).
	self assert: (cart quantityOf: self bookFromTheEditorial) equals: 3! !

!CartTest methodsFor: 'tests' stamp: 'LL 1/21/2021 21:26:35'!
test07CannotAddTwoCopiesOfABookNotInCatalog

	| cart bookNotInCatalog |
	cart := self createCart.
	bookNotInCatalog := 'DEF123'.
	
	self assert: cart isEmptyAfter: [ cart add: bookNotInCatalog quantity: 2 ] raisesErrorWithMessage: Cart bookNotInCatalogErrorMessage.! !


!CartTest methodsFor: 'private' stamp: 'LL 1/21/2021 21:24:13'!
assert: cart isEmptyAfter: blockExpectedToFail raisesErrorWithMessage: errorMessage
	
	self should: blockExpectedToFail raise: Error withExceptionDo: [ :anException |
		self assert: anException messageText equals: errorMessage.
		self assert: cart isEmpty.
	]! !

!CartTest methodsFor: 'private' stamp: 'LL 1/21/2021 20:08:01'!
bookFromTheEditorial

	^ 'ABC123'! !

!CartTest methodsFor: 'private' stamp: 'LL 1/21/2021 20:09:10'!
createCart

	| aCatalog |
	aCatalog := Set with: self bookFromTheEditorial.
	^Cart withCatalog: aCatalog.! !


!classDefinition: #CashierTest category: 'TusLibros'!
TestCase subclass: #CashierTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!CashierTest methodsFor: 'test' stamp: 'ao 2/18/2021 00:41:13'!
test01CannotCheckoutOnEmptyCart

	| aCashier aCart aCreditCard |
	aCart := self createCart.
	aCashier := Cashier new.
	aCreditCard := self createValidCreditCard.

	self should: [ aCashier checkout: aCart withCreditCard: aCreditCard ] raise: Error withExceptionDo: [ :anException | self assert: anException messageText equals: aCashier class CannotCheckoutOnEmptyCartErrorMessage ]! !

!CashierTest methodsFor: 'test' stamp: 'ao 2/18/2021 02:14:18'!
test02CannotCheckoutWithInvalidCreditCardNumber

	| aCashier aCart aCreditCard |
	aCart := self createCart.
	aCashier := Cashier new.
	aCreditCard := self createCreditCardWithInvalidNumber.
	
	aCart add: self bookFromTheEditorial.
	
	self should: [ aCashier checkout: aCart withCreditCard: aCreditCard ] raise: Error withExceptionDo: [ :anException | self assert: anException messageText equals: MerchantProcessor CannotCheckoutWithInvalidCreditCardNumber ]! !


!CashierTest methodsFor: 'private' stamp: 'ao 2/16/2021 04:27:46'!
bookFromTheEditorial

	^ 'ABC123'! !

!CashierTest methodsFor: 'private' stamp: 'ao 2/16/2021 04:27:18'!
createCart

	| aCatalog |
	aCatalog := Set with: self bookFromTheEditorial.
	^Cart withCatalog: aCatalog.! !

!CashierTest methodsFor: 'private' stamp: 'ao 2/18/2021 00:41:51'!
createCreditCardWithInvalidNumber

	| aCreditCard |
	aCreditCard := 000100020003000.
	^ aCreditCard ! !

!CashierTest methodsFor: 'private' stamp: 'ao 2/18/2021 00:41:46'!
createValidCreditCard

	| aCreditCard |
	aCreditCard := 0001000200030004.
	^ aCreditCard ! !


!classDefinition: #Cart category: 'TusLibros'!
Object subclass: #Cart
	instanceVariableNames: 'books bookCatalog'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!Cart methodsFor: 'initialization' stamp: 'LL 1/21/2021 20:26:42'!
initializeWithCatalog: aBookCatalog
	
	bookCatalog := aBookCatalog.
	books := Bag new! !


!Cart methodsFor: 'adding' stamp: 'LL 1/21/2021 20:24:07'!
add: aBook
	
	self add: aBook quantity: 1.! !

!Cart methodsFor: 'adding' stamp: 'LL 1/21/2021 20:23:42'!
add: aBook quantity: numberOfBooksToAdd

	self assertIsInCatalog: aBook.
	self assertValidNumberOfCopies: numberOfBooksToAdd.
	
	books add: aBook withOccurrences: numberOfBooksToAdd.! !


!Cart methodsFor: 'accessing' stamp: 'LL 1/20/2021 22:11:43'!
contents
	^books copy! !

!Cart methodsFor: 'accessing' stamp: 'LL 1/21/2021 21:39:26'!
includes: aBook

	^ books includes: aBook! !

!Cart methodsFor: 'accessing' stamp: 'LL 1/20/2021 21:51:06'!
quantityOf: aBook
	
	^books occurrencesOf: aBook! !


!Cart methodsFor: 'testing' stamp: 'LL 1/20/2021 21:33:04'!
isEmpty

	^books isEmpty! !


!Cart methodsFor: 'private - assertions' stamp: 'LL 1/21/2021 20:19:45'!
assertIsInCatalog: aBook

	^ (bookCatalog includes: aBook) ifFalse: [ self error: self class bookNotInCatalogErrorMessage ]! !

!Cart methodsFor: 'private - assertions' stamp: 'LL 1/21/2021 21:27:21'!
assertValidNumberOfCopies: numberOfBooksToAdd

	^ numberOfBooksToAdd strictlyPositive ifFalse: [ self error: self class invalidNumberOfCopiesErrorMessage ]! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Cart class' category: 'TusLibros'!
Cart class
	instanceVariableNames: ''!

!Cart class methodsFor: 'instance creation' stamp: 'LL 1/20/2021 21:37:38'!
withCatalog: aBookCatalog
 
	^self new initializeWithCatalog: aBookCatalog ! !


!Cart class methodsFor: 'error messages' stamp: 'LL 1/20/2021 21:45:09'!
bookNotInCatalogErrorMessage

	^'Cannot add a book that is not from the editorial'! !

!Cart class methodsFor: 'error messages' stamp: 'LL 1/21/2021 21:27:21'!
invalidNumberOfCopiesErrorMessage

	^'Cannot add zero books'! !


!classDefinition: #Cashier category: 'TusLibros'!
Object subclass: #Cashier
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!Cashier methodsFor: 'action' stamp: 'ao 2/18/2021 02:13:26'!
checkout: aCart withCreditCard: creditCard

	| merchantProcessor  |
	self validateCart: aCart.
	merchantProcessor := MerchantProcessor new.
	
	merchantProcessor validateCard: creditCard.

	! !

!Cashier methodsFor: 'action' stamp: 'ao 2/18/2021 00:47:41'!
validateCart: aCart 
	
	( aCart isEmpty ) ifTrue: [ ^ self error: self class CannotCheckoutOnEmptyCartErrorMessage ]! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Cashier class' category: 'TusLibros'!
Cashier class
	instanceVariableNames: ''!

!Cashier class methodsFor: 'error handling' stamp: 'ao 2/16/2021 12:37:49'!
CannotCheckoutOnEmptyCartErrorMessage
	
	^ 'Cannot checkout on empty cart'! !


!classDefinition: #MerchantProcessor category: 'TusLibros'!
Object subclass: #MerchantProcessor
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!MerchantProcessor methodsFor: 'action' stamp: 'ao 2/18/2021 02:08:43'!
validateCard: aCreditCard 
	
	( aCreditCard decimalDigitLength = 16 ) ifFalse: [ ^ self error: self class CannotCheckoutWithInvalidCreditCardNumber ]! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MerchantProcessor class' category: 'TusLibros'!
MerchantProcessor class
	instanceVariableNames: ''!

!MerchantProcessor class methodsFor: 'error handling' stamp: 'ao 2/18/2021 02:12:12'!
CannotCheckoutWithInvalidCreditCardNumber
	
	^ 'Cannot checkout with invalid credit card number'! !
