/*
 * Copyright (C) 2019 Juan Pablo Calle
 *
 * Este software se proporciona 'tal cual', sin ninguna garantía expresa o implícita.
 * En ningún caso, los autores serán responsables de los daños que se deriven del
 * uso de este software.
 *
 * Se concede permiso a cualquier persona para utilizar este software para
 * cualquier propósito, incluidas las aplicaciones comerciales, y para modificarlo y
 * redistribuirlo libremente, sujeto a las siguientes restricciones:
 *
 * 1. El origen de este software no debe ser tergiversado; No debes reclamar
 *    que escribiste el software original. Si utiliza este software en un producto,
 *    se agradecería un reconocimiento en la documentación del producto, pero no
 *    es obligatorio.
 * 2. Las versiones fuente modificadas deben estar claramente marcadas como
 *     tales y no deben tergiversarse como si fueran el software original.
 * 3. Este aviso no puede ser eliminado ni alterado de ninguna distribución.
 */

package KYLib.utils
{
	import KYLib.clases;
	import KYLib.global.esencial;
	import flash.events.*;
	import flash.utils.*;
	//import KYLib.TePo.*;
	import flash.desktop.NativeApplication;
	import flash.display.NativeWindow;

	/**
	 * Tiene la funcionalidad de cerrar la aplicación si esta se esta ejecutando en AIR, si usa Flash Player esta función es inutil.
	 *
	 * @langversion 3.0
	 *
	 * @playerversion AIR 32
	 *
	 * @productversion Flash CS6
	 * @productversion Animate CC
	 */
	public function cerrarPrograma(): void
	{
		for each (var i:NativeWindow in NativeApplication.nativeApplication.openedWindows) 
		{
			trace('Cerrando la ventana "' + i.title + '"');
			i.visible = false;
		}
		
		// ejecutada cuando se esta cerrando la aplicacion
		if (GLOBAL.tempDir.exists)
		{
			GLOBAL.tempDir.addEventListener(Event.COMPLETE, onTempDirComplete);
			GLOBAL.tempDir.deleteDirectoryAsync(true);
		}
		else 
		{
			onTempDirComplete(null);
		}
		
		/// Se ejecuta cuando se elimina el directorio principal de la aplicación
		function onTempDirComplete(e:Event):void
		{
			//cierra
			NativeApplication.nativeApplication.exit();
		}
	}
}