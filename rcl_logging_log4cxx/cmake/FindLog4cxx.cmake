#ckwg +4
# Copyright 2010 by Kitware, Inc. All Rights Reserved. Please refer to
# KITWARE_LICENSE.TXT for licensing information, or contact General Counsel,
# Kitware, Inc., 28 Corporate Drive, Clifton Park, NY 12065.

# Locate the system installed Log4cxx
# The following variables will be set:
#
# Log4cxx_FOUND       - Set to true if Log4cxx can be found
# Log4cxx_INCLUDE_DIR - The path to the Log4cxx header files
# Log4cxx_LIBRARIES     - The full path to the Log4cxx library

if( Log4cxx_DIR )
  find_package( Log4cxx NO_MODULE )
elseif( NOT Log4cxx_FOUND )
  message(STATUS "Searching for log4cxx/logger.h")
  if (WIN32)

  else()

  endif()
  find_path( Log4cxx_INCLUDE_DIR log4cxx/logger.h  HINTS "C:\\ProgramData\\chocolatey\\lib\\log4cxx\\include")
  set(Log4cxx_INCLUDE_DIRS ${Log4cxx_INCLUDE_DIR})

  message(STATUS "Searching for libLog4cxx")
  find_library( Log4cxx_LIBRARIES log4cxx HINTS "C:\\ProgramData\\chocolatey\\lib\\log4cxx\\lib")
  set(Log4cxx_LIBRARY ${Log4cxx_LIBRARIES})

  include( FindPackageHandleStandardArgs )
  FIND_PACKAGE_HANDLE_STANDARD_ARGS( Log4cxx Log4cxx_INCLUDE_DIR Log4cxx_LIBRARIES )
  if( LOG4CXX_FOUND )
    set( Log4cxx_FOUND TRUE )
  endif()
endif()
