# AS3-Blurhash

AS3-Blurhash Decoder for AS3 and Adobe AIR allows you to integrate beautiful image placeholders in your apps when the original takes too long to load from an external web service. Simply use one of the backend encoder libraries from https://blurha.sh/ and pass compact, Base83 encoded strings to the client very quickly in order to render Bitmap placeholders while the actual image is loading.

![Image of example](https://cdn.discordapp.com/attachments/310222402674229249/728483366097125386/unknown.png)

Example usage:

```actionscript
var placeHolderBitmapData: BitmapData = Decoder.decode("LKO2?V%2Tw=w]~RBVZRi};RPxuwH", 400, 200);
addChild(new Bitmap(placeHolderBitmapData));
```

Starling Usage:

```actionscript
var placeHolderBitmapData: BitmapData = Decoder.decode("LKO2?V%2Tw=w]~RBVZRi};RPxuwH", 400, 200);
var image:Image = new Image(Texture.fromBitmapData(placeHolderBitmapData));
addChild(image);
```

![Image of example usage](https://i.gyazo.com/3763b3064077d8b5e08b9631252c18f1.gif)

Credit to Leonidas for motivating me to writing this small blurhash decoder in AS3.

Enjoy!
