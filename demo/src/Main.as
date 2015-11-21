package
{

    import com.alexandrratush.ane.NativeLoggerExtension;
    import com.bit101.components.PushButton;

    import flash.display.Sprite;
    import flash.display.StageAlign;
    import flash.display.StageScaleMode;
    import flash.events.Event;
    import flash.events.MouseEvent;

    public class Main extends Sprite
    {
        private var _buttonDebug:PushButton;
        private var _buttonError:PushButton;
        private var _buttonInfo:PushButton;
        private var _buttonVerbose:PushButton;
        private var _buttonWarn:PushButton;

        public function Main()
        {
            if (stage) init();
            addEventListener(Event.ADDED_TO_STAGE, init);
        }

        private function init(e:Event = null):void
        {
            if (e) removeEventListener(Event.ADDED_TO_STAGE, init);

            stage.align = StageAlign.TOP_LEFT;
            stage.scaleMode = StageScaleMode.NO_SCALE;

            NativeLoggerExtension.getInstance().init();

            _buttonDebug = new PushButton(this, 10, 10, "Debug", buttonLogClickHandler);
            _buttonError = new PushButton(this, 10, 50, "Error", buttonLogClickHandler);
            _buttonInfo = new PushButton(this, 10, 90, "Info", buttonLogClickHandler);
            _buttonVerbose = new PushButton(this, 10, 130, "Verbose", buttonLogClickHandler);
            _buttonWarn = new PushButton(this, 10, 170, "Warn", buttonLogClickHandler);
        }

        private function buttonLogClickHandler(e:MouseEvent):void
        {
            switch (e.currentTarget)
            {
                case _buttonDebug:
                    NativeLoggerExtension.getInstance().debug("NativeLoggerExtension", "Debug message");
                    break;

                case _buttonError:
                    NativeLoggerExtension.getInstance().error("NativeLoggerExtension", "Error message");
                    break;

                case _buttonInfo:
                    NativeLoggerExtension.getInstance().info("NativeLoggerExtension", "Info message");
                    break;

                case _buttonVerbose:
                    NativeLoggerExtension.getInstance().verbose("NativeLoggerExtension", "Verbose message");
                    break;

                case _buttonWarn:
                    NativeLoggerExtension.getInstance().warn("NativeLoggerExtension", "Warn message");
                    break;
            }
        }
    }
}
