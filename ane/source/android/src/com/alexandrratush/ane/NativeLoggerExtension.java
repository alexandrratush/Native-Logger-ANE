package com.alexandrratush.ane;

import com.adobe.fre.FREContext;
import com.adobe.fre.FREExtension;

public class NativeLoggerExtension implements FREExtension {

    public static final String ERROR_EVENT = "error";

    public FREContext context;

    @Override
    public FREContext createContext(String extId) {
        return context = new NativeLoggerContext();
    }

    @Override
    public void dispose() {
        if (context != null) {
            context.dispose();
            context = null;
        }
    }

    @Override
    public void initialize() {

    }
}
