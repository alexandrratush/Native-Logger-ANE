package com.alexandrratush.ane;

import com.adobe.fre.FREContext;
import com.adobe.fre.FREFunction;

import java.util.HashMap;
import java.util.Map;

public class NativeLoggerContext extends FREContext {

    @Override
    public void dispose() {

    }

    @Override
    public Map<String, FREFunction> getFunctions() {
        Map<String, FREFunction> map = new HashMap<>();
        return map;
    }
}
