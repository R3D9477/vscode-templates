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

CC ?= g++

CLFLAGS ?= -I$(ESCINCDIR)
CCFLAGS ?= -Wall

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

LDFLAGS ?=
LDLIBS  ?=

.PHONY: clean build_debug rebuild_debug build_release rebuild_release

build_debug: prep debug
build_release: prep release

debug: $(DBGTARGET)

$(ESCDBGOBJDIR)/%.o: $(ESCSRCDIR)/%.c
	$(CC) $(CLFLAGS) $(DBGCFLAGS) $(CCFLAGS) -c $< -o "$@"

$(DBGTARGET): $(DBGOBJS)
	$(CC) $(LDFLAGS) $(DBGCFLAGS) $^ $(LDLIBS) -o "$@"

release: $(RELTARGET)

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
