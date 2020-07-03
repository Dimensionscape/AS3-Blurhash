# AS3-Blurhash

AS3-Blurhash Decoder for AS3 allows you to integrate image placeholders in your apps when the original take too long to load. Simply use one of the backend encoder libraries from https://blurha.sh/ and pass compact encoded strings to the client.
![Image of example](https://cdn.discordapp.com/attachments/310222402674229249/728483366097125386/unknown.png)

Example usage

`
var placeHolderBitmapData: BitmapData = Decoder.decode("LKO2?V%2Tw=w]~RBVZRi};RPxuwH", 400, 200);
addChild(new Bitmap(placeHolderBitmapData));
`
