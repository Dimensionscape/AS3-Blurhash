package blurhash{

	public class Base83 {

		private static const digitCharacters:Array = [
			"0", "1", "2", "3", "4", "5", "6", "7", "8", "9",
			"A", "B", "C", "D", "E", "F", "G", "H", "I", "J",
			"K", "L", "M", "N", "O", "P", "Q", "R", "S", "T",
			"U", "V", "W", "X", "Y", "Z", "a", "b", "c", "d",
			"e", "f", "g", "h", "i", "j", "k", "l", "m", "n",
			"o", "p", "q", "r", "s", "t", "u", "v", "w", "x",
			"y", "z", "#", "$", "%", "*", "+", ",", "-", ".",
			":", ";", "=", "?", "@", "[", "]", "^", "_", "{",
			"|", "}", "~"
		];
		
		public static function decode83(str:String):Number{
			var value: Number = 0;
			for(var i:int = 0; i< str.length; i++){
				var c:String = str.charAt(i);
				var digit:int = digitCharacters.indexOf(c);
				value = value * 83 + digit;
			}
			return value;
		}
		
		public static function encode83(n:Number, length:Number):String{
			var result:String = "";
			for(var i:int = 1; i<= length; i++){
				var digit:Number = (Math.floor(n) / Math.pow(83, length - i)) % 83;
				result += digitCharacters[Math.floor(digit)];
			}
			return result;
		} 
	}
}
