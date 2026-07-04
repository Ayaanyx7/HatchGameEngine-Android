package com.hatchgameengine.android;

import org.libsdl.app.SDLActivity;

public class MainActivity extends SDLActivity {
    @Override
    protected String[] getLibraries() {
        // Must match ${PROJECT_NAME} from the top-level CMakeLists.txt project() call
        return new String[] { "HatchGameEngine" };
    }
}
