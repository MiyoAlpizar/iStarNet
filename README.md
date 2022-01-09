# iStarNet

## _Una app social muy muy lejana_

[![N|Solid](https://cldup.com/dTxpPi9lDf.thumb.png)](https://nodesource.com/products/nsolid)

[![Build Status](https://travis-ci.org/joemccann/dillinger.svg?branch=master)](https://travis-ci.org/joemccann/dillinger)

Proyecto desarrollado usando VIPER como patrón de arquitectura de software ya que esté patrón permite una mayor escalabilidad en proyectos grandes, usando también como base los principios de SOLID e injección de dependencias.

Ejemplo de la app funcionando


## Ciclo de vida de UIView Controller en orden:

ViewDidLoad: Se llama cuando crea la clase.

ViewWillAppear - Llamado justo antes de que aparezca su vista, esto puede ocurrir 1 o más veces, debido a que es posible que vaya y venga de una vista a otra, esto se activará cada vez que su vista aparezca en la pantalla.

ViewDidAppear - Llamado después de que aparezca la vista, de igual manera, puede ocurrir varias veces.

ViewWillDisappear/DidDisappear - La misma idea que ViewWillAppear/ViewDidAppear.

ViewDidUnload/ViewDidDispose - Es donde se hace la limpieza y el lanzamiento de las cosas, pero esto se maneja automáticamente.

## Ciclo de vida de una app ##

didFinishLaunchingWithOptions: Este método de devolución de llamada se llama cuando la aplicación ha terminado de iniciarse y restaurado el estado y puede realizar la inicialización final, como la creación de una interfaz de usuario.

applicationWillEnterForeground: Se llama después de application "didFinishLaunchingWithOptions" o si su aplicación se vuelve a activar después de recibir una llamada telefónica u otra interrupción del sistema.

applicationDidBecomeActive: se llama después de "applicationWillEnterForeground" para finalizar la transición al primer plano.

applicationWillResignActive: se llama cuando la aplicación está a punto de quedar inactiva (por ejemplo, cuando el teléfono recibe una llamada o el usuario presiona el botón Inicio).

applicationDidEnterBackground: se llama cuando la aplicación entra en un estado de fondo después de estar inactiva. Tiene aproximadamente cinco segundos para ejecutar cualquier tarea que necesite para hacer una copia de seguridad en caso de que la aplicación se cancele más tarde o inmediatamente después de eso.

applicationWillTerminate: Se llama cuando la aplicación está a punto de ser borrada de la memoria. Aquí es donde se pueden realizar limpiezas finales necesarias.

## En que casos se usa un weak, un strong y un unowned. ##

Strong: Es el tipo de referencia por default en swift, se utliza cuando queramos al usar un valor externo dentro de un clouser nunca se destruido automaticamente.

Weak: Este tipo de referencia, se usa para que al momento de un usar un valor dentro de un clouser, este pueda ser destruido automaticamente

Onwoned: Es similar a la referencia Weak, solo que este permite usar los valores como opcionales sin necesidad de hacer un unwrap

## ¿Qué es el ARC? ##
Automatic Reference Counting
Es el que se encarga de liberar memoria de manera automatica, cuando las instancias de clases ya no son necesarias, para así poder evitar loe memory leaks.

## Respuesta a color de background ##

El color de la vista será amarilla ya que:

1 .- Al instanciar el UIViewController se llama a la función ViewDidLoad y se le asigna el color rojo

2 .- El view controller y se ha instanciado y se tiene acceso a sus propiedades y se le cambia el color del background a amarillo.
