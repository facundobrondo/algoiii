!classDefinition: #CantSuspend category: 'CodigoRepetido-Ejercicio'!
Error subclass: #CantSuspend
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!


!classDefinition: #NotFound category: 'CodigoRepetido-Ejercicio'!
Error subclass: #NotFound
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!


!classDefinition: #CustomerBookTest category: 'CodigoRepetido-Ejercicio'!
TestCase subclass: #CustomerBookTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!

!CustomerBookTest methodsFor: 'tests-utils' stamp: 'ao 11/8/2020 03:13:32'!
exceptionThrowBy: collaboration WithError: error Verification: verification
	[ collaboration value . self fail. ]
	on: error
	do: [ :anError | verification value: anError ].! !

!CustomerBookTest methodsFor: 'tests-utils' stamp: 'ao 11/8/2020 03:24:22'!
executeBlock: closure TakeNoMoreThan: maxTime

       | millisecondsBeforeRunning millisecondsAfterRunning |

	millisecondsBeforeRunning := Time millisecondClockValue * millisecond.
	closure value.
	millisecondsAfterRunning := Time millisecondClockValue * millisecond.
	
	self assert: (millisecondsAfterRunning-millisecondsBeforeRunning) < (maxTime * millisecond).! !

!CustomerBookTest methodsFor: 'tests-utils' stamp: 'ao 11/8/2020 03:46:39'!
includesThisCustomer: aCustomer InCustomerBook: customerBook.
	self assert: (customerBook includesCustomerNamed: aCustomer).! !

!CustomerBookTest methodsFor: 'tests-utils' stamp: 'ao 11/8/2020 03:47:32'!
notIncludesThisCustomer: aCustomer InCustomerBook: customerBook.
	self deny: (customerBook includesCustomerNamed: aCustomer).! !

!CustomerBookTest methodsFor: 'tests-utils' stamp: 'ao 11/8/2020 03:41:58'!
numberOfActiveCustomers: numberActive SuspendedCustomers: numberSuspended Customers: numberCustomers inTheCustomerBook: customerBook
	self assert: numberActive equals: customerBook numberOfActiveCustomers.
	self assert: numberSuspended equals: customerBook numberOfSuspendedCustomers.
	self assert: numberCustomers equals: customerBook numberOfCustomers.! !

!CustomerBookTest methodsFor: 'tests-utils' stamp: 'ao 11/8/2020 03:40:04'!
numberOfActiveCustomers: numberActive SuspendedCustomers: numberSuspended Customers: numberCustomers includesThisCustomer: aCustomer inTheCustomerBook: customerBook
	self assert: numberActive equals: customerBook numberOfActiveCustomers.
	self assert: numberSuspended equals: customerBook numberOfSuspendedCustomers.
	self assert: numberCustomers equals: customerBook numberOfCustomers.
	self deny: (customerBook includesCustomerNamed: aCustomer).! !


!CustomerBookTest methodsFor: 'tests' stamp: 'ao 11/8/2020 00:36:27'!
test01AddingCustomerShouldNotTakeMoreThan50Milliseconds

"	| customerBook millisecondsBeforeRunning millisecondsAfterRunning |
	
	customerBook := CustomerBook new.
	
	millisecondsBeforeRunning := Time millisecondClockValue * millisecond.
	customerBook addCustomerNamed: 'John Lennon'.
	millisecondsAfterRunning := Time millisecondClockValue * millisecond.
	
	self assert: (millisecondsAfterRunning-millisecondsBeforeRunning) < (50 * millisecond)"
	
	| customerBook addCustomerJohnLennon |
	
	customerBook  := CustomerBook new.
	
	addCustomerJohnLennon := [customerBook addCustomerNamed: 'John Lennon'].
	
	self executeBlock: addCustomerJohnLennon TakeNoMoreThan: 50.
	
	
	
! !

!CustomerBookTest methodsFor: 'tests' stamp: 'ao 11/8/2020 00:49:56'!
test02RemovingCustomerShouldNotTakeMoreThan100Milliseconds

"	| customerBook millisecondsBeforeRunning millisecondsAfterRunning paulMcCartney |
	
	customerBook := CustomerBook new.
	paulMcCartney := 'Paul McCartney'.
	
	customerBook addCustomerNamed: paulMcCartney.
	  
	millisecondsBeforeRunning := Time millisecondClockValue * millisecond.
	customerBook removeCustomerNamed: paulMcCartney.
	millisecondsAfterRunning := Time millisecondClockValue * millisecond.
	
	self assert: (millisecondsAfterRunning-millisecondsBeforeRunning) < (100 * millisecond)"
	
	| customerBook removeCustomerNamedPaulMcCartney paulMcCartney |
	
	customerBook := CustomerBook new.
	paulMcCartney := 'Paul McCartney'.
	customerBook addCustomerNamed: paulMcCartney.
	
	removeCustomerNamedPaulMcCartney := [customerBook removeCustomerNamed: paulMcCartney.].
	
	self executeBlock: removeCustomerNamedPaulMcCartney TakeNoMoreThan: 100.
	
	! !

!CustomerBookTest methodsFor: 'tests' stamp: 'ao 11/8/2020 03:12:59'!
test03CanNotAddACustomerWithEmptyName 

	| customerBook |
			
	customerBook := CustomerBook new.

	self exceptionThrowBy: [ customerBook addCustomerNamed: ''. ]
	WithError: Error 
	Verification: [		:anError | self assert: anError messageText = CustomerBook customerCanNotBeEmptyErrorMessage.
                           self assert: customerBook isEmpty. ].
"
	[ customerBook addCustomerNamed: ''.
	self fail ]
		on: Error 
		do: [ :anError | 
			self assert: anError messageText = CustomerBook customerCanNotBeEmptyErrorMessage.
			self assert: customerBook isEmpty ]
"		
! !

!CustomerBookTest methodsFor: 'tests' stamp: 'ao 11/8/2020 03:14:13'!
test04CanNotRemoveAnInvalidCustomer
	
	| customerBook johnLennon |
			
	customerBook := CustomerBook new.
	johnLennon := 'John Lennon'.
	customerBook addCustomerNamed: johnLennon.
	
	self exceptionThrowBy:  [ customerBook removeCustomerNamed: 'Paul McCartney']
	WithError: NotFound
	Verification: [ :anError | self assert: customerBook numberOfCustomers = 1.
			    self assert: (customerBook includesCustomerNamed: johnLennon) ].
"	
	[ customerBook removeCustomerNamed: 'Paul McCartney'.
	self fail ]
		on: NotFound 
		do: [ :anError | 
			self assert: customerBook numberOfCustomers = 1.
			self assert: (customerBook includesCustomerNamed: johnLennon) ]
"! !

!CustomerBookTest methodsFor: 'tests' stamp: 'ao 11/8/2020 03:45:33'!
test05SuspendingACustomerShouldNotRemoveItFromCustomerBook

	| customerBook paulMcCartney|
	
	customerBook := CustomerBook new.
	paulMcCartney := 'Paul McCartney'.
	
	customerBook addCustomerNamed: paulMcCartney.
	customerBook suspendCustomerNamed: paulMcCartney.
	
	self numberOfActiveCustomers: 0 SuspendedCustomers: 1 Customers: 1 inTheCustomerBook: customerBook.
	self includesThisCustomer: paulMcCartney InCustomerBook: customerBook.
"	
	self assert: 0 equals: customerBook numberOfActiveCustomers.
	self assert: 1 equals: customerBook numberOfSuspendedCustomers.
	self assert: 1 equals: customerBook numberOfCustomers.
	self assert: (customerBook includesCustomerNamed: paulMcCartney).
	
"! !

!CustomerBookTest methodsFor: 'tests' stamp: 'ao 11/8/2020 03:42:32'!
test06RemovingASuspendedCustomerShouldRemoveItFromCustomerBook

	| customerBook paulMcCartney|
	
	customerBook := CustomerBook new.
	paulMcCartney := 'Paul McCartney'.
	
	customerBook addCustomerNamed: paulMcCartney.
	customerBook suspendCustomerNamed: paulMcCartney.
	customerBook removeCustomerNamed: paulMcCartney.

	self numberOfActiveCustomers: 0 SuspendedCustomers: 0 Customers: 0 inTheCustomerBook: customerBook.
"	
	self assert: 0 equals: customerBook numberOfActiveCustomers.
	self assert: 0 equals: customerBook numberOfSuspendedCustomers.
	self assert: 0 equals: customerBook numberOfCustomers.
	self deny: (customerBook includesCustomerNamed: paulMcCartney).

"
	
! !

!CustomerBookTest methodsFor: 'tests' stamp: 'ao 11/8/2020 03:20:37'!
test07CanNotSuspendAnInvalidCustomer
	
	| customerBook johnLennon |
			
	customerBook := CustomerBook new.
	johnLennon := 'John Lennon'.
	customerBook addCustomerNamed: johnLennon.
	
	self exceptionThrowBy: [ customerBook suspendCustomerNamed: 'Ringo Starr' ]
	WithError: CantSuspend  
	Verification: 	[ :anError | 
			self assert: customerBook numberOfCustomers = 1.
			self assert: (customerBook includesCustomerNamed: johnLennon) ]
	
"	
	[ customerBook suspendCustomerNamed: 'Ringo Starr'.
	self fail ]
		on: CantSuspend 
		do: [ :anError | 
			self assert: customerBook numberOfCustomers = 1.
			self assert: (customerBook includesCustomerNamed: johnLennon) ]

"! !

!CustomerBookTest methodsFor: 'tests' stamp: 'ao 11/8/2020 03:22:11'!
test08CanNotSuspendAnAlreadySuspendedCustomer
	
	| customerBook johnLennon |
			
	customerBook := CustomerBook new.
	johnLennon := 'John Lennon'.
	customerBook addCustomerNamed: johnLennon.
	customerBook suspendCustomerNamed: johnLennon.

	self exceptionThrowBy: [ customerBook suspendCustomerNamed: johnLennon ]
	WithError:  CantSuspend
	Verification: [ :anError | 
			self assert: customerBook numberOfCustomers = 1.
			self assert: (customerBook includesCustomerNamed: johnLennon) ]

"	
	[ customerBook suspendCustomerNamed: johnLennon.
	self fail ]
		on: CantSuspend 
		do: [ :anError | 
			self assert: customerBook numberOfCustomers = 1.
			self assert: (customerBook includesCustomerNamed: johnLennon) ]
"! !


!classDefinition: #CustomerBook category: 'CodigoRepetido-Ejercicio'!
Object subclass: #CustomerBook
	instanceVariableNames: 'suspended active'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!

!CustomerBook methodsFor: 'initialization' stamp: 'LL 10/30/2020 12:22:04'!
initialize

	active := OrderedCollection new.
	suspended:= OrderedCollection new.! !


!CustomerBook methodsFor: 'customer management' stamp: 'NR 4/3/2019 10:14:26'!
addCustomerNamed: aName

	aName isEmpty ifTrue: [ self signalCustomerNameCannotBeEmpty ].
	((active includes: aName) or: [suspended includes: aName]) ifTrue: [ self signalCustomerAlreadyExists ].
	
	active add: aName ! !

!CustomerBook methodsFor: 'customer management' stamp: 'ao 11/8/2020 01:47:32'!
removeCustomerNamed: aName 
| deletedCustomerName | 
"	1 to: active size do: 
	[ :index |
		aName = (active at: index)
			ifTrue: [
				active removeAt: index.
				^ aName 
			] 
	].

	1 to: suspended size do: 	
	[ :index |
		aName = (suspended at: index)
			ifTrue: [
				suspended removeAt: index.
				^ aName 
			] 
	].

	^ NotFound signal."
	
	deletedCustomerName := active removeByName: aName.
	( deletedCustomerName ~= false ) ifTrue: [^aName].
	deletedCustomerName := suspended removeByName: aName.
	( deletedCustomerName ~= false ) ifTrue: [^aName].
	^ NotFound signal.
	
	
! !

!CustomerBook methodsFor: 'customer management' stamp: 'NR 4/3/2019 10:14:26'!
suspendCustomerNamed: aName 
	
	(active includes: aName) ifFalse: [^CantSuspend signal].
	
	active remove: aName.
	
	suspended add: aName
! !


!CustomerBook methodsFor: 'accessing' stamp: 'NR 4/3/2019 10:14:26'!
numberOfActiveCustomers
	
	^active size! !

!CustomerBook methodsFor: 'accessing' stamp: 'NR 4/3/2019 10:14:26'!
numberOfCustomers
	
	^active size + suspended size! !

!CustomerBook methodsFor: 'accessing' stamp: 'NR 9/19/2018 17:36:09'!
numberOfSuspendedCustomers
	
	^suspended size! !


!CustomerBook methodsFor: 'testing' stamp: 'NR 4/3/2019 10:14:26'!
includesCustomerNamed: aName

	^(active includes: aName) or: [ suspended includes: aName ]! !

!CustomerBook methodsFor: 'testing' stamp: 'NR 4/3/2019 10:14:26'!
isEmpty
	
	^active isEmpty and: [ suspended isEmpty ]! !


!CustomerBook methodsFor: 'signal errors' stamp: 'HernanWilkinson 7/6/2011 17:52'!
signalCustomerAlreadyExists 

	self error: self class customerAlreadyExistsErrorMessage! !

!CustomerBook methodsFor: 'signal errors' stamp: 'HernanWilkinson 7/6/2011 17:51'!
signalCustomerNameCannotBeEmpty 

	self error: self class customerCanNotBeEmptyErrorMessage ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CustomerBook class' category: 'CodigoRepetido-Ejercicio'!
CustomerBook class
	instanceVariableNames: ''!

!CustomerBook class methodsFor: 'error messages' stamp: 'NR 4/30/2020 09:05:18'!
customerAlreadyExistsErrorMessage

	^'Customer Already Exists'! !

!CustomerBook class methodsFor: 'error messages' stamp: 'NR 4/30/2020 09:05:25'!
customerCanNotBeEmptyErrorMessage

	^'Customer Name Cannot Be Empty'! !
