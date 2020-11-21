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
 
package KYLib.math 
{
	//--------------------------------------
	//  Descripcion de la clase
	//--------------------------------------
	/**
	 * La clase TipoNumero es usada para obtener los valores usados por algunas funciones para identificar el tipo de numero con el que se va a trabajar.
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
	public final class TipoNumero 
	{
		/**
		 * Tipo automatico: cuando se pasa este valor a un metodo el intentara identificar el tipo de número.
		 */
		public static function get Auto():String { return "auto"; }
		
		/**
		 * Indica que el número es un entero con signo de 8 bits.
		 * <span>El rango de este número es de -128 hasta 127.</span>
		 */
		public static function get Byte():String { return "byte"; }
		
		/**
		 * Indica que el número es un entero sin signo de 8 bits.
		 * <span>El rango de este número es de 0 hasta 255.</span>
		 */
		public static function get UnsignedByte():String { return "ubyte"; }
		
		/**
		 * Indica que el número es un entero con signo de 16 bits.
		 * <span>El rango de este número es de -32768 hasta 32767.</span>
		 */
		public static function get Short():String { return "short"; }
		
		/**
		 * Indica que el número es un entero sin signo de 16 bits.
		 * <span>El rango de este número es de 0 hasta 65535.</span>
		 */
		public static function get UnsignedShort():String { return "ushort"; }
		
		/**
		 * Indica que el número es un entero con signo de 24 bits.
		 * <span>El rango de este número es de -8388608 hasta 8388607.</span>
		 */
		public static function get Medium():String { return "medium"; }
		
		/**
		 * Indica que el número es un entero sin signo de 24 bits.
		 * <span>El rango de este número es de 0 hasta 16777215.</span>
		 */
		public static function get UnsignedMedium():String { return "umedium"; }
		
		/**
		 * Indica que el número es un entero con signo de 32 bits.
		 * <span>El rango de este número es de -2147483648 hasta 2147483647.</span>
		 */
		public static function get Int():String { return "int"; }
		
		/**
		 * Indica que el número es un entero sin signo de 32 bits.
		 * <span>El rango de este número es de 0 hasta 4294967295.</span>
		 */
		public static function get UnsignedInt():String { return "uint"; }
		
		/**
		 * Indica que el número es un entero positivo de una longitud dinamica de bits(depende de cada numero).
		 * <span>El rango de este número es de 0 hasta 1e+308.</span>
		 */
		public static function get IntPositivo():String { return "+int"; }
		
		/**
		 * Indica que el número es un entero negativo de una longitud dinamica de bits(depende de cada numero).
		 * <span>El rango de este número es de -1e+308 hasta 0.</span>
		 */
		public static function get IntNegativo():String { return "-int"; }
		
		/**
		 * Indica que es número de coma flotante de precisión simple de 32 bits.
		 * <span>El rango de este número es de -3.402823466E+38 hasta -1.175494351E-38, 0 y de 1.175494351E-38 hasta 3.402823466E+38.</span>
		 */
		public static function get Float():String { return "float"; }
		
		/**
		 * Indica que es número de coma flotante de doble precisión de 64 bits.
		 * <span>El rango de este número es de -1.7976931348623157E+308 hasta -2.2250738585072014E-308, 0 y de 2.2250738585072014E-308 hasta 1.7976931348623157E+308.</span>
		 */
		public static function get Double():String { return "double"; }
		
		/**
		 * Detecta el tipo de numero pasado.
		 * 
		 * @param	numero El numero del cual se quiere saber el tipo.
		 * @return El tipo de numero.
		 */
		public static function detectarTipoNumero(value:Number):String 
		{
			var cadena:String = String(value);
			//se mira si es un numero de coma flotante o si esta reducido, para esto se mira si la representación textual del numero tiene el caracter ".", tambien se mira si el numero esta por debajo del valor minimo que puede tener un int.
			if (cadena.indexOf(".") != -1 && cadena.lastIndexOf("e") == -1) 
			{
				// Se mira si tiene mas de dos decimales o de si esta reducido
				if (cadena.indexOf(".") < cadena.length - 3) 
				{
					// en caso de que se tengan mas de dos decimales es un numero double
					return TipoNumero.Double;
				}
				// se mira si el numero esta en el rango de un numero flotante aceptable.
				if ((value > -1e+12 && value < -1e-2) || (value > 1e-2 && value < 1e+12)) 
				{
					// se es un numero flotante aceptable se devuelve ese tipo
					return TipoNumero.Float;
				}
				// en caso de no ser un flotante entonces sera un double
				return TipoNumero.Double;
			}
			//se mira si el numero esta en el rango soportado por un byte
			if (value <= 255 && value >= -128) 
			{
				// se mira si el nnumero esta en el rango de un byte sin signo
				if (value >= 128 && value <= 255) 
				{
					// se devuelve el tipo byte sin signo
					return TipoNumero.UnsignedByte;
				}
				// en caso de no ser un byte sin signo entonces es un byte con signo
				return TipoNumero.Byte;
			}
			//se mira si el numero esta en el rango soportado por un short
			if (value <= 65535 && value >= -32768) 
			{
				// se mira si el nnumero esta en el rango de un short sin signo
				if (value >= 32768 && value <= 65535) 
				{
					// se devuelve el tipo short sin signo
					return TipoNumero.UnsignedShort;
				}
				// en caso de no ser un short sin signo entonces es un short con signo
				return TipoNumero.Short;
			}
			//se mira si el numero esta en el rango soportado por un medium
			if (value <= 16777215 && value >= -8388608) 
			{
				// se mira si el nnumero esta en el rango de un medium sin signo
				if (value >= 8388608 && value <= 16777215) 
				{
					// se devuelve el tipo medium sin signo
					return TipoNumero.UnsignedMedium;
				}
				// en caso de no ser un medium sin signo entonces es un medium con signo
				return TipoNumero.Medium;
			}
			//se mira si el numero esta en el rango soportado por un int con signo
			if (value <= 4294967295 && value >= -2147483648) 
			{
				// se mira si el nnumero esta en el rango de un int sin signo
				if (value >= 2147483648 && value <= 4294967295) 
				{
					// se devuelve el tipo int sin signo
					return TipoNumero.UnsignedInt;
				}
				// en caso de no ser un int sin signo entonces es un int con signo
				return TipoNumero.Int;
			}
			// en este punto ya sabemos que el numero es un entero
			
			// se mira que el valor no sea negativo
			if (value < 0) 
			{
				// si el valor es negativo entonces se devuelve el tipo entero negativo
				return TipoNumero.IntNegativo;
			}
			// si el valor es un positivo entonces se el tipo entero positivo
			return TipoNumero.IntPositivo;
		}
		
	}
}