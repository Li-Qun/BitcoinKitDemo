# BitcoinKitDemo
第三方链接 https://github.com/yenom/BitcoinKit

使用BitcoinKit
第一步：pod install / pod update
报错：



    erminal call wrong:
    [!] /bin/bash -c
    set -e
    sh setup/build_libraries.sh
    
    ++ dirname setup/build_libraries.sh

    SCRIPT_DIR=setup
    cd setup
    sh build_secp256k1.sh
    ++ dirname build_secp256k1.sh
    SCRIPT_DIR=.
    ++ mktemp -d
    TDIR=/var/folders/wb/94fnm3z10kx173vpc3nj1y340000gn/T/tmp.FOGQuhGh
    trap '{ cd - ; rm -rf /var/folders/wb/94fnm3z10kx173vpc3nj1y340000gn/T/tmp.FOGQuhGh; exit 255; }' SIGINT
    cd /var/folders/wb/94fnm3z10kx173vpc3nj1y340000gn/T/tmp.FOGQuhGh
    git clone https://github.com/bitcoin-core/secp256k1.git src
    Cloning into 'src'...
    ++ pwd
    CURRENTPATH=/var/folders/wb/94fnm3z10kx173vpc3nj1y340000gn/T/tmp.FOGQuhGh
    TARGETDIR_IPHONEOS=/var/folders/wb/94fnm3z10kx173vpc3nj1y340000gn/T/tmp.FOGQuhGh/.build/iphoneos
    mkdir -p /var/folders/wb/94fnm3z10kx173vpc3nj1y340000gn/T/tmp.FOGQuhGh/.build/iphoneos
    TARGETDIR_SIMULATOR=/var/folders/wb/94fnm3z10kx173vpc3nj1y340000gn/T/tmp.FOGQuhGh/.build/iphonesimulator
    mkdir -p /var/folders/wb/94fnm3z10kx173vpc3nj1y340000gn/T/tmp.FOGQuhGh/.build/iphonesimulator
    cd src
    ./autogen.sh
    ./autogen.sh: line 3: autoreconf: command not found
报错原因：技术支持说：“BitcoinKit builds secp256k1 and OpenSSL itself for security reasons. They requires autoconf and automake. Please install them. brew install autoconf automake”
所以

第二步：brew install autoconf automake

又报错：


    Installing BitcoinKit (1.0.2)
    [!] /bin/bash -c
    set -e
    sh setup/build_libraries.sh

    glibtoolize: putting auxiliary files in AC_CONFIG_AUX_DIR, 'build-aux'.
    glibtoolize: copying file 'build-aux/ltmain.sh'
    glibtoolize: putting macros in AC_CONFIG_MACRO_DIRS, 'build-aux/m4'.
    glibtoolize: copying file 'build-aux/m4/libtool.m4'
    glibtoolize: copying file 'build-aux/m4/ltoptions.m4'
    glibtoolize: copying file 'build-aux/m4/ltsugar.m4'
    glibtoolize: copying file 'build-aux/m4/ltversion.m4'
    glibtoolize: copying file 'build-aux/m4/lt~obsolete.m4'
    checking build system type... x86_64-apple-darwin17.7.0
    checking host system type... x86_64-apple-darwin
    checking for a BSD-compatible install... /usr/bin/install -c
    checking whether build environment is sane... yes
    checking for x86_64-apple-darwin-strip... no
    checking for strip... strip
    checking for a thread-safe mkdir -p... build-aux/install-sh -c -d
    checking for gawk... no
    checking for mawk... no
    checking for nawk... no
    checking for awk... awk
    checking whether make sets $(MAKE)... yes
    checking whether make supports nested variables... yes
    checking how to print strings... printf
    checking whether make supports the include directive... yes (GNU style)
    checking for x86_64-apple-darwin-gcc... /Library/Developer/CommandLineTools/usr/bin/clang
    checking whether the C compiler works... no
    ++ dirname setup/build_libraries.sh

    SCRIPT_DIR=setup
    cd setup
    sh build_secp256k1.sh
    ++ dirname build_secp256k1.sh
    SCRIPT_DIR=.
    ++ mktemp -d
    TDIR=/var/folders/wb/94fnm3z10kx173vpc3nj1y340000gn/T/tmp.AEVq8aCT
    trap '{ cd - ; rm -rf /var/folders/wb/94fnm3z10kx173vpc3nj1y340000gn/T/tmp.AEVq8aCT; exit 255; }' SIGINT
    cd /var/folders/wb/94fnm3z10kx173vpc3nj1y340000gn/T/tmp.AEVq8aCT
    git clone https://github.com/bitcoin-core/secp256k1.git src
    Cloning into 'src'...
    ++ pwd
    CURRENTPATH=/var/folders/wb/94fnm3z10kx173vpc3nj1y340000gn/T/tmp.AEVq8aCT
    TARGETDIR_IPHONEOS=/var/folders/wb/94fnm3z10kx173vpc3nj1y340000gn/T/tmp.AEVq8aCT/.build/iphoneos
    mkdir -p /var/folders/wb/94fnm3z10kx173vpc3nj1y340000gn/T/tmp.AEVq8aCT/.build/iphoneos
    TARGETDIR_SIMULATOR=/var/folders/wb/94fnm3z10kx173vpc3nj1y340000gn/T/tmp.AEVq8aCT/.build/iphonesimulator
    mkdir -p /var/folders/wb/94fnm3z10kx173vpc3nj1y340000gn/T/tmp.AEVq8aCT/.build/iphonesimulator
    cd src
    ./autogen.sh
    configure.ac:10: installing 'build-aux/compile'
    configure.ac:5: installing 'build-aux/config.guess'
    configure.ac:5: installing 'build-aux/config.sub'
    configure.ac:9: installing 'build-aux/install-sh'
    configure.ac:9: installing 'build-aux/missing'
    Makefile.am: installing 'build-aux/depcomp'
    parallel-tests: installing 'build-aux/test-driver'
    cd src
    ++ xcrun -find clang
    ++ xcrun -sdk iphonesimulator --show-sdk-path
    xcrun: error: SDK "iphonesimulator" cannot be located
    xcrun: error: SDK "iphonesimulator" cannot be located
    xcrun: error: unable to lookup item 'Path' in SDK 'iphonesimulator'
    ++ xcrun -find clang++
    ++ xcrun -sdk iphonesimulator --show-sdk-path
    xcrun: error: SDK "iphonesimulator" cannot be located
    xcrun: error: SDK "iphonesimulator" cannot be located
    xcrun: error: unable to lookup item 'Path' in SDK 'iphonesimulator'
    ./configure --host=x86_64-apple-darwin CC=/Library/Developer/CommandLineTools/usr/bin/clang 'CFLAGS=-O3 -arch i386 -arch x86_64 -isysroot -fembed-bitcode-marker -mios-simulator-version-min=8.0' CXX=/Library/Developer/CommandLineTools/usr/bin/clang++ 'CXXFLAGS=-O3 -arch i386 -arch x86_64 -isysroot -fembed-bitcode-marker -mios-simulator-version-min=8.0' --prefix=/var/folders/wb/94fnm3z10kx173vpc3nj1y340000gn/T/tmp.AEVq8aCT/.build/iphoneos
    configure: error: in /var/folders/wb/94fnm3z10kx173vpc3nj1y340000gn/T/tmp.AEVq8aCT/src': configure: error: C compiler cannot create executables See config.log' for more details

天啊！根本和sdk 说明里介绍的操作情况不一样，门槛相当高，看看问题反馈那么多没被关闭的问题就知道了，当然，也有可能遇到和我一样的问题的人，作者好像嫌弃我问了一个重复的问题。。。但是我用关键字查询并没查到，因为那人用的是截图！如果大家都有门槛问题，为啥在sdk readme 里面不列出来 解决方案呢。。。真的门槛高，不太友好

解决建议： When you have a problem, you should google it first. ...
"xcrun: error: SDK "iphonesimulator" cannot be located".
Update your Xcode and Open in Xcode Preferences, tab into Locations and take a look at your Command Line Tools selection

好吧。。。
这个错误原因我调研一下：就是mac 端Xcode路径判断错误，你可能曾经或者正在使用2个版本以上的Xcode 所以混淆了路径

#解决方法：给Xcode命令行工具指定路径

#sudo xcode-select --switch /Applications/Xcode.app/Contents/Developer/

结束 。终于pod 成功了 用了2到3天，没夸张，费劲着呢


