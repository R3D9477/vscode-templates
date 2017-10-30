APPNAME ?= main

SRCDIR ?= src
INCDIR ?= include

DBGBINDIR ?= bin/debug
DBGOBJDIR ?= obj/debug
RELBINDIR ?= bin/release
RELOBJDIR ?= obj/release

ifeq ($(OS),Windows_NT)
	TARGETOS ?= windows
	APPEXT ?= .exe
	LIBEXT ?= .dll

	RM = del
	MKDIR = mkdir -p
    
    ifeq ($(PROCESSOR_ARCHITEW6432),AMD64)
    	TARGETARCH ?= x86_64
    else
        ifeq ($(PROCESSOR_ARCHITECTURE),AMD64)
        	TARGETARCH ?= x86_64
        endif
        ifeq ($(PROCESSOR_ARCHITECTURE),x86)
        	TARGETARCH ?= x86
        endif
    endif
else
	RM = rm -f
	MKDIR = mkdir -p
    
    UNAME_S := $(shell uname -s)
    ifeq ($(UNAME_S),Linux)
    	TARGETOS ?= linux
    	APPEXT ?=
    	LIBEXT ?= .so
    endif
    
    UNAME_P := $(shell uname -p)
    ifeq ($(UNAME_P),x86_64)
    	TARGETARCH ?= x86_64
    endif
    ifneq ($(filter %86,$(UNAME_P)),)
    	TARGETARCH ?= x86
    endif
    ifneq ($(filter arm%,$(UNAME_P)),)
    	TARGETARCH ?= arm
    endif
endif

CC ?= gcc

CLFLAGS ?= -I$(ESCINCDIR)
CCFLAGS ?= -Wall -Werror -fPIC

ifeq ($(TARGETOS),windows)
	CCFLAGS += -D WIN32
endif
ifeq ($(TARGETOS),linux)
	CCFLAGS += -D LINUX
endif

ifeq ($(TARGETARCH),x86_64)
	CCFLAGS += -D AMD64
endif
ifeq ($(TARGETARCH),x86)
	CCFLAGS += -D IA32
endif
ifeq ($(TARGETARCH),arm)
	CCFLAGS += -D ARM
endif

empty =
space = $(empty) $(empty)
escspace = $(empty)\ $(empty)
ESCSRCDIR = $(subst $(space),$(escspace),$(SRCDIR))
ESCINCDIR = $(subst $(space),$(escspace),$(INCDIR))
ESCAPPNAME = $(subst $(space),$(escspace),$(APPNAME))$(subst $(space),$(escspace),$(APPEXT))
ESCLIBNAME = $(subst $(space),$(escspace),$(APPNAME))
ESCDBGBINDIR = $(subst $(space),$(escspace),$(DBGBINDIR))
ESCDBGOBJDIR = $(subst $(space),$(escspace),$(DBGOBJDIR))
ESCRELBINDIR = $(subst $(space),$(escspace),$(RELBINDIR))
ESCRELOBJDIR = $(subst $(space),$(escspace),$(RELOBJDIR))

SRCS = $(wildcard $(ESCSRCDIR)/*.c)

DBGTARGET = $(ESCDBGBINDIR)/$(ESCAPPNAME)
DBGOBJS   = $(SRCS:$(ESCSRCDIR)/%.c=$(ESCDBGOBJDIR)/%.o)
DBGCFLAGS = -g3 -DDEBUG

RELTARGET = $(ESCRELBINDIR)/$(ESCAPPNAME)
RELOBJS   = $(SRCS:$(ESCSRCDIR)/%.c=$(ESCRELOBJDIR)/%.o)
RELCFLAGS = -O3 -DNDEBUG

LDFLAGS ?= -Wall
LDLIBS  ?= -l$(ESCLIBNAME)

.PHONY: clean build_debug rebuild_debug build_release rebuild_release

build_debug: prep debug
build_release: prep release

debug: $(DBGTARGET)

LDFLAGS += -Wl,-rpath=$(DBGBINDIR)
LDFLAGS += -L$(DBGBINDIR)

$(ESCDBGOBJDIR)/%.o: $(ESCSRCDIR)/%.c
	$(CC) $(CLFLAGS) $(DBGCFLAGS) $(CCFLAGS) -c $< -o "$@"

$(DBGTARGET): $(DBGOBJS)
	$(CC) $(LDFLAGS) $(DBGCFLAGS) $^ $(LDLIBS) -o "$@"

release: $(RELTARGET)

LDFLAGS += -Wl,-rpath=$(RELBINDIR)
LDFLAGS += -L$(RELBINDIR)

$(ESCRELOBJDIR)/%.o: $(ESCSRCDIR)/%.c
	$(CC) $(CLFLAGS) $(RELCFLAGS) $(CCFLAGS) -c $< -o "$@"

$(RELTARGET): $(RELOBJS)
	$(CC) $(LDFLAGS) $(RELCFLAGS) $^ $(LDLIBS) -o "$@"

prep:
	$(MKDIR) $(DBGBINDIR)
	$(MKDIR) $(DBGOBJDIR)
	$(MKDIR) $(RELBINDIR)
	$(MKDIR) $(RELOBJDIR)

clean:
	$(RM) $(DBGTARGET)
	$(RM) $(DBGOBJS)
	$(RM) $(RELTARGET)
	$(RM) $(RELOBJS)

rebuild_debug: clean build_debug
rebuild_release: clean build_release
