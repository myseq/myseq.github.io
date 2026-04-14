---
title: "Character Encoding Set"
date: 2023-11-10T19:13:16+08:00
tags: [ "101", "ascii", "encoding" ]
categories: [ "Posts"  ]
summary: "ASCII vs CP-1252 vs ISO-8859-1"
draft: false
---
{{< lead >}}
Showing you the differences between ASCII, CP-1252 and ISO-8859-1.
{{< /lead >}}


## Intro

ASCII 
: `ASCII` is a 7-bit character encoding. It can go from 0 to 127 (0x7F) only. 

CP-1252
: `CP-1252` is an 8-bit character encoding based on ASCII. It is identical to ASCII up to code point 127.

ISO-8859-1
: `8859-1` is also an 8-bit character encoding based on CP-1252. However, 8859-1 differs from CP-1252 in sticks 8 (0x80-0x8F) and 9 (0x90-0x9F).
: `8859-1` is also the default character set used in HTML4.

> Unicode, `UTF-8` or `UTF-16`, is a multi-byte character encoding based on ISO-8859-1.
> They are identical up to code point 255. `UTF-8` is the default character set used in HTML5. See more encoding methods at
: {{< article link="/posts/encoding_101/" >}}


| Code Point  | ASCII | CP-1251 | 8859-1 | Unicode |
| ----------- | ----- | ------- | ------ | ------- |
| 0x00 - 0x7f | same | <-same | <-same | <-same |
| 0x80 - 0x8f | N/A | diff-> | <-diff | <-same | 
| 0x90 - 0x9f | N/A | diff-> | <-diff | <-same | 
| 0xa0 - 0xff | N/A | same | same | <-same | 

## Character Sets

All the 256 characters are broken down to 3 groups:
 - From 0 - 127 
 - From 128 - 159 (stick8 and stick9)
 - From 160 - 255

### :zero:-:one::two::seven:

| Description           | ASCII | CP-1252 | 8859-1 | Oct | Hex  | Dec | Stick/Pos |
| :-------------------- | :---: | :-----: | :----: | --: | ---: | --: | --------: |
| Null                  |  NUL  |   NUL   |  NUL   | 000 | 0x00 |  0  |  0/1  |
| Start of Header       |  SOH  |   SOH   |  SOH   | 001 | 0x01 |  1  |  0/2  |
| Start of Text         |  STX  |   STX   |  STX   | 002 | 0x02 |  2  |  0/3  |
| End of Text           |  ETX  |   ETX   |  ETX   | 003 | 0x03 |  3  |  0/4  |
| End of Transmission   |  EOT  |   EOT   |  EOT   | 004 | 0x04 |  4  |  0/5  |
| Enquiry               |  ENQ  |   ENQ   |  ENQ   | 005 | 0x05 |  5  |  0/6  |
| Acknowledge           |  ACK  |   ACK   |  ACK   | 006 | 0x06 |  6  |  0/7  |
| Bell                  |  BEL  |   BEL   |  BEL   | 007 | 0x07 |  7  |  0/8  |
| Backspace             |  BS   |   BS    |  BS    | 010 | 0x08 |  8  |  0/9  |
| Horizontal Tab        |  HT   |   HT    |  HT    | 011 | 0x09 |  9  | 0/10  |
| Linefeed              |  LF   |   LF    |  LF    | 012 | 0x0A | 10  | 0/11  |
| Vertical Tab          |  VT   |   VT    |  VT    | 013 | 0x0B | 11  | 0/12  |
| Form Feed             |  FF   |   FF    |  FF    | 014 | 0x0C | 12  | 0/13  |
| Carriage Return       |  CR   |   CR    |  CR    | 015 | 0x0D | 13  | 0/14  |
| Shift Out             |  SO   |   SO    |  SO    | 016 | 0x0E | 14  | 0/15  |
| Shift In              |  SI   |   SI    |  SI    | 017 | 0x0F | 15  | 0/16  |
| Data Link Escape      |  DLE  |   DLE   |  DLE   | 020 | 0x10 | 16  |  1/1  |
| Device Control 1      |  DC1  |   DC1   |  DC1   | 021 | 0x11 | 17  |  1/2  |
| Device Control 2      |  DC2  |   DC2   |  DC2   | 022 | 0x12 | 18  |  1/3  |
| Device Control 3      |  DC3  |   DC3   |  DC3   | 023 | 0x13 | 19  |  1/4  |
| Device Control 4      |  DC4  |   DC4   |  DC4   | 024 | 0x14 | 20  |  1/5  |
| Negative Acknowledge  |  NAK  |   NAK   |  NAK   | 025 | 0x15 | 21  |  1/6  |
| Synchronous Idle      |  SYN  |   SYN   |  SYN   | 026 | 0x16 | 22  |  1/7  |
| End of Transmission   |  ETB  |   ETB   |  ETB   | 027 | 0x17 | 23  |  1/8  |
| Cancel                |  CAN  |   CAN   |  CAN   | 030 | 0x18 | 24  |  1/9  |
| End of Medium         |  EM   |   EM    |  EM    | 031 | 0x19 | 25  | 1/10  |
| Substitute            |  SUB  |   SUB   |  SUB   | 032 | 0x1A | 26  | 1/11  |
| Escape                |  ESC  |   ESC   |  ESC   | 033 | 0x1B | 27  | 1/12  |
| File Separator        |  FS   |   FS    |  FS    | 034 | 0x1C | 28  | 1/13  |
| Group Separator       |  GS   |   GS    |  GS    | 035 | 0x1D | 29  | 1/14  |
| Record Separator      |  RS   |   RS    |  RS    | 036 | 0x1E | 30  | 1/15  |
| Unit Separator        |  US   |   US    |  US    | 037 | 0x1F | 31  | 1/16  |
| Space                 |  SP   |   SP    |   SP   | 040 | 0x20 | 32  |  2/1  |
| Exclamation Mark      |  !    |   !     |   !    | 041 | 0x21 | 33  |  2/2  |
| Quotation Mark        |  "    |   "     |   "    | 042 | 0x22 | 34  |  2/3  |
| Number Sign           |  #    |   #     |   #    | 043 | 0x23 | 35  |  2/4  |
| Dollar Sign           |  $    |   $     |   $    | 044 | 0x24 | 36  |  2/5  |
| Percent Sign          |  %    |   %     |   %    | 045 | 0x25 | 37  |  2/6  |
| Ampersand             |  &    |   &     |   &    | 046 | 0x26 | 38  |  2/7  |
| Apostrophe            |  '    |   '     |   '    | 047 | 0x27 | 39  |  2/8  |
| Left Parenthesis      |  (    |   (     |   (    | 050 | 0x28 | 40  |  2/9  |
| Right Parenthesis     |  )    |   )     |   )    | 051 | 0x29 | 41  | 2/10  |
| Asterisk              |  *    |   *     |   *    | 052 | 0x2A | 42  | 2/11  |
| Plus Sign             |  +    |   +     |   +    | 053 | 0x2B | 43  | 2/12  |
| Comma                 |  ,    |   ,     |   ,    | 054 | 0x2C | 44  | 2/13  |
| Hyphen-Minus          |  -    |   -     |   -    | 055 | 0x2D | 45  | 2/14  |
| Full Stop             |  .    |   .     |   .    | 056 | 0x2E | 46  | 2/15  |
| Solidus               |  /    |   /     |   /    | 057 | 0x2F | 47  | 2/16  |
| Digit Zero            |  0    |   0     |   0    | 060 | 0x30 | 48  |  3/1  |
| Digit One             |  1    |   1     |   1    | 061 | 0x31 | 49  |  3/2  |
| Digit Two             |  2    |   2     |   2    | 062 | 0x32 | 50  |  3/3  |
| Digit Three           |  3    |   3     |   3    | 063 | 0x33 | 51  |  3/4  |
| Digit Four            |  4    |   4     |   4    | 064 | 0x34 | 52  |  3/5  |
| Digit Five            |  5    |   5     |   5    | 065 | 0x35 | 53  |  3/6  |
| Digit Six             |  6    |   6     |   6    | 066 | 0x36 | 54  |  3/7  |
| Digit Seven           |  7    |   7     |   7    | 067 | 0x37 | 55  |  3/8  |
| Digit Eight           |  8    |   8     |   8    | 070 | 0x38 | 56  |  3/9  |
| Digit Nine            |  9    |   9     |   9    | 071 | 0x39 | 57  | 3/10  |
| Colon                 |  :    |   :     |   :    | 072 | 0x3A | 58  | 3/11  |
| Semicolon             |  ;    |   ;     |   ;    | 073 | 0x3B | 59  | 3/12  |
| Less-Than Sign        |  <    |   <     |   <    | 074 | 0x3C | 60  | 3/13  |
| Equals Sign           |  =    |   =     |   =    | 075 | 0x3D | 61  | 3/14  |
| Greater-Than Sign     |  >    |   >     |   >    | 076 | 0x3E | 62  | 3/15  |
| Question Mark         |  ?    |   ?     |   ?    | 077 | 0x3F | 63  | 3/16  |
| Commercial At         |  @    |   @     |   @    | 100 | 0x40 | 64  |  4/1  |
| Latin Capital Letter A|  A    |   A     |   A    | 101 | 0x41 | 65  |  4/2  |
| Latin Capital Letter B|  B    |   B     |   B    | 102 | 0x42 | 66  |  4/3  |
| Latin Capital Letter C|  C    |   C     |   C    | 103 | 0x43 | 67  |  4/4  |
| Latin Capital Letter D|  D    |   D     |   D    | 104 | 0x44 | 68  |  4/5  |
| Latin Capital Letter E|  E    |   E     |   E    | 105 | 0x45 | 69  |  4/6  |
| Latin Capital Letter F|  F    |   F     |   F    | 106 | 0x46 | 70  |  4/7  |
| Latin Capital Letter G|  G    |   G     |   G    | 107 | 0x47 | 71  |  4/8  |
| Latin Capital Letter H|  H    |   H     |   H    | 110 | 0x48 | 72  |  4/9  |
| Latin Capital Letter I|  I    |   I     |   I    | 111 | 0x49 | 73  | 4/10  |
| Latin Capital Letter J|  J    |   J     |   J    | 112 | 0x4A | 74  | 4/11  |
| Latin Capital Letter K|  K    |   K     |   K    | 113 | 0x4B | 75  | 4/12  |
| Latin Capital Letter L|  L    |   L     |   L    | 114 | 0x4C | 76  | 4/13  |
| Latin Capital Letter M|  M    |   M     |   M    | 115 | 0x4D | 77  | 4/14  |
| Latin Capital Letter N|  N    |   N     |   N    | 116 | 0x4E | 78  | 4/15  |
| Latin Capital Letter O|  O    |   O     |   O    | 117 | 0x4F | 79  | 4/16  |
| Latin Capital Letter P|  P    |   P     |   P    | 120 | 0x50 | 80  |  5/1  |
| Latin Capital Letter Q|  Q    |   Q     |   Q    | 121 | 0x51 | 81  |  5/2  |
| Latin Capital Letter R|  R    |   R     |   R    | 122 | 0x52 | 82  |  5/3  |
| Latin Capital Letter S|  S    |   S     |   S    | 123 | 0x53 | 83  |  5/4  |
| Latin Capital Letter T|  T    |   T     |   T    | 124 | 0x54 | 84  |  5/5  |
| Latin Capital Letter U|  U    |   U     |   U    | 125 | 0x55 | 85  |  5/6  |
| Latin Capital Letter V|  V    |   V     |   V    | 126 | 0x56 | 86  |  5/7  |
| Latin Capital Letter W|  W    |   W     |   W    | 127 | 0x57 | 87  |  5/8  |
| Latin Capital Letter X|  X    |   X     |   X    | 130 | 0x58 | 88  |  5/9  |
| Latin Capital Letter Y|  Y    |   Y     |   Y    | 131 | 0x59 | 89  | 5/10  |
| Latin Capital Letter Z|  Z    |   Z     |   Z    | 132 | 0x5A | 90  | 5/11  |
| Left Square Bracket   |  [    |   [     |   [    | 133 | 0x5B | 91  | 5/12  |
| Reverse Solidus       |  \    |   \     |   \    | 134 | 0x5C | 92  | 5/13  |
| Right Square Bracket  |  ]    |   ]     |   ]    | 135 | 0x5D | 93  | 5/14  |
| Circumflex Accent     |  ^    |   ^     |   ^    | 136 | 0x5E | 94  | 5/15  |
| Low Line              |  _    |   _     |   _    | 137 | 0x5F | 95  | 5/16  |
| Grave Accent          |  `    |   `     |   `    | 140 | 0x60 | 96  |  6/1  |
| Latin Small Letter A  |  a    |   a     |   a    | 141 | 0x61 | 97  |  6/2  |
| Latin Small Letter B  |  b    |   b     |   b    | 142 | 0x62 | 98  |  6/3  |
| Latin Small Letter C  |  c    |   c     |   c    | 143 | 0x63 | 99  |  6/4 |
| Latin Small Letter D  |  d    |   d     |   d    | 144 | 0x64 |100  |  6/5 |
| Latin Small Letter E  |  e    |   e     |   e    | 145 | 0x65 |101  |  6/6 |
| Latin Small Letter F  |  f    |   f     |   f    | 146 | 0x66 |102  |  6/7 |
| Latin Small Letter G  |  g    |   g     |   g    | 147 | 0x67 |103  |  6/8 |
| Latin Small Letter H  |  h    |   h     |   h    | 150 | 0x68 |104  |  6/9 |
| Latin Small Letter I  |  i    |   i     |   i    | 151 | 0x69 |105  | 6/10 |
| Latin Small Letter J  |  j    |   j     |   j    | 152 | 0x6A |106  | 6/10 |
| Latin Small Letter K  |  k    |   k     |   k    | 153 | 0x6B |107  | 6/10 |
| Latin Small Letter L  |  l    |   l     |   l    | 154 | 0x6C |108  | 6/10 |
| Latin Small Letter M  |  m    |   m     |   m    | 155 | 0x6D |109  | 6/10 |
| Latin Small Letter N  |  n    |   n     |   n    | 156 | 0x6E |110  | 6/10 |
| Latin Small Letter O  |  o    |   o     |   o    | 157 | 0x6F |111  | 6/10 |
| Latin Small Letter P  |  p    |   p     |   p    | 160 | 0x70 |112  |  7/1 |
| Latin Small Letter Q  |  q    |   q     |   q    | 161 | 0x71 |113  |  7/2 |
| Latin Small Letter R  |  r    |   r     |   r    | 162 | 0x72 |114  |  7/3 |
| Latin Small Letter S  |  s    |   s     |   s    | 163 | 0x73 |115  |  7/4 |
| Latin Small Letter T  |  t    |   t     |   t    | 164 | 0x74 |116  |  7/5 |
| Latin Small Letter U  |  u    |   u     |   u    | 165 | 0x75 |117  |  7/6 |
| Latin Small Letter V  |  v    |   v     |   v    | 166 | 0x76 |118  |  7/7 |
| Latin Small Letter W  |  w    |   w     |   w    | 167 | 0x77 |119  |  7/8 |
| Latin Small Letter X  |  x    |   x     |   x    | 170 | 0x78 |120  |  7/9 |
| Latin Small Letter Y  |  y    |   y     |   y    | 171 | 0x79 |121  | 7/10 |
| Latin Small Letter Z  |  z    |   z     |   z    | 172 | 0x7A |122  | 7/11 |
| Left Curly Bracket    |  {    |   {     |   {    | 173 | 0x7B |123  | 7/12 |
| Vertical Line         |  \|   |   \|    |   \|   | 174 | 0x7C |124  | 7/13 |
| Right Curly Bracket   |  }    |   }     |   }    | 175 | 0x7D |125  | 7/14 |
| Tilde                 |  ~    |   ~     |   ~    | 176 | 0x7E |126  | 7/15 |
| Delete                | DEL   |  DEL    |  DEL   | 177 | 0x7F | 127 | 7/16 |

### :one::two::eight:-:one::five::nine:

| Stick | Pos  | CP-1252 | 8859-1 | Hex  | Dec | Description |
| :---: | ---: | :-----: | :----: | ---: | --: | :---------- |
|  8    |   1  |    €    |  PAD   |  0x80 | 128  | Pad Stop |
|       |   2  |         |  HOP   |  0x81 | 129  | High octet preset |
|       |   3  |    ‚    |  BPH   |  0x82 | 130  | Break Permitted Here    |
|       |   4  |    ƒ    |  NBH   |  0x83 | 131  | No Break Here |
|       |   5  |    „    |  IND   |  0x84 | 132  | Index         |
|       |   6  |    …    |  NEL   |  0x85 | 133  | Next Line               |
|       |   7  |    †    |  SSA   |  0x86 | 134  | Start of Selected Area  |
|       |   8  |    ‡    |  ESA   |  0x87 | 135  | End of Selected Area    |
|       |   9  |    ˆ    |  HTS   |  0x88 | 136  | Horizontal Tabulation Set |
|       |  10  |    ‰    |  HTJ   |  0x89 | 137  | Horizontal Tabulation with Justification |
|       |  11  |    Š    |  VTS   |  0x8A | 138  | Vertical Tabulation Set     |
|       |  12  |    ‹    |  PLD   |  0x8B | 139  | Partial Line Down    |
|       |  13  |    Œ    |  PLU   |  0x8C | 140  | Partial Line Up   |
|       |  14  |         |  RI    |  0x8D | 141  | Reverse Line Feed       |
|       |  15  |    Ž    |  SS2   |  0x8E | 142  | Single-Shift 2          |
|       |  16  |         |  SS3   |  0x8F | 143  | Single-Shift 3          |


| Stick | Pos  | CP-1252 | 8859-1 | Hex  | Dec | Description |
| :---: | ---: | :-----: | :----: | ---: | --: | :---------- |
|  9    |   1  |         |  DCS   | 0x90 | 144 | Device control string |
|       |   2  |    ‘    |  PU1   | 0x91 | 145 | Private use 1 |
|       |   3  |    ’    |  PU2   | 0x92 | 146 | Private use 2 |
|       |   4  |    “    |  STS   | 0x93 | 147 | Set transmit state |
|       |   5  |    ”    |  CCH   | 0x94 | 148 | Cancel character |
|       |   6  |    •    |   MW   | 0x95 | 149 | Message waiting |
|       |   7  |    –    |  SPA   | 0x96 | 150 | Start protected area |
|       |   8  |    —    |  EPA   | 0x97 | 151 | End protected area |
|       |   9  |    ˜    |  SOS   | 0x98 | 152 | Start of string |
|       |  10  |    ™    | SGCI   | 0x99 | 153 | Single graphic character introducer |
|       |  11  |    š    |  SCI   | 0x9A | 154 | Single character introducer |
|       |  12  |    ›    |  CSI   | 0x9B | 155 | Control sequence introducer |
|       |  13  |    œ    |   ST   | 0x9C | 156 | String terminator |
|       |  14  |         |  OSC   | 0x9D | 157 | Operating system command |
|       |  15  |    ž    |   PM   | 0x9E | 158 | Private message | 
|       |  16  |    Ÿ    |  APC   | 0x9F | 159 | Application program command |

### :one::six::zero:-:two::five::five:

| Stick | Pos  | CP-1252 | 8859-1 | Hex  | Dec | Description |
| :---: | ---: | :-----: | :----: | ---: | --: | :---------- |
|  10   |   1  | [NBSP]  | [NBSP] |  0xA0 | 160  | No-Break Space          |
|      |    2 |         |        |  0xA1 | 161  | Inverted Exclamation Mark |
|      |    3 |         |        |  0xA2 | 162  | Cent Sign               |
|      |    4 |       |       |  0xA3 | 163  | Pound Sign              |
|      |    5 |       |       |  0xA4 | 164  | Currency Sign           |
|      |    6 |       |       |  0xA5 | 165  | Yen Sign                |
|      |    7 |       |       |  0xA6 | 166  | Broken Bar              |
|      |    8 |       |       |  0xA7 | 167  | Section Sign            |
|      |    9 |       |       |  0xA8 | 168  | Diaeresis               |
|      |   10 |       |       |  0xA9 | 169  | Copyright Sign          |
|      |   11 |       |       |  0xAA | 170  | Feminine Ordinal Indicator |
|      |   12 |       |       |  0xAB | 171  | Left-Pointing Double Angle Quotation Mark |
|      |   13 |       |       |  0xAC | 172  | Not Sign                |
|      |   14 |       |       |  0xAD | 173  | Soft Hyphen             |
|      |   15 |       |       |  0xAE | 174  | Registered Sign         |
|      |   16 |       |       |  0xAF | 175  | Macron                  |
|      |      |       |       |       |      |                         |
|  11  |    1 |       |       |  0xB0 | 176  | Degree Sign             |
|      |    2 |       |       |  0xB1 | 177  | Plus-Minus Sign         |
|      |    3 |       |       |  0xB2 | 178  | Superscript Two         |
|      |    4 |       |       |  0xB3 | 179  | Superscript Three       |
|      |    5 |       |       |  0xB4 | 180  | Acute Accent            |
|      |    6 |       |       |  0xB5 | 181  | Micro Sign              |
|      |    7 |       |       |  0xB6 | 182  | Pilcrow Sign            |
|      |    8 |       |       |  0xB7 | 183  | Middle Dot              |
|      |    9 |       |       |  0xB8 | 184  | Cedilla                 |
|      |   10 |       |       |  0xB9 | 185  | Superscript One         |
|      |   11 |       |       |  0xBA | 186  | Masculine Ordinal Indicator |
|      |   12 |       |       |  0xBB | 187  | Right-Pointing Double Angle Quotation Mark |
|      |   13 |       |       |  0xBC | 188  | Fraction One Quarter    |
|      |   14 |       |       |  0xBD | 189  | Fraction One Half       |
|      |   15 |       |       |  0xBE | 190  | Fraction Three Quarters |
|      |   16 |       |       |  0xBF | 191  | Inverted Question Mark  |
|      |      |       |       |       |      |                         |
|  12  |    1 |       |       |  0xC0 | 192  | Latin Capital Letter A with Grave |
|      |    2 |    ¡   |    ¡   |  0xC1 | 193  | Latin Capital Letter A with Acute |
|      |    3 |    ¢   |    ¢   |  0xC2 | 194  | Latin Capital Letter A with Circumflex |
|      |    4 |    £   |    £   |  0xC3 | 195  | Latin Capital Letter A with Tilde |
|      |    5 |    ¤   |    ¤   |  0xC4 | 196  | Latin Capital Letter A with Diaeresis |
|      |    6 |    ¥   |    ¥   |  0xC5 | 197  | Latin Capital Letter A with Ring Above |
|      |    7 |    ¦   |    ¦   |  0xC6 | 198  | Latin Capital Letter AE (ligature) |
|      |    8 |    §   |    §   |  0xC7 | 199  | Latin Capital Letter C with Cedilla |
|      |    9 |    ¨   |    ¨   |  0xC8 | 200  | Diaeresis               |
|      |   10 |    ©   |    ©   |  0xC9 | 201  | Copyright Sign          |
|      |   11 |    ª   |    ª   |  0xCA | 202  | Feminine Ordinal Indicator |
|      |   12 |    «   |    «   |  0xCB | 203  | Left-Pointing Double Angle Quotation Mark |
|      |   13 |    ¬   |    ¬   |  0xCC | 204  | Not Sign                |
|      |   14 |    ­   |    ­   |  0xCD | 205  | Soft Hyphen             |
|      |   15 |    ®   |    ®   |  0xCE | 206  | Registered Sign         |
|      |   16 |    ¯   |    ¯   |  0xCF | 207  | Macron                  |
|      |      |        |        |       |      |                         |
|  13  |    1 |    °   |    °   |  0xD0 | 208  | Degree Sign             |
|      |    2 |    ±   |    ±   |  0xD1 | 209  | Plus-Minus Sign         |
|      |    3 |    ´   |    ´   |  0xD2 | 210  | Acute Accent            |
|      |    4 |    µ   |    µ   |  0xD3 | 211  | Micro Sign              |
|      |    5 |    ¶   |    ¶   |  0xD4 | 212  | Pilcrow Sign            |
|      |    6 |    ·   |    ·   |  0xD5 | 213  | Middle Dot              |
|      |    7 |    ¸   |    ¸   |  0xD6 | 214  | Cedilla                 |
|      |    8 |    ¹   |    ¹   |  0xD7 | 215  | Superscript One         |
|      |    9 |    º   |    º   |  0xD8 | 216  | Masculine Ordinal Indicator |
|      |   10 |    »   |    »   |  0xD9 | 217  | Right-Pointing Double Angle Quotation Mark |
|      |   11 |    ¼   |    ¼   |  0xDA | 218  | Fraction One Quarter    |
|      |   12 |    ½   |    ½   |  0xDB | 219  | Fraction One Half       |
|      |   13 |    ¾   |    ¾   |  0xDC | 220  | Fraction Three Quarters |
|      |   14 |    ¿   |    ¿   |  0xDD | 221  | Inverted Question Mark  |
|      |   15 |    À   |    À   |  0xDE | 222  | Latin Capital Letter A with Grave |
|      |   16 |    Á   |    Á   |  0xDF | 223  | Latin Capital Letter A with Acute |
|      |      |        |        |       |      |                         |
|  14  |    1 |    à   |    à   |  0xE0 | 224  | Latin Small Letter A with Grave |
|      |    2 |    á   |    á   |  0xE1 | 225  | Latin Small Letter A with Acute |
|      |    3 |    â   |    â   |  0xE2 | 226  | Latin Small Letter A with Circumflex |
|      |    4 |    ã   |    ã   |  0xE3 | 227  | Latin Small Letter A with Tilde |
|      |    5 |    ä   |    ä   |  0xE4 | 228  | Latin Small Letter A with Diaeresis |
|      |    6 |    å   |    å   |  0xE5 | 229  | Latin Small Letter A with Ring Above |
|      |    7 |    æ   |    æ   |  0xE6 | 230  | Latin Small Letter AE (ligature) |
|      |    8 |    ç   |    ç   |  0xE7 | 231  | Latin Small Letter C with Cedilla |
|      |    9 |    è   |    è   |  0xE8 | 232  | Latin Small Letter E with Grave |
|      |   10 |    é   |    é   |  0xE9 | 233  | Latin Small Letter E with Acute |
|      |   11 |    ê   |    ê   |  0xEA | 234  | Latin Small Letter E with Circumflex |
|      |   12 |    ë   |    ë   |  0xEB | 235  | Latin Small Letter E with Diaeresis |
|      |   13 |    ì   |    ì   |  0xEC | 236  | Latin Small Letter I with Grave |
|      |   14 |    í   |    í   |  0xED | 237  | Latin Small Letter I with Acute |
|      |   15 |    î   |    î   |  0xEE | 238  | Latin Small Letter I with Circumflex |
|      |   16 |    ï   |    ï   |  0xEF | 239  | Latin Small Letter I with Diaeresis |
|      |      |        |        |       |      |                         |
|  15  |    1 |    ð   |    ð   |  0xF0 | 240  | Latin Small Letter Eth (Icelandic) |
|      |    2 |    ñ   |    ñ   |  0xF1 | 241  | Latin Small Letter N with Tilde |
|      |    3 |    ò   |    ò   |  0xF2 | 242  | Latin Small Letter O with Grave |
|      |    4 |    ó   |    ó   |  0xF3 | 243  | Latin Small Letter O with Acute |
|      |    5 |    ô   |    ô   |  0xF4 | 244  | Latin Small Letter O with Circumflex |
|      |    6 |    õ   |    õ   |  0xF5 | 245  | Latin Small Letter O with Tilde |
|      |    7 |    ö   |    ö   |  0xF6 | 246  | Latin Small Letter O with Diaeresis |
|      |    8 |    ÷   |    ÷   |  0xF7 | 247  | Division Sign           |
|      |    9 |    ø   |    ø   |  0xF8 | 248  | Latin Small Letter O with Stroke |
|      |   10 |    ù   |    ù   |  0xF9 | 249  | Latin Small Letter U with Grave |
|      |   11 |    ú   |    ú   |  0xFA | 250  | Latin Small Letter U with Acute |
|      |   12 |    û   |    û   |  0xFB | 251  | Latin Small Letter U with Circumflex |
|      |   13 |    ü   |    ü   |  0xFC | 252  | Latin Small Letter U with Diaeresis |
|      |   14 |    ý   |    ý   |  0xFD | 253  | Latin Small Letter Y with Acute |
|      |   15 |    þ   |    þ   |  0xFE | 254  | Latin Small Letter Thorn (Icelandic) |
|      |   16 |    ß   |    ß   |  0xFF | 255  | Latin Small Letter Sharp S (German) |

## Links 

 - [Code: The Hidden Language of Computer Hardware and Software](https://www.charlespetzold.com/books/#code) Book (Chap 13)
    - [Interactive Illustrations](https://www.codehiddenlanguage.com/)


