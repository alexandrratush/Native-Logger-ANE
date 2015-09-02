package com.alexandrratush.ane;

import android.util.Log;
import com.adobe.fre.FREContext;
import com.adobe.fre.FREFunction;
import com.adobe.fre.FREObject;

import java.util.HashMap;
import java.util.Map;

public class NativeLoggerContext extends FREContext {

    @Override
    public void dispose() {

    }

    @Override
    public Map<String, FREFunction> getFunctions() {
        Map<String, FREFunction> map = new HashMap<>();
        map.put("debug", new DebugFunction());
        map.put("error", new ErrorFunction());
        map.put("info", new InfoFunction());
        map.put("verbose", new VerboseFunction());
        map.put("warn", new WarnFunction());
        return map;
    }

    public class DebugFunction implements FREFunction {
        @Override
        public FREObject call(FREContext context, FREObject[] args) {
            try {
                String tag = args[0].getAsString();
                String msg = args[1].getAsString();
                Log.d(tag, msg);
            } catch (Exception e) {
                context.dispatchStatusEventAsync("debug call error" + ": " + e, NativeLoggerExtension.ERROR_EVENT);
            }
            return null;
        }
    }

    public class ErrorFunction implements FREFunction {
        @Override
        public FREObject call(FREContext context, FREObject[] args) {
            try {
                String tag = args[0].getAsString();
                String msg = args[1].getAsString();
                Log.e(tag, msg);
            } catch (Exception e) {
                context.dispatchStatusEventAsync("error call error" + ": " + e, NativeLoggerExtension.ERROR_EVENT);
            }
            return null;
        }
    }

    public class InfoFunction implements FREFunction {
        @Override
        public FREObject call(FREContext context, FREObject[] args) {
            try {
                String tag = args[0].getAsString();
                String msg = args[1].getAsString();
                Log.i(tag, msg);
            } catch (Exception e) {
                context.dispatchStatusEventAsync("info call error" + ": " + e, NativeLoggerExtension.ERROR_EVENT);
            }
            return null;
        }
    }

    public class VerboseFunction implements FREFunction {
        @Override
        public FREObject call(FREContext context, FREObject[] args) {
            try {
                String tag = args[0].getAsString();
                String msg = args[1].getAsString();
                Log.v(tag, msg);
            } catch (Exception e) {
                context.dispatchStatusEventAsync("verbose call error" + ": " + e, NativeLoggerExtension.ERROR_EVENT);
            }
            return null;
        }
    }

    public class WarnFunction implements FREFunction {
        @Override
        public FREObject call(FREContext context, FREObject[] args) {
            try {
                String tag = args[0].getAsString();
                String msg = args[1].getAsString();
                Log.w(tag, msg);
            } catch (Exception e) {
                context.dispatchStatusEventAsync("warn call error" + ": " + e, NativeLoggerExtension.ERROR_EVENT);
            }
            return null;
        }
    }
}
