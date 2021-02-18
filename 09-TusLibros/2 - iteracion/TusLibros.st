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

!CartTest methodsFor: 'private' stamp: 'ao 2/18/2021 13:05:16'!
createCart

	| aCatalog |
	
	aCatalog := Dictionary new.
	aCatalog add: ( self bookFromTheEditorial ) -> 400.
	
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

!CashierTest methodsFor: 'test' stamp: 'ao 2/18/2021 12:15:38'!
test03CannotCheckoutWithAnExpiredCreditCard

	| aCashier aCart aCreditCard |
	aCart := self createCart.
	aCashier := Cashier new.
	aCreditCard := self createExpiredCreditCard.
	
	aCart add: self bookFromTheEditorial.
	
	self should: [ aCashier checkout: aCart withCreditCard: aCreditCard ] raise: Error withExceptionDo: [ :anException | self assert: anException messageText equals: MerchantProcessor CannotCheckoutWithExpiredCreditCard ]! !

!CashierTest methodsFor: 'test' stamp: 'ao 2/18/2021 12:46:37'!
test04CannotCheckoutWithInvalidNameOnCreditCard

	| aCashier aCart aCreditCard |
	aCart := self createCart.
	aCashier := Cashier new.
	aCreditCard := self createCreditCardWithInvalidName.
	
	aCart add: self bookFromTheEditorial.
	
	self should: [ aCashier checkout: aCart withCreditCard: aCreditCard ] raise: Error withExceptionDo: [ :anException | self assert: anException messageText equals: MerchantProcessor CannotCheckoutWithInvalidNameOnCreditCard ]! !

!CashierTest methodsFor: 'test' stamp: 'ao 2/18/2021 12:48:50'!
test05CannotCheckoutWithEmptyNameOnCreditCard

	| aCashier aCart aCreditCard |
	aCart := self createCart.
	aCashier := Cashier new.
	aCreditCard := self createCreditCardWithEmptyName.
	
	aCart add: self bookFromTheEditorial.
	
	self should: [ aCashier checkout: aCart withCreditCard: aCreditCard ] raise: Error withExceptionDo: [ :anException | self assert: anException messageText equals: MerchantProcessor CannotCheckoutWithInvalidNameOnCreditCard ]! !

!CashierTest methodsFor: 'test' stamp: 'PDG 2/18/2021 14:19:52'!
test06CanCheckoutCartWithOneBookAndValidCreditCard

	| aCashier aCart aCreditCard sales |
	aCart := self createCart.
	aCashier := Cashier new.
	aCreditCard := self createValidCreditCard.
	
	aCart add: self bookFromTheEditorial.
	
	sales := aCashier checkout: aCart withCreditCard: aCreditCard.
	self assert: sales equals: 400.! !

!CashierTest methodsFor: 'test' stamp: 'PDG 2/18/2021 14:23:43'!
test07CanCheckoutCartWithMoreThanOneBookAndValidCreditCard

	| aCashier aCart aCreditCard sales |
	aCart := self createCart.
	aCashier := Cashier new.
	aCreditCard := self createValidCreditCard.
	
	aCart add: self bookFromTheEditorial.
	aCart add: self bookFromTheEditorial.
	
	sales := aCashier checkout: aCart withCreditCard: aCreditCard.
	self assert: sales equals: 800.! !

!CashierTest methodsFor: 'test' stamp: 'PDG 2/18/2021 14:29:25'!
test08CanCheckoutTwoCartsWithValidCreditCard

	| aCashier cart1 cart2 aCreditCard sales |
	cart1 := self createCart.
	cart2 := self createCart.
	aCashier := Cashier new.
	aCreditCard := self createValidCreditCard.
	
	cart1 add: self bookFromTheEditorial.
	cart1 add: self bookFromTheEditorial.
	cart2 add: self bookFromTheEditorial.
	
	sales := aCashier checkout: cart1 withCreditCard: aCreditCard.
	sales := sales + (aCashier checkout: cart2 withCreditCard: aCreditCard).
	self assert: sales equals: 1200.! !

!CashierTest methodsFor: 'test' stamp: 'PDG 2/18/2021 14:34:10'!
test09CannotCheckoutACartTwice

	| aCashier aCart aCreditCard sales |
	aCart := self createCart.
	aCashier := Cashier new.
	aCreditCard := self createValidCreditCard.
	
	aCart add: self bookFromTheEditorial.
	aCart add: self bookFromTheEditorial.
	
	sales := aCashier checkout: aCart withCreditCard: aCreditCard.
	self should: [ aCashier checkout: aCart withCreditCard: aCreditCard ] raise: Error withExceptionDo: [ :anException | self assert: anException messageText equals: aCashier class CannotCheckoutOnEmptyCartErrorMessage ]! !


!CashierTest methodsFor: 'private' stamp: 'ao 2/16/2021 04:27:46'!
bookFromTheEditorial

	^ 'ABC123'! !

!CashierTest methodsFor: 'private' stamp: 'ao 2/18/2021 13:05:43'!
createCart

	| aCatalog |
	
	aCatalog := Dictionary new.
	aCatalog add: ( self bookFromTheEditorial ) -> 400.
	
	^Cart withCatalog: aCatalog.! !

!CashierTest methodsFor: 'private' stamp: 'ao 2/18/2021 12:48:20'!
createCreditCardWithEmptyName
	
	| aCreditCardWithEmptyName |
	aCreditCardWithEmptyName := CreditCard createWithNumber: '0001000200030004' withCardHolder: '' withExpirationDate: December/31/2022.
	
	^ aCreditCardWithEmptyName 
	! !

!CashierTest methodsFor: 'private' stamp: 'ao 2/18/2021 12:43:05'!
createCreditCardWithInvalidName
	
	| aCreditCardWithInvalidName |
	aCreditCardWithInvalidName := CreditCard createWithNumber: '0001000200030004' withCardHolder: 'Manuel Jose Joaquin del Corazon de Jesus Belgrano' withExpirationDate: December/31/2022.
	
	^ aCreditCardWithInvalidName 
	! !

!CashierTest methodsFor: 'private' stamp: 'ao 2/18/2021 12:18:11'!
createCreditCardWithInvalidNumber

	| aCreditCard |
	aCreditCard := CreditCard createWithNumber: '000100020003000' withCardHolder: 'PEPE' withExpirationDate: January/31/2022.
	^ aCreditCard ! !

!CashierTest methodsFor: 'private' stamp: 'ao 2/18/2021 12:18:21'!
createExpiredCreditCard
	
	| anExpiredCreditCard |
	anExpiredCreditCard := CreditCard createWithNumber: '0001000200030004' withCardHolder: 'PEPE' withExpirationDate: December/31/2020.
	
	^ anExpiredCreditCard ! !

!CashierTest methodsFor: 'private' stamp: 'PDG 2/18/2021 14:20:36'!
createValidCreditCard

	| aCreditCard |
	aCreditCard := CreditCard createWithNumber: '0001000200030004' withCardHolder: 'Pepe' withExpirationDate: January/31/2022.
	
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

!Cart methodsFor: 'adding' stamp: 'PDG 2/18/2021 13:58:33'!
booksCatalog

	^ bookCatalog copy! !

!Cart methodsFor: 'adding' stamp: 'PDG 2/18/2021 14:39:27'!
empty

	books := Bag new.! !


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


!Cart methodsFor: 'private - assertions' stamp: 'ao 2/18/2021 13:03:29'!
assertIsInCatalog: aBook

	^ bookCatalog at: aBook ifAbsent:[ self error: self class bookNotInCatalogErrorMessage ]
	"^ (bookCatalog includes: aBook) ifFalse: [ self error: self class bookNotInCatalogErrorMessage ]"! !

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

!Cashier methodsFor: 'action' stamp: 'PDG 2/18/2021 14:35:17'!
checkout: aCart withCreditCard: creditCard

	| merchantProcessor chargedAmount items catalog |
	
	self validateCart: aCart.
	items := aCart contents.
	catalog := aCart booksCatalog.
	chargedAmount := 0.
	items do: [:aBook | chargedAmount := chargedAmount + (catalog at: aBook)].
	
	merchantProcessor := MerchantProcessor new.
	merchantProcessor validateCard: creditCard.
	
	aCart empty.
	
	^ chargedAmount.! !

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


!classDefinition: #CreditCard category: 'TusLibros'!
Object subclass: #CreditCard
	instanceVariableNames: 'number name expirationDate'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!CreditCard methodsFor: 'initialization' stamp: 'ao 2/18/2021 12:35:04'!
initializeCreateWithNumber: aNumber withCardHolder: aName withExpirationDate: aDate 
	
	number := aNumber.
	name := aName.
	expirationDate := aDate.! !


!CreditCard methodsFor: 'accessing' stamp: 'ao 2/18/2021 12:25:30'!
expirationDate

	^ expirationDate ! !

!CreditCard methodsFor: 'accessing' stamp: 'ao 2/18/2021 12:44:51'!
name

	^ name ! !

!CreditCard methodsFor: 'accessing' stamp: 'ao 2/18/2021 12:12:19'!
number
	
	^number! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CreditCard class' category: 'TusLibros'!
CreditCard class
	instanceVariableNames: ''!

!CreditCard class methodsFor: 'instance creation' stamp: 'ao 2/18/2021 12:01:47'!
createWithNumber: aNumber withCardHolder: aName withExpirationDate: aDate
	
	^self new initializeCreateWithNumber: aNumber withCardHolder: aName withExpirationDate: aDate! !


!classDefinition: #MerchantProcessor category: 'TusLibros'!
Object subclass: #MerchantProcessor
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!MerchantProcessor methodsFor: 'action' stamp: 'ao 2/18/2021 12:50:26'!
validateCard: aCreditCard 
	
	( aCreditCard number size = 16 ) ifFalse: [ ^ self error: self class CannotCheckoutWithInvalidCreditCardNumber ].
	( FixedGregorianDate today < aCreditCard expirationDate ) ifFalse: [ ^ self error: self class CannotCheckoutWithExpiredCreditCard ].
	( aCreditCard name size between: 1 and: 30 ) ifFalse: [ ^ self error: self class CannotCheckoutWithInvalidNameOnCreditCard ]! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MerchantProcessor class' category: 'TusLibros'!
MerchantProcessor class
	instanceVariableNames: ''!

!MerchantProcessor class methodsFor: 'error handling' stamp: 'ao 2/18/2021 12:16:11'!
CannotCheckoutWithExpiredCreditCard
	
	^ 'Cannot checkout with an expired credit card'! !

!MerchantProcessor class methodsFor: 'error handling' stamp: 'ao 2/18/2021 02:12:12'!
CannotCheckoutWithInvalidCreditCardNumber
	
	^ 'Cannot checkout with invalid credit card number'! !


!MerchantProcessor class methodsFor: 'as yet unclassified' stamp: 'ao 2/18/2021 12:46:12'!
CannotCheckoutWithInvalidNameOnCreditCard

	^ 'Cannot checkout with a credit card with an invalid name'! !
