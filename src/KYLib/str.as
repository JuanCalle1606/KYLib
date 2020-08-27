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
	
	//--------------------------------------
	//  Descripción de la clase
	//--------------------------------------
	/**
	 * La clase str posee metodos estaticos para trabajos con cadenas de texto y caracteres.
	 *
	 * @langversion 3.0
	 *
	 * @playerversion Flash 12
	 *  @playerversion AIR 32
	 *
	 * @productversion Flash CS6
	 * @productversion Animate CC
	 *
	 * @author Juan Pablo Calle
	 */
	public final class str
	{
		
		/**
		 * Separa subcadenas dentro de una cadena con un caracter especificado, las subcadenas tienen una longitud definida por el parametro caracteres.
		 * <span>En el siguiente ejemplo se separa una cadena en subcadenas de 3 caracteres:</span>
		 * 
		 * <listing>trace(str.subDividir("Hello word!", "#", 3)); //salida: Hel#lo #wor#d!</listing>
		 * 
		 * @param	cadena La cadena en la cual se separaran las subcadenas.
		 * @param	separador El caracter que se usara para separar las cadenas.
		 * @param	caracteres La longitud de cada subcadena.
		 * @return La cadena con las subcadenas ya separadas.
		 */
		public static function subDividir(cadena:String, separador:String = ",", caracteres:uint = 1):String 
		{
			// si el parametro caracteres es menor a 1 entonces se devuelve la misma cadena
			if (caracteres < 1) 
			{
				return cadena.substr(0,cadena.length);
			}
			
			/// La variable devuelta
			var Dev:String = "";
			/// La posicion de lectura actual
			var i:uint = 0;
			
			// se escriben los primeros caracteres
			Dev += cadena.substr(0, caracteres);
			
			for (i = caracteres; i < cadena.length; i += caracteres) 
			{
				Dev += separador;
				Dev += cadena.substr(i, caracteres);
			}
			
			return Dev;
		}
		
		/**
		 * Invierte el orden de los caracteres de una cadena.
		 * 
		 * @param	cadena La cadena que se quiere invertir.
		 * @return La cadena invertida.
		 */
		public static function invertir(cadena:String):String 
		{
			/// La variable devuelta
			var Dev:String = "";
			for (var i:int = cadena.length; Dev.length < cadena.length; i--) 
			{
				Dev += cadena.charAt(i);
			}
			return Dev;
		}
	}
}