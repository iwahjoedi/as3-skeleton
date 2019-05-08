package com.embedded {

    import flash.display.Bitmap;
    import flash.display.DisplayObject;
	import flash.display.Sprite;

	public class Images {

        /*----- Set a link to the main class of the project -----*/

        private static var mainClass_: Class;
        
        public static function setMainClass(mainClass: Class): void
        {
            mainClass_ = mainClass;
        }

        /*----- Embedded images -----*/

        // [Embed(source='testimg.png')]
        [Embed(source='game-background-2.jpg')]
        public static const TEST_IMAGE: Class;

        public static function getImage(image: Class, fullscreen: Boolean = false): Sprite
        {
            var retval: Sprite = new Sprite();
            if (image != null){
                retval.addChild(new image());
                if ( fullscreen ) {
                    if (mainClass_.STAGE_WIDTH  != undefined && 
                        mainClass_.STAGE_HEIGHT != undefined) {
                        retval.width  = mainClass_.STAGE_WIDTH;
                        retval.height = mainClass_.STAGE_HEIGHT;
                    }
                }
            } else {
                throw new Error("The image doesn't exist!");
            }
            return retval;
        }

	}
}
