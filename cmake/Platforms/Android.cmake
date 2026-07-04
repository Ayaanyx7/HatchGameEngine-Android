add_library(${PROJECT_NAME} SHARED ${HATCH_SOURCES})

target_compile_definitions(${PROJECT_NAME} PRIVATE -DANDROID)

include(cmake/Dependencies/FetchSDL2.cmake)
target_link_libraries(${PROJECT_NAME} ${SDL2_LIBRARIES})

if(USING_OPENGL)
  set(OPENGL_LIBRARIES "-lGLESv2")
endif()

if(USE_OPEN_ASSET_IMPORT_LIBRARY)
  include(cmake/Dependencies/Fetchassimp.cmake)
endif()

target_link_libraries(${PROJECT_NAME} log android)
