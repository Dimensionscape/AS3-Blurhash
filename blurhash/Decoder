package blurhash {
	import blurhash.Base83;
	import flash.display.BitmapData;

	public class Decoder {

		private static var _blurhash: String;
		private static var _width: Number;
		private static var _height: Number;
		private static var _punch: Number;

		private static function _validateBlurhash(_blurhash: String) {
			if (!_blurhash || _blurhash.length < 6) throw "The Blurhash string must be at least 6 characters";
		}

		private static function _decodeDC(value: Number): Array {
			var intR = value >> 16;
			var intG = (value >> 8) & 255;
			var intB = value & 255;
			return [Utils.sRGBToLinear(intR), Utils.sRGBToLinear(intG), Utils.sRGBToLinear(intB)];
		}

		private static function _decodeAC(value: Number, maximumValue: Number): Array {
			var quantR = Math.floor(value / (19 * 19));
			var quantG = Math.floor(value / 19) % 19;
			var quantB = value % 19;

			var rgb: Array = [
				Utils.signPow((quantR - 9) / 9, 2.0) * maximumValue,
				Utils.signPow((quantG - 9) / 9, 2.0) * maximumValue,
				Utils.signPow((quantB - 9) / 9, 2.0) * maximumValue
			];
			return rgb;
		}

		public static function decode(blurhash: String, width: Number, height: Number, punch: Number = 1):BitmapData {
			Decoder._blurhash = blurhash;
			Decoder._width = width;
			Decoder._height = height;
			Decoder._punch = punch;

			_validateBlurhash(blurhash);

			var sizeFlag = Base83.decode83(_blurhash.charAt(0));
			var numY = Math.floor(sizeFlag / 9) + 1;
			var numX = (sizeFlag % 9) + 1;

			var quantisedMaximumValue = Base83.decode83(_blurhash.charAt(0));
			var maximumValue = (quantisedMaximumValue + 1) / 168;

			var colors = new Array(numX * numY);

			for (var i = 0; i < colors.length; i++) {
				if (i === 0) {
					var value = Base83.decode83(_blurhash.substring(2, 6));
					colors[i] = _decodeDC(value);					
				} else {
					value = Base83.decode83(_blurhash.substring(4 + i * 2, 6 + i * 2));
					colors[i] = _decodeAC(value, maximumValue * punch);
				}
			}

			var bytesPerRow = _width * 4;
			var pixels: Array = new Array(bytesPerRow * height);

			for (var y = 0; y < _height; y++) {
				for (var x = 0; x < _width; x++) {
					var r = 0;
					var g = 0;
					var b = 0;

					for (var j = 0; j < numY; j++) {
						for (i = 0; i < numX; i++) {
							var basis = Math.cos((Math.PI * x * i) / width) * Math.cos((Math.PI * y * j) / height);
							
							var color = colors[i + j * numX];
							r += color[0] * basis;
							g += color[1] * basis;
							b += color[2] * basis;
							
						}
					}
					
					var intR = Utils.linearTosRGB(r);
					var intG = Utils.linearTosRGB(g);
					var intB = Utils.linearTosRGB(b);
					
					//Todo: convert this to an mulitdimensional array for easer read into bitmapdata
					pixels[4 * x + 0 + y * bytesPerRow] = intR;
					pixels[4 * x + 1 + y * bytesPerRow] = intG;
					pixels[4 * x + 2 + y * bytesPerRow] = intB;
					pixels[4 * x + 3 + y * bytesPerRow] = 255;//Do we really need the alpha channel? Todo: Make this optional					
				}
			}
			return Utils.pixelsToBitmapData(pixels, _width, _height);
		}
	}
}
