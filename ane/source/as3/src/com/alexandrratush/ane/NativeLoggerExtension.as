package com.alexandrratush.ane
{
    import flash.events.EventDispatcher;
    import flash.events.StatusEvent;
    import flash.external.ExtensionContext;

    public class NativeLoggerExtension extends EventDispatcher
    {
        public static const EXTENSION_ID:String = "com.alexandrratush.ane.nativelogger";

        private static var _instance:NativeLoggerExtension;
        private static var _isConstructing:Boolean;

        protected var _context:ExtensionContext;

        public function NativeLoggerExtension()
        {
            if (!_isConstructing) throw new Error("Singleton, use NativeLoggerExtension.getInstance()");
        }

        public static function getInstance():NativeLoggerExtension
        {
            if (_instance == null)
            {
                _isConstructing = true;
                _instance = new NativeLoggerExtension();
                _isConstructing = false;
            }
            return _instance;
        }

        public function init():void
        {
            _context = ExtensionContext.createExtensionContext(EXTENSION_ID, "");
            _context.addEventListener(StatusEvent.STATUS, onStatusEventHandler);
        }

        public function debug(tag:String, message:String):void
        {
            _context.call("debug", tag, message);
        }

        public function error(tag:String, message:String):void
        {
            _context.call("error", tag, message);
        }

        public function info(tag:String, message:String):void
        {
            _context.call("info", tag, message);
        }

        public function verbose(tag:String, message:String):void
        {
            _context.call("verbose", tag, message);
        }

        public function warn(tag:String, message:String):void
        {
            _context.call("warn", tag, message);
        }

        protected function onStatusEventHandler(e:StatusEvent):void
        {
            dispatchEvent(e);
        }

        public function dispose():void
        {
            _context.removeEventListener(StatusEvent.STATUS, onStatusEventHandler);
            _context.dispose();
            _context = null;
        }
    }
}
