package com.embedded {

    import flash.display.Bitmap;
    import flash.display.DisplayObject;
	import flash.display.Sprite;

	public class Camel {

        /*----- Set a link to the main class of the project -----*/

        private static var mainClass_: Class;
        
        public static function setMainClass(mainClass: Class): void
        {
            mainClass_ = mainClass;
        }

        /*----- Embedded images -----*/
        [Embed(source='camel_PNG23436.png')]
        public static const THE_IMAGE: Class;
        /*----- Embedded images -----*/

        public static function getImageX(image: Class, fullscreen: Boolean = false, height: Number = 10, width: Number = 10): Sprite
        {
            var retval: Sprite = new Sprite();
            retval.x = 50;
            retval.y = 60;
            if (image != null){
                retval.addChild(new image());
                if ( fullscreen ) {
                    if (mainClass_.STAGE_WIDTH  != undefined && 
                        mainClass_.STAGE_HEIGHT != undefined) {
                        retval.width  = mainClass_.STAGE_WIDTH;
                        retval.height = mainClass_.STAGE_HEIGHT;
                    }
                } else{
                    retval.width = width;
                    retval.height = height;
                }
            } else {
                throw new Error("The image doesn't exist!");
            }
            return retval;
        }

	}
}
