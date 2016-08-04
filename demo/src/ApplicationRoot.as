package
{

    import com.aratush.ane.NativeLoggerExtension;

    import feathers.controls.ButtonGroup;
    import feathers.controls.LayoutGroup;
    import feathers.data.ListCollection;
    import feathers.layout.AnchorLayout;
    import feathers.layout.AnchorLayoutData;
    import feathers.themes.MetalWorksMobileTheme;

    import starling.events.Event;

    public class ApplicationRoot extends LayoutGroup
    {
        private var _buttonGroup:ButtonGroup;

        public function ApplicationRoot()
        {
            new MetalWorksMobileTheme();
            layout = new AnchorLayout();

            var layoutData:AnchorLayoutData = new AnchorLayoutData();
            layoutData.horizontalCenter = layoutData.verticalCenter = 0;
            _buttonGroup = new ButtonGroup();
            _buttonGroup.layoutData = layoutData;
            _buttonGroup.dataProvider = new ListCollection([
                {label: "Verbose", triggered: buttonVerboseHandler},
                {label: "Debug", triggered: buttonDebugHandler},
                {label: "Info", triggered: buttonInfoHandler},
                {label: "Warn", triggered: buttonWarnHandler},
                {label: "Error", triggered: buttonErrorHandler},
                {label: "Dispose extension", triggered: buttonDisposeExtensionHandler}
            ]);
            addChild(_buttonGroup);
        }

        private function buttonVerboseHandler(event:Event):void
        {
            NativeLoggerExtension.getInstance().verbose("tag", "message");
        }

        private function buttonDebugHandler(event:Event):void
        {
            NativeLoggerExtension.getInstance().debug("tag", "message");
        }

        private function buttonInfoHandler(event:Event):void
        {
            NativeLoggerExtension.getInstance().info("tag", "message");
        }

        private function buttonWarnHandler(event:Event):void
        {
            NativeLoggerExtension.getInstance().warn("tag", "message");
        }

        private function buttonErrorHandler(event:Event):void
        {
            NativeLoggerExtension.getInstance().error("tag", "message");
        }

        private function buttonDisposeExtensionHandler(event:Event):void
        {
            NativeLoggerExtension.getInstance().dispose();
        }
    }
}
