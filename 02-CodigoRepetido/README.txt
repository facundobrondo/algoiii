Se agrego una categoria a la clase CustomerBookTest llamada "test-utils" para incorporar
mensajes que sirvan para quitar el codigo repetido.


Observaciones:
Se dejo el codigo viejo comentado solo para tenerlo de ayuda visual en el ejercicio.

En los test 1 y 2 a demas de quitar codigo, se parametrizo el tiempo maximo que no deberia
superar la ejecucion del bloque.

Para el caso de los test 3, 4, 7 y 8 se quito codigo con con el mensaje exceptionThrowBy:WithError:Verification:
si bien el codigo es similar creemos que se le agrega semantica al codigo final.

Para el caso de los test 5 y 6  se quito codigo a traves del mensaje numberOfActiveCustomers:SuspendedCustomers:Customers:inTheCustomerBook:
a demas de agregarle semantica al codgio tambien se lo parametrizo

Para el mensaje removeCustomerNamed: se quito codigo agregando un mensaje al OrderCollection llamado removeByName:
