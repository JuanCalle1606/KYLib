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
 
package KYLib.utils 
{
	import KYLib.global.contiene;
		
	//--------------------------------------
	//  Descripcion de la clase
	//--------------------------------------
	/**
	 * La clase Opciones se usa principalmente para establecer opciones de configuracion en un objeto. Posee funciones de lectura de objetos y es una clase muy buena para establecer opciones por defecto y que pueden ser sobreescritas.
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
	public dynamic class Opciones extends Object 
	{
		/// Guarda todos los nombres de las propieades
		private const $issetArr:Vector.<String> = new Vector.<String>();
		
		/**
		 * Crea un nuevo objeto con las opciones especificas, el parametro que se pasa va a ser iterado y todas sus propiedades leibles seran escritas en el objeto Opciones
		 */
		public function Opciones(opciones:Object = null) 
		{
			for (var i:String in opciones)
			{
				this[i] = opciones[i];
				$issetArr.push(i);
			}
		}
		
		/**
		 * Convierte las propiedades establecidas dinamicamente en propiedades aplicables de opciones.
		 * 
		 * No es necesario llamar este metodo si se llama al metodo <code>aplicar()</code>
		 */
		public function parsearDatos():void 
		{
			for (var i:String in this)
			{
				if ($issetArr.indexOf(i) == -1) 
				{
					$issetArr.push(i);
				}
			}
		}
		
		/**
		 * Indica si existe esa opción o no.
		 * 
		 * <p>Esta función no detecta propiedades establecidas dinamicamente, para que esta propiedades sean detectables llame al metodo <code>parsearDatos()</code></p>
		 * 
		 * @param nombre El nombre de la propiedad que se quiere ver si la tienen las opciones.
		 * 
		 * @return <code>true</code> si se tiene la opción, <code>false</code> en caso contrario.
		 */
		public function posee(nombre:String):Boolean
		{
			if ($issetArr.indexOf(nombre) >= 0) 
			{
				return true;
			}
			return false;
		}
		
		/**
		 * Aplica las propiedades de un objeto como opciones
		 * 
		 * @param	opciones el opjeto cuyas propiedades seran copiadas como opciones.
		 * 
		 * @return se devuelve esta instancia de Opciones, tenga en cuenta que es la misma intancia que se usa y no una copia.
		 */
		public function aplicar(opciones:Object):Opciones 
		{
			for (var i:String in opciones)
			{
				this[i] = opciones[i];
				if ($issetArr.indexOf(i) == -1) 
				{
					$issetArr.push(i);
				}
			}
			return this;
		}
		
		/**
		 * Aplica las opciones que se tienen a un objeto en especifico
		 * 
		 * @param	objeto al que se le quieren aplicar las propiedades
		 * @param	crear indica si se intenta crear la propiedad si no existe
		 */
		public function aplicarA(objeto:*,crear:Boolean = false):void
		{
			for each (var i:String in $issetArr) 
			{
				if (crear) 
				{
					try 
					{
						objeto[i] = this[i];
					}
					catch (err:Error)
					{
						//No ocurre nada si no es posible crear la propiedad simplemente se continua con el codigo
					}
				}
				else 
				{
					if (contiene(objeto,i))
					{
						objeto[i] = this[i];
					}
				}
			}
		}
		
		/**
		 * Devuelve una representancion de cadena en formato json de este objeto
		 */
		public function toString():String 
		{
			return JSON.stringify(this);
		}
	}
}