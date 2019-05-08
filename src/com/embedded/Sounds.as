package com.embedded {

    import flash.events.Event;
    import flash.events.ProgressEvent;
    import flash.media.Sound;
    import flash.media.SoundChannel;
    import flash.media.SoundMixer;
    import flash.media.SoundTransform;

	public class Sounds {

        /*----- Embedded sounds -----*/

        // [Embed(source='testsnd.mp3')]
        [Embed(source='MarimbaBoy.mp3')]
        public static const TEST_SOUND: Class;

        /*----- Private fields -----*/

        private static var currentSound_  : Class          = null;
        private static var currentChannel_: SoundChannel  = null;
        private static var currentST_     : SoundTransform = new SoundTransform(1.0);

        private static function startCurrentSound(repeat: Boolean = false): void
        {
            if ( currentSound_ != null ) {
                currentChannel_ = (Sound(new currentSound_())).play();
                if ( repeat ) {
                    currentChannel_.addEventListener(Event.SOUND_COMPLETE, startAgain);
                }
            }
        }

        private static function startAgain(ev: Event): void
        {
            currentChannel_.removeEventListener(Event.SOUND_COMPLETE, startAgain);
            startCurrentSound(true);
        }

        /*----- Public fields -----*/

        public static function start(sound: Class, repeat: Boolean = false, vol: Number = -1.0): void
        {
            if ( sound != null && sound != currentSound_ ) {
                stop();
                currentSound_ = sound;
                startCurrentSound(repeat);
                setVolume(vol);
            }
        }

        public static function stop(): void
        {
            if ( currentChannel_ != null ) {
                currentChannel_.stop();
                currentSound_ = null;
            }
        }

        public static function setVolume(vol: Number = -1.0): void
        {
            if ( vol >= 0.0 ) {
                currentST_ = new SoundTransform(vol);
                if (currentChannel_ != null && currentST_ != null) {
                    currentChannel_.soundTransform = currentST_;
                }
            }
        }

	}

}
