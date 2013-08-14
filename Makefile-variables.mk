CC = g++
CFLAGS = -Wall -g -std=c++0x

OCV_INC = C:\opencv\build\include
BOOST_INC = C:\boost_1_54_0

INC_PATHS = -I$(OCV_INC) -I$(BOOST_INC)

OCV_LIBS = -lopencv_highgui246 -lopencv_imgproc246 -lopencv_core246
BOOST_LIBS = -lboost_program_options-mgw46-1_54 -lboost_filesystem-mgw46-1_54 -lboost_system-mgw46-1_54

OCV_LIB_STATIC_ROOT = C:\Users\Bugra\Desktop\opencvbin
OCV_LIB_DYN_ROOT = C:\Users\ebemunk\Downloads\opencv\release\lib
BOOST_LIB_ROOT = C:\boost_1_54_0\release\boost\bin.v2\libs

DYNAMIC_LINK =

ifdef DYNAMIC_LINK
LDFLAGS = -L$(OCV_LIB_DYN_ROOT) \
		$(OCV_LIBS) \
		-L$(BOOST_LIB_ROOT)\program_options\build\gcc-mingw-4.6.2\release \
		-L$(BOOST_LIB_ROOT)\filesystem\build\gcc-mingw-4.6.2\release \
		-L$(BOOST_LIB_ROOT)\system\build\gcc-mingw-4.6.2\release \
		$(BOOST_LIBS)
EXE_NAME = phoenix-dyn.exe
else
LDFLAGS = -L$(OCV_LIB_STATIC_ROOT)\3rdparty\lib \
		-L$(OCV_LIB_STATIC_ROOT)\lib \
		$(OCV_LIBS) \
		-lzlib -lIlmImf -llibjpeg -llibtiff -llibpng -llibjasper -lcomctl32 -lgdi32 \
		-L$(BOOST_LIB_ROOT)\program_options\build\gcc-mingw-4.6.2\release\link-static \
		-L$(BOOST_LIB_ROOT)\filesystem\build\gcc-mingw-4.6.2\release\link-static \
		-L$(BOOST_LIB_ROOT)\system\build\gcc-mingw-4.6.2\release\link-static \
		$(BOOST_LIBS) \
		-static
EXE_NAME = phoenix.exe
endif