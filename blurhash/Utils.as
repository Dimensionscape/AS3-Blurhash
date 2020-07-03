package blurhash {
	import flash.display.BitmapData;

	public class Utils {

		public static function sRGBToLinear(value: Number): Number {
			var v: Number = value / 255;
			if (v <= 0.04045) return v / 12.92;
			return Math.pow((v + 0.055) / 1.055, 2.4);
		}

		public static function linearTosRGB(value: Number): Number {
			var v: Number = Math.max(0, Math.min(1, value));
			if (v <= 0.0031308) return Math.round(v * 12.92 * 255 + 0.5);
			return Math.round((1.055 * Math.pow(v, 1 / 2.4) - 0.055) * 255 + 0.5);
		}

		public static function sign(n: Number): int {
			return (n < 0 ? -1 : 1);
		}
		
		public static function signPow(val:Number, exp:Number):Number{
			return sign(val) * Math.pow(Math.abs(val), exp);
		}
		
		public static function pixelsToBitmapData(pixels:Array, width:Number, height:Number):BitmapData {
			
			var bitmapData: BitmapData = new BitmapData(width, height);
			
			var length:int = pixels.length / 4;
			var row:int = 0;
			var column:int = 0;
			for(var i:int = 0; i < length; i++){
				var pixel:int = i*4;
				bitmapData.setPixel(column, row, _rgbToHex(pixels[pixel], pixels[pixel+1], pixels[pixel+2]));
				column++;
				if(column>width-1){
					column = 0;
					row++;
				}
			}		
			return bitmapData;
		}
		
		private static function _rgbToHex(r: int, g: int, b: int): uint {
			var hex: uint = r << 16 | g << 8 | b;
			return hex;
		}

	}

}
