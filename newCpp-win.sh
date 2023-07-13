#bin/bash

echo Setting up new C++ project with vcpkg and cmake
echo Would you like to clear the current folder? \(Y\/n\)

read clearFolder

if [ clearFolder == "y" ] || [ clearFolder == "Y" ] || [ clearFolder == "" ];
then
	rm -rf ./*
	echo \nFolder clear.
fi

#git
git init
cat > .gitignore <<- EOM
build
out
EOM

#Script to install VCPKG as a submodule
git submodule add https://github.com/Microsoft/vcpkg.git
./vcpkg/bootstrap-vcpkg.bat

#Create CMakeLists.txt scaffold
cat > CMakeLists.txt <<- EOM
cmake_minimum_required(VERSION 2.8.11)
set(CMAKE_TOOLCHAIN_FILE ./vcpkg/scripts/buildsystems/vcpkg.cmake)

set(PROJECT_NAME myNewProject)
project(\${PROJECT_NAME})

set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_FLAGS "\${CMAKE_CXX_FLAGS} -Wall")
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY \${CMAKE_BINARY_DIR}/bin)

# Disable in-source builds to prevent source tree corruption.
if(" \${CMAKE_SOURCE_DIR}" STREQUAL " \${CMAKE_BINARY_DIR}")
  message(FATAL_ERROR "FATAL: In-source builds are not allowed. You should create a separate directory for build files.")
endif()

#Dependencies
#find_package(pkgname CONFIG REQUIRED)
#add_subdirectory(subdir)

#Executable
add_executable(\${PROJECT_NAME}
#	src/deps/dep.cpp
	src/main.cpp
)

#Includes and linker
#target_include_directories(${PROJECT_NAME}
#	PRIVATE Dir
#)

#target_link_libraries(${PROJECT_NAME} 
#	PRIVATE Lib
#)
EOM

#Project structure
mkdir src
cat > src/main.cpp <<- EOM
#include <iostream>

int main(void) {
    std::cout << "Hello world!";
}
EOM