STK-on-iOS
==========

This is an example project that shows how to use the [The Synthesis Toolkit in C++](https://ccrma.stanford.edu/software/stk/) v 4.4.4 for iOS projects, using [The Amazing Audio Engine](https://github.com/TheAmazingAudioEngine/TheAmazingAudioEngine) as the audio engine.

The idea behind it is to help integrate those changes INTO the STK so that it fully supports iOS. 

Please read the [original thread](http://ccrma-mail.stanford.edu/pipermail/stk/2013-September/001087.html) on the STK mailing list for more information.


##Instructions
1. Clone this repository, then clone the The Amazing Audio Engine by doing:
`git submodule update --init`


##Steps so far:
1. [Get the STK](https://github.com/thestk/stk)
1. Copy only the following directories into a new and empty STK folder in the repository: 
 * **include/**
 * **rawwaves/**
 * **src/**
1. Remove the file `src/Makefile.in`
1. Drag and drop the STK folder into the Xcode project, select "Create groups for any added folders", tick "Add to targets".
1. Open your Build Settings, add `stk/include/` to your Header Search Paths:
![](http://i.imgur.com/Ww5oeSs.png)

1. Remove the following files (`.h` files are in **include/**, `.cpp` files are in **src/**):

Multithreading:
* `Thread.h`
* `Thread.cpp`
* `Mutex.h`
* `Mutex.ccp`

Networking:
* `UdpSocket.h`
* `UdpSocket.cpp`
* `Socket.h`
* `Socket.cpp`
* `TcpClient.h`
* `TcpClient.cpp`
* `TcpServer.h`
* `TcpServer.cpp`

File I/O:
* `InetWvOut.h`
* `InetWvOut.cpp`
* `InetWvIn.h`
* `InetWvIn.cpp`

Audio Layer setup:
* `RtAudio.h`
* `RtAudio.cpp`
* `RtMidi.h`
* `RtMidi.cpp`
* `RtWvIn.h`
* `RtWvIn.cpp`
* `RtWvOut.h`
* `RtWvOut.cpp`
* `RtError.h`

In rawwaves/
* `makefun.c`
* `makemidi.c`
* `makewav.c`
* `sine.c`

##Thanks
to Hari Karam Singh, Richard Dobson, and the [MoMu-STK](http://momu.stanford.edu/stk/) project for useful pointers. 