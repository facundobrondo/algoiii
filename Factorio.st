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

!CintaTransportadoraRoja class methodsFor: 'as yet unclassified' stamp: 'PDG 10/24/2020 16:08:56'!
cantidadDeMenas
	^contenido size.! !

!CintaTransportadoraRoja class methodsFor: 'as yet unclassified' stamp: 'PDG 10/24/2020 15:51:33'!
conectarA: unDestino
	destino := unDestino.! !

!CintaTransportadoraRoja class methodsFor: 'as yet unclassified' stamp: 'PDG 10/24/2020 16:04:30'!
descargar
	destino agregar: #carbon.
	self vaciar.! !

!CintaTransportadoraRoja class methodsFor: 'as yet unclassified' stamp: 'PDG 10/24/2020 16:09:21'!
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

!Contenedor class methodsFor: 'as yet unclassified' stamp: 'SF 10/23/2020 00:35:04'!
agregar: unaMena
	contenido add: unaMena.! !

!Contenedor class methodsFor: 'as yet unclassified' stamp: 'SF 10/23/2020 00:38:00'!
cantidadDe: unaMenaDeMuestra
	^contenido count: [:unaMena | unaMena = unaMenaDeMuestra ].! !

!Contenedor class methodsFor: 'as yet unclassified' stamp: 'SF 10/23/2020 00:38:20'!
cantidadDeMenas
	^contenido size.! !

!Contenedor class methodsFor: 'as yet unclassified' stamp: 'PDG 10/24/2020 16:09:21'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	contenido := ((OrderedCollection new) add: #carbon; yourself).! !

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

!ExtractorDeCarbon class methodsFor: 'as yet unclassified' stamp: 'PDG 10/24/2020 16:09:21'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	destino := CintaTransportadoraRoja.! !


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


!FactorioTest class methodsFor: 'escenario 3' stamp: 'SF 10/23/2020 01:01:20'!
configurarCircuitoExtractorExtractorCintaCintaCaja

	Contenedor vaciar.
	"Además de vaciar el Contenedor (arriba) también vaciamos las dos cintas"
	"Conectamos el extractor de carbon a una de las cintas"
	"Conectamos el extractor de hierro a la otra cinta"
	"Ahora conectamos la primer cinta al Contenedor"
	"Y conectamos la segunda cinta a la primer cinta"
	
! !

!FactorioTest class methodsFor: 'escenario 3' stamp: 'SF 10/23/2020 01:02:57'!
hacerAndarCircuitoExtractorExtractorCintaCintaCaja
	
	"Hacemos andar el extractor, asi deja un carbon en la cinta.
	Lo mismo con el otro extractor, asi deja una mena de hierro en la otra cinta.
	Hacemos andar la cinta con la mena de hierro, asi la deposita en la cinta que tiene el carbon.
	Ahora podemos hacer andar la ultima cinta, la que recibió primero el carbon 
	y ahora tambien tiene el hierro y que deje todo en el Contenedor."! !

!FactorioTest class methodsFor: 'escenario 3' stamp: 'SF 10/23/2020 01:03:37'!
test03ExtractorExtractorCintaCintaCaja
	self configurarCircuitoExtractorExtractorCintaCintaCaja.
	
	self hacerAndarCircuitoExtractorExtractorCintaCintaCaja.
	
	Assert that: (Contenedor cantidadDe: #carbon) isEqualTo: 1.
	Assert that: (Contenedor cantidadDe: #hierro) isEqualTo: 1.
	Assert that: Contenedor cantidadDeMenas isEqualTo: 2.
	"Tambien tenemos que chequear que no haya nada en las cintas"! !

CintaTransportadoraRoja initializeAfterFileIn!
Contenedor initializeAfterFileIn!
ExtractorDeCarbon initializeAfterFileIn!