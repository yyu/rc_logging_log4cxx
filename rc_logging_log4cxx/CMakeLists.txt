cmake_minimum_required(VERSION 3.5)

project(rc_logging_log4cxx)

# Default to C11
if(NOT CMAKE_C_STANDARD)
  set(CMAKE_C_STANDARD 11)
endif()
# Default to C++14
if(NOT CMAKE_CXX_STANDARD)
  set(CMAKE_CXX_STANDARD 14)
endif()

find_package(ament_cmake_ros REQUIRED)

#find_package(log4cxx REQUIRED ../vs6/apache-log4cxx-0.10.0/projects/Debug)

#set(dependencies
#    log4cxx
#)

include_directories(${ament_INCLUDE_DIRS})
include_directories(../../../../../vs6/apache-log4cxx-0.10.0/src/main/include)

if(NOT WIN32)
  add_compile_options(-Wall -Wextra -Wpedantic)
endif()

set(${PROJECT_NAME}_sources
    src/rc_logging_log4cxx/rc_logging_log4cxx.cpp
)
#set_source_files_properties(${${PROJECT_NAME}_sources} PROPERTIES language "CXX")

add_library(${PROJECT_NAME} ${${PROJECT_NAME}_sources})
#link_directories(../../../../../vs6/apache-log4cxx-0.10.0/projects/Debug)
#link_directories("C:/dev/vs6/apache-log4cxx-0.10.0/projects/Debug")
#set(LINK_LIBS log4cxx)

#add_library(log4cxx SHARED IMPORTED)
#set_target_properties(log4cxx PROPERTIES
#  IMPORTED_LOCATION C:/dev/vs6/apache-log4cxx-0.10.0/projects/Debug/log4cxx.dll
#  INTERFACE_INCLUDE_DIRECTORIES C:/dev/vs6/apache-log4cxx-0.10.0/src/main/include
#)

link_directories(C:\\dev\\vs6\\apache-log4cxx-0.10.0\\projects\\Debug)
target_link_libraries(${PROJECT_NAME} C:\\dev\\vs6\\apache-log4cxx-0.10.0\\projects\\Debug\\log4cxx.lib)

ament_target_dependencies(${PROJECT_NAME}
    ${dependencies}
)


install(TARGETS ${PROJECT_NAME}
  ARCHIVE DESTINATION lib
  LIBRARY DESTINATION lib
  RUNTIME DESTINATION bin)


ament_export_dependencies(ament_cmake)
ament_export_libraries(${PROJECT_NAME} ${dependencies})
ament_package()
