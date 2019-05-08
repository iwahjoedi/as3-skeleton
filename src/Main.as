package {
	import flash.display.Sprite;
	import flash.display.Loader;
	import flash.display.Stage;
    import flash.events.Event;
    import flash.net.URLRequest;
	import flash.text.TextField;

    import com.embedded.Images;
    import com.embedded.Sounds;
    import com.embedded.Camel;

    [SWF(width='600', height='452', backgroundColor='#00ffff', frameRate='30')]
    //Note:
    //  It is an undocumented metadata tag. It must be after the imports and 
    //  before the class definition.	

	public class Main extends Sprite {

        /*----- Variables related to stage width/height -----*/
        public static var STAGE_WIDTH  : Object = undefined;
        public static var STAGE_HEIGHT : Object = undefined;
		
		public function Main() {

            /*----- Set stage width/height -----*/
            STAGE_WIDTH  = stage.stageWidth;
            STAGE_HEIGHT = stage.stageHeight;

            /*----- Set embedded files -----*/
            Images.setMainClass( Main );

            Camel.setMainClass( Main );

            var display_txt:TextField = new TextField();
            display_txt.text = "Hello World!";
            addChild(Images.getImage(Images.TEST_IMAGE, false));
            addChild(Camel.getImageX(Camel.THE_IMAGE, false, 150, 150));
            addChild(display_txt);


            /** This is the way image load from current directory **/
            // var loader:Loader = new Loader();
            // loader.contentLoaderInfo.addEventListener(Event.COMPLETE, onComplete);
            // loader.load(new URLRequest("testimg.png"));
            // addChild(loader);

            Sounds.start(Sounds.TEST_SOUND, true);
		}


        private function onComplete():void{ 
            trace("Hello world"); 
        } 
	}

}
