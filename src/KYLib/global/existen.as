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
		 * Verifica si un conjunto de objetos existen.
		 *
		 * @param objetos Un conjunto de objetos que se quieren ver si existen.
		 *
		 * @return Devuelve <code>true</code> si los objetos existen y <code>false</code> si al menos uno de ellos no existe, es nulo o indefinido.
		 * 
		 * @author Juan Pablo Calle
		 */
		public function existen(...objetos): Boolean
		{
			//se mira que si hayan parametros
			if (objetos.length <= 0)
			{
				//se retorna false ya que el conjunto es vacio
				return false;
			}
			//se crea un bucle que pasa por cada uno de los parametros
			for each(var objeto: * in objetos)
			{
				//si el objeto actual no existe entonces se retorna false
				if (!existe(objeto))
				{
					return false;
				}
			}
			//si todos existen se retorna true
			return true;
		}
}