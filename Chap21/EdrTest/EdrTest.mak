# This is the Gnu makefile for the EdrTest program found
# on p. 1249 of the book "Programming Windows Fifth Edition"
# by Charles Petzold.

# John Kopplin   www.computersciencelab.com

PROGRAM = EdrTest.exe

DLL_NAME    = EdrLib.dll
DLL_EXP_LIB = libEdrLib.a


ifndef WINE
CC      = gcc
WRES    = windres
else
CC      = winegcc
WRES    = wrc
endif

ifdef DEBUG
ODIR    = Debug
CFLAGS  = -g -D_DEBUG -mno-cygwin
LIBDIRS = -L ./Debug
else
ODIR    = Release
CFLAGS  = -mno-cygwin
LIBDIRS = -L ./Release
endif

SRCDIR  = .
INCDIRS =
LIBS    = -mno-cygwin -mwindows -lcomctl32 -lcomdlg32 -lwinmm -ladvapi32 -lwinspool

DLL_LDFLAGS = 
DLL_LDLIBS  = -mwindows

SRCS     = $(SRCDIR)/EdrTest.c
OBJS     = $(ODIR)/EdrTest.o
HDRS     =

DLL_SRCS = $(SRCDIR)/EdrLib.c
DLL_OBJS = $(ODIR)/EdrLib.o
DLL_HDRS = $(SRCDIR)/EdrLib.h

ALLOBJS  = $(OBJS) \
           $(DLL_OBJS)

ALLBIN   = $(ODIR)/$(PROGRAM) \
           $(ODIR)/$(DLL_NAME) \
           $(ODIR)/$(DLL_EXP_LIB)




all: $(ODIR)/$(PROGRAM)

cleanobjs:
	rm -f $(ALLOBJS)

cleanbin:
	rm -f $(ALLBIN)

clean: cleanobjs cleanbin

cleanall: cleanobjs cleanbin

# You can find documentation on how to create a DLL using the MinGW tools at:
#   http://webclub.kcom.ne.jp/ma/colinp/win32/dll/make.html
# These other web pages describe the older technique involving the dlltool
# and dllwrap utilities:
#   http://www.mingw.org/docs.shtml
#   http://www.nanotech.wisc.edu/~khan/software/gnu-win32/dllhelpers.html

$(ODIR)/$(DLL_NAME): $(DLL_OBJS) $(DLL_HDRS) $(ODIR)
	$(CC) $(CFLAGS) -shared -o $(ODIR)/$(DLL_NAME) $(DLL_OBJS) \
       $(DLL_LDFLAGS) $(DLL_LDLIBS) -Wl,--out-implib,$(ODIR)/$(DLL_EXP_LIB)

# The -Wl switch says to pass the following item on to the linker.
# The --out-implib switch requests the creation of an import library.

   
$(DLL_OBJS) : $(DLL_SRCS) $(DLL_HDRS) $(ODIR)
	$(CC) $(CFLAGS) -c -o $(DLL_OBJS) $(DLL_SRCS)

$(ODIR)/$(PROGRAM): $(OBJS) $(HDRS) $(ODIR)/$(DLL_NAME)
	$(CC) -o $(ODIR)/$(PROGRAM) $(OBJS) $(INCDIRS) $(LIBDIRS) $(LIBS) -lEdrLib

$(ODIR)/%.res : %.rc $(HDRS) $(ODIR)
	$(WRES) --use-temp-file -O coff $< $@

$(ODIR)/%.o : %.cpp $(HDRS) $(ODIR)
	$(CC) $(CFLAGS) -c $(INCDIRS) -o $@ $<

$(ODIR)/%.o : %.c $(HDRS) $(ODIR)
	$(CC) $(CFLAGS) -c $(INCDIRS) -o $@ $<

$(ODIR):
	mkdir $@
