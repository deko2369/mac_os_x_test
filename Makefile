CC         = clang
TARGET     = Test
FRAMEWORKS = -framework Foundation -framework AppKit
CFLAGS     = -Wall -Werror -fobjc-arc
LDFLAGS    = $(FRAMEWORKS)
OBJS       = main.o TestController.o

APPNAME    = Test.app
APPDIRCONT = $(APPNAME)/Contents
APPDIRSTRUCT = $(APPDIRCONT)/MacOS $(APPDIRCONT)/Resources

DEST       = bin

all : $(TARGET)

$(TARGET) : $(OBJS) appdir
	@if [ ! -d $(DEST) ]; then \
		mkdir $(DEST); \
	fi
	$(CC) $(CFLAGS) $(LDFLAGS) $(OBJS) -o $(DEST)/$(TARGET)
	cp $(DEST)/$(TARGET) $(APPDIRCONT)/MacOS

appdir:
	@if [ ! -d $(APPNAME) ]; then \
		mkdir -p $(APPDIRSTRUCT); \
		cp -R Resources/* $(APPDIRCONT)/Resources; \
		cp Info.plist $(APPDIRCONT); \
	fi

run: $(TARGET)
	open $(APPNAME)

clean:
	$(RM) -r $(DEST)
	$(RM) $(OBJS)
	$(RM) -r $(APPNAME)
