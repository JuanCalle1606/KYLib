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
	import KYLib.str;
	import KYLib.math.TipoNumero;
	
	//--------------------------------------
	//  Descripcion de la clase
	//--------------------------------------
	/**
	 * La clase hex posee metodos estaticos para realizar conversiones con valores hexadecimales, como conversiones entre numeros a hexadecimales y viceversa y tambien con cadenas de texto y conjunto de bytes.
	 * <span>Con los numeros ofrece metodos estaticos para trabajos con hexadecimales desde un byte como <code>0x12</code> hasta hexadecimales de 8 bytes como <code>0x1216102300903705</code>.</span>
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
	public final class hex 
	{
		
		/**
		 * @private
		 */
		public function hex() 
		{
			//ErrorClaseAbstracta.agregar(this);
			super();
		}	
		
		//{region Utilidades
		
		/// Esta variable guarda un conjunto de bytes usada en toda la clase.
		private static const $bytes:ConjuntoBytes = new ConjuntoBytes();
		
		/**
		 * Devuelve el equivalente hexadecimal de un numero.
		 * 
		 * @param	value Un numero que se quiere pasar a hexadecimal.
		 * @return Un caracter que equivale en hexadecimal al valor pasado.
		 */
		internal static function hexChar(value:Number):String
		{
			if (value == Infinity) 
			{
				return "00";
			}
			return (value.toString(16).length % 2) != 0 ? String("0" + value.toString(16)) : value.toString(16);
		}
		
		/**
		 * lee el tipo de numero especificado del byte array.
		 * 
		 * @param	byteArray El byte array del que se va a leer el numero.
		 * @param	cadena La cadena en formato hexadecimal a con los datos del byte array.
		 * @param	tipo El tipo de numero a ser leido.
		 * @return El numero obtenido.
		 */
		private static function leerNumero(bytes:ConjuntoBytes,cadena:String,tipo:String):Number 
		{
			/// La variable devuelta
			var Dev:Number = Number(cadena);
			
			bytes.position = 0;
			switch (tipo) 
			{
				case "byte":
				{
					if (bytes.length == 1) 
					{
						Dev = bytes.readByte();
					}
					break;
				}
				case "short":
				{
					if (bytes.length == 2) 
					{
						Dev = bytes.readByte();
					}
					break;
				}
				case "medium":
				{
					if (bytes.length == 3) 
					{
						Dev = bytes.readMedium();
					}
					break;
				}
				case "int":
				{
					if (bytes.length == 4) 
					{
						Dev = bytes.readInt();
					}
					break;
				}
				case "float":
				{
					if (bytes.length == 4) 
					{
						Dev = bytes.readFloat();
					}
					break;
				}
				case "double":
				{
					if (bytes.length == 8) 
					{
						Dev = bytes.readDouble();
					}
					break;
				}
			}
			return Dev;
		}
		//}endregion
		//{region Numeros
		
		/**
		 * Convierte un numero en su representación hexadecimal.
		 * <span>El tipo de numero debe ser pasado en el segundo parametro, si no sabe que tipo de numero poner utilize la propiedad TipoNumero.Auto para que se identifique automaticamente. La funcion de reconocimiento de numero devuelve los numeros de coma flotante de 1 o 2 decimales como tipo <code>TipoNumero.Float</code>, si tiene mas de 2 decimales es tomado como TipoNumero.Double, pero si usted quiere usar un tipo de numero especifico puede pasarlo como segundo parametro.</span>
		 * 
		 * <p>Para numeros enteros positivos se recomienda usar el tipo <code>TipoNumero.IntPositivo</code>, ya que este tipo devuelve la representacion hexadecimal de numeros enteros sin importar su tamaño, hasta un maximo de 1e+308.</p>
		 * 
		 * @param	value El numero que se quiere convertir a hexadecimal.
		 * @param	tipo El tipo de numero que se quiere convertir, los valores aceptados estan definidos en las propiedades estaicas de la clase TipoNumero.
		 * @return Devuelve la representación hexadecimal del numero.
		 * 
		 * @see KYLib.TePo.ByteLevel.Constantes.TipoNumero TipoNumero
		 */
		public static function deNumero(value:Number, tipo:String = "auto"):String 
		{
			/// El tipo de numero que se usara para escribir
			var tipoNumero:String = tipo == TipoNumero.Auto ? TipoNumero.detectarTipoNumero(value) : tipo;
			//se limpia el cb para liberar espacio
			$bytes.clear();
			
			//se mira el tipo de numero
			switch (tipoNumero) 
			{
				case TipoNumero.IntPositivo:
				case TipoNumero.IntNegativo:
				{
					return hexChar(Math.abs(value));
					break;
				}
			}
			
			//se escribe el numero dentro del arreglo
			ByteLevelUtil.escribirNumero(value, tipoNumero, $bytes);
			
			return deBytes($bytes);
		}
		
		
		
		//}endregion
		//{region Cadenas
		
		/**
		 * Convierte un texto en su representación hexadecimal.
		 * 
		 * <p>Por ejemplo; si la cadena pasada es "Hello word!" el resultado sera 0x48656c6c6f20776f726421 debido a que esta es la representación hexadecimal de la cadena.</p>
		 * 
		 * @param	value Una cadena para convertirla en formato hexadecimal.
		 * @return Una cadena con formato hexadecimal que representa a la cadena pasada.
		 */
		public static function  deCadena(value:String):String 
		{
			$bytes.clear();
			$bytes.writeUTFBytes(value);
			/// La variable que sera devuelta
			var Dev:String = deBytes($bytes);
			
			return Dev;
		}
		
		/**
		 * Convierte un texto en formato hexadecimal a una cadena de texto.
		 * 
		 * @param	value Una cadena en formato hexadecimal para convertir a texto.
		 * @return La cadena resultante.
		 */
		public static function  aCadena(value:String):String 
		{
			$bytes.deDataInput(aBytes(value));
			/// La variable que sera devuelta
			var Dev:String = $bytes.readUTFBytes($bytes.length);
			$bytes.clear();
			
			return Dev;
		}
		
		//}endregion
		//{region Conjuntos de bytes
		
		/**
		 * Convierte un conjunto de bytes en una cadena de texto en formato hexadecimal que contiene cada byte del flujo de bytes.
		 * 
		 * @param	value El conjunto de bytes que se quieren pasar a la cadena.
		 * @return La cadena con el valor hexadecimal del byte array.
		 */
		public static function deBytes(value:ConjuntoBytes):String 
		{
			/// La variable que sera devuelta
			var Dev:String = "";
			
			//se lee cada byte del byte array y se convierte en cadena
			for (var i:int = 0; i < value.length; i++) 
			{
				Dev += hexChar(value[i]);
			}
			
			// se devuelve la cadena
			return Dev;
		}
		
		/**
		 * Convierte una cadena con formato hexadecimal a un conjunto de bytes.
		 * <span>Todos los caracteres que no sean numeros o las letras minusculas de la a-f seran quitadas de la cadena. Si el numero de caracteres de la cadena es impar entonces se agregara un cacarter "0" al final de la cadena para convertirla en el conjunto de bytes.</span>
		 * 
		 * @param	value La cadena de texto con formato hexadecimal que se quiere convertir.
		 * @return El conjunto de bytes que contiene escritos los bytes de la cadena.
		 */
		public static function aBytes(value:String):ConjuntoBytes
		{
			/// La variable que sera devuelta
			var Dev:ConjuntoBytes = new ConjuntoBytes();
			/// La cadena que esta siendo leida
			var cadena:String = str.subDividir(value.replace("0x", "").replace(/[^a-f\d]/g, ""), "-", 2);
			
			
			/// Al conjunto que guarda cada byte
			var arr:Array = cadena.split("-");
			
			for (var i:int = 0; i < arr.length; i++)
			{
				Dev[i] = parseInt(arr[i], 16);
			}
			
			return Dev;
		}
		
		//}endregion
		
	}
}