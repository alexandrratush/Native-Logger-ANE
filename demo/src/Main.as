package
{

    import feathers.utils.ScreenDensityScaleFactorManager;

    import flash.display.Sprite;
    import flash.display.StageAlign;
    import flash.display.StageScaleMode;
    import flash.events.Event;

    import starling.core.Starling;

    public class Main extends Sprite
    {
        private var _starling:Starling;
        private var _scaler:ScreenDensityScaleFactorManager;

        public function Main()
        {
            if (stage) init();
            else addEventListener(Event.ADDED_TO_STAGE, init);
        }

        private function init(e:Event = null):void
        {
            if (e) removeEventListener(Event.ADDED_TO_STAGE, init);

            stage.align = StageAlign.TOP_LEFT;
            stage.scaleMode = StageScaleMode.NO_SCALE;

            Starling.multitouchEnabled = true;
            _starling = new Starling(ApplicationRoot, stage, null, null);
            _starling.supportHighResolutions = true;
            _starling.skipUnchangedFrames = true;
            _starling.start();

            _scaler = new ScreenDensityScaleFactorManager(_starling);
            stage.addEventListener(Event.DEACTIVATE, stageDeactivateHandler, false, 0, true);
        }

        private function stageDeactivateHandler(event:Event):void
        {
            _starling.stop(true);
            stage.addEventListener(Event.ACTIVATE, stageActivateHandler, false, 0, true);
        }

        private function stageActivateHandler(event:Event):void
        {
            stage.addEventListener(Event.ACTIVATE, stageActivateHandler);
            _starling.start();
        }
    }
}
