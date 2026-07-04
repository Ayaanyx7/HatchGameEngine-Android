add_library(${PROJECT_NAME} SHARED ${HATCH_SOURCES})

target_compile_definitions(${PROJECT_NAME} PRIVATE -DANDROID)

# NOTE: do NOT define SDL_MAIN_HANDLED here (unlike Windows) —
# Android's SDLActivity Java glue calls SDL_main via JNI, which
# requires SDL2's main-renaming macro to still be active.

include(cmake/Dependencies/FetchSDL2.cmake)
target_link_libraries(${PROJECT_NAME} PRIVATE ${SDL2_LIBRARIES})

# No GLEW on Android — GLES entry points come directly from the NDK,
# no desktop-style extension loader exists or is needed.
if(USING_OPENGL)
  set(OPENGL_LIBRARIES "-lGLESv2")
  target_link_libraries(${PROJECT_NAME} PRIVATE ${OPENGL_LIBRARIES})
endif()

if(USE_OPEN_ASSET_IMPORT_LIBRARY)
  include(cmake/Dependencies/Fetchassimp.cmake)
  # untested on Android — if assimp's CPM build fails to cross-compile
  # for the NDK, simplest fix is disabling USE_OPEN_ASSET_IMPORT_LIBRARY
  # for the Android target as a first pass
endif()

target_link_libraries(${PROJECT_NAME} PRIVATE log android)
