function(target_set_warnings TARGET ENABLED ENABLED_AS_ERRORS)
    if (NOT ${ENABLED})
        message(STATUS "Warnings disabled for: ${TARGET}")
        return()
    endif()

    set(MSVC_WARNINGS
        /W4
        /permissive-
    )

    set(CLANG_WARNINGS
        -Wall
        -Wextra
        -Wpedantic
    )

    set(GCC_WARNINGS ${CLANG_WARNINGS})

    if (${ENABLED_AS_ERRORS})
        set(MSVC_WARNINGS ${MSVC_WARNINGS} /WX)
        set(CLANG_WARNINGS ${CLANG_WARNINGS} -Werror)
        set(GCC_WARNINGS ${GCC_WARNINGS} -Werror)
    endif()

    string(TOUPPER ${CMAKE_CXX_COMPILER} UPPER_CMAKE_CXX_COMPILER)

    if (UPPER_CMAKE_CXX_COMPILER MATCHES "MSVC")
        set(WARNINGS ${MSVC_WARNINGS})
    elseif (UPPER_CMAKE_CXX_COMPILER MATCHES "CLANG")
        set(WARNINGS ${CLANG_WARNINGS})
    elseif (UPPER_CMAKE_CXX_COMPILER MATCHES "GCC")
        set(WARNINGS ${GCC_WARNINGS})
    endif()

    target_compile_options(${TARGET} PRIVATE ${WARNINGS})
    message(STATUS ${WARNINGS})

endfunction()
