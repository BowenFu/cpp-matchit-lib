# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.16

# Default target executed when no arguments are given to make.
default_target: all

.PHONY : default_target

# Allow only one "make -f Makefile2" at a time, but pass parallelism.
.NOTPARALLEL:


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
CMAKE_COMMAND = /usr/local/Cellar/cmake/3.16.5/bin/cmake

# The command to remove a file.
RM = /usr/local/Cellar/cmake/3.16.5/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /Users/fubowen/Git/Codes/matchit

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /Users/fubowen/Git/Codes/matchit

#=============================================================================
# Targets provided globally by CMake.

# Special rule for the target install/strip
install/strip: preinstall
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --cyan "Installing the project stripped..."
	/usr/local/Cellar/cmake/3.16.5/bin/cmake -DCMAKE_INSTALL_DO_STRIP=1 -P cmake_install.cmake
.PHONY : install/strip

# Special rule for the target install/strip
install/strip/fast: preinstall/fast
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --cyan "Installing the project stripped..."
	/usr/local/Cellar/cmake/3.16.5/bin/cmake -DCMAKE_INSTALL_DO_STRIP=1 -P cmake_install.cmake
.PHONY : install/strip/fast

# Special rule for the target install/local
install/local: preinstall
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --cyan "Installing only the local directory..."
	/usr/local/Cellar/cmake/3.16.5/bin/cmake -DCMAKE_INSTALL_LOCAL_ONLY=1 -P cmake_install.cmake
.PHONY : install/local

# Special rule for the target install/local
install/local/fast: preinstall/fast
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --cyan "Installing only the local directory..."
	/usr/local/Cellar/cmake/3.16.5/bin/cmake -DCMAKE_INSTALL_LOCAL_ONLY=1 -P cmake_install.cmake
.PHONY : install/local/fast

# Special rule for the target list_install_components
list_install_components:
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --cyan "Available install components are: \"Unspecified\""
.PHONY : list_install_components

# Special rule for the target list_install_components
list_install_components/fast: list_install_components

.PHONY : list_install_components/fast

# Special rule for the target rebuild_cache
rebuild_cache:
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --cyan "Running CMake to regenerate build system..."
	/usr/local/Cellar/cmake/3.16.5/bin/cmake -S$(CMAKE_SOURCE_DIR) -B$(CMAKE_BINARY_DIR)
.PHONY : rebuild_cache

# Special rule for the target rebuild_cache
rebuild_cache/fast: rebuild_cache

.PHONY : rebuild_cache/fast

# Special rule for the target install
install: preinstall
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --cyan "Install the project..."
	/usr/local/Cellar/cmake/3.16.5/bin/cmake -P cmake_install.cmake
.PHONY : install

# Special rule for the target install
install/fast: preinstall/fast
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --cyan "Install the project..."
	/usr/local/Cellar/cmake/3.16.5/bin/cmake -P cmake_install.cmake
.PHONY : install/fast

# Special rule for the target test
test:
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --cyan "Running tests..."
	/usr/local/Cellar/cmake/3.16.5/bin/ctest --force-new-ctest-process $(ARGS)
.PHONY : test

# Special rule for the target test
test/fast: test

.PHONY : test/fast

# Special rule for the target edit_cache
edit_cache:
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --cyan "Running CMake cache editor..."
	/usr/local/Cellar/cmake/3.16.5/bin/ccmake -S$(CMAKE_SOURCE_DIR) -B$(CMAKE_BINARY_DIR)
.PHONY : edit_cache

# Special rule for the target edit_cache
edit_cache/fast: edit_cache

.PHONY : edit_cache/fast

# The main all target
all: cmake_check_build_system
	$(CMAKE_COMMAND) -E cmake_progress_start /Users/fubowen/Git/Codes/matchit/CMakeFiles /Users/fubowen/Git/Codes/matchit/CMakeFiles/progress.marks
	$(MAKE) -f CMakeFiles/Makefile2 all
	$(CMAKE_COMMAND) -E cmake_progress_start /Users/fubowen/Git/Codes/matchit/CMakeFiles 0
.PHONY : all

# The main clean target
clean:
	$(MAKE) -f CMakeFiles/Makefile2 clean
.PHONY : clean

# The main clean target
clean/fast: clean

.PHONY : clean/fast

# Prepare targets for installation.
preinstall: all
	$(MAKE) -f CMakeFiles/Makefile2 preinstall
.PHONY : preinstall

# Prepare targets for installation.
preinstall/fast:
	$(MAKE) -f CMakeFiles/Makefile2 preinstall
.PHONY : preinstall/fast

# clear depends
depend:
	$(CMAKE_COMMAND) -S$(CMAKE_SOURCE_DIR) -B$(CMAKE_BINARY_DIR) --check-build-system CMakeFiles/Makefile.cmake 1
.PHONY : depend

#=============================================================================
# Target rules for targets named ContinuousCoverage

# Build rule for target.
ContinuousCoverage: cmake_check_build_system
	$(MAKE) -f CMakeFiles/Makefile2 ContinuousCoverage
.PHONY : ContinuousCoverage

# fast build rule for target.
ContinuousCoverage/fast:
	$(MAKE) -f CMakeFiles/ContinuousCoverage.dir/build.make CMakeFiles/ContinuousCoverage.dir/build
.PHONY : ContinuousCoverage/fast

#=============================================================================
# Target rules for targets named ContinuousTest

# Build rule for target.
ContinuousTest: cmake_check_build_system
	$(MAKE) -f CMakeFiles/Makefile2 ContinuousTest
.PHONY : ContinuousTest

# fast build rule for target.
ContinuousTest/fast:
	$(MAKE) -f CMakeFiles/ContinuousTest.dir/build.make CMakeFiles/ContinuousTest.dir/build
.PHONY : ContinuousTest/fast

#=============================================================================
# Target rules for targets named ContinuousBuild

# Build rule for target.
ContinuousBuild: cmake_check_build_system
	$(MAKE) -f CMakeFiles/Makefile2 ContinuousBuild
.PHONY : ContinuousBuild

# fast build rule for target.
ContinuousBuild/fast:
	$(MAKE) -f CMakeFiles/ContinuousBuild.dir/build.make CMakeFiles/ContinuousBuild.dir/build
.PHONY : ContinuousBuild/fast

#=============================================================================
# Target rules for targets named ContinuousStart

# Build rule for target.
ContinuousStart: cmake_check_build_system
	$(MAKE) -f CMakeFiles/Makefile2 ContinuousStart
.PHONY : ContinuousStart

# fast build rule for target.
ContinuousStart/fast:
	$(MAKE) -f CMakeFiles/ContinuousStart.dir/build.make CMakeFiles/ContinuousStart.dir/build
.PHONY : ContinuousStart/fast

#=============================================================================
# Target rules for targets named ExperimentalCoverage

# Build rule for target.
ExperimentalCoverage: cmake_check_build_system
	$(MAKE) -f CMakeFiles/Makefile2 ExperimentalCoverage
.PHONY : ExperimentalCoverage

# fast build rule for target.
ExperimentalCoverage/fast:
	$(MAKE) -f CMakeFiles/ExperimentalCoverage.dir/build.make CMakeFiles/ExperimentalCoverage.dir/build
.PHONY : ExperimentalCoverage/fast

#=============================================================================
# Target rules for targets named ExperimentalSubmit

# Build rule for target.
ExperimentalSubmit: cmake_check_build_system
	$(MAKE) -f CMakeFiles/Makefile2 ExperimentalSubmit
.PHONY : ExperimentalSubmit

# fast build rule for target.
ExperimentalSubmit/fast:
	$(MAKE) -f CMakeFiles/ExperimentalSubmit.dir/build.make CMakeFiles/ExperimentalSubmit.dir/build
.PHONY : ExperimentalSubmit/fast

#=============================================================================
# Target rules for targets named ExperimentalBuild

# Build rule for target.
ExperimentalBuild: cmake_check_build_system
	$(MAKE) -f CMakeFiles/Makefile2 ExperimentalBuild
.PHONY : ExperimentalBuild

# fast build rule for target.
ExperimentalBuild/fast:
	$(MAKE) -f CMakeFiles/ExperimentalBuild.dir/build.make CMakeFiles/ExperimentalBuild.dir/build
.PHONY : ExperimentalBuild/fast

#=============================================================================
# Target rules for targets named ExperimentalStart

# Build rule for target.
ExperimentalStart: cmake_check_build_system
	$(MAKE) -f CMakeFiles/Makefile2 ExperimentalStart
.PHONY : ExperimentalStart

# fast build rule for target.
ExperimentalStart/fast:
	$(MAKE) -f CMakeFiles/ExperimentalStart.dir/build.make CMakeFiles/ExperimentalStart.dir/build
.PHONY : ExperimentalStart/fast

#=============================================================================
# Target rules for targets named ContinuousSubmit

# Build rule for target.
ContinuousSubmit: cmake_check_build_system
	$(MAKE) -f CMakeFiles/Makefile2 ContinuousSubmit
.PHONY : ContinuousSubmit

# fast build rule for target.
ContinuousSubmit/fast:
	$(MAKE) -f CMakeFiles/ContinuousSubmit.dir/build.make CMakeFiles/ContinuousSubmit.dir/build
.PHONY : ContinuousSubmit/fast

#=============================================================================
# Target rules for targets named ExperimentalTest

# Build rule for target.
ExperimentalTest: cmake_check_build_system
	$(MAKE) -f CMakeFiles/Makefile2 ExperimentalTest
.PHONY : ExperimentalTest

# fast build rule for target.
ExperimentalTest/fast:
	$(MAKE) -f CMakeFiles/ExperimentalTest.dir/build.make CMakeFiles/ExperimentalTest.dir/build
.PHONY : ExperimentalTest/fast

#=============================================================================
# Target rules for targets named NightlySubmit

# Build rule for target.
NightlySubmit: cmake_check_build_system
	$(MAKE) -f CMakeFiles/Makefile2 NightlySubmit
.PHONY : NightlySubmit

# fast build rule for target.
NightlySubmit/fast:
	$(MAKE) -f CMakeFiles/NightlySubmit.dir/build.make CMakeFiles/NightlySubmit.dir/build
.PHONY : NightlySubmit/fast

#=============================================================================
# Target rules for targets named NightlyMemCheck

# Build rule for target.
NightlyMemCheck: cmake_check_build_system
	$(MAKE) -f CMakeFiles/Makefile2 NightlyMemCheck
.PHONY : NightlyMemCheck

# fast build rule for target.
NightlyMemCheck/fast:
	$(MAKE) -f CMakeFiles/NightlyMemCheck.dir/build.make CMakeFiles/NightlyMemCheck.dir/build
.PHONY : NightlyMemCheck/fast

#=============================================================================
# Target rules for targets named ExperimentalConfigure

# Build rule for target.
ExperimentalConfigure: cmake_check_build_system
	$(MAKE) -f CMakeFiles/Makefile2 ExperimentalConfigure
.PHONY : ExperimentalConfigure

# fast build rule for target.
ExperimentalConfigure/fast:
	$(MAKE) -f CMakeFiles/ExperimentalConfigure.dir/build.make CMakeFiles/ExperimentalConfigure.dir/build
.PHONY : ExperimentalConfigure/fast

#=============================================================================
# Target rules for targets named NightlyCoverage

# Build rule for target.
NightlyCoverage: cmake_check_build_system
	$(MAKE) -f CMakeFiles/Makefile2 NightlyCoverage
.PHONY : NightlyCoverage

# fast build rule for target.
NightlyCoverage/fast:
	$(MAKE) -f CMakeFiles/NightlyCoverage.dir/build.make CMakeFiles/NightlyCoverage.dir/build
.PHONY : NightlyCoverage/fast

#=============================================================================
# Target rules for targets named NightlyTest

# Build rule for target.
NightlyTest: cmake_check_build_system
	$(MAKE) -f CMakeFiles/Makefile2 NightlyTest
.PHONY : NightlyTest

# fast build rule for target.
NightlyTest/fast:
	$(MAKE) -f CMakeFiles/NightlyTest.dir/build.make CMakeFiles/NightlyTest.dir/build
.PHONY : NightlyTest/fast

#=============================================================================
# Target rules for targets named ContinuousMemCheck

# Build rule for target.
ContinuousMemCheck: cmake_check_build_system
	$(MAKE) -f CMakeFiles/Makefile2 ContinuousMemCheck
.PHONY : ContinuousMemCheck

# fast build rule for target.
ContinuousMemCheck/fast:
	$(MAKE) -f CMakeFiles/ContinuousMemCheck.dir/build.make CMakeFiles/ContinuousMemCheck.dir/build
.PHONY : ContinuousMemCheck/fast

#=============================================================================
# Target rules for targets named NightlyBuild

# Build rule for target.
NightlyBuild: cmake_check_build_system
	$(MAKE) -f CMakeFiles/Makefile2 NightlyBuild
.PHONY : NightlyBuild

# fast build rule for target.
NightlyBuild/fast:
	$(MAKE) -f CMakeFiles/NightlyBuild.dir/build.make CMakeFiles/NightlyBuild.dir/build
.PHONY : NightlyBuild/fast

#=============================================================================
# Target rules for targets named NightlyConfigure

# Build rule for target.
NightlyConfigure: cmake_check_build_system
	$(MAKE) -f CMakeFiles/Makefile2 NightlyConfigure
.PHONY : NightlyConfigure

# fast build rule for target.
NightlyConfigure/fast:
	$(MAKE) -f CMakeFiles/NightlyConfigure.dir/build.make CMakeFiles/NightlyConfigure.dir/build
.PHONY : NightlyConfigure/fast

#=============================================================================
# Target rules for targets named NightlyUpdate

# Build rule for target.
NightlyUpdate: cmake_check_build_system
	$(MAKE) -f CMakeFiles/Makefile2 NightlyUpdate
.PHONY : NightlyUpdate

# fast build rule for target.
NightlyUpdate/fast:
	$(MAKE) -f CMakeFiles/NightlyUpdate.dir/build.make CMakeFiles/NightlyUpdate.dir/build
.PHONY : NightlyUpdate/fast

#=============================================================================
# Target rules for targets named ContinuousUpdate

# Build rule for target.
ContinuousUpdate: cmake_check_build_system
	$(MAKE) -f CMakeFiles/Makefile2 ContinuousUpdate
.PHONY : ContinuousUpdate

# fast build rule for target.
ContinuousUpdate/fast:
	$(MAKE) -f CMakeFiles/ContinuousUpdate.dir/build.make CMakeFiles/ContinuousUpdate.dir/build
.PHONY : ContinuousUpdate/fast

#=============================================================================
# Target rules for targets named ExperimentalUpdate

# Build rule for target.
ExperimentalUpdate: cmake_check_build_system
	$(MAKE) -f CMakeFiles/Makefile2 ExperimentalUpdate
.PHONY : ExperimentalUpdate

# fast build rule for target.
ExperimentalUpdate/fast:
	$(MAKE) -f CMakeFiles/ExperimentalUpdate.dir/build.make CMakeFiles/ExperimentalUpdate.dir/build
.PHONY : ExperimentalUpdate/fast

#=============================================================================
# Target rules for targets named ContinuousConfigure

# Build rule for target.
ContinuousConfigure: cmake_check_build_system
	$(MAKE) -f CMakeFiles/Makefile2 ContinuousConfigure
.PHONY : ContinuousConfigure

# fast build rule for target.
ContinuousConfigure/fast:
	$(MAKE) -f CMakeFiles/ContinuousConfigure.dir/build.make CMakeFiles/ContinuousConfigure.dir/build
.PHONY : ContinuousConfigure/fast

#=============================================================================
# Target rules for targets named NightlyMemoryCheck

# Build rule for target.
NightlyMemoryCheck: cmake_check_build_system
	$(MAKE) -f CMakeFiles/Makefile2 NightlyMemoryCheck
.PHONY : NightlyMemoryCheck

# fast build rule for target.
NightlyMemoryCheck/fast:
	$(MAKE) -f CMakeFiles/NightlyMemoryCheck.dir/build.make CMakeFiles/NightlyMemoryCheck.dir/build
.PHONY : NightlyMemoryCheck/fast

#=============================================================================
# Target rules for targets named ExperimentalMemCheck

# Build rule for target.
ExperimentalMemCheck: cmake_check_build_system
	$(MAKE) -f CMakeFiles/Makefile2 ExperimentalMemCheck
.PHONY : ExperimentalMemCheck

# fast build rule for target.
ExperimentalMemCheck/fast:
	$(MAKE) -f CMakeFiles/ExperimentalMemCheck.dir/build.make CMakeFiles/ExperimentalMemCheck.dir/build
.PHONY : ExperimentalMemCheck/fast

#=============================================================================
# Target rules for targets named NightlyStart

# Build rule for target.
NightlyStart: cmake_check_build_system
	$(MAKE) -f CMakeFiles/Makefile2 NightlyStart
.PHONY : NightlyStart

# fast build rule for target.
NightlyStart/fast:
	$(MAKE) -f CMakeFiles/NightlyStart.dir/build.make CMakeFiles/NightlyStart.dir/build
.PHONY : NightlyStart/fast

#=============================================================================
# Target rules for targets named Nightly

# Build rule for target.
Nightly: cmake_check_build_system
	$(MAKE) -f CMakeFiles/Makefile2 Nightly
.PHONY : Nightly

# fast build rule for target.
Nightly/fast:
	$(MAKE) -f CMakeFiles/Nightly.dir/build.make CMakeFiles/Nightly.dir/build
.PHONY : Nightly/fast

#=============================================================================
# Target rules for targets named Continuous

# Build rule for target.
Continuous: cmake_check_build_system
	$(MAKE) -f CMakeFiles/Makefile2 Continuous
.PHONY : Continuous

# fast build rule for target.
Continuous/fast:
	$(MAKE) -f CMakeFiles/Continuous.dir/build.make CMakeFiles/Continuous.dir/build
.PHONY : Continuous/fast

#=============================================================================
# Target rules for targets named Experimental

# Build rule for target.
Experimental: cmake_check_build_system
	$(MAKE) -f CMakeFiles/Makefile2 Experimental
.PHONY : Experimental

# fast build rule for target.
Experimental/fast:
	$(MAKE) -f CMakeFiles/Experimental.dir/build.make CMakeFiles/Experimental.dir/build
.PHONY : Experimental/fast

#=============================================================================
# Target rules for targets named gmock

# Build rule for target.
gmock: cmake_check_build_system
	$(MAKE) -f CMakeFiles/Makefile2 gmock
.PHONY : gmock

# fast build rule for target.
gmock/fast:
	$(MAKE) -f _deps/googletest-build/googlemock/CMakeFiles/gmock.dir/build.make _deps/googletest-build/googlemock/CMakeFiles/gmock.dir/build
.PHONY : gmock/fast

#=============================================================================
# Target rules for targets named gmock_main

# Build rule for target.
gmock_main: cmake_check_build_system
	$(MAKE) -f CMakeFiles/Makefile2 gmock_main
.PHONY : gmock_main

# fast build rule for target.
gmock_main/fast:
	$(MAKE) -f _deps/googletest-build/googlemock/CMakeFiles/gmock_main.dir/build.make _deps/googletest-build/googlemock/CMakeFiles/gmock_main.dir/build
.PHONY : gmock_main/fast

#=============================================================================
# Target rules for targets named gtest_main

# Build rule for target.
gtest_main: cmake_check_build_system
	$(MAKE) -f CMakeFiles/Makefile2 gtest_main
.PHONY : gtest_main

# fast build rule for target.
gtest_main/fast:
	$(MAKE) -f _deps/googletest-build/googletest/CMakeFiles/gtest_main.dir/build.make _deps/googletest-build/googletest/CMakeFiles/gtest_main.dir/build
.PHONY : gtest_main/fast

#=============================================================================
# Target rules for targets named gtest

# Build rule for target.
gtest: cmake_check_build_system
	$(MAKE) -f CMakeFiles/Makefile2 gtest
.PHONY : gtest

# fast build rule for target.
gtest/fast:
	$(MAKE) -f _deps/googletest-build/googletest/CMakeFiles/gtest.dir/build.make _deps/googletest-build/googletest/CMakeFiles/gtest.dir/build
.PHONY : gtest/fast

#=============================================================================
# Target rules for targets named unittests

# Build rule for target.
unittests: cmake_check_build_system
	$(MAKE) -f CMakeFiles/Makefile2 unittests
.PHONY : unittests

# fast build rule for target.
unittests/fast:
	$(MAKE) -f test/matchit/CMakeFiles/unittests.dir/build.make test/matchit/CMakeFiles/unittests.dir/build
.PHONY : unittests/fast

#=============================================================================
# Target rules for targets named sumIs

# Build rule for target.
sumIs: cmake_check_build_system
	$(MAKE) -f CMakeFiles/Makefile2 sumIs
.PHONY : sumIs

# fast build rule for target.
sumIs/fast:
	$(MAKE) -f samples/CMakeFiles/sumIs.dir/build.make samples/CMakeFiles/sumIs.dir/build
.PHONY : sumIs/fast

#=============================================================================
# Target rules for targets named gcd

# Build rule for target.
gcd: cmake_check_build_system
	$(MAKE) -f CMakeFiles/Makefile2 gcd
.PHONY : gcd

# fast build rule for target.
gcd/fast:
	$(MAKE) -f samples/CMakeFiles/gcd.dir/build.make samples/CMakeFiles/gcd.dir/build
.PHONY : gcd/fast

#=============================================================================
# Target rules for targets named clip

# Build rule for target.
clip: cmake_check_build_system
	$(MAKE) -f CMakeFiles/Makefile2 clip
.PHONY : clip

# fast build rule for target.
clip/fast:
	$(MAKE) -f samples/CMakeFiles/clip.dir/build.make samples/CMakeFiles/clip.dir/build
.PHONY : clip/fast

#=============================================================================
# Target rules for targets named variantAny

# Build rule for target.
variantAny: cmake_check_build_system
	$(MAKE) -f CMakeFiles/Makefile2 variantAny
.PHONY : variantAny

# fast build rule for target.
variantAny/fast:
	$(MAKE) -f samples/CMakeFiles/variantAny.dir/build.make samples/CMakeFiles/variantAny.dir/build
.PHONY : variantAny/fast

#=============================================================================
# Target rules for targets named someNone

# Build rule for target.
someNone: cmake_check_build_system
	$(MAKE) -f CMakeFiles/Makefile2 someNone
.PHONY : someNone

# fast build rule for target.
someNone/fast:
	$(MAKE) -f samples/CMakeFiles/someNone.dir/build.make samples/CMakeFiles/someNone.dir/build
.PHONY : someNone/fast

#=============================================================================
# Target rules for targets named isValid

# Build rule for target.
isValid: cmake_check_build_system
	$(MAKE) -f CMakeFiles/Makefile2 isValid
.PHONY : isValid

# fast build rule for target.
isValid/fast:
	$(MAKE) -f samples/CMakeFiles/isValid.dir/build.make samples/CMakeFiles/isValid.dir/build
.PHONY : isValid/fast

#=============================================================================
# Target rules for targets named getClassName

# Build rule for target.
getClassName: cmake_check_build_system
	$(MAKE) -f CMakeFiles/Makefile2 getClassName
.PHONY : getClassName

# fast build rule for target.
getClassName/fast:
	$(MAKE) -f samples/CMakeFiles/getClassName.dir/build.make samples/CMakeFiles/getClassName.dir/build
.PHONY : getClassName/fast

#=============================================================================
# Target rules for targets named contains

# Build rule for target.
contains: cmake_check_build_system
	$(MAKE) -f CMakeFiles/Makefile2 contains
.PHONY : contains

# fast build rule for target.
contains/fast:
	$(MAKE) -f samples/CMakeFiles/contains.dir/build.make samples/CMakeFiles/contains.dir/build
.PHONY : contains/fast

#=============================================================================
# Target rules for targets named isLarge

# Build rule for target.
isLarge: cmake_check_build_system
	$(MAKE) -f CMakeFiles/Makefile2 isLarge
.PHONY : isLarge

# fast build rule for target.
isLarge/fast:
	$(MAKE) -f samples/CMakeFiles/isLarge.dir/build.make samples/CMakeFiles/isLarge.dir/build
.PHONY : isLarge/fast

#=============================================================================
# Target rules for targets named relu

# Build rule for target.
relu: cmake_check_build_system
	$(MAKE) -f CMakeFiles/Makefile2 relu
.PHONY : relu

# fast build rule for target.
relu/fast:
	$(MAKE) -f samples/CMakeFiles/relu.dir/build.make samples/CMakeFiles/relu.dir/build
.PHONY : relu/fast

#=============================================================================
# Target rules for targets named customAsPointer

# Build rule for target.
customAsPointer: cmake_check_build_system
	$(MAKE) -f CMakeFiles/Makefile2 customAsPointer
.PHONY : customAsPointer

# fast build rule for target.
customAsPointer/fast:
	$(MAKE) -f samples/CMakeFiles/customAsPointer.dir/build.make samples/CMakeFiles/customAsPointer.dir/build
.PHONY : customAsPointer/fast

#=============================================================================
# Target rules for targets named optionalLift

# Build rule for target.
optionalLift: cmake_check_build_system
	$(MAKE) -f CMakeFiles/Makefile2 optionalLift
.PHONY : optionalLift

# fast build rule for target.
optionalLift/fast:
	$(MAKE) -f samples/CMakeFiles/optionalLift.dir/build.make samples/CMakeFiles/optionalLift.dir/build
.PHONY : optionalLift/fast

#=============================================================================
# Target rules for targets named checkAndlogLarge

# Build rule for target.
checkAndlogLarge: cmake_check_build_system
	$(MAKE) -f CMakeFiles/Makefile2 checkAndlogLarge
.PHONY : checkAndlogLarge

# fast build rule for target.
checkAndlogLarge/fast:
	$(MAKE) -f samples/CMakeFiles/checkAndlogLarge.dir/build.make samples/CMakeFiles/checkAndlogLarge.dir/build
.PHONY : checkAndlogLarge/fast

#=============================================================================
# Target rules for targets named detectTuplePattern

# Build rule for target.
detectTuplePattern: cmake_check_build_system
	$(MAKE) -f CMakeFiles/Makefile2 detectTuplePattern
.PHONY : detectTuplePattern

# fast build rule for target.
detectTuplePattern/fast:
	$(MAKE) -f samples/CMakeFiles/detectTuplePattern.dir/build.make samples/CMakeFiles/detectTuplePattern.dir/build
.PHONY : detectTuplePattern/fast

#=============================================================================
# Target rules for targets named factorial

# Build rule for target.
factorial: cmake_check_build_system
	$(MAKE) -f CMakeFiles/Makefile2 factorial
.PHONY : factorial

# fast build rule for target.
factorial/fast:
	$(MAKE) -f samples/CMakeFiles/factorial.dir/build.make samples/CMakeFiles/factorial.dir/build
.PHONY : factorial/fast

#=============================================================================
# Target rules for targets named eval

# Build rule for target.
eval: cmake_check_build_system
	$(MAKE) -f CMakeFiles/Makefile2 eval
.PHONY : eval

# fast build rule for target.
eval/fast:
	$(MAKE) -f samples/CMakeFiles/eval.dir/build.make samples/CMakeFiles/eval.dir/build
.PHONY : eval/fast

#=============================================================================
# Target rules for targets named customDs

# Build rule for target.
customDs: cmake_check_build_system
	$(MAKE) -f CMakeFiles/Makefile2 customDs
.PHONY : customDs

# fast build rule for target.
customDs/fast:
	$(MAKE) -f samples/CMakeFiles/customDs.dir/build.make samples/CMakeFiles/customDs.dir/build
.PHONY : customDs/fast

# Help Target
help:
	@echo "The following are some of the valid targets for this Makefile:"
	@echo "... all (the default if no target is provided)"
	@echo "... clean"
	@echo "... depend"
	@echo "... install/strip"
	@echo "... install/local"
	@echo "... list_install_components"
	@echo "... rebuild_cache"
	@echo "... ContinuousCoverage"
	@echo "... ContinuousTest"
	@echo "... ContinuousBuild"
	@echo "... ContinuousStart"
	@echo "... ExperimentalCoverage"
	@echo "... ExperimentalSubmit"
	@echo "... ExperimentalBuild"
	@echo "... install"
	@echo "... ExperimentalStart"
	@echo "... ContinuousSubmit"
	@echo "... ExperimentalTest"
	@echo "... NightlySubmit"
	@echo "... NightlyMemCheck"
	@echo "... test"
	@echo "... ExperimentalConfigure"
	@echo "... NightlyCoverage"
	@echo "... NightlyTest"
	@echo "... ContinuousMemCheck"
	@echo "... NightlyBuild"
	@echo "... NightlyConfigure"
	@echo "... NightlyUpdate"
	@echo "... ContinuousUpdate"
	@echo "... ExperimentalUpdate"
	@echo "... edit_cache"
	@echo "... ContinuousConfigure"
	@echo "... NightlyMemoryCheck"
	@echo "... ExperimentalMemCheck"
	@echo "... NightlyStart"
	@echo "... Nightly"
	@echo "... Continuous"
	@echo "... Experimental"
	@echo "... gmock"
	@echo "... gmock_main"
	@echo "... gtest_main"
	@echo "... gtest"
	@echo "... unittests"
	@echo "... sumIs"
	@echo "... gcd"
	@echo "... clip"
	@echo "... variantAny"
	@echo "... someNone"
	@echo "... isValid"
	@echo "... getClassName"
	@echo "... contains"
	@echo "... isLarge"
	@echo "... relu"
	@echo "... customAsPointer"
	@echo "... optionalLift"
	@echo "... checkAndlogLarge"
	@echo "... detectTuplePattern"
	@echo "... factorial"
	@echo "... eval"
	@echo "... customDs"
.PHONY : help



#=============================================================================
# Special targets to cleanup operation of make.

# Special rule to run CMake to check the build system integrity.
# No rule that depends on this can have commands that come from listfiles
# because they might be regenerated.
cmake_check_build_system:
	$(CMAKE_COMMAND) -S$(CMAKE_SOURCE_DIR) -B$(CMAKE_BINARY_DIR) --check-build-system CMakeFiles/Makefile.cmake 0
.PHONY : cmake_check_build_system

