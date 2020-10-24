!classDefinition: #CintaTransportadoraAzul category: 'Factorio'!
DenotativeObject subclass: #CintaTransportadoraAzul
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Factorio'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CintaTransportadoraAzul class' category: 'Factorio'!
CintaTransportadoraAzul class
	instanceVariableNames: 'contenido destino'!

!CintaTransportadoraAzul class methodsFor: 'as yet unclassified' stamp: 'ao 10/24/2020 16:26:04'!
agregar: unaMena
	contenido add: unaMena.! !

!CintaTransportadoraAzul class methodsFor: 'as yet unclassified' stamp: 'ao 10/24/2020 16:26:04'!
cantidadDeMenas
	^contenido size.! !

!CintaTransportadoraAzul class methodsFor: 'as yet unclassified' stamp: 'ao 10/24/2020 16:26:04'!
conectarA: unDestino
	destino := unDestino.! !

!CintaTransportadoraAzul class methodsFor: 'as yet unclassified' stamp: 'ao 10/24/2020 16:50:34'!
descargar
	destino agregarTodo: contenido.
	self vaciar.! !

!CintaTransportadoraAzul class methodsFor: 'as yet unclassified' stamp: 'ao 10/24/2020 16:53:36'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	contenido := ((OrderedCollection new)).
	destino := CintaTransportadoraRoja.! !

!CintaTransportadoraAzul class methodsFor: 'as yet unclassified' stamp: 'ao 10/24/2020 16:26:04'!
vaciar

	contenido := OrderedCollection new.! !


!classDefinition: #CintaTransportadoraRoja category: 'Factorio'!
DenotativeObject subclass: #CintaTransportadoraRoja
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Factorio'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CintaTransportadoraRoja class' category: 'Factorio'!
CintaTransportadoraRoja class
	instanceVariableNames: 'contenido destino'!

!CintaTransportadoraRoja class methodsFor: 'as yet unclassified' stamp: 'PDG 10/24/2020 15:58:18'!
agregar: unaMena
	contenido add: unaMena.! !

!CintaTransportadoraRoja class methodsFor: 'as yet unclassified' stamp: 'ao 10/24/2020 16:48:26'!
agregarTodo: Menas
	contenido addAll: Menas.! !

!CintaTransportadoraRoja class methodsFor: 'as yet unclassified' stamp: 'PDG 10/24/2020 16:08:56'!
cantidadDeMenas
	^contenido size.! !

!CintaTransportadoraRoja class methodsFor: 'as yet unclassified' stamp: 'PDG 10/24/2020 15:51:33'!
conectarA: unDestino
	destino := unDestino.! !

!CintaTransportadoraRoja class methodsFor: 'as yet unclassified' stamp: 'ao 10/24/2020 16:47:58'!
descargar
	destino agregarTodo: contenido.
	self vaciar.! !

!CintaTransportadoraRoja class methodsFor: 'as yet unclassified' stamp: 'ao 10/24/2020 16:53:36'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	contenido := ((OrderedCollection new)).
	destino := Contenedor.! !

!CintaTransportadoraRoja class methodsFor: 'as yet unclassified' stamp: 'PDG 10/24/2020 15:47:51'!
vaciar

	contenido := OrderedCollection new.! !


!classDefinition: #Contenedor category: 'Factorio'!
DenotativeObject subclass: #Contenedor
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Factorio'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Contenedor class' category: 'Factorio'!
Contenedor class
	instanceVariableNames: 'contenido'!

!Contenedor class methodsFor: 'as yet unclassified' stamp: 'ao 10/24/2020 16:40:30'!
agregar: unaMena
	contenido add: unaMena.! !

!Contenedor class methodsFor: 'as yet unclassified' stamp: 'ao 10/24/2020 16:41:19'!
agregarTodo: Menas
	contenido addAll: Menas.! !

!Contenedor class methodsFor: 'as yet unclassified' stamp: 'SF 10/23/2020 00:38:00'!
cantidadDe: unaMenaDeMuestra
	^contenido count: [:unaMena | unaMena = unaMenaDeMuestra ].! !

!Contenedor class methodsFor: 'as yet unclassified' stamp: 'SF 10/23/2020 00:38:20'!
cantidadDeMenas
	^contenido size.! !

!Contenedor class methodsFor: 'as yet unclassified' stamp: 'ao 10/24/2020 16:53:36'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	contenido := ((OrderedCollection new) add: #carbon; add: #hierro; yourself).! !

!Contenedor class methodsFor: 'as yet unclassified' stamp: 'SF 10/23/2020 00:35:51'!
vaciar
	contenido := OrderedCollection new.! !


!classDefinition: #ExtractorDeCarbon category: 'Factorio'!
DenotativeObject subclass: #ExtractorDeCarbon
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Factorio'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'ExtractorDeCarbon class' category: 'Factorio'!
ExtractorDeCarbon class
	instanceVariableNames: 'destino'!

!ExtractorDeCarbon class methodsFor: 'as yet unclassified' stamp: 'SF 10/23/2020 00:33:23'!
conectarA: unDestino
	destino := unDestino.! !

!ExtractorDeCarbon class methodsFor: 'as yet unclassified' stamp: 'SF 10/23/2020 00:33:50'!
extraer
	destino agregar: #carbon.! !

!ExtractorDeCarbon class methodsFor: 'as yet unclassified' stamp: 'ao 10/24/2020 16:53:36'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	destino := CintaTransportadoraRoja.! !


!classDefinition: #ExtractorDeHierro category: 'Factorio'!
DenotativeObject subclass: #ExtractorDeHierro
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Factorio'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'ExtractorDeHierro class' category: 'Factorio'!
ExtractorDeHierro class
	instanceVariableNames: 'destino'!

!ExtractorDeHierro class methodsFor: 'as yet unclassified' stamp: 'ao 10/24/2020 16:25:55'!
conectarA: unDestino
	destino := unDestino.! !

!ExtractorDeHierro class methodsFor: 'as yet unclassified' stamp: 'ao 10/24/2020 16:31:40'!
extraer
	destino agregar: #hierro.! !

!ExtractorDeHierro class methodsFor: 'as yet unclassified' stamp: 'ao 10/24/2020 16:53:36'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	destino := CintaTransportadoraAzul.! !


!classDefinition: #FactorioTest category: 'Factorio'!
DenotativeObject subclass: #FactorioTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Factorio'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'FactorioTest class' category: 'Factorio'!
FactorioTest class
	instanceVariableNames: ''!

!FactorioTest class methodsFor: 'escenario 1' stamp: 'SF 10/23/2020 01:01:45'!
configurarCircuitoExtractorCaja.

	Contenedor vaciar.
	ExtractorDeCarbon conectarA: Contenedor.	
! !

!FactorioTest class methodsFor: 'escenario 1' stamp: 'SF 10/23/2020 00:55:32'!
hacerAndarCircuitoExtractorCaja

	ExtractorDeCarbon extraer.
	! !

!FactorioTest class methodsFor: 'escenario 1' stamp: 'SF 10/23/2020 00:53:55'!
test01ExtractorCaja
	self configurarCircuitoExtractorCaja.
	
	self hacerAndarCircuitoExtractorCaja.
	
	Assert that: (Contenedor cantidadDe: #carbon) isEqualTo: 1.
	Assert that: Contenedor cantidadDeMenas isEqualTo: 1.! !


!FactorioTest class methodsFor: 'escenario 2' stamp: 'PDG 10/24/2020 15:55:36'!
configurarCircuitoExtractorCintaCaja

	Contenedor vaciar.
	
	"No se olviden de vaciar la cinta tambien!!"
	CintaTransportadoraRoja vaciar.
	
	"Conectamos el extractor a la cinta, luego conectamos la cinta a la caja"
	ExtractorDeCarbon conectarA: CintaTransportadoraRoja.	
	CintaTransportadoraRoja conectarA: 	Contenedor.
	
! !

!FactorioTest class methodsFor: 'escenario 2' stamp: 'PDG 10/24/2020 16:01:31'!
hacerAndarCircuitoExtractorCintaCaja

	"Hacemos andar el extractor, asi deja un carbon en la cinta."
	ExtractorDeCarbon extraer.
	
	"Luego hacemos andar la cinta (con algun mensaje) y deberia dejar el carbon en la caja.	"
	CintaTransportadoraRoja descargar.! !

!FactorioTest class methodsFor: 'escenario 2' stamp: 'PDG 10/24/2020 16:08:14'!
test02ExtractorCintaCaja
	self configurarCircuitoExtractorCintaCaja.
	
	self hacerAndarCircuitoExtractorCintaCaja.
	
	Assert that: (Contenedor cantidadDe: #carbon) isEqualTo: 1.
	Assert that: Contenedor cantidadDeMenas isEqualTo: 1.
	"Tambien tenemos que chequear que en la cinta no haya nada. Cero carbon."
	Assert that: CintaTransportadoraRoja cantidadDeMenas isEqualTo: 0.! !


!FactorioTest class methodsFor: 'escenario 3' stamp: 'ao 10/24/2020 16:29:04'!
configurarCircuitoExtractorExtractorCintaCintaCaja

	Contenedor vaciar.
	"Además de vaciar el Contenedor (arriba) también vaciamos las dos cintas"
	CintaTransportadoraAzul vaciar.
	CintaTransportadoraRoja vaciar.
	"Conectamos el extractor de carbon a una de las cintas"
	ExtractorDeCarbon conectarA: CintaTransportadoraRoja.
	"Conectamos el extractor de hierro a la otra cinta"
	ExtractorDeHierro conectarA: CintaTransportadoraAzul .
	"Ahora conectamos la primer cinta al Contenedor"
	CintaTransportadoraRoja conectarA: Contenedor.    	
	"Y conectamos la segunda cinta a la primer cinta"
	CintaTransportadoraAzul conectarA: CintaTransportadoraRoja.
	
! !

!FactorioTest class methodsFor: 'escenario 3' stamp: 'ao 10/24/2020 16:33:28'!
hacerAndarCircuitoExtractorExtractorCintaCintaCaja
	
	"Hacemos andar el extractor, asi deja un carbon en la cinta."
	ExtractorDeCarbon extraer.
	"Lo mismo con el otro extractor, asi deja una mena de hierro en la otra cinta."
	ExtractorDeHierro extraer.
	"Hacemos andar la cinta con la mena de hierro, asi la deposita en la cinta que tiene el carbon."
	CintaTransportadoraAzul descargar.
	"Ahora podemos hacer andar la ultima cinta, la que recibió primero el carbon
	y ahora tambien tiene el hierro y que deje todo en el Contenedor."
	CintaTransportadoraRoja descargar.! !

!FactorioTest class methodsFor: 'escenario 3' stamp: 'ao 10/24/2020 16:52:17'!
test03ExtractorExtractorCintaCintaCaja
	self configurarCircuitoExtractorExtractorCintaCintaCaja.
	
	self hacerAndarCircuitoExtractorExtractorCintaCintaCaja.
	
	Assert that: (Contenedor cantidadDe: #carbon) isEqualTo: 1.
	Assert that: (Contenedor cantidadDe: #hierro) isEqualTo: 1.
	Assert that: Contenedor cantidadDeMenas isEqualTo: 2.
	"Tambien tenemos que chequear que no haya nada en las cintas"
	Assert that: CintaTransportadoraRoja cantidadDeMenas isEqualTo: 0.
	Assert that: CintaTransportadoraAzul cantidadDeMenas isEqualTo: 0.
	! !

CintaTransportadoraAzul initializeAfterFileIn!
CintaTransportadoraRoja initializeAfterFileIn!
Contenedor initializeAfterFileIn!
ExtractorDeCarbon initializeAfterFileIn!
ExtractorDeHierro initializeAfterFileIn!