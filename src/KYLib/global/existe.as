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
	 * Verifica si un objeto existe.
	 *
	 * @param objeto El objeto que se quiere ver si existe o no.
	 * 
	 * @param propiedad El nombre de una propiedad que se quiera ver que existe en el objeto pasado, si de por si el objeto pasado no existe se devuelve <code>false</code>.
	 *
	 * @return Devuelve <code>true</code> si el objeto existe y <code>false</code> si no existe, si es nulo, es <code>false</code>, es 0 o es indefinido.
	 */
	public function existe(objeto:*, propiedad:String = null):Boolean
	{
		//se mira si se definio una propiedad
		if (propiedad)
		{
			// se mira si existe el objeto en el que se quiere ver la propiedad
			if (existe(objeto))
			{
				try //se intenta devolver la existencia de la propiedad
				{
					return objeto[propiedad];
				}
				catch (err:Error)
				{
					//si ocurre algun error es porque no existe esa propiedad en el objeto entonces se devuelve false
					return false;
				}
			}
			else //si no existe el objeto se devuelve false
			{
				return false;
			}
		}
		//mira si el objeto no es nulo ni indefinido para devolver true
		if (objeto != null && objeto != undefined && objeto != false && objeto != 0)
		{
			return true;
		}
		return false;
	}
}