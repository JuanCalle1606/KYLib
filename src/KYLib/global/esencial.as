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

package KYLib.global
{
	import KYLib.global.*;
	import KYLib.utils.*;
	import KYLib.*;
	import flash.desktop.NativeApplication;
	import flash.filesystem.File;
	
	import flash.display.*;
	import flash.events.*;
	import flash.media.*;
	import flash.system.*;
	
	//--------------------------------------
	//  Descripcion de la clase
	//--------------------------------------
	/**
	 * La clase esencial contiene metodos con cosas basicas y que pueden usarse en cualquier momento como por ejemplo el metodo <code>copiarTextoAlPortapapeles()</code> que pone un texto simple en el portapapeles del dispositivo. Esta clase ademas tiene muchas funciones que cargan la libreria, se recomienda siempre inicializar la libreria con el metodo <code>inicializar()</code>
	 *
	 * @langversion 3.0
	 *
	 * @playerversion Flash 12
	 *  @playerversion AIR 32
	 *
	 * @productversion Flash CS6
	 *  @productversion Animate CC
	 * 
	 * @author Juan Pablo Calle
	 */
	public final class esencial
	{

		/**
		 * @private
		 */
		public function esencial():void 
		{
			//ErrorClaseAbstracta.agregar(this);
			super();
		}
		
		/**
		 * Pone un texto simple en el portapapeles del dispositivo.
		 *
		 * @param Texto El texto que se le quiere poner al portapapeles.
		 */
		public static function copiarTextoAlPortapapeles(Texto: String): void
		{
			//establece el texto
			System.setClipboard(Texto);
		}
		
		/// Indica si ya se ha inicializado la app
		private static var $inicializado:Boolean = false;
		
		/**
		 * Inicia una aplicación haciendo configuraciones basicas.
		 *
		 * <p>Al inicializar la aplicación hace lo siguiente:</p>
		 * <ul>
		 * <li>registra las clases basicas de ActionScript 3.0 y las de de esta libreria en la clase <code>clases</code></li>
		 * <li>Inicializa el objeto <code>GLOBAL</code></li>
		 * </ul>
		 */
		public static function inicializar(): void
		{
			if ($inicializado) 
			{
				return;
			}
			//se crea el objeto de aplicación
			/*Aplicacion.crearInstancia();*/
			
			//se inicializa el admin de ventanas
			/*AdminVentanas.init();*/
			
			/****************************************************/
			//creación e iniciación del objeto GLOBAL
			try
			{
				GLOBAL.init();
			}
			catch (e: Error)
			{
				GLOBALinit();
			}
			/****************************************************/
			
			//se registran las clases con sus alias
			registrarClases();
			var initAt:Date = fecha();
			//se manda un log de que se inicio el programa
			trace("Programa inicializado correctamente a las " + initAt.hours + ":" + initAt.minutes + ":" + initAt.seconds + ":" + initAt.milliseconds);
			
			$inicializado = true;
		}
		
		/**
		 * Este es la ubicacion para un directorio temporal del programa, solo esta disponible en AIR.
		 * 
		 * @playerversion AIR 32
		 */
		//public static var tempDir:Parche;
		
		/**
		 * Crea las variables runtime del objeto GLOBAL.
		 */
		private static function GLOBALinit():void 
		{
			GLOBAL.runtime = { };
			GLOBAL.runtime.KYLib = { };
			/*GLOBAL.runtime.KYLib.TePo = { };
			GLOBAL.runtime.KYLib.TePo.ByteLevel = { };
			GLOBAL.runtime.KYLib.TePo.ByteLevel.ConjuntoBytes = { };
			GLOBAL.runtime.KYLib.TePo.ByteLevel.ConjuntoBytes.TMP = { };
			GLOBAL.runtime.KYLib.TePo.ByteLevel.ConjuntoBytes.TMP.CB = new ConjuntoBytes();
			GLOBAL.runtime.KYLib.TePo.Exterior = { };
			GLOBAL.runtime.KYLib.TePo.Exterior.CMD = { };
			GLOBAL.runtime.KYLib.TePo.Carga = { };
			GLOBAL.runtime.KYLib.TePo.Carga.Internet = { };
			GLOBAL.runtime.KYLib.TePo.Carga.Internet.FTP = { };
			GLOBAL.runtime.KYLib.TePo.Carga.Internet.FTPUtil = { };
			GLOBAL.runtime.KYLib.TePo.Carga.Internet.FTPUtil.SesionFTP = {  };
			GLOBAL.runtime.KYLib.TePo.Carga.Internet.FTPUtil.SesionFTP.plantilla = "Plantilla de vector: <['comando parametros]>";
			*/
			//reemplazar por Aplicacion.ID cuando sea implementada
			GLOBAL.tempDir = File.cacheDirectory.resolvePath(String(NativeApplication.nativeApplication.applicationID/*Aplicacion.ID*/ + " -- KYLib.TempDir"));
			
			//GLOBAL.runtime.KYLib.TePo.Exterior.CMD.tempDir = GLOBAL.tempDir.resolvePath("KYLib/TePo/Exterior/CMD.as/Temp");
			
			//tempDir = new Parche(GLOBAL.tempDir.nativePath);
			
		}
		
		/**
		 * Estableze los valores de clase con su respectivo alias.
		 */
		private static function registrarClases(): void
		{
			//
			//mis clases
			//
			
			clases.registrarAliasClase("esencial", esencial);
			
			//C.Esencial
			clases.registrarAliasClase("clases", clases);
			clases.registrarAliasClase("objVisible", objVisible);
			clases.registrarAliasClase("str", str);
			/*
			//C.Mat
			clases.registrarAliasClase("num", num);
			clases.registrarAliasClase("getRandom", random);
			
			//Errores
			clases.registrarAliasClase("KYlibError", KYlibError);
			
			//Errores.ErroresClases
			clases.registrarAliasClase("ErrorClaseAbstracta", ErrorClaseAbstracta);
			clases.registrarAliasClase("ErrorClaseAIR", ErrorClaseAIR);
			
			//Eventos.EventosCargas
			clases.registrarAliasClase("EventoCarga", EventoCarga);
			
			//Eventos.TePo.EventosExteriores
			clases.registrarAliasClase("EventoCMD", EventoCMD);
			
			//Interfaces
			iEventoError;
			
			//Interfaces.Extendidas
			iEscrituraDatos;
			iLecturaDatos;
			
			//NameSpaces
			nsComponente;
			
			//TePo.Archivos
			clases.registrarAliasClase("Archivo", Archivo);
			clases.registrarAliasClase("Parche", Parche);
			
			//TePo.ByteLevel
			clases.registrarAliasClase("ConjuntoBytes", ConjuntoBytes);
			clases.registrarAliasClase("hex", hex);
			
			//TePo.ByteLevel.Codificacion
			clases.registrarAliasClase("TW2code", TW2code);
			clases.registrarAliasClase("TW3code", TW3code);
			
			//TePo.ByteLevel.Constantes
			clases.registrarAliasClase("TipoNumero", TipoNumero);
			
			//TePo.Carga
			clases.registrarAliasClase("cargadorSWF", cargadorSWF);
			
			//TePo.Carga.Internet
			//clases.registrarAliasClase("FTP", FTP);
			
			//TePo.Carga.Internet.FTPUtil
			clases.registrarAliasClase("ServidorFTP", ServidorFTP);
			clases.registrarAliasClase("SesionFTP", SesionFTP);
			
			//TePo.Exterior
			clases.registrarAliasClase("Aplicacion", Aplicacion);
			//clases.registrarAliasClase("CMD", CMD);*/
			
			//clases nativas
			clases.registrarAliasClase("MovieClip", MovieClip);
			clases.registrarAliasClase("Number", Number);
			clases.registrarAliasClase("String", String);
			clases.registrarAliasClase("int", int);
			clases.registrarAliasClase("uint", uint);
			clases.registrarAliasClase("Capabilities", Capabilities);
			clases.registrarAliasClase("DisplayObjectContainer", DisplayObjectContainer);
			clases.registrarAliasClase("DisplayObject", DisplayObject);
			clases.registrarAliasClase("Boolean", Boolean);
			clases.registrarAliasClase("Event", Event);
			clases.registrarAliasClase("EventDispatcher", EventDispatcher);
			clases.registrarAliasClase("MouseEvent", MouseEvent);
			clases.registrarAliasClase("KeyboardEvent", KeyboardEvent);
			clases.registrarAliasClase("Stage", Stage);
			clases.registrarAliasClase("Sound", Sound);
			clases.registrarAliasClase("Function", Function);
			clases.registrarAliasClase("Object", Object);
			clases.registrarAliasClase("Array", Array);
			clases.registrarAliasClase("Bitmap", Bitmap);
			clases.registrarAliasClase("Error", Error);
			clases.registrarAliasClase("Graphics", Graphics);
			clases.registrarAliasClase("Sprite", Sprite);
			clases.registrarAliasClase("XML", XML);
			clases.registrarAliasClase("Video", Video);
			clases.registrarAliasClase("Shape", Shape);
		}
	}
}