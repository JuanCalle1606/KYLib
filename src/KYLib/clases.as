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
 
package KYLib
{
	import flash.net.*;
	import flash.utils.*;
	//import KYLib.Errores.KYlibError;

	/**
	 * La clase clases ofrece metodos estaticos para trabajar con las clases, guardarlas con una alias u obtener una clase pasando su nombre en una cadena de texto.
	 *
	 * <p>Para trabajar con clases con un alias primero tienen que estar registradas, para ello llame al metodo <code>registrarAliasClase()</code> y registre todas las clases que vaya a usar con un alias, el siguiente ejemplo registra la clases Sprite con un alias y luego lo usa para generar una instancia de la clase Sprite:</p>
	 *
	<pre>
	package MyPaquete
	{
		import flash.display.Sprite;
		import C.Esencial.clases;
        
		public class clasesEjemplo
		{
			//variable que guarda el alias que se le pondra al Sprite
			internal var AliasSprite: String = "Mi_Alias_Perzonalizado";
            
			public function clasesEjemplo()
			{
				//se registra la clase Sprite
				clases.registrarAliasClase(AliasSprite, Sprite);
                
				//se llama a la función que generara el objeto Sprite
				crearInstancia();
			}
            
			//función que genera la instancia
			internal function crearInstancia();
			{
				//se obtiene y se guarda la clase
				var clase: Class = clases.obtenerClaseConAlias(AliasSprite);
                
				//se crea el objeto Sprite
				var MySprite: clase = new clase();
			}
		}
	}
	</pre>
	 *
	 * <span>Podria decirse que es mas facil hacer la siguiente sentencia:</span>
	 *
	 * <listing>var MySprite:Sprite = new Sprite();</listing>

	 * <span>Pero la ventaja de usar los alias en las clases es que se puede acceder a ellos mediante cadenas de texto y es por eso que en tiempo de ejecución se podria por ejemplo generar un objeto de una clase cuyo alias esta escrito en un campo de texto en el escenario.</span>
	 *
	 * @langversion 3.0
	 *
	 * @playerversion Flash 12
	 *  @playerversion AIR 32
	 *
	 * @productversion Flash CS6
	 *  @productversion Animate CC
	 */
	public final class clases
	{
		/**
		 * Registra una clase con un alias para identificarla.
		 *
		 * @param Alias El alias que se le quiere poner a la clase.
		 * @param Clase La clase a la que se le colocara el alias.
		 */
		public static function registrarAliasClase(Alias: String, Clase: Class): void
		{
			registerClassAlias(Alias, Clase);
		}
		
		/**
		 * Develve una clase solicitada por un alias.
		 *
		 * @param Alias El alias de la clase que se solicita.
		 *
		 * @return La clase que le corresponde al alias pasado. Si no es encontrada se lanzara una excepción.
		 */
		public static function obtenerClaseConAlias(Alias: String): Class
		{
			/// Almacena la clase a devolver
			var Dev:Class;
			try 
			{
				Dev = getDefinitionByName(Alias) as Class;
			}
			catch (err:ReferenceError)
			{
				/*Necesita la clase*/
				//KYlibError.lanzar(err);
			}
			return Dev;
		}
		
		/**
		 * Devuelve el nombre de la clase de un objeto.
		 *
		 * @param Objeto El objeto del cual se quiere obtener la clase.
		 *
		 * @return El nombre de la clase del objeto.
		 */
		public static function nombreClaseObjeto(Objeto: * ): String
		{
			return getQualifiedClassName(Objeto);
		}
		
		/**
		 * Devuelve la clase respectiva de un objeto.
		 * 
		 * @param	Objeto El objeto del cual se quiere obtener la clase.
		 * @return La clase del objeto dado.
		 */
		public static function claseObjeto(Objeto:*):Class 
		{
			return deCadena(nombreClaseObjeto(Objeto));
		}
		
		/**
		 * Convierte una cadena en una clase con ese nombre.
		 *
		 * <span>El nombre debe estar en formato paquete-clase, de la siguiente forma:</span>
		 *
		 * <listing>var MovieClipClase:Class = clases.cadenaAClase("flash.display.MovieClip");</listing>
		 * 
		 * O tambien de esta forma:
		 * 
		 * <listing>var MovieClipClase:Class = clases.cadenaAClase("flash.display::MovieClip");</listing>
		 *
		 * @param NombreClase El nombre de la clase en formato paquete-clase que se quiere convertir en clase.
		 *
		 * @return La clase que se obtuvo, devuelve null si no se encuentra una clase cuyo nombre sea el de la cadena pasada.
		 */
		public static function deCadena(NombreClase: String): Class
		{
			/// Almacena la clase a devolver
			var Dev:Class;
			try 
			{
				Dev = getDefinitionByName(NombreClase) as Class;
			}
			catch (err:ReferenceError)
			{
				Dev = null;
			}
			return Dev;
		}

	}
}