#------------------------------------------------------------------------------#
# This makefile was generated by 'cbp2make' tool rev.147                       #
#------------------------------------------------------------------------------#


WORKDIR = `pwd`

CC = gcc
CXX = g++
AR = ar
LD = g++
WINDRES = windres

INC  = -I/usr/local/include/opencv4 
INC += -I/home/ubuntu/opt/tensorflow 
INC += -I/home/ubuntu/opt/tensorflow/tensorflow/lite/tools/make/downloads/flatbuffers/include 
INC += -I/home/ubuntu/opt/tensorflow/tensorflow/lite/tools/make/downloads/absl 
LIBDIR  = -L/home/ubuntu/opt/tensorflow/tensorflow/lite/tools/make/gen/linux_aarch64/lib
LIBDIR += -L/home/ubuntu/opt/tensorflow/tensorflow/lite/tools/make/downloads/flatbuffers/build

CFLAGS = -O3 -Wall -fexceptions -pthread
RESINC = 
# STATIC_LIB  = /home/ubuntu/opt/tensorflow/tensorflow/lite/tools/make/gen/linux_aarch64/lib/libtensorflow-lite.a
# STATIC_LIB += /home/ubuntu/opt/tensorflow/tensorflow/lite/tools/make/downloads/flatbuffers/build/libflatbuffers.a
# with -L path 
STATIC_LIB  = -ltensorflow-lite
STATIC_LIB += -lflatbuffers
LDFLAGS = -O3 `pkg-config --libs --cflags opencv4` -pthread

INC_DEBUG = $(INC)
CFLAGS_DEBUG = $(CFLAGS) -g
RESINC_DEBUG = $(RESINC)
RCFLAGS_DEBUG = $(RCFLAGS)
LIBDIR_DEBUG = $(LIBDIR)
LIB_DEBUG = $(STATIC_LIB)
LDFLAGS_DEBUG = $(LDFLAGS)
OBJDIR_DEBUG = obj/Debug
DEP_DEBUG = 
OUT_DEBUG = bin/Debug/TestUnet

INC_RELEASE = $(INC)
CFLAGS_RELEASE = $(CFLAGS) -O3
RESINC_RELEASE = $(RESINC)
RCFLAGS_RELEASE = $(RCFLAGS)
LIBDIR_RELEASE = $(LIBDIR)
LIB_RELEASE = $(STATIC_LIB)
LDFLAGS_RELEASE = $(LDFLAGS) -s
OBJDIR_RELEASE = obj/Release
DEP_RELEASE = 
OUT_RELEASE = bin/Release/TestUnet

OBJ_DEBUG = $(OBJDIR_DEBUG)/Pose_single.o

OBJ_RELEASE = $(OBJDIR_RELEASE)/Pose_single.o

all: debug release

clean: clean_debug clean_release

before_debug: 
	test -d bin/Debug || mkdir -p bin/Debug
	test -d $(OBJDIR_DEBUG) || mkdir -p $(OBJDIR_DEBUG)

after_debug: 

debug: before_debug out_debug after_debug

out_debug: before_debug $(OBJ_DEBUG) $(DEP_DEBUG)
	$(LD) $(LIBDIR_DEBUG) -o $(OUT_DEBUG) $(OBJ_DEBUG)  $(LDFLAGS_DEBUG) $(LIB_DEBUG)

$(OBJDIR_DEBUG)/Pose_single.o: Pose_single.cpp
	$(CXX) $(CFLAGS_DEBUG) $(INC_DEBUG) -c Pose_single.cpp -o $(OBJDIR_DEBUG)/Pose_single.o

clean_debug: 
	rm -f $(OBJ_DEBUG) $(OUT_DEBUG)
	rm -rf bin/Debug
	rm -rf $(OBJDIR_DEBUG)

before_release: 
	test -d bin/Release || mkdir -p bin/Release
	test -d $(OBJDIR_RELEASE) || mkdir -p $(OBJDIR_RELEASE)

after_release: 

release: before_release out_release after_release

out_release: before_release $(OBJ_RELEASE) $(DEP_RELEASE)
	$(LD) $(LIBDIR_RELEASE) -o $(OUT_RELEASE) $(OBJ_RELEASE)  $(LDFLAGS_RELEASE) $(LIB_RELEASE)

$(OBJDIR_RELEASE)/Pose_single.o: Pose_single.cpp
	$(CXX) $(CFLAGS_RELEASE) $(INC_RELEASE) -c Pose_single.cpp -o $(OBJDIR_RELEASE)/Pose_single.o

clean_release: 
	rm -f $(OBJ_RELEASE) $(OUT_RELEASE)
	rm -rf bin/Release
	rm -rf $(OBJDIR_RELEASE)

.PHONY: before_debug after_debug clean_debug before_release after_release clean_release

