# CPP Bootstrap

Small shell file that sets up the following:

* Checks if you want to clear the current working directory
* `git init` and `.gitignore` ignoring `build` and `out` directories
* add vcpkg (Microsoft's C++ package manager) as a git submodule and bootstrap
* `CMakeLists.txt` with the appropriate vcpkg toolchain file and commented out scaffolding (works as-is to build and run Hello World)
* `src/main.cpp` with Hello World program

## Why?

As a front-end dev spoiled on NPM, I have found C++ dependency management and build tooling to be vexing at best. I made this script to help me get a quick start on simple C++ projects without several Google searches to jog my memory. It's my hope that this script may help others get up and running quickly, and provide a minimal example of how to set up a decent build and dependency management solution.

## Instructions

Place the appropriate .sh file (`newCpp.sh` for Linux and Mac, `newCpp-win.sh` for Windows) where you would like it, or put it in your path for a quick C++ project setup. The only difference in the two `.sh` files is whether the script calls `./vcpkg/bootstrap-vcpkg.bat` or `./vcpkg/bootstrap-vcpkg.sh`.

On Windows, the `.sh` file should run just fine if you have git intalled; PowerShell should trigger Git Bash to run the file in another window without any setup on your part.

Usage depends on your tooling, but it is very easy to get running in Visual Studio proper (NOT Code); choose "Open Folder" and VS will run CMake for you. Then, just click "Play" to build and run.

To install dependencies, use `./vcpkg/vcpkg install ...` - see [vcpkg documentation](https://github.com/microsoft/vcpkg). Add your vcpkg dependencies to your `CMakeLists.txt` file, then include headers using `#include <whateverHeader>`.

## Requirements

It is expected that you have git installed on your system.

## Caveats

It is expected that your `CMakeLists.txt` will not be sufficient for your project as you add more modular `.cpp` files and external dependencies. Check out the [CMake documentation](https://cmake.org/documentation/). I've included a few simple functions to demonstrate how to include subdirectories, link libraries, and include directories.