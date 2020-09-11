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
	import KYLib.math.TipoNumero;
	
	[ExcludeClass]
	//--------------------------------------
	//  Descripcion de la clase
	//--------------------------------------
	/**
	 * La clase Util se usa para utilidades en las funciones a nivel de bytes. Esta clase es interna por lo que no puede ser usada fuera de este paquete.
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
	internal final class ByteLevelUtil 
	{
		
		/**
		 * @private
		 */
		public function ByteLevelUtil() 
		{
			//ErrorClaseAbstracta.agregar(this);
			super();
		}
		
		/**
		 * Escribe un numero, de un tipo especificado dentro de un cojunto de bytes.
		 * 
		 * @param	value El numero que se escribira.
		 * @param	tipo El tipo de numero a ser escrito.
		 * @param	bytes El conjunto de bytes donde sera escrito el numero.
		 */
		public static function escribirNumero(value:Number, tipo:String, bytes:ConjuntoBytes):void 
		{
			
			switch (tipo) 
			{
				case TipoNumero.Byte:
				case TipoNumero.UnsignedByte:
				{
					bytes.writeByte(value);
					break;
				}
				case TipoNumero.Short:
				case TipoNumero.UnsignedShort:
				{
					bytes.writeShort(value);
					break;
				}
				case TipoNumero.Medium:
				case TipoNumero.UnsignedMedium:
				{
					bytes.writeMedium(value);
					break;
				}
				case TipoNumero.Int:
				{
					bytes.writeInt(value);
					break;
				}
				case TipoNumero.UnsignedInt:
				{
					bytes.writeUnsignedInt(value);
					break;
				}
				case TipoNumero.Float:
				{
					bytes.writeFloat(value);
					break;
				}
				case TipoNumero.Double:
				{
					bytes.writeDouble(value);
					break;
				}
				default:
				{
					//KYlibError.lanzar(new ArgumentError("El tipo de numero \"" + tipo + "\" no es valido.", 1327));
					throw new ArgumentError("El tipo de numero \"" + tipo + "\" no es valido.", 1327);
				}
			}
		}
		
	}
}