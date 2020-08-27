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
	//  Descripcion de la clase
	//--------------------------------------
	/**
	 * La clase arr es una clase de utilidades para trabajar con arreglos.
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
	public final class arr 
	{
		/**
		 * Cuenta la cantidad de elementos en un arreglo, pero ademas tiene la funcionalidad de contar solo los elementos de una clase.
		 * 
		 * @param	arreglo El arreglo que se quiere contar.
		 * @param	clase opcionalmente se puede especificar una clase y solo seran contados los elementos de esa clase.
		 * @return	Devuelve el numero de elementos contados.
		 */
		public static function contar(arreglo:Array, clase:Class = null):uint
		{
			var $dev:uint = 0;
			
			if (clase != null) 
			{
				for each (var item:* in arreglo) 
				{
					if (item is clase)
					{
						$dev++;
					}
				}
				
				return $dev;
			}
			
			return arreglo.length;
		}
	}
}