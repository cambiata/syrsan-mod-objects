package se.cambiata.utils.calculators
{
	import se.cambiata.utils.StringUtils;

	public class SimStringCambiata implements IStringSim
	{
		public function SimStringCambiata()
		{
		}
		
		public function calculate(strA:String, strB:String):Number
		{
			return StringUtils.stringCompare(strA, strB);
		}
	}
}