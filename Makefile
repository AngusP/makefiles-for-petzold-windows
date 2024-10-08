
SAMPLES = \
    Chap01/HelloMsg \
    Chap02/ScrnSize \
    Chap03/HelloWin \
    Chap04/SysMets1 \
    Chap04/SysMets2 \
    Chap04/SysMets3 \
    Chap05/AltWind \
    Chap05/Bezier \
    Chap05/Clover \
    Chap05/DevCaps1 \
    Chap05/LineDemo \
    Chap05/RandRect \
    Chap05/SineWave \
    Chap05/WhatSize \
    Chap06/KeyView1 \
    Chap06/KeyView2 \
    Chap06/StokFont \
    Chap06/SysMets4 \
    Chap06/Typer \
    Chap07/BlokOut1 \
    Chap07/BlokOut2 \
    Chap07/Checker1 \
    Chap07/Checker2 \
    Chap07/Checker3 \
    Chap07/Checker4 \
    Chap07/Connect \
    Chap07/SysMets \
    Chap08/Beeper1 \
    Chap08/Beeper2 \
    Chap08/Clock \
    Chap08/DigClock \
    Chap08/WhatClr \
    Chap09/BtnLook \
    Chap09/Colors1 \
    Chap09/Environ \
    Chap09/OwnDraw \
    Chap09/PopPad1 \
    Chap09/head \
    Chap10/IconDemo \
    Chap10/MenuDemo \
    Chap10/NoPopups \
    Chap10/PoePoem \
    Chap10/PoorMenu \
    Chap10/PopMenu \
    Chap10/PopPad2 \
    Chap11/About1 \
    Chap11/About2 \
    Chap11/About3 \
    Chap11/Colors2 \
    Chap11/Colors3 \
    Chap11/HexCalc \
    Chap11/PopPad3 \
    Chap12/ClipText \
    Chap12/ClipView \
    Chap13/DevCaps2 \
    Chap13/FormFeed \
    Chap13/PopPad \
    Chap13/Print1 \
    Chap13/Print2 \
    Chap13/Print3 \
    Chap14/BitBlt \
    Chap14/BitMask \
    Chap14/Blowup \
    Chap14/Bounce \
    Chap14/Bricks1 \
    Chap14/Bricks2 \
    Chap14/Bricks3 \
    Chap14/GrafMenu \
    Chap14/HelloBit \
    Chap14/Scramble \
    Chap14/Sketch \
    Chap14/Stretch \
    Chap15/Apollo11 \
    Chap15/DibConv \
    Chap15/DibHeads \
    Chap15/DibSect \
    Chap15/SeqDisp \
    Chap15/ShowDib1 \
    Chap15/ShowDib2 \
    Chap16/AllColor \
    Chap16/Bounce \
    Chap16/Dibble \
    Chap16/Fader \
    Chap16/Grays1 \
    Chap16/Grays2 \
    Chap16/Grays3 \
    Chap16/Pipes \
    Chap16/ShowDib3 \
    Chap16/ShowDib4 \
    Chap16/ShowDib5 \
    Chap16/ShowDib6 \
    Chap16/ShowDib7 \
    Chap16/ShowDib8 \
    Chap16/SysPal1 \
    Chap16/SysPal2 \
    Chap16/SysPal3 \
    Chap16/Tunnel \
    Chap17/ChosFont \
    Chap17/EZTest \
    Chap17/EndJoin \
    Chap17/FontClip \
    Chap17/FontFill \
    Chap17/FontOut1 \
    Chap17/FontOut2 \
    Chap17/FontRot \
    Chap17/Justify1 \
    Chap17/Justify2 \
    Chap17/PickFont \
    Chap17/UniChars \
    Chap18/Emf1 \
    Chap18/Emf10 \
    Chap18/Emf11 \
    Chap18/Emf12 \
    Chap18/Emf13 \
    Chap18/Emf2 \
    Chap18/Emf3 \
    Chap18/Emf4 \
    Chap18/Emf5 \
    Chap18/Emf6 \
    Chap18/Emf7 \
    Chap18/Emf8 \
    Chap18/Emf9 \
    Chap18/EmfView \
    Chap18/Metafile \
    Chap19/MDIDemo \
    Chap20/BigJob1 \
    Chap20/BigJob2 \
    Chap20/Multi1 \
    Chap20/Multi2 \
    Chap20/RndRctMT \
    Chap21/EdrTest \
    Chap21/ShowBit \
    Chap21/StrProg \
    Chap22/AddSynth \
    Chap22/BachTocc \
    Chap22/Drum \
    Chap22/KBMidi \
    Chap22/Record1 \
    Chap22/Record2 \
    Chap22/Record3 \
    Chap22/SineWave \
    Chap22/TestMci \
    Chap22/WakeUp \
    Chap23/NetTime \
    Chap23/UpdDemo


all: $(SAMPLES:%=%/__all__)

$(SAMPLES:%=%/__all__): dummy
	@dir=`dirname $@` && cd $$dir && $(MAKE) -f $${dir##*/}.mak

dummy:

