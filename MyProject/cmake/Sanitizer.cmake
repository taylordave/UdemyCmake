function(add_sanitizer_flags)
    if (NOT ${ENABLE_SANITIZE_ADDR} AND NOT ${ENABLE_SANITIZE_UNDEF})
        message(STATUS "Sanitizerrs deactivated.")
        return()
    endif()

    string(TOUPPER ${CMAKE_CXX_COMPILER} UPPER_CMAKE_CXX_COMPILER)

    if (UPPER_CMAKE_CXX_COMPILER MATCHES "CLANG" OR UPPER_CMAKE_CXX_COMPILER MATCHES "GNU")
        add_compile_options("-fno-omit-frame-pointer")
        add_link_options("-fno-omit-frame-pointer")

        if(ENABLE_SANITIZE_ADDR)
            add_compile_options("-fsanitize=address")
            add_link_options("-fsanitize=address")
        endif()

        if(ENABLE_SANITIZE_UNDEF)
            add_compile_options("-fsanitize=undefined")
            add_link_options("-fsanitize=undefined")
        endif()
    elseif (UPPER_CMAKE_CXX_COMPILER MATCHES "MSVC")
        if(ENABLE_SANITIZE_ADDR)
            add_compile_options("/fsanitize=address")
        endif()

        if(ENABLE_SANITIZE_UNDEF)
            message(STATUS "Undefined sanitizer not implemented for MSVC!")
        endif()
    else()
        message(ERROR "Compiler not suppoer for Sanitizers")
    endif()
endfunction()
