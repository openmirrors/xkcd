#!/usr/bin/env sh
# SPDX-License-Identifier: CC0-1.0

# This POSIX shell script is similar to a Makefile;
#   it creates a file containing the entire book.
# Currently supported file formats are:
#   comic book ZIP (CBZ)
# These file formats will be supported in the future:
#   OpenDocument Drawing (ODG)
#   Portable Document Format (PDF)
#   comic book ACE (CBA)
#   comic book RAR (CBR)
#   comic book tar (CBT)
#   comic book 7z  (CB7)

# tell shells to be POSIX-compliant
export POSIXLY_CORRECT

if command -v basename > '/dev/null'; then
  script=$(basename "$0")
  else script='make.sh'
fi

# show info
info () {
  printf 'This shell script builds files containing the book "xkcd: volume 0" by Randall Munroe. The book is licensed under Creative Commons Attribution 3.0 Unported.
NOTE: Before running this script, make sure you have the required PDFs, PNGs, and/or the ODG source from:
  https://github.com/openmirrors/xkcd/
in the same directory as this script.

usage: %s cbz

Build requirements are below:
- cbz requires the zip application in your $PATH, and the 118 PNG files in the ./pages/png/ directory.\n' "$script"
}

png_pages () {
  p001='./pages/png/001.png' # Yes. I am
  p002='./pages/png/002.png' # hardcoding
  p003='./pages/png/003.png' # this manually,
  p004='./pages/png/004.png' # and it is
  p005='./pages/png/005.png' # on purpose.
  p006='./pages/png/006.png' # No wildcards.
  p007='./pages/png/007.png' # No seqs.
  p008='./pages/png/008.png' # No friends.
  p009='./pages/png/009.png' # I am simply
  p010='./pages/png/010.png' # too efficient
  p011='./pages/png/011.png' # for you to
  p012='./pages/png/012.png' # truly get it.
  p013='./pages/png/013.png' # I have
  p014='./pages/png/014.png' # transcended
  p015='./pages/png/015.png' # simplicity.
  p016='./pages/png/016.png' # People will
  p017='./pages/png/017.png' # call this bad
  p018='./pages/png/018.png' # because they
  p019='./pages/png/019.png' # are jealous of
  p020='./pages/png/020.png' # my power.
  p021='./pages/png/021.png' # Do you
  p022='./pages/png/022.png' # understand?
  p023='./pages/png/023.png' # I have broken
  p024='./pages/png/024.png' # free from this
  p025='./pages/png/025.png' # mortal coil.
  p026='./pages/png/026.png' # I will enter
  p027='./pages/png/027.png' # your dreams.
  p028='./pages/png/028.png' # Enter your
  p029='./pages/png/029.png' # nightmares.
  p030='./pages/png/030.png' # The variables
  p031='./pages/png/031.png' # will stick in
  p032='./pages/png/032.png' # your mind,
  p033='./pages/png/033.png' # like a pancake
  p034='./pages/png/034.png' # sticks to the
  p035='./pages/png/035.png' # kitchen
  p036='./pages/png/036.png' # ceiling.
  p037='./pages/png/037.png' # Like tree sap
  p038='./pages/png/038.png' # sticks to
  p039='./pages/png/039.png' # your hands.
  p040='./pages/png/040.png' # Like a stick.
  p041='./pages/png/041.png' # A tree stick.
  p042='./pages/png/042.png' # Made of wood.
  p043='./pages/png/043.png' # Like your
  p044='./pages/png/044.png' # fatuous brain.
  p045='./pages/png/045.png' # Made of wood.
  p046='./pages/png/046.png' # That is why
  p047='./pages/png/047.png' # you are so
  p048='./pages/png/048.png' # dumb. So dumb.
  p049='./pages/png/049.png' # Imbecilic.
  p050='./pages/png/050.png' # Your brain is
  p051='./pages/png/051.png' # a tiny cone.
  p052='./pages/png/052.png' # A pine cone.
  p053='./pages/png/053.png' # A fir cone.
  p054='./pages/png/054.png' # A spruce cone.
  p055='./pages/png/055.png' # A waffle cone.
  p056='./pages/png/056.png' # Your brain is
  p057='./pages/png/057.png' # a waffle,
  p058='./pages/png/058.png' # which is like
  p059='./pages/png/059.png' # a pancake,
  p060='./pages/png/060.png' # which is what
  p061='./pages/png/061.png' # sticks on the
  p062='./pages/png/062.png' # ceiling, like
  p063='./pages/png/063.png' # my programming
  p064='./pages/png/064.png' # practices in
  p065='./pages/png/065.png' # your head.
  p066='./pages/png/066.png' # You will never
  p067='./pages/png/067.png' # escape me.
  p068='./pages/png/068.png' # I am in your
  p069='./pages/png/069.png' # house. Whether
  p070='./pages/png/070.png' # literally or
  p071='./pages/png/071.png' # metaphorically
  p072='./pages/png/072.png' # you will never
  p073='./pages/png/073.png' # know. To fight
  p074='./pages/png/074.png' # is to die; to
  p075='./pages/png/075.png' # run is to be
  p076='./pages/png/076.png' # a coward. A
  p077='./pages/png/077.png' # stupid coward,
  p078='./pages/png/078.png' # in your case.
  p079='./pages/png/079.png' # Because you
  p080='./pages/png/080.png' # are stupid.
  p081='./pages/png/081.png' # I used to be
  p082='./pages/png/082.png' # stupid too.
  p083='./pages/png/083.png' # I was blind.
  p084='./pages/png/084.png' # I was a sheep.
  p085='./pages/png/085.png' # "No, you
  p086='./pages/png/086.png' # shouldn't
  p087='./pages/png/087.png' # write a
  p088='./pages/png/088.png' # 200-line shell
  p089='./pages/png/089.png' # script with
  p090='./pages/png/090.png' # 118 explicit
  p091='./pages/png/091.png' # variable
  p092='./pages/png/092.png' # assignments!
  p093='./pages/png/093.png' # That's just
  p094='./pages/png/094.png' # madness!"
  p095='./pages/png/095.png' # And you know
  p096='./pages/png/096.png' # what? I
  p097='./pages/png/097.png' # believed them.
  p098='./pages/png/098.png' # I, too, was
  p099='./pages/png/099.png' # brainwashed by
  p100='./pages/png/100.png' # the masses.
  p101='./pages/png/101.png' # But I realized
  p102='./pages/png/102.png' # something.
  p103='./pages/png/103.png' # Madness is
  p104='./pages/png/104.png' # not madness.
  p105='./pages/png/105.png' # Madness is
  p106='./pages/png/106.png' # genius.
  p107='./pages/png/107.png' # It always is.
  p108='./pages/png/108.png' # A madman is
  p109='./pages/png/109.png' # greater than
  p110='./pages/png/110.png' # all the sane
  p111='./pages/png/111.png' # ones. And
  p112='./pages/png/112.png' # everyone knows
  p113='./pages/png/113.png' # it. You know
  p114='./pages/png/114.png' # it. I know it.
  p115='./pages/png/115.png' # I truly am a
  p116='./pages/png/116.png' # lunatic.
  p117='./pages/png/117.png' # Because only
  p118='./pages/png/118.png' # I see my genius.
  pngs="$p001 $p002 $p003 $p004 $p005
  $p006 $p007 $p008 $p009 $p010 $p011
  $p012 $p013 $p014 $p015 $p016 $p017
  $p018 $p019 $p020 $p021 $p022 $p023
  $p024 $p025 $p026 $p027 $p028 $p029
  $p030 $p031 $p032 $p033 $p034 $p035
  $p036 $p037 $p038 $p039 $p040 $p041
  $p042 $p043 $p044 $p045 $p046 $p047
  $p048 $p049 $p050 $p051 $p052 $p053
  $p054 $p055 $p056 $p057 $p058 $p059
  $p060 $p061 $p062 $p063 $p064 $p065
  $p066 $p067 $p068 $p069 $p070 $p071
  $p072 $p073 $p074 $p075 $p076 $p077
  $p078 $p079 $p080 $p081 $p082 $p083
  $p084 $p085 $p086 $p087 $p088 $p089
  $p090 $p091 $p092 $p093 $p094 $p095
  $p096 $p097 $p098 $p099 $p100 $p101
  $p102 $p103 $p104 $p105 $p106 $p107
  $p108 $p109 $p110 $p111 $p112 $p113
  $p114 $p115 $p116 $p117 $p118"
}

make_cbz () {
  if command -v zip; then
    if [ -e './pages/png' ]; then
      png_pages
      if [ -s "$p001" -a -s "$p002" \
        -a -s "$p003" -a -s "$p004" \
        -a -s "$p005" -a -s "$p006" \
        -a -s "$p007" -a -s "$p008" \
        -a -s "$p009" -a -s "$p010" \
        -a -s "$p011" -a -s "$p012" \
        -a -s "$p013" -a -s "$p014" \
        -a -s "$p015" -a -s "$p016" \
        -a -s "$p017" -a -s "$p018" \
        -a -s "$p019" -a -s "$p020" \
        -a -s "$p021" -a -s "$p022" \
        -a -s "$p023" -a -s "$p024" \
        -a -s "$p025" -a -s "$p026" \
        -a -s "$p027" -a -s "$p028" \
        -a -s "$p029" -a -s "$p030" \
        -a -s "$p031" -a -s "$p032" \
        -a -s "$p033" -a -s "$p034" \
        -a -s "$p035" -a -s "$p036" \
        -a -s "$p037" -a -s "$p038" \
        -a -s "$p039" -a -s "$p040" \
        -a -s "$p041" -a -s "$p042" \
        -a -s "$p043" -a -s "$p044" \
        -a -s "$p045" -a -s "$p046" \
        -a -s "$p047" -a -s "$p048" \
        -a -s "$p049" -a -s "$p050" \
        -a -s "$p051" -a -s "$p052" \
        -a -s "$p053" -a -s "$p054" \
        -a -s "$p055" -a -s "$p056" \
        -a -s "$p057" -a -s "$p058" \
        -a -s "$p059" -a -s "$p060" \
        -a -s "$p061" -a -s "$p062" \
        -a -s "$p063" -a -s "$p064" \
        -a -s "$p065" -a -s "$p066" \
        -a -s "$p067" -a -s "$p068" \
        -a -s "$p069" -a -s "$p070" \
        -a -s "$p071" -a -s "$p072" \
        -a -s "$p073" -a -s "$p074" \
        -a -s "$p075" -a -s "$p076" \
        -a -s "$p077" -a -s "$p078" \
        -a -s "$p079" -a -s "$p080" \
        -a -s "$p081" -a -s "$p082" \
        -a -s "$p083" -a -s "$p084" \
        -a -s "$p085" -a -s "$p086" \
        -a -s "$p087" -a -s "$p088" \
        -a -s "$p089" -a -s "$p090" \
        -a -s "$p091" -a -s "$p092" \
        -a -s "$p093" -a -s "$p094" \
        -a -s "$p095" -a -s "$p096" \
        -a -s "$p097" -a -s "$p098" \
        -a -s "$p099" -a -s "$p100" \
        -a -s "$p101" -a -s "$p102" \
        -a -s "$p103" -a -s "$p104" \
        -a -s "$p105" -a -s "$p106" \
        -a -s "$p107" -a -s "$p108" \
        -a -s "$p109" -a -s "$p110" \
        -a -s "$p111" -a -s "$p112" \
        -a -s "$p113" -a -s "$p114" \
        -a -s "$p115" -a -s "$p116" \
        -a -s "$p117" -a -s "$p118" ]; then
        printf 'zipping...\n'
        if zip -0Juv './xkcd_-_volume_0.cbz' $pngs; then
          printf 'success!'
        fi
      fi
    else printf 'The directory ./pages/png/ does not exist. CBZ cannot be made.'
    fi
  else printf 'zip is not in your $PATH. CBZ cannot be made.\n'
  exit 1
  fi
}


if [ "$1" = '' -o "$1" = '-h' -o "$1" = '-?' -o "$1" = '--help' ]; then
  info
elif [ "$1" = cbz ]; then
  make_cbz
else info
fi
