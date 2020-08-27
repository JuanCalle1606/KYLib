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

package KYLib.utils
{
	import flash.display.*;

	/**
	 * La clase objVisible define metodos estaticos que se pueden aplicar con objetos de visualización, que hereden de la clase DisplayObjectContainer.
	 *
	 * @langversion 3.0
	 *
	 * @playerversion Flash 12
	 *  @playerversion AIR 32
	 *
	 * @productversion Flash CS6
	 *  @productversion Animate CC
	 * 
	 * @author Juan Pablo Calle
	 */
	public final class objVisible
	{
		/**
		 * Elimina todo lo que haya dentro de un objeto de visualización dejandolo completamente vacio.
		 * 
		 * @param objetoAVaciar El objeto de visualización que quiere ser vaciado.
		 */
		public static function vaciar(objetoAVaciar: DisplayObjectContainer): void
		{
			while(objetoAVaciar.numChildren > 0)
			{
				objetoAVaciar.removeChildAt(0);
			}
		}
		
		/**
 		 * Elimina un grupo de objetos que se especifiquen de un DisplayObject.
 		 *
 		 * <p>Las especificaciones pueden ser:</p>
 		 *
 		 * <ul>
 		 * <li>Por clase("clase"): si se especifica una clase todos los objetos dentro del contenedor que sean de esa clase seran eliminados.</li>
 		 * <li>Por objeto("objeto"): se puede pasar un objeto especifico y si este se encuentra dentro del contenedor sera eliminado.</li>
 		 * <li>Por nombre("id"): se puede pasar una cadena y si un objeto tiene la propiedad <code>name</code> establecida en esa cadena sera eliminado.</li>
 		 * </ul>
 		 *
		 * @param objetoAVaciar El objeto que se quiere vaciar
		 * @param ParametrosDeEliminacion Un array que contiene información sobre que objetos seran eliminados del objeto a vaciar, un ejemplo de parametro de eliminación puede ser:
		 * <listing>[{
			"tipo": "clase",
			"valor": Sprite
		 },
		 {
		 	"tipo": "objeto",
		 	"valor": [object DisplayObject] //se pasa un objeto en especifico
		 },
		 {
		 	"tipo": "id",
		 	"valor": "instance12"
		 }]
		 </listing>
		 */
		public static function vaciarEspecificado(objetoAVaciar: DisplayObjectContainer, ParametrosDeEliminacion: Array = null): void
		{
			if (ParametrosDeEliminacion == null)
			{
				return;
			}
			try
			{
				for (var o: uint = 0; o < objetoAVaciar.numChildren; o++)
				{
					for (var i: uint = 0; i < ParametrosDeEliminacion.length; i++)
					{
						if (ParametrosDeEliminacion[i].tipo == undefined)
						{
							throw "@NoType";
						}
						else if (ParametrosDeEliminacion[i].valor == undefined)
						{
							throw "@NoValue";
						}
						else
						{
							switch (ParametrosDeEliminacion[i].tipo)
							{
								case "clase":
								{
									if (ParametrosDeEliminacion[i].valor is Class)
									{
										if (objetoAVaciar.getChildAt(o) is ParametrosDeEliminacion[i].valor)
										{
											objetoAVaciar.removeChildAt(o);
											o--;
											i = ParametrosDeEliminacion.length;
										}
									}
									else
									{
										throw "@Value:{Expected:Class}";
									}
									break;
								}
								case "objeto":
								{
									if (ParametrosDeEliminacion[i].valor is DisplayObject)
									{
										if (objetoAVaciar.getChildAt(o) == ParametrosDeEliminacion[i].valor)
										{
											objetoAVaciar.removeChildAt(o);
											o--;
											i = ParametrosDeEliminacion.length;
										}
									}
									else
									{
										throw "@Value:{Expected:DisplayObject}";
									}
									break;
								}
								case "id":
								{
									if (ParametrosDeEliminacion[i].valor is String)
									{
										if (objetoAVaciar.getChildAt(o)["name"] == ParametrosDeEliminacion[i].valor)
										{
											objetoAVaciar.removeChildAt(o);
											o--;
											i = ParametrosDeEliminacion.length;
										}
									}
									else
									{
										throw "@Value:{Expected:String}";
									}
									break;
								}
								default:
								{
									throw "@InvalidType";
									break;
								}
							}
						}
					}
				}
			}
			catch (StringError: String)
			{
				//Pendiente agregar control de errores
			}
		}
		
		/**
		 * Elimina los objetos de vizualización de otro objeto de visualización.
		 *
		 * <p>Al contrario del metodo <code>vaciarEspecificado</code> el objeto array pasado define parametros de los objetos que no deben de ser eliminado sin embargo la estrutura del array es la misma y se categoriza en:</p>
		 *
		 * <ul>
		 * <li>Por clase("clase"): si se especifica una clase todos los objetos dentro del contenedor que sean de esa clase seran eliminados.</li>
		 * <li>Por objeto("objeto"): se puede pasar un objeto especifico y si este se encuentra dentro del contenedor sera eliminado.</li>
		 * <li>Por nombre("id"): se puede pasar una cadena y si un objeto tiene la propiedad <code>name</code> establecida en esa cadena sera eliminado.</li>
		 * </ul>
		 *
		 * @param objetoAVaciar El objeto que se quiere vaciar
		 * @param ParametrosDeExclusion Un array que contiene información sobre que objetos seran eliminados del objetoa vaciar,ejemplo de parametro de eliminación puede ser:
		 *<listing>[{
		 	"tipo": "clase",
		 	"valor": Sprite
		 },
		 {
		 	"tipo": "objeto",
		 	"valor": [object Object] //se pasa un objeto en especifico
		 },
		 {
		 	"tipo": "id",
		 	"valor": "instance12"
		 }]
		 </listing>
		 *
		 */
		public static function vaciarExcluido(objetoAVaciar: DisplayObjectContainer, ParametrosDeExclusion: Array = null): void
		{
			if (ParametrosDeExclusion == null)
			{
				vaciar(objetoAVaciar);
				return;
			}
			try
			{
				for (var o: uint = 0; o < objetoAVaciar.numChildren; o++)
				{
					for (var i: uint = 0; i < ParametrosDeExclusion.length; i++)
					{
						if (ParametrosDeExclusion[i].tipo == undefined)
						{
							throw "@NoType";
						}
						else if (ParametrosDeExclusion[i].valor == undefined)
						{
							throw "@NoValue";
						}
						else
						{
							switch (ParametrosDeExclusion[i].tipo)
							{
								case "clase":
								{
									if (ParametrosDeExclusion[i].valor is Class)
									{

										if (!(objetoAVaciar.getChildAt(o) is ParametrosDeExclusion[i].valor))
										{
											if (i == ParametrosDeExclusion.length - 1)
											{
												objetoAVaciar.removeChildAt(o);
												o--;
												i = ParametrosDeExclusion.length;
											}
										}
										else
										{
											i = ParametrosDeExclusion.length;
										}
									}
									else
									{
										throw "@Value:{Expected:Class}";
									}
									break;
								}
								case "objeto":
								{
									if (ParametrosDeExclusion[i].valor is DisplayObject)
									{
										if (objetoAVaciar.getChildAt(o) != ParametrosDeExclusion[i].valor)
										{
											if (i == ParametrosDeExclusion.length - 1)
											{
												objetoAVaciar.removeChildAt(o);
												o--;
												i = ParametrosDeExclusion.length;
											}
										}
										else
										{
											i = ParametrosDeExclusion.length;
										}
									}
									else
									{
										throw "@Value:{Expected:DisplayObject}";
									}
									break;
								}
								case "id":
								{
									if (ParametrosDeExclusion[i].valor is String)
									{
										if (objetoAVaciar.getChildAt(o)["name"] != ParametrosDeExclusion[i].valor)
										{
											if (i == ParametrosDeExclusion.length - 1)
											{
												objetoAVaciar.removeChildAt(o);
												o--;
												i = ParametrosDeExclusion.length;
											}
										}
										else
										{
											i = ParametrosDeExclusion.length;
										}
									}
									else
									{
										throw "@Value:{Expected:String}";
									}
									break;
								}
								default:
								{
									throw "@InvalidType";
									break;
								}
							}
						}

					}
				}
			}
			catch (StringError: String)
			{
				//Pendiente agregar control de errores
			}
		}
	}
}