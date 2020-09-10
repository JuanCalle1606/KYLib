package
{
	
	/**
	 * Punto de entrada de la KYLib
	 * @author Juan Pablo Calle
	 */
	public class KYLibMain
	{		
		public static function info():void
		{
			trace("[KYLib] Libreria por Juan Pablo Calle");
			trace("[KYLib] version " + VERSION + " Build " + BUILD);
		}
		
		public static const BUILD:int = 2059;
		
		public static const VERSION:String = "BETA 0.200.909";
		
	}
}