package se.cambiata.utils {

	public class StringUtils {
		public function StringUtils() {
		}

		public static function stringCompareCyclic(strA:String, strB:String):Number {

			var testA:String = '';
			
			var topResult:Number = 0;
			
			for (var i:int = 0; i < strA.length; i++) {
				
				var firstA:String = strA.substr(i, strA.length-i);
				var secondA:String = strA.substr(0, i);
				testA = firstA + secondA;

				
				var currResult:Number = stringCompare(testA, strB);
				//trace(testA, strB, currResult);
				topResult = Math.max(topResult, currResult);
					
				
			}
			//trace(topResult);
			return topResult;
		}
			

		public static function stringCompare(strA:String, strB:String):Number {
			
			if (!strA) return 0;
			if (!strB) return 0;
			
			var lengthA:int = strA.length;
			var lengthB:int = strB.length;

			var segmentCount:int = 0;
			var segementsInfo:Array = new Array();
			var segment:String = '';

			var i:int = 0;

			while (i < lengthA) {
				var char:String = strA.substr(i, 1);
				if (strB.indexOf(char) >= 0) {
					segment = segment + char;
					if (strB.indexOf(segment) >= 0) {
						var segmentPosA:int = i - segment.length + 1;
						var segmentPosB:int = strB.indexOf(segment);
						var positionDiff:int = Math.abs(segmentPosA - segmentPosB);
						var posFactor:Number = (lengthA - positionDiff) / lengthB;
						var lengthFactor:Number = segment.length / lengthA;
						segementsInfo[segmentCount] = ({'segment': segment, 'score': (posFactor * lengthFactor)});
					} else {
						segment = '';
						i--;
						segmentCount++;
					}
				} else {
					segment = '';
					segmentCount++;
				}

				i++;
			}

			var totalScore:Number = 0;

			for each (var info:Object in segementsInfo)
				totalScore += info.score;

			return totalScore;
		}
		

		

	}
}