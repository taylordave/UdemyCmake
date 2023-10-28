find_package(Doxygen)

if (DOXYGEN_FOUND)
    add_custom_target(docs ALL
        ${DOXYGEN_EXECUTABLE}
        WORKING_DIRECTORY "${CMAKE_SOURCE_DIR}/docs"
        COMMENT "Generating HTML documentation with Doxygen"
    )
endif()
