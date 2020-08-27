/*
 * Copyright (C) 2020 Juan Pablo Calle
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
	/**
	 * Indica si un objeto tiene una propiedad con el nombre especificado.
	 * 
	 * <p>Esta función utiliza otra funcion bastante primitiva por lo que se pueden usar otras clases mas personalizadas para realizar esto.</p>
	 * 
	 * @param	objeto El objeto a verificar.
	 * @param	propiedad El nombre de la propiedad que se quiere saber si la tiene el objeto.
	 * @return	<code>true</code> en caso de que el objeto posea una propiedad con ese nombre o <code>false</code> en caso contrario.
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
	public function contiene(objeto:*, propiedad:String):Boolean
	{
		return objeto.hasOwnProperty(propiedad);
	}
}