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
 
package KYLib.bytelevel 
{
	import KYLib.global.existe;	
	import KYLib.str;
	import flash.errors.EOFError;
	import flash.utils.ByteArray;
	import flash.utils.IDataInput;
	
	
	//--------------------------------------
	//  Descripcion de la clase
	//--------------------------------------
	/**
	 * La clase ConjuntoBytes extiende de la clase ByteArray y tiene su misma funcionalidad.
	 * <span>La diferencia entre esta clase y la clase ByteArray es que en esta existen mas metodos que sirven para el manejo y tambien para escritura y lectura de datos.</span>
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
	public class ConjuntoBytes extends ByteArray
	{
		/// Conjunto de bytes usado para operaciones internas
		private const $bytes:ByteArray = new ByteArray();
		
		/**
		 * Crea una nueva instancia de ConjuntoBytes que representa un conjunto de bytes empaquetado, se puede usar los metodos y propiedades de esta clase para administrar su almacenamiento de datos.
		 * 
		 * @param byteArray Un conjunto de bytes para copiarlo en el nuevo.
		 */
		public function ConjuntoBytes(datos:ByteArray = null)
		{
			super();
			if (existe(datos)) 
			{
				deDataInput(datos);
			}
		}
		
		/**
		 * Copia el contenido de un byte array a este objeto.
		 * 
		 * @param origen El byte array que contiene la información que se le pondra al objeto ConjuntoBytes.
		 */
		public function deDataInput(origen:ByteArray):void
		{
			//se limpia el contenido actual
			clear();
			for (var i:int = 0; i < origen.length; i++)
			{
				this[i] = origen[i];
			}
		}
		
		/**
		 * lee un byte del flujo de bytes y devuelve un conjunto con los 8 bits almacenados en el byte. 
		 * 
		 * @return Un conjunto con los 8-bits leidos
		 * 
		 * @throws	EOFError No hay suficientes datos disponibles para leer.
		 */
		public function read8Bits():Array
		{
			if (bytesAvailable < 1) 
			{
				throw new EOFError("No hay suficientes datos disponibles para leer");
			}
			///La cadena con los el byte
			var cadena:String = binChar(readUnsignedByte());
			// se separan los caracteres
			cadena = str.subDividir(cadena, ",", 1);
			
			return cadena.split(",", 8);
		}
		/**
		 * Lee un numero y retorna su representacion binaria.
		 */
		private function binChar(byte:uint):String 
		{
			var Dev:String = byte.toString(2);
			while (Dev.length < 8) 
			{
				Dev = String("0" + Dev);
			}
			return Dev;
		}
		
		/// El valor maximo alcanzable por un numero medium con signo
		private static const MAX_MEDIUM:uint = 8388607;
		
		/// El valor minimo alcanzable por un numero medium con signo
		private static const MIN_MEDIUM:int = -8388608;
		
		/**
		 * Lee un entero con signo de 24 bits del flujo de bytes.
		 * 
		 * @return	Un entero con signo de 24 bits en el rango de -8388608 hasta 8388607.
		 * 
		 * @throws	EOFError No hay suficientes datos disponibles para leer.
		 */
		public function readMedium():int 
		{
			if (bytesAvailable < 3) 
			{
				throw new EOFError("No hay suficientes datos disponibles para leer");
			}
			/// La variable devuelta
			var Dev:int = 0;
			
			/// EL numero actual
			var Act:int = readUnsignedMedium();
			
			//si el valor esta dentro del rango entonces lo devuelve
			if (Act >= 0 && Act <= ConjuntoBytes.MAX_MEDIUM) 
			{
				return Act;
			}
			else 
			{
				Dev = ConjuntoBytes.MIN_MEDIUM;
				Dev += Act-ConjuntoBytes.MAX_MEDIUM-1;
			}
			
			return Dev;
		}
		
		/**
		 * Lee un entero sin signo de 24 bits del flujo de bytes.
		 * 
		 * @return	Un entero sin signo de 24 bits en el rango de 0 hasta 16777215.
		 * 
		 * @throws	EOFError No hay suficientes datos disponibles para leer.
		 */
		public function readUnsignedMedium():uint 
		{
			if (bytesAvailable < 3) 
			{
				throw new EOFError("No hay suficientes datos disponibles para leer");
			}
			// se leen los tres bytes
			readBytes($bytes, 0, 3);
			
			/// variable devuelta
			var dev:uint = parseInt(hex.hexChar($bytes[0]) +
							hex.hexChar($bytes[1]) +
							hex.hexChar($bytes[2]), 16);
							
			//se libera la memoria
			$bytes.clear();
			
			return dev;
		}
		
		/**
		 * Escribe un entero de 24 bits en el flujo de bytes. Los ultimos 24 bits del parametro son usados y se ignoran los primeros 8 bits.
		 * 
		 * @param	value Un entero que quiere ser escrito.
		 */
		public function writeMedium(value:int):void 
		{
			// se escribe el valor en el conjunto de bytes interno
			$bytes.writeInt(value);
			
			// se escriben los 3 bytes
			writeBytes($bytes, 1, 3);
			
			//se libera la memoria
			$bytes.clear();
		}
		
		
	}
}