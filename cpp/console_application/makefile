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
	
	FIXPATH = $(subst /,\,$1)
	
	MKDIR = if not exist "$(call FIXPATH,$1)" mkdir "$(call FIXPATH,$1)"
	RM = del "$(call FIXPATH,$1)"

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
	FIXPATH = $(subst \,/,$1)
	
	MKDIR = mkdir -p "$(call FIXPATH,$1)"
	RM = rm -f "$(call FIXPATH,$1)"

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

ifeq ($(TARGETOS),windows)
	CCFLAGS ?= -D WIN32
endif
ifeq ($(TARGETOS),linux)
	CCFLAGS ?= -D LINUX
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

SRCS = $(wildcard $(SRCDIR)/*.cpp)

DBGTARGET = $(DBGBINDIR)/$(APPNAME)$(APPEXT)
DBGOBJS   = $(SRCS:$(SRCDIR)/%.cpp=$(DBGOBJDIR)/%.o)
DBGCFLAGS = -g3 -DDEBUG

RELTARGET = $(RELBINDIR)/$(APPNAME)$(APPEXT)
RELOBJS   = $(SRCS:$(SRCDIR)/%.cpp=$(RELOBJDIR)/%.o)
RELCFLAGS = -O3 -DNDEBUG

CC      ?= g++

CLFLAGS += -I$(INCDIR)
CCFLAGS += -Wall

LDFLAGS ?=
LDLIBS  ?=

.PHONY: clean build_debug rebuild_debug build_release rebuild_release

build_debug: prep debug
build_release: prep release

debug: $(DBGTARGET)

$(DBGOBJDIR)/%.o: $(SRCDIR)/%.cpp
	$(CC) $(CLFLAGS) $(DBGCFLAGS) $(CCFLAGS) -c "$<" -o "$@"

$(DBGTARGET): $(DBGOBJS)
	$(CC) $(LDFLAGS) $(DBGCFLAGS) $^ $(LDLIBS) -o "$@"

release: $(RELTARGET)

$(RELOBJDIR)/%.o: $(SRCDIR)/%.cpp
	$(CC) $(CLFLAGS) $(RELCFLAGS) $(CCFLAGS) -c "$<" -o "$@"

$(RELTARGET): $(RELOBJS)
	$(CC) $(LDFLAGS) $(RELCFLAGS) $^ $(LDLIBS) -o "$@"

prep:

	$(call MKDIR,$(DBGBINDIR))
	$(call MKDIR,$(DBGOBJDIR))
	$(call MKDIR,$(RELBINDIR))
	$(call MKDIR,$(RELOBJDIR))

clean:

	$(call RM,$(DBGTARGET))
	$(call RM,$(DBGOBJS))
	$(call RM,$(RELTARGET))
	$(call RM,$(RELOBJS))

rebuild_debug: clean build_debug
rebuild_release: clean build_release
