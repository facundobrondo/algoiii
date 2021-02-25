!classDefinition: #CartTest category: 'TusLibros'!
TestCase subclass: #CartTest
	instanceVariableNames: 'objectsFactory'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!CartTest methodsFor: 'tests' stamp: 'LL 2/16/2021 19:50:24'!
setUp

	objectsFactory := PublisherTestObjectsFactory new! !

!CartTest methodsFor: 'tests' stamp: 'LL 1/21/2021 20:09:58'!
test01NewCartIsEmpty

	| cart |
	
	cart := self createCart.
	
	self assert: cart isEmpty.! !

!CartTest methodsFor: 'tests' stamp: 'LL 2/16/2021 19:50:24'!
test02CanAddABookToACart

	| cart |
	cart := self createCart.
	
	cart add: objectsFactory bookFromTheEditorial.
	
	self deny: cart isEmpty.! !

!CartTest methodsFor: 'tests' stamp: 'LL 1/21/2021 21:25:18'!
test03CannotAddABookNotInCatalog

	| cart bookNotInCatalog |
	cart := self createCart.
	bookNotInCatalog := 'DEF456'.

	self assert: cart isEmptyAfter: [ cart add: bookNotInCatalog ] raisesErrorWithMessage: Cart bookNotInCatalogErrorMessage.
	! !

!CartTest methodsFor: 'tests' stamp: 'LL 2/16/2021 19:50:24'!
test04CanAddTwoCopiesOfABook

	| cart |
	cart := self createCart.
	
	cart add: objectsFactory bookFromTheEditorial quantity: 2.
	
	self assert: (cart quantityOf: objectsFactory bookFromTheEditorial) equals: 2.! !

!CartTest methodsFor: 'tests' stamp: 'LL 2/16/2021 19:50:24'!
test05CannotAddNonPositiveNumberOfCopiesOfABook

	| cart |
	cart := self createCart.

	self assert: cart isEmptyAfter: [ cart add: objectsFactory bookFromTheEditorial quantity: -1 ] raisesErrorWithMessage: Cart invalidNumberOfCopiesErrorMessage.! !

!CartTest methodsFor: 'tests' stamp: 'LL 2/16/2021 19:50:24'!
test06CartRemembersAddedBooks

	| cart |
	cart := self createCart.
	
	cart add: objectsFactory bookFromTheEditorial quantity: 2.
	cart add: objectsFactory bookFromTheEditorial quantity: 1.
	
	self assert: (cart includes: objectsFactory bookFromTheEditorial).
	self assert: (cart quantityOf: objectsFactory bookFromTheEditorial) equals: 3! !

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

!CartTest methodsFor: 'private' stamp: 'LL 2/16/2021 19:50:24'!
createCart

	^ objectsFactory anEmptyCart! !


!classDefinition: #CashierTest category: 'TusLibros'!
TestCase subclass: #CashierTest
	instanceVariableNames: 'objectsFactory merchantProcessorBehaviour'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!CashierTest methodsFor: 'tests' stamp: 'LL 2/16/2021 19:50:04'!
setUp

	objectsFactory := PublisherTestObjectsFactory new.
	merchantProcessorBehaviour := [ :anAmountToDebit :aCreditCard |  ]! !

!CashierTest methodsFor: 'tests' stamp: 'LL 2/16/2021 19:51:40'!
test01CannotCheckoutAnEmptyCart

	| cart salesBook cashier |
	cart := objectsFactory anEmptyCart.
	salesBook := objectsFactory anEmptySalesBook.
	cashier := Cashier registeringSalesOn: salesBook.
	
	self should: [ self cashier: cashier checkout: cart ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anException |
			self assert: anException messageText equals: Cashier cannotCheckoutAnEmptyCart.
			self assert: salesBook isEmpty
		]! !

!CashierTest methodsFor: 'tests' stamp: 'LL 2/16/2021 19:50:05'!
test02TotalIsCalculatedCorrectlyAfterCheckout

	| cart ticket cashier |
	cart := objectsFactory cartWithABook.
	cashier := objectsFactory aCashier.
	
	ticket := self cashier: cashier checkout: cart.
	
	self assert: objectsFactory bookFromTheEditorialPrice equals: ticket value.! !

!CashierTest methodsFor: 'tests' stamp: 'LL 2/16/2021 19:51:50'!
test03CannotCheckoutIfCardIsExpired

	| cart cashier merchantProcessorWasContacted salesBook |
	cart := objectsFactory cartWithABook.
	salesBook := objectsFactory anEmptySalesBook.
	cashier := Cashier registeringSalesOn: salesBook.
	
	merchantProcessorWasContacted := false.
	self merchantProcessorBehaviour: [ :amountToDebit :aCreditCard |  merchantProcessorWasContacted := true ].
	
	self should: [ self cashier: cashier checkout: cart debitingOn: objectsFactory anExpiredCreditCard ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anException |
			self assert: anException messageText equals: Cashier cannotCheckoutUsingAnExpiredCard.
			self deny: merchantProcessorWasContacted.
			self assert: salesBook isEmpty.
		]! !

!CashierTest methodsFor: 'tests' stamp: 'LL 2/16/2021 23:04:34'!
test04CheckoutDebitsCreditCardUsingMerchantProcessor

	| cart ticket cashier debitedAmountFromCreditCard debitedCreditCard creditCard |
	cart := objectsFactory cartWithABook.
	cashier := objectsFactory aCashier.
	creditCard := objectsFactory aValidCreditCard.
		
	self merchantProcessorBehaviour: [ :anAmountToDebit :aCreditCard | 
		debitedAmountFromCreditCard := anAmountToDebit.
		debitedCreditCard := aCreditCard.
	].
	
	ticket := self cashier: cashier checkout: cart debitingOn: creditCard.
	
	self assert: debitedAmountFromCreditCard equals: ticket value.
	self assert: debitedCreditCard equals: creditCard.! !

!CashierTest methodsFor: 'tests' stamp: 'LL 2/16/2021 19:51:58'!
test05CheckoutFailsIfMerchantProcessorCantProcessPayment

	| cart cashier salesBook |
	cart := objectsFactory cartWithABook.
	salesBook := objectsFactory anEmptySalesBook.
	cashier := Cashier registeringSalesOn: salesBook.
	
	self merchantProcessorBehaviour: [ :anAmountToDebit :aCreditCard | Error new signal ].
	
	self should: [ self cashier: cashier checkout: cart ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :exceptionRaised | 
			self assert: exceptionRaised messageText equals: Cashier couldNotProcessPaymentErrorMessage.
			self assert: salesBook isEmpty.
		]! !

!CashierTest methodsFor: 'tests' stamp: 'LL 2/16/2021 19:52:03'!
test06CheckingOutACartRegistersASale

	| cart cashier ticket salesBook |
	cart := objectsFactory cartWithABook.
	salesBook := objectsFactory anEmptySalesBook.
	cashier := Cashier registeringSalesOn: salesBook.	
	
	ticket := self cashier: cashier checkout: cart.
	
	self assert: salesBook size equals: 1.
	self assert: salesBook first equals: ticket.! !


!CashierTest methodsFor: 'merchat processor protocol' stamp: 'LL 1/24/2021 18:26:00'!
debit: anAmountToDebit from: aCreditCard

	^merchantProcessorBehaviour value: anAmountToDebit value: aCreditCard! !


!CashierTest methodsFor: 'change mp behaviour' stamp: 'LL 1/24/2021 18:26:00'!
merchantProcessorBehaviour: newBehaviour

	merchantProcessorBehaviour := newBehaviour! !


!CashierTest methodsFor: 'private' stamp: 'LL 2/16/2021 19:50:05'!
cashier: cashier checkout: cart

	^self cashier: cashier checkout: cart debitingOn: objectsFactory aValidCreditCard! !

!CashierTest methodsFor: 'private' stamp: 'LL 2/16/2021 19:50:04'!
cashier: cashier checkout: cart debitingOn: aCreditCard

	^cashier checkout: cart payingWith: aCreditCard through: self merchantProcessorForTest on: objectsFactory now.! !

!CashierTest methodsFor: 'private' stamp: 'LL 2/16/2021 18:29:57'!
merchantProcessorForTest
	
	^self! !


!classDefinition: #CreditCardTest category: 'TusLibros'!
TestCase subclass: #CreditCardTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!CreditCardTest methodsFor: 'tests' stamp: 'LL 1/24/2021 18:15:23'!
test01CreditCardOwnerNameCannotBeBlank

	^self should: [ CreditCard of: '' number: 11111111 expiringOn: (FixedGregorianDate today) monthOfYear ] 
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :exceptionRaised | 
			self assert: exceptionRaised messageText equals: CreditCard nameCannotBeBlankErrorMessage.
		]! !


!classDefinition: #InterfaceInTest category: 'TusLibros'!
TestCase subclass: #InterfaceInTest
	instanceVariableNames: 'objectsFactory'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!InterfaceInTest methodsFor: 'test' stamp: 'ao 2/25/2021 17:53:32'!
setUp

	objectsFactory := PublisherTestObjectsFactory new.
	! !

!InterfaceInTest methodsFor: 'test' stamp: 'ao 2/24/2021 02:50:43'!
test01InterfaceCanCreateANewCart

	| interfaceIn cartId |
	
	interfaceIn := InterfaceIn new.

	cartId := interfaceIn createCartFor: self validClientId withPassword: self validPassword through: self userPasswordValidatorForTest.
	
	self assert: (interfaceIn listCart: cartId ) isEmpty.

	! !

!InterfaceInTest methodsFor: 'test' stamp: 'ao 2/24/2021 23:03:32'!
test02InterfaceCannotCreateANewCartWithAnInvalidClientId

	| interfaceIn aUserPasswordValidatorForTest |
	
	interfaceIn := InterfaceIn new.
	
	aUserPasswordValidatorForTest := self userPasswordValidatorForTest.
	
	self should: [ interfaceIn createCartFor: self invalidClientId withPassword: self validPassword through: aUserPasswordValidatorForTest ]
	raise:  Error
	withExceptionDo: [ :anException |			self assert: anException messageText equals: aUserPasswordValidatorForTest class invalidClientIdErrorMessage ]

	! !

!InterfaceInTest methodsFor: 'test' stamp: 'ao 2/25/2021 00:01:40'!
test03InterfaceCannotCreateANewCartWithAnInvalidPassword

	| interfaceIn aUserPasswordValidatorForTest |
	
	interfaceIn := InterfaceIn new.
	
	aUserPasswordValidatorForTest := self userPasswordValidatorForTest.
	
	self should: [ interfaceIn createCartFor: self validClientId withPassword: self invalidPassword through: aUserPasswordValidatorForTest ]
	raise:  Error
	withExceptionDo: [ :anException |			self assert: anException messageText equals: aUserPasswordValidatorForTest class invalidPasswordErrorMessage ]

	! !

!InterfaceInTest methodsFor: 'test' stamp: 'ao 2/25/2021 17:21:21'!
test04InterfaceCanAddABookToCart

	| interfaceIn aUserPasswordValidatorForTest cartId |
	
	interfaceIn := InterfaceIn new.
	
	aUserPasswordValidatorForTest := self userPasswordValidatorForTest.
	
	cartId := interfaceIn createCartFor: self validClientId withPassword: self validPassword through: aUserPasswordValidatorForTest.
	
	interfaceIn addBook: objectsFactory bookFromTheEditorial toCart: cartId.
	
	self assert: ( interfaceIn listCart: cartId ) includes: objectsFactory bookFromTheEditorial! !

!InterfaceInTest methodsFor: 'test' stamp: 'ao 2/25/2021 00:52:30'!
test05InterfaceCanAddTwoCopiesOfABookToCart

	| interfaceIn aUserPasswordValidatorForTest cartId |
	
	interfaceIn := InterfaceIn new.
	
	aUserPasswordValidatorForTest := self userPasswordValidatorForTest.
	
	cartId := interfaceIn createCartFor: self validClientId withPassword: self validPassword through: aUserPasswordValidatorForTest.
	
	interfaceIn addBook: objectsFactory bookFromTheEditorial toCart: cartId quantity: 2.
	
	self assert: ( ( interfaceIn listCart: cartId ) occurrencesOf: objectsFactory bookFromTheEditorial ) equals: 2
	
	

	! !

!InterfaceInTest methodsFor: 'test' stamp: 'ao 2/25/2021 00:56:51'!
test06InterfaceCannotAddABookToCartWithInvalidCartId

	| interfaceIn |
	
	interfaceIn := InterfaceIn new.
	
	self should: [ interfaceIn addBook: objectsFactory bookFromTheEditorial toCart: self invalidCartId ]
	raise: Error
	withExceptionDo: [ :anException |			self assert: anException messageText equals: interfaceIn class cannotAddABookWithInvalidCartId ]
	
	
	
	

	! !

!InterfaceInTest methodsFor: 'test' stamp: 'ao 2/25/2021 01:05:16'!
test07InterfaceCannotListCartWithInvalidCartId

	| interfaceIn |
	
	interfaceIn := InterfaceIn new.
	
	self should: [ interfaceIn listCart: self invalidCartId ]
	raise: Error
	withExceptionDo: [ :anException |			self assert: anException messageText equals: interfaceIn class cannotListCartWithInvalidCartId ]
	
	
	
	

	! !

!InterfaceInTest methodsFor: 'test' stamp: 'ao 2/25/2021 18:50:03'!
test08InterfaceCanCheckoutACart

	| interfaceIn cartId ticket |
	
	interfaceIn := InterfaceIn new.
	
	cartId := interfaceIn createCartFor: self validClientId withPassword: self validPassword through: self userPasswordValidatorForTest.
	
	interfaceIn addBook: objectsFactory bookFromTheEditorial toCart: cartId.
	
	ticket := interfaceIn checkoutACart: cartId payingWithNumberCreditCard: self validNumberCreditCard expirationDate: self validExpirationDate ownerName: self validNameOfTheCreditCardOwner through: self MerchantProcessorForTest.
	
	
	self assert: ( interfaceIn listPurchasesFor: self validClientId withPassword: self validPassword through: self userPasswordValidatorForTest) equals: ticket
	
	
	
	
	
	
	

! !

!InterfaceInTest methodsFor: 'test' stamp: 'ao 2/25/2021 17:09:55'!
test09InterfaceCannotListPurchasesWithInvalidClientId

	| interfaceIn cartId |
	
	interfaceIn := InterfaceIn new.
	
	cartId := interfaceIn createCartFor: self validClientId withPassword: self validPassword through: self userPasswordValidatorForTest.
	
	interfaceIn addBook: objectsFactory bookFromTheEditorial toCart: cartId.
	
	interfaceIn checkoutACart: cartId payingWithNumberCreditCard: self validNumberCreditCard expirationDate: self validExpirationDate ownerName: self validNameOfTheCreditCardOwner through: self MerchantProcessorForTest.
	
	self should: [interfaceIn listPurchasesFor: self invalidClientId withPassword: self validPassword through: self userPasswordValidatorForTest]
	raise: Error
	withExceptionDo: [ :anException |			self assert: anException messageText equals: interfaceIn class cannotListPurchasesWithInvalidClientId ]
	
	
	
	
	
	
	
	

! !

!InterfaceInTest methodsFor: 'test' stamp: 'ao 2/25/2021 18:51:38'!
test10ACartCreatedByTheInterfaceInIsNotValidAfterThirtyMinutes

	"Falta terminar test por falta de tiempo"

	| interfaceIn cartId |
	
	interfaceIn := InterfaceIn new.
	
	cartId := interfaceIn createCartFor: self validClientId withPassword: self validPassword through: self userPasswordValidatorForTest.
	
	interfaceIn advanceClock: 1800*second.	
	
	"self should: [ interfaceIn addBook: objectsFactory bookFromTheEditorial toCart: cartId ]
	raise: Error
	withExceptionDo: [ :anException |			self assert: anException messageText equals: interfaceIn class theCartIsInvalidAfterThirtyMinutes ]
	
	
	
	
	
	
	
	

"! !


!InterfaceInTest methodsFor: 'private' stamp: 'ao 2/25/2021 18:20:23'!
MerchantProcessorForTest
	
	^ MerchantProcessorForTest new.
	! !

!InterfaceInTest methodsFor: 'private' stamp: 'ao 2/25/2021 01:02:02'!
invalidCartId
	
	^ 'abcd'! !

!InterfaceInTest methodsFor: 'private' stamp: 'ao 2/24/2021 22:00:18'!
invalidClientId
	
	^ '0002'! !

!InterfaceInTest methodsFor: 'private' stamp: 'ao 2/24/2021 23:04:52'!
invalidPassword
	
	^ '1235'! !

!InterfaceInTest methodsFor: 'private' stamp: 'ao 2/24/2021 23:06:40'!
userBookRegistration
	
	| userBook | 
	
	userBook := Dictionary new.
	
	"userBook add: self validClientId -> self validPassword."
	userBook add: self validPassword -> self validClientId.
	
	^ userBook ! !

!InterfaceInTest methodsFor: 'private' stamp: 'ao 2/24/2021 22:13:12'!
userPasswordValidatorForTest
	
	^ UserPasswordValidatorForTest createWithUserBook: self userBookRegistration.! !

!InterfaceInTest methodsFor: 'private' stamp: 'ao 2/24/2021 02:51:50'!
validClientId

	^ '0001'! !

!InterfaceInTest methodsFor: 'private' stamp: 'ao 2/25/2021 18:03:16'!
validExpirationDate

	| nextMonth |
	
	nextMonth := (FixedGregorianDate today next: GregorianMonth oneMonth) monthOfYear.
	
	^ nextMonth ! !

!InterfaceInTest methodsFor: 'private' stamp: 'ao 2/25/2021 18:03:42'!
validNameOfTheCreditCardOwner

	^ 'Juan Perez'! !

!InterfaceInTest methodsFor: 'private' stamp: 'ao 2/25/2021 18:02:17'!
validNumberCreditCard
	
	^ '1111'! !

!InterfaceInTest methodsFor: 'private' stamp: 'ao 2/24/2021 02:52:17'!
validPassword
	
	^ '1234'! !


!classDefinition: #Cart category: 'TusLibros'!
Object subclass: #Cart
	instanceVariableNames: 'books bookCatalog owner'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!Cart methodsFor: 'initialization' stamp: 'LL 1/25/2021 18:50:24'!
initializeWithCatalog: aBookCatalog
	
	bookCatalog := aBookCatalog.
	books := Bag new.! !


!Cart methodsFor: 'adding' stamp: 'LL 1/21/2021 20:24:07'!
add: aBook
	
	self add: aBook quantity: 1.! !

!Cart methodsFor: 'adding' stamp: 'LL 1/21/2021 20:23:42'!
add: aBook quantity: numberOfBooksToAdd

	self assertIsInCatalog: aBook.
	self assertValidNumberOfCopies: numberOfBooksToAdd.
	
	books add: aBook withOccurrences: numberOfBooksToAdd.! !


!Cart methodsFor: 'accessing' stamp: 'ao 2/22/2021 21:04:38'!
contents

	^ books copy! !

!Cart methodsFor: 'accessing' stamp: 'ao 2/25/2021 16:59:47'!
owner
	
	^owner! !

!Cart methodsFor: 'accessing' stamp: 'LL 1/20/2021 21:51:06'!
quantityOf: aBook
	
	^books occurrencesOf: aBook! !

!Cart methodsFor: 'accessing' stamp: 'LL 1/24/2021 17:42:15'!
total
	
	^books sum: [ :aBook | bookCatalog at: aBook ].! !


!Cart methodsFor: 'testing' stamp: 'LL 1/21/2021 21:39:26'!
includes: aBook

	^ books includes: aBook! !

!Cart methodsFor: 'testing' stamp: 'LL 1/20/2021 21:33:04'!
isEmpty

	^books isEmpty! !


!Cart methodsFor: 'private - assertions' stamp: 'LL 1/24/2021 15:49:03'!
assertIsInCatalog: aBook

	^ (bookCatalog includesKey: aBook) ifFalse: [ self error: self class bookNotInCatalogErrorMessage ]! !

!Cart methodsFor: 'private - assertions' stamp: 'LL 1/21/2021 21:27:21'!
assertValidNumberOfCopies: numberOfBooksToAdd

	^ numberOfBooksToAdd strictlyPositive ifFalse: [ self error: self class invalidNumberOfCopiesErrorMessage ]! !

!Cart methodsFor: 'private - assertions' stamp: 'ao 2/25/2021 16:55:35'!
hasOwner: aOwner 
	
	owner := aOwner ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Cart class' category: 'TusLibros'!
Cart class
	instanceVariableNames: ''!

!Cart class methodsFor: 'instance creation' stamp: 'ao 2/24/2021 22:25:35'!
acceptingItemsOf: aBookCatalog
 
	^self new initializeWithCatalog: aBookCatalog ! !


!Cart class methodsFor: 'error messages' stamp: 'LL 1/20/2021 21:45:09'!
bookNotInCatalogErrorMessage

	^'Cannot add a book that is not from the editorial'! !

!Cart class methodsFor: 'error messages' stamp: 'LL 1/21/2021 21:27:21'!
invalidNumberOfCopiesErrorMessage

	^'Cannot add zero books'! !


!classDefinition: #Cashier category: 'TusLibros'!
Object subclass: #Cashier
	instanceVariableNames: 'salesBook'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!Cashier methodsFor: 'initialization' stamp: 'LL 1/25/2021 18:49:19'!
initializeWithSalesBook: aSalesBook

	salesBook := aSalesBook! !


!Cashier methodsFor: 'checkout' stamp: 'LL 1/25/2021 23:10:38'!
checkout: aCart payingWith: aCreditCard through: aMerchantProcessor on: aCheckoutDateTime  

	| ticket |
	self assertCanCheckout: aCart using: aCreditCard on: aCheckoutDateTime.
	
	ticket := aCart total.
	
	self debit: ticket value from: aCreditCard using: aMerchantProcessor.
	
	self registerSale: ticket.
	
	^ticket! !


!Cashier methodsFor: 'assertions' stamp: 'LL 1/25/2021 23:10:22'!
assertCanCheckout: aCart using: aCreditCard on: aDateTime 

	self assertContainsBooks: aCart.
	self assertIsNotExpired: aCreditCard on: aDateTime! !

!Cashier methodsFor: 'assertions' stamp: 'LL 1/24/2021 17:45:42'!
assertContainsBooks: aCart

	^ aCart isEmpty ifTrue: [	 self error: Cashier cannotCheckoutAnEmptyCart ]! !

!Cashier methodsFor: 'assertions' stamp: 'LL 1/25/2021 23:11:12'!
assertIsNotExpired: aCreditCard on: aDateTime 

	^ (aCreditCard isExpiredOn: aDateTime) ifTrue: [ self error: Cashier cannotCheckoutUsingAnExpiredCard ]! !


!Cashier methodsFor: 'private' stamp: 'LL 1/24/2021 18:23:28'!
debit: anAmount from: aCreditCard using: aMerchantProcessor

	^ [ aMerchantProcessor debit: anAmount from: aCreditCard ]
		on: Error - MessageNotUnderstood 
		do: [ :exceptionRaised |
			self error: self class couldNotProcessPaymentErrorMessage.
		]! !

!Cashier methodsFor: 'private' stamp: 'LL 1/25/2021 19:50:24'!
registerSale: ticket

	^ salesBook add: ticket! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Cashier class' category: 'TusLibros'!
Cashier class
	instanceVariableNames: ''!

!Cashier class methodsFor: 'as yet unclassified' stamp: 'LL 1/21/2021 21:50:07'!
cannotCheckoutAnEmptyCart
	^'Cannot checkout an empty cart'! !

!Cashier class methodsFor: 'as yet unclassified' stamp: 'LL 1/24/2021 16:44:06'!
cannotCheckoutUsingAnExpiredCard

	^'Cannot checkout using an expired card'! !

!Cashier class methodsFor: 'as yet unclassified' stamp: 'LL 1/24/2021 18:13:36'!
couldNotProcessPaymentErrorMessage

	^'Cart was rejected'! !

!Cashier class methodsFor: 'as yet unclassified' stamp: 'LL 1/25/2021 18:48:59'!
registeringSalesOn: aSalesBook

	^ self new initializeWithSalesBook: aSalesBook.! !


!classDefinition: #CreditCard category: 'TusLibros'!
Object subclass: #CreditCard
	instanceVariableNames: 'creditCardNumber owner expirationDate'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!CreditCard methodsFor: 'initialization' stamp: 'LL 2/16/2021 18:05:42'!
initializeOf: aPerson number: aCreditCardNumber expiringOn: aMonthOfYear 

	owner := aPerson.
	creditCardNumber := aCreditCardNumber.
	expirationDate := aMonthOfYear.! !


!CreditCard methodsFor: 'testing' stamp: 'LL 2/16/2021 18:05:42'!
isExpiredOn: aDateTime

	^ aDateTime > (expirationDate lastDate)! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CreditCard class' category: 'TusLibros'!
CreditCard class
	instanceVariableNames: ''!

!CreditCard class methodsFor: 'instance creation' stamp: 'LL 1/24/2021 18:15:40'!
of: nameOfTheOwner number: aCreditCardNumber expiringOn: aMonthOfYear

	nameOfTheOwner isEmpty ifTrue: [ self error: self nameCannotBeBlankErrorMessage ].
	
	^self new initializeOf: nameOfTheOwner number: aCreditCardNumber expiringOn: aMonthOfYear ! !


!CreditCard class methodsFor: 'as yet unclassified' stamp: 'LL 1/24/2021 18:01:14'!
nameCannotBeBlankErrorMessage

	^'Name cannot be blank'! !


!classDefinition: #InterfaceIn category: 'TusLibros'!
Object subclass: #InterfaceIn
	instanceVariableNames: 'objectsFactory carts cashier salesRecord clock'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!InterfaceIn methodsFor: 'inizialization' stamp: 'ao 2/25/2021 17:56:14'!
initialize

	carts := Dictionary new.
	salesRecord := Dictionary new.
	
	objectsFactory := PublisherTestObjectsFactory new.
	cashier := Cashier registeringSalesOn: objectsFactory anEmptySalesBook.
	clock := DateAndTime now.
	
	! !


!InterfaceIn methodsFor: 'action' stamp: 'ao 2/25/2021 00:16:36'!
addBook: aBook toCart: aCartId
	
	self addBook: aBook toCart: aCartId quantity: 1! !

!InterfaceIn methodsFor: 'action' stamp: 'ao 2/25/2021 18:43:43'!
addBook: aBook toCart: aCartId quantity: numberOfBooksToAdd

	| aCart |
	
	aCart := carts keyAtValue: aCartId ifAbsent: [ self error: self class cannotAddABookWithInvalidCartId ].
	
	"self validateCart: aCart"
	
	aCart add: aBook quantity: numberOfBooksToAdd.
	
	^ aCart! !

!InterfaceIn methodsFor: 'action' stamp: 'ao 2/25/2021 18:44:02'!
checkoutACart: aCartId payingWithNumberCreditCard: aNumber expirationDate: aDate ownerName: aName through: aMerchantProcessor

	| aCart aCreditCard clientId ticket |
	
	aCart := carts keyAtValue: aCartId.
	"self validateCart: aCart"
	
	aCreditCard := CreditCard of: aName number: aNumber expiringOn: aDate.
	clientId := aCart owner.
	
	ticket := cashier checkout: aCart payingWith: aCreditCard through: aMerchantProcessor  on: objectsFactory now.
	
	salesRecord add: ticket -> clientId.
	
	^ ticket
	
	! !

!InterfaceIn methodsFor: 'action' stamp: 'ao 2/25/2021 17:53:26'!
createCartFor: clientId withPassword: password through: userPasswordValidator

	| aCart cartId |
	
	userPasswordValidator validateUser: clientId withPassword: password.
	
	aCart := objectsFactory anEmptyCart.
	
	aCart hasOwner: clientId.
	
	cartId := aCart identityHash.
	
	carts add: aCart->cartId.

	^ cartId
	
	! !

!InterfaceIn methodsFor: 'action' stamp: 'ao 2/25/2021 18:44:13'!
listCart: cartId

	| aCart |
	
	aCart := carts keyAtValue: cartId ifAbsent: [ self error: self class cannotListCartWithInvalidCartId ].
	
	"self validateCart: aCart"
	
	^ aCart contents 
	

	! !

!InterfaceIn methodsFor: 'action' stamp: 'ao 2/25/2021 18:44:37'!
listPurchasesFor: aClientId withPassword: apassword through: aUserPasswordValidator

	| aTicket |
	
	aTicket := salesRecord keyAtValue: aClientId ifAbsent: [ self error: self class cannotListPurchasesWithInvalidClientId ].
	
	^ aTicket ! !


!InterfaceIn methodsFor: 'as yet unclassified' stamp: 'ao 2/25/2021 18:33:54'!
advanceClock: seconds


	
	! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'InterfaceIn class' category: 'TusLibros'!
InterfaceIn class
	instanceVariableNames: ''!

!InterfaceIn class methodsFor: 'as yet unclassified' stamp: 'ao 2/25/2021 01:03:41'!
cannotAddABookWithInvalidCartId
	
	^ 'Cannot add a book with invalid CartId'! !

!InterfaceIn class methodsFor: 'as yet unclassified' stamp: 'ao 2/25/2021 01:06:27'!
cannotListCartWithInvalidCartId
	
	^ 'Cannot list a cart with invalid CartId'! !

!InterfaceIn class methodsFor: 'as yet unclassified' stamp: 'ao 2/25/2021 17:07:53'!
cannotListPurchasesWithInvalidClientId
	
	^ 'Cannot list purchases with invalid clientId'! !

!InterfaceIn class methodsFor: 'as yet unclassified' stamp: 'ao 2/25/2021 17:43:14'!
theCartIsInvalidAfterThirtyMinutes
	
	^ 'The cart is invalid after thirty minutes'! !


!classDefinition: #MerchantProcessorForTest category: 'TusLibros'!
Object subclass: #MerchantProcessorForTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!MerchantProcessorForTest methodsFor: 'action' stamp: 'ao 2/25/2021 18:24:35'!
debit: anAmount from: aCreditCard 
	
	^ true! !


!classDefinition: #PublisherTestObjectsFactory category: 'TusLibros'!
Object subclass: #PublisherTestObjectsFactory
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!PublisherTestObjectsFactory methodsFor: 'as yet unclassified' stamp: 'LL 2/16/2021 19:41:18'!
aCashier

	| salesBook |
	salesBook := OrderedCollection new.
	^ Cashier registeringSalesOn: salesBook.! !

!PublisherTestObjectsFactory methodsFor: 'as yet unclassified' stamp: 'LL 2/16/2021 19:45:08'!
aValidCreditCard

	| nextMonth |
	nextMonth := (FixedGregorianDate today next: GregorianMonth oneMonth) monthOfYear.
	^CreditCard of: 'Juan Perez' number: 11111111 expiringOn: nextMonth.! !

!PublisherTestObjectsFactory methodsFor: 'as yet unclassified' stamp: 'LL 1/25/2021 18:29:34'!
anEmptyCart

	| aCatalog |
	aCatalog := Dictionary newFromPairs: {self bookFromTheEditorial. self bookFromTheEditorialPrice}.
	^Cart acceptingItemsOf: aCatalog.! !

!PublisherTestObjectsFactory methodsFor: 'as yet unclassified' stamp: 'LL 2/16/2021 19:51:21'!
anEmptySalesBook

	^OrderedCollection new.! !

!PublisherTestObjectsFactory methodsFor: 'as yet unclassified' stamp: 'LL 2/16/2021 19:43:38'!
anExpiredCreditCard
	
	| lastMonth |
	lastMonth := (FixedGregorianDate today previous: GregorianMonth oneMonth) monthOfYear.
	^CreditCard of: 'Juan Perez' number: 11111111 expiringOn: lastMonth.! !

!PublisherTestObjectsFactory methodsFor: 'as yet unclassified' stamp: 'LL 1/24/2021 15:59:26'!
bookFromTheEditorial

	^ 'ABC123'! !

!PublisherTestObjectsFactory methodsFor: 'as yet unclassified' stamp: 'LL 1/24/2021 17:11:28'!
bookFromTheEditorialPrice

	^ 1000 * peso! !

!PublisherTestObjectsFactory methodsFor: 'as yet unclassified' stamp: 'LL 2/16/2021 19:46:27'!
cartWithABook

	| cart |
	cart := self anEmptyCart.
	cart add: self bookFromTheEditorial.
	^cart! !

!PublisherTestObjectsFactory methodsFor: 'as yet unclassified' stamp: 'LL 2/16/2021 19:48:31'!
now 

	^GregorianDateTime now! !


!classDefinition: #UserPasswordValidatorForTest category: 'TusLibros'!
Object subclass: #UserPasswordValidatorForTest
	instanceVariableNames: 'userBook'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!UserPasswordValidatorForTest methodsFor: 'as yet unclassified' stamp: 'ao 2/24/2021 22:22:04'!
validateUser: aClientId withPassword: aPassword

	| password |

	password := userBook keyAtValue: aClientId ifAbsent: [ ^ self error: self class invalidClientIdErrorMessage ].
	
	password = aPassword ifFalse: [ ^ self error: self class invalidPasswordErrorMessage ]! !


!UserPasswordValidatorForTest methodsFor: 'initialization' stamp: 'ao 2/24/2021 22:18:46'!
initializeWithUserBook: userBookRegistration 
	
	userBook := userBookRegistration! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'UserPasswordValidatorForTest class' category: 'TusLibros'!
UserPasswordValidatorForTest class
	instanceVariableNames: 'userBookRegistration_CHANGE_ME'!

!UserPasswordValidatorForTest class methodsFor: 'as yet unclassified' stamp: 'ao 2/24/2021 22:25:31'!
createWithUserBook: userBookRegistration 
	
	^self new initializeWithUserBook: userBookRegistration! !

!UserPasswordValidatorForTest class methodsFor: 'as yet unclassified' stamp: 'ao 2/24/2021 22:23:26'!
invalidClientIdErrorMessage

	^ 'The ClientId is not valid'! !

!UserPasswordValidatorForTest class methodsFor: 'as yet unclassified' stamp: 'ao 2/24/2021 22:23:37'!
invalidPasswordErrorMessage

	^ 'The password is not valid'! !

