# if you had an external dependency that is not a git repo you can manually place the files
# into a folder and then use this CMakeLists.txt file to ensure it gets added as a dependency
# to the main project - for example:

set(LOG_SOURCES "${CMAKE_CURRENT_SOURCE_DIR}/log/src/log.c")
set(LOG_HEADERS "${CMAKE_CURRENT_SOURCE_DIR}/log/src/log.h")
set(LOG_INCLUDES "${CMAKE_CURRENT_SOURCE_DIR}/log/src/")
add_library(log STATIC ${LOG_SOURCES} ${LOG_HEADERS})
target_include_directories(log PUBLIC ${LOG_INCLUDES})

# note - example used comes from: https://github.com/rxi/log.c/tree/master
