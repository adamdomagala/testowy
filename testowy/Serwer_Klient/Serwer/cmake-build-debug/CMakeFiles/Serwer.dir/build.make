# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.8

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list


# Suppress display of executed commands.
$(VERBOSE).SILENT:


# A target that is always out of date.
cmake_force:

.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /home/rafal/Pulpit/clion-2017.2.3/bin/cmake/bin/cmake

# The command to remove a file.
RM = /home/rafal/Pulpit/clion-2017.2.3/bin/cmake/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /root/CLionProjects/Serwer

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /root/CLionProjects/Serwer/cmake-build-debug

# Include any dependencies generated for this target.
include CMakeFiles/Serwer.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/Serwer.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/Serwer.dir/flags.make

CMakeFiles/Serwer.dir/main.c.o: CMakeFiles/Serwer.dir/flags.make
CMakeFiles/Serwer.dir/main.c.o: ../main.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/root/CLionProjects/Serwer/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object CMakeFiles/Serwer.dir/main.c.o"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/Serwer.dir/main.c.o   -c /root/CLionProjects/Serwer/main.c

CMakeFiles/Serwer.dir/main.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/Serwer.dir/main.c.i"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /root/CLionProjects/Serwer/main.c > CMakeFiles/Serwer.dir/main.c.i

CMakeFiles/Serwer.dir/main.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/Serwer.dir/main.c.s"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /root/CLionProjects/Serwer/main.c -o CMakeFiles/Serwer.dir/main.c.s

CMakeFiles/Serwer.dir/main.c.o.requires:

.PHONY : CMakeFiles/Serwer.dir/main.c.o.requires

CMakeFiles/Serwer.dir/main.c.o.provides: CMakeFiles/Serwer.dir/main.c.o.requires
	$(MAKE) -f CMakeFiles/Serwer.dir/build.make CMakeFiles/Serwer.dir/main.c.o.provides.build
.PHONY : CMakeFiles/Serwer.dir/main.c.o.provides

CMakeFiles/Serwer.dir/main.c.o.provides.build: CMakeFiles/Serwer.dir/main.c.o


# Object files for target Serwer
Serwer_OBJECTS = \
"CMakeFiles/Serwer.dir/main.c.o"

# External object files for target Serwer
Serwer_EXTERNAL_OBJECTS =

Serwer: CMakeFiles/Serwer.dir/main.c.o
Serwer: CMakeFiles/Serwer.dir/build.make
Serwer: CMakeFiles/Serwer.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/root/CLionProjects/Serwer/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking C executable Serwer"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/Serwer.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/Serwer.dir/build: Serwer

.PHONY : CMakeFiles/Serwer.dir/build

CMakeFiles/Serwer.dir/requires: CMakeFiles/Serwer.dir/main.c.o.requires

.PHONY : CMakeFiles/Serwer.dir/requires

CMakeFiles/Serwer.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/Serwer.dir/cmake_clean.cmake
.PHONY : CMakeFiles/Serwer.dir/clean

CMakeFiles/Serwer.dir/depend:
	cd /root/CLionProjects/Serwer/cmake-build-debug && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /root/CLionProjects/Serwer /root/CLionProjects/Serwer /root/CLionProjects/Serwer/cmake-build-debug /root/CLionProjects/Serwer/cmake-build-debug /root/CLionProjects/Serwer/cmake-build-debug/CMakeFiles/Serwer.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/Serwer.dir/depend

