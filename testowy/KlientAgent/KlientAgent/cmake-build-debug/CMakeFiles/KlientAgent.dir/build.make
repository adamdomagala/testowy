# CMAKE generated file: DO NOT EDIT!
# Generated by "MinGW Makefiles" Generator, CMake Version 3.9

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

SHELL = cmd.exe

# The CMake executable.
CMAKE_COMMAND = "C:\Program Files\JetBrains\CLion 2017.3.2\bin\cmake\bin\cmake.exe"

# The command to remove a file.
RM = "C:\Program Files\JetBrains\CLion 2017.3.2\bin\cmake\bin\cmake.exe" -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = C:\Users\Rafal\CLionProjects\KlientAgent

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = C:\Users\Rafal\CLionProjects\KlientAgent\cmake-build-debug

# Include any dependencies generated for this target.
include CMakeFiles/KlientAgent.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/KlientAgent.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/KlientAgent.dir/flags.make

CMakeFiles/KlientAgent.dir/main.c.obj: CMakeFiles/KlientAgent.dir/flags.make
CMakeFiles/KlientAgent.dir/main.c.obj: ../main.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=C:\Users\Rafal\CLionProjects\KlientAgent\cmake-build-debug\CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object CMakeFiles/KlientAgent.dir/main.c.obj"
	C:\PROGRA~1\MINGW-~1\X86_64~1.0-W\mingw64\bin\gcc.exe $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles\KlientAgent.dir\main.c.obj   -c C:\Users\Rafal\CLionProjects\KlientAgent\main.c

CMakeFiles/KlientAgent.dir/main.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/KlientAgent.dir/main.c.i"
	C:\PROGRA~1\MINGW-~1\X86_64~1.0-W\mingw64\bin\gcc.exe $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E C:\Users\Rafal\CLionProjects\KlientAgent\main.c > CMakeFiles\KlientAgent.dir\main.c.i

CMakeFiles/KlientAgent.dir/main.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/KlientAgent.dir/main.c.s"
	C:\PROGRA~1\MINGW-~1\X86_64~1.0-W\mingw64\bin\gcc.exe $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S C:\Users\Rafal\CLionProjects\KlientAgent\main.c -o CMakeFiles\KlientAgent.dir\main.c.s

CMakeFiles/KlientAgent.dir/main.c.obj.requires:

.PHONY : CMakeFiles/KlientAgent.dir/main.c.obj.requires

CMakeFiles/KlientAgent.dir/main.c.obj.provides: CMakeFiles/KlientAgent.dir/main.c.obj.requires
	$(MAKE) -f CMakeFiles\KlientAgent.dir\build.make CMakeFiles/KlientAgent.dir/main.c.obj.provides.build
.PHONY : CMakeFiles/KlientAgent.dir/main.c.obj.provides

CMakeFiles/KlientAgent.dir/main.c.obj.provides.build: CMakeFiles/KlientAgent.dir/main.c.obj


# Object files for target KlientAgent
KlientAgent_OBJECTS = \
"CMakeFiles/KlientAgent.dir/main.c.obj"

# External object files for target KlientAgent
KlientAgent_EXTERNAL_OBJECTS =

KlientAgent.exe: CMakeFiles/KlientAgent.dir/main.c.obj
KlientAgent.exe: CMakeFiles/KlientAgent.dir/build.make
KlientAgent.exe: CMakeFiles/KlientAgent.dir/linklibs.rsp
KlientAgent.exe: CMakeFiles/KlientAgent.dir/objects1.rsp
KlientAgent.exe: CMakeFiles/KlientAgent.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=C:\Users\Rafal\CLionProjects\KlientAgent\cmake-build-debug\CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking C executable KlientAgent.exe"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles\KlientAgent.dir\link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/KlientAgent.dir/build: KlientAgent.exe

.PHONY : CMakeFiles/KlientAgent.dir/build

CMakeFiles/KlientAgent.dir/requires: CMakeFiles/KlientAgent.dir/main.c.obj.requires

.PHONY : CMakeFiles/KlientAgent.dir/requires

CMakeFiles/KlientAgent.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles\KlientAgent.dir\cmake_clean.cmake
.PHONY : CMakeFiles/KlientAgent.dir/clean

CMakeFiles/KlientAgent.dir/depend:
	$(CMAKE_COMMAND) -E cmake_depends "MinGW Makefiles" C:\Users\Rafal\CLionProjects\KlientAgent C:\Users\Rafal\CLionProjects\KlientAgent C:\Users\Rafal\CLionProjects\KlientAgent\cmake-build-debug C:\Users\Rafal\CLionProjects\KlientAgent\cmake-build-debug C:\Users\Rafal\CLionProjects\KlientAgent\cmake-build-debug\CMakeFiles\KlientAgent.dir\DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/KlientAgent.dir/depend

