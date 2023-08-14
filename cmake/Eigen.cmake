
include(ExternalProject)

set(EIGEN_BUILD_DIR   ${CMAKE_BINARY_DIR}/eigen)
set(EIGEN_INSTALL_DIR ${CMAKE_SOURCE_DIR}/include/eigen3)
set(EIGEN_INCLUDE_DIR ${EIGEN_INSTALL_DIR})

ExternalProject_Add(
    eigen
    URL https://gitlab.com/libeigen/eigen/-/archive/3.4.0/eigen-3.4.0.tar.gz
    PREFIX ${EIGEN_BUILD_DIR}
    CONFIGURE_COMMAND ""
    BUILD_COMMAND ""
    INSTALL_COMMAND
      ${CMAKE_COMMAND} -E copy_directory ${EIGEN_BUILD_DIR}/src/eigen/Eigen ${EIGEN_INCLUDE_DIR}/Eigen 
      && ${CMAKE_COMMAND} -E copy_directory ${EIGEN_BUILD_DIR}/src/eigen/unsupported ${EIGEN_INCLUDE_DIR}/unsupported
    TEST_COMMAND ""
)
include_directories(SYSTEM ${EIGEN_INCLUDE_DIR})


# include(FetchContent)
# FetchContent_Declare(
#   eigen
#   GIT_REPOSITORY https://gitlab.com/libeigen/eigen.git
#   GIT_TAG 3.3.9
#   GIT_SHALLOW TRUE
#   GIT_PROGRESS TRUE)
# set(EIGEN_BUILD_DOC OFF)
# # note: To disable eigen tests,
# # you should put this code in a add_subdirectory to avoid to change
# # BUILD_TESTING for your own project too since variables are directory
# # scoped
# set(BUILD_TESTING OFF)
# set(EIGEN_BUILD_PKGCONFIG OFF)
# set( OFF)

# FetchContent_MakeAvailable(eigen)

##
# target_link_libraries(YourTarget PRIVATE Eigen3::Eigen)