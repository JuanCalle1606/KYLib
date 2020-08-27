﻿/*
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

package KYLib.utils
{
	import flash.system.System;

	/**
	 *  Pausa la aplicacion.
	 *
	 * <span>Detiene todo lo que esta contenido en el stage(objetos de visualización) deteniendo eventos como los 'flash.events.MouseEvent' y algunos parecidos, esto quiere decir que tambien todos los objetos con linea de tiempo son congelados, sin embargo el codigo que no dependa del stage y que ya se este ejecutando se seguira ejecutando.Para despausar la aplicación es necesarion llamar al metodo <code>continuarAplicacion()</code>.</span>
	 *
	 * @see KYLib.utils#continuarAplicacion()
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
	public function pausarAplicacion(): void
	{
		System.pause();
	}
}