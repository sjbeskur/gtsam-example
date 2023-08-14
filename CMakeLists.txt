
cmake_minimum_required(VERSION 3.10)

# Set your project name here
project( gtsam-example )

# Set the C++ standard to use (change to your preferred version)
set(CMAKE_CXX_STANDARD 17)
set(CMAKE_MODULE_PATH "${PROJECT_SOURCE_DIR}/cmake" ${CMAKE_MODULE_PATH})

#message(" module path ==== > " ${CMAKE_MODULE_PATH})
#list(APPEND CMAKE_MODULE_PATH "${PROJECT_SOURCE_DIR}/cmake")

# Add your source files here (replace "main.cpp" with your actual source files)
set(SOURCES
    src/main.cpp
)

# Add headers, if any (replace "header.h" with your actual header files)
set(HEADERS
    include/dummy.hpp
)

include(Eigen)

#find_package(Eigen3 REQUIRED)
#find_package (Eigen3 3.3 REQUIRED NO_MODULE) 
#add_library(Eigen3::Eigen ALIAS Eigen3::Eigen)

# Create an executable target from the source files
add_executable(${PROJECT_NAME} ${SOURCES} ${HEADERS})
add_dependencies(${PROJECT_NAME} eigen )
target_link_libraries (${PROJECT_NAME} gtsam)

#target_link_libraries(${PROJECT_NAME} PRIVATE Eigen3::Eigen)


target_include_directories(${PROJECT_NAME} PUBLIC
    include
)

# Set the include directories (replace "include" with your actual include path)

# Set any additional compiler flags if needed
# For example:
# target_compile_options(${PROJECT_NAME} PRIVATE -Wall -Wextra)

# If you have any external libraries to link against, use the following format:
# find_package(YourLibrary REQUIRED)
# target_link_libraries(${PROJECT_NAME} PRIVATE YourLibrary::YourLibrary)

# Optionally, you can enable testing with Google Test
add_subdirectory(tests)
enable_testing()


# add_test(NAME MyTest COMMAND MyTestExecutable)

# Optionally, set the output directory for the built binaries
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/bin)

