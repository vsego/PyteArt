10 REM TYPEART.BAS
20 REM Program by Nick Higham 1982 (Commodore Basic),
30 REM and 1988 (GW-Basic/Turbo Basic).  (c) N.J. Higham 1982, 1988.
40 REM Designs by Bob Neill.  (c) A.R. Neill 1982, 1984.
50 CLS
60 PRINT TAB(30)"Typewriter Art":PRINT
70 PRINT"This program prints two pieces of `typewriter art' to an Epson compatible"
80 PRINT"printer. These examples are based on designs in the books:
90 PRINT
100 PRINT" [1]  Bob Neill's Book of Typewriter Art, Weaver's Press, 1982."
110 PRINT" [2]  Bob Neill's Second Book of Typewriter Art, Weaver's Press, 1984."
120 PRINT
130 PRINT"Both [1] and [2] contain 20 pictures, each presented as a pattern for
135 PRINT"typing with an example of the final result.  The first book is out
140 PRINT"of print, but the second is available at the price of �7.50
150 PRINT"(post free) from
160 PRINT
170 PRINT TAB(7)"Weavers Press Publishing
180 PRINT TAB(7)"Tregeraint House
190 PRINT TAB(7)"Zennor
200 PRINT TAB(7)"Cornwall, TR26 3DB
220 PRINT TAB(7)"England
230 PRINT TAB(7)"Tel. 0736 797061
240 PRINT
250 PRINT"This program was written by Nick Higham, (c) 1982, 1988.
260 PRINT"The designs are by A.R. Neill, (c) 1982, 1984.
270 WHILE INKEY$<>"": WEND
280 PRINT:PRINT TAB(27)"Press any key to continue...";
290 WHILE INKEY$="": WEND
300 '
310 CLS
320 PRINT "1.  H.R.H. Prince Charles (from book [1])"
330 PRINT "2.  The Tabby Cat         (from book [2])"
340 PRINT: INPUT "Which picture (1 or 2)";Z$
350 IF Z$<>"1" AND Z$<>"2" THEN 340
360 IF Z$="1" THEN T$="H.R.H. Prince Charles"
370 IF Z$="2" THEN T$ = "The Tabby Cat"
380 READ X$
390 WHILE X$<>T$: READ X$: WEND
400 '
410 PRINT: INPUT "Epson FX/LX (1) or LQ (2) compatible printer (1 or 2)";Z$
420 IF Z$<>"1" AND Z$<>"2" THEN 410
430 RESET.CODE$ = CHR$(27)+"@"
440 ZERO.LFEED$ = CHR$(27)+"A"+CHR$(0)    ' EPSON LQ-800 0 INCH
450 NORMAL.LFEED$ = CHR$(27)+"A"+CHR$(6)  ' EPSON LQ-800 6/60 INCH
460 IF Z$="2" GOTO 490
470 ZERO.LFEED$ = CHR$(27)+"3"+CHR$(0)    ' EPSON FX-80 0 INCH
480 NORMAL.LFEED$ = CHR$(27)+"3"+CHR$(21) ' EPSON FX-80 21/216 INCH
490 '
500 PRINT: INPUT "Printer port LPT1 or LPT2 (1 or 2)";PP$
510 IF PP$<>"1" AND PP$<>"2" THEN 500
520 '
530 REM -----------------------------
540 REM ROUTINE TO PRINT OUT DATABASE
550 REM -----------------------------
560 DEV$ = "LPT"+PP$+":"
570 OPEN DEV$ FOR  OUTPUT AS #1
580 PRINT #1, RESET.CODE$
590 WIDTH #1,255 ' this stops basic inserting unwanted carriage returns
600  GOSUB  800
610 L$=""
620  GOSUB 700:IF A$="/" THEN PRINT#1, NORMAL.LFEED$+L$: GOTO 610
630 IF A$="-" THEN PRINT#1, ZERO.LFEED$;L$: GOTO 610
640 A=ASC(A$):IF A>47 AND A<58 THEN A=A-48: GOTO 660
650 L$=L$+A$: GOTO 620
660  GOSUB 700:B=ASC(A$):IF B>47 AND B<58 THEN A=10*A+B-48: GOSUB 700
670 FOR I=1 TO A:L$=L$+A$:NEXT: GOTO 620
680 '
690 REM -- SUBROUTINE TO TAKE NEXT CHARACTER FROM Z$
700 A$=MID$(Z$,P,1):P=P+1: IF A$<>" "  AND A$<>"" THEN 730
710 IF P>Z THEN GOSUB 800
720 GOTO 700
730 IF A$="]" THEN A$=" "
740 IF A$="#" THEN A$=CHR$(34)
750 IF A$="^" THEN A$=":"
760 IF P>Z THEN GOSUB 800
770 RETURN
780 '
790 REM -- SUBROUTINE TO READ NEXT LUMP OF DATA
800 READ Z$:Z=LEN(Z$):P=1
810 IF Z$="PAUSE" THEN  FOR D=1 TO 20000:NEXT: GOTO 800
820 IF Z$="FINISH" THEN PRINT #1, CHR$(12)+RESET.CODE$: CLOSE #1:END
830 RETURN
840 '
850 REM -------------------------------------
860 REM * DATABASE1 - H.R.H. PRINCE CHARLES *
870 REM -------------------------------------
880 '
890 DATA "H.R.H. Prince Charles"
900 DATA  79G/79G/79G/79G
910 DATA  /79G-25]2.2^2&^L2^2&3^2.
920 DATA /26G16@&36G-22]2.^9]&S&3S2&3^.
930 DATA /22G23@34G-20].^10&]3&^6Y2C&^.
940 DATA /19G31@29G-17].^6&C&4C6&2^1]1'2#2]&.2]^.-25]^]2^]^
950 DATA /17G35@27G-16].5&^6&^#^.2^.3]^]^2].#3&2^^.-30].14].
960 REM --10
970 DATA /15G40@24G-13].^2]5&4^2&^]3^3]'3]^&]#2]5&3]2&.-27].15].
980 DATA/13G45@21G-12]^6&^5&^.'4]#^.]^.3].#^9&]2.2&.-42].
990 DATA /12G47@20G-11].&^7&^.5]^6]#^.2&^.2^.#9&^2.#.
1000 DATA /11G49@19G-11]A2&2#.^.#2@.#'^]#'2&5]#^2.#^.13&.2]#.-19].39].
1010 DATA /11G50@18G-10]^]4&]5&.^2]#^2&^#'2&]^2]&^15&^2&2].
1020 DATA /10G52@17G-9]^.4&^2&.&^.3]#^.3]&.].2]#'2&18&^.].
1030 DATA /10G53@16G-8].3&3S&S3&'3]#^.]^.2]2&^&'^3&^10&^9&2.
1040 DATA /9G53@17G-8]3&2]S2^S4]#3]#.]2&]^#26&]^3&.
1050 DATA /8G57@14G-7]^4&^.4&.3&.2]'^.#3&.2S29&].
1060 DATA /7G44@3&11@14G-6].4&.3&#2&2]#2.]&^@^3&^&18&9#5&1&-51]'7]'5].
1070 REM --20
1080 DATA  PAUSE
1090 DATA /7G42@4&4@4&5@13G-6]4&^.#4&6]#2^2.#20&2#.3^2&^3#5&.-12].15].20]'8]3.
1100 DATA /6G40@T2&12@&5@12G-6]3&2^2&2S2]4#2&.#]6&4S10&2#.'11]^3&2].-17].5].
1110 DATA /6G11@&13@4&10@2&21@11G-5]^3&2^#.3&].7&3A]2&4#'2&^4]^]#.2]2^]^2'&
1120 DATA &^#&]&^4&.-15]^43].
1130 DATA /5G16@7&@2&2@^&2@3&2@4&4@2&2@3&11@11G
1140 DATA -5]4&&2L6&^2]2#'#2]#'8]##'^4].^3]&2T].3T#'^#4]3&-21].32]2^.3].
1150 REM --24
1160 DATA /5G15@T#']'#2'#^14&24@11G
1170 DATA -5]4&#^'.2&^'.2]#2.3]4.13]^'2^']#]^&3^'#^'].']^#2&^-14]^#41].7]'
1180 DATA /5G10@4&'9].2^9&27@11G
1190 DATA -5]4&2]&^2]#'25]^2]^2]&]2^#]3&]&.]^]'^2]&^-15]'36].
1200 DATA /5G7@3&^.#13]2.#'4^3&26@&10G
1210 DATA -5]7&2#19]2.8]'^']2&]&#3&]3&^]&]^&2]&-51].
1220 DATA /5G6@&'#18]7.2^&26@&10G
1230 DATA -5]6&32]#']^#&]&S2&^.3&^.]2^&]^&
1240 DATA /5G5@^21]9.2&25@&10G-5]5&#31]^2]^&^&.13&.&^.&].
1250 DATA /5G4@#21]9.^2&26@10G-5]4&'32]^2]2.#10&#3&^3&^&^-47].10].8].
1260 REM --30
1270 DATA /5G4@21]10.^&27@10G-5]4&35]2^12&#2^9&-58].]#
1280 DATA /4G4@P20]10.^2&27@&9G-4]A3&#36]&&7&&14&].
1290 DATA /4GC3@^20]10.^3&27@&8G-4]VV3&34]^2]8&]#3&#].8&-4]37]#11].
1300 DATA /4GC3@'19]10.2^3&27@&8G-4]A3&34]'].8&^2&^.'4&^6&.
1310 DATA /4G4@20]11.^3&28@8G-4]4&36]^7&^11&#5&].
1320 DATA /4G4@20]9.3^3&29@&6G-4]4&35]^8&2&10&S#5&
1330 DATA /4GS3@20]9.2^5&27@G&6G-4]V3&35]'5&&2&&']'6&&^3&2&2&#-4]'66]'
1340 DATA /5G3@21]9.2^5&26@&7G-4]'3&36]#7&^5]#'#]#3&&4&]^-44]'13].3].
1350 DATA /5G3@24]6.3^4&28@6G-5]3&37]6&']#.2&3]^6&&4&-53].14].
1360 DATA /5G3@20]3.2^2.2]2.^6&27@6G-6]2&36]'#5&2]^19&.-45]'
1370 REM --40
1380 DATA  PAUSE
1390 DATA /5GC2@13]3.2^.^6&2^2.2].6&26@6G-5]V2&36]2^V13&&12&#-5]'40]'26].
1400 DATA /6G2@4.8].3&4@8&2@^2.7&25@6G-5]#2&16]3&5].10]2^#2&#2^&&18&^
1410 DATA /6G@&.4&3@&.3]11@&6@.]7&&24@6G-5]^&#16]6&6]2^5]^2.^]#24&V-48]'24]'
1420 DATA /6G2@^@2&5@&3]&6@3&9@3&^2.&&2&13@3&7@6G
1430 DATA -6]^4].10]3&'4#'3#'11].2]#12&&2#'7&'-63]'
1440 DATA /7G2&8@&2].^&2@2&4@7&2@^&^4.3&11@4&2^&5@6G
1450 DATA -6]#3]5&10]3.^#]'2^.12]^]'11&#5]#5&^-61]'5]'
1460 DATA /7G11&3].&4@2&2@10&2^4.^3&9@9&4@6G
1470 DATA -6]^^2]^2#2.2^.10]2.^S^.]#2^13]#9&#2].^.2]#4&^-60]'7]'
1480 DATA /7G&^3&^3&2@3].2@&2@&@&3@5&^5.]2.2^2&9@2&5@&^&3@6G
1490 DATA -6]^]#].^4#^.10]&&3S2^.#'#12]9&9]^3&-12]3.13]^#].37]#
1500 DATA /7G^.&4@J2&@3].@2&@&@C]4@#2@&3^.]3.3^2&9@&2@2&2@&2.3@6G
1510 DATA -6]#2]2^]2SV^.10]^#]4S.#^14]8&J3]2#2]']#3&-14]'13].30].9]'
1520 DATA /8G]2@&3@&#V3].2&@#@#'^#2@#^@&3^.3]3.3^&8@2&@&2.2&@2.3@6G
1530 DATA -11]#3S^2'7].]2.]'2S'18]7&3]#2]#4]3&-30]4.
1540 DATA /8G]&@'3@.^'2].2&2@&#10&^3.3]3.2^2&8@2&@&3.&@2.3@6G
1550 DATA -7]^4]3S12]8^16].7&11]3&
1560 REM --50
1570 DATA /8G]2#^#T#.^3].2&@&2@9&^.6]4.^2&7@4&^3.2&2.2@V6G-10].].#.9]#27]6&
1580 DATA ^].9]&^'-58]#
1590 DATA /8G2]6&^3].2&@&@#&#5&^.9]3.^2&8@3&2.].2&2.@&7G-34]#17]6&2]^.8]&]'
1600 DATA /8G2]#4&@4]^2&@2&^'.2]2#11]3.2^&@&7@&2@&.].2&.&@8G
1610 DATA -52]5&^2]2@.7]&#-27]#
1620 DATA /8G3]#2@'#3].2&2@&^#2.14]3.2^2&9@&3@2.]2&.&@8G-14]2.10].25]5&^12]2&
1630 DATA /8G6].^2].6&^2.]2.11]3.2^4&8@&@&@^2]&^.&@8G-52]'4&13]&V
1640 DATA /8G5]2.^2].6&^.14].4^3&9@3&@#@2.&.2^@8G-51]^]4&2]^.].6]#&
1650 DATA /8G7]'2].^5&^2.10]4.^4&11@&@&2.&].&.3@8G-52]^4&3]#7]^2&
1660 DATA /8G6].2].^&@3&&2.8]2.5^4&12@&@&2.&.2&.&2@8G-51]^4&#11].2&.-56]'
1670 DATA /8G2.4].2]2.&@5&2.7]3.3^6&10@2&2@&'2.&#.4@7G-51]^3&3].&2].3].]3&A
1680 DATA /8G6.3].^2@2&2@&^.7]4.2^5&11@&2@#3.&2.&4@&6G-52]#2&4]@.6].4&].
1690 REM --60
1700 DATA  PAUSE
1710 DATA /8G^5.4]2&@&^#&2@2.5]6.^5&4@3&4@&@&2.2&2.&6@&5G
1720 DATA -21]^]^33]^]#7]6&-59]'
1730 DATA /8GL4.5]3&#3.&@&2.4]6.^5&5@&4@&@#2.&#].&6@7G
1740 DATA -18].2^.3]#32].7]6&V#-72]'
1750 DATA /9G4.5]3&4.&@&2.3]6.2^5&4@3&3@&#2.2&2].&5@8G-25].31].7]^6&#-71]#
1760 DATA /9G7.^&6@2&@2.3]6.3^4&5@3&4@2&.^2].&6@8G-13]#7].^.41]6&#
1770 DATA /9GT2.2]&9@2&@.4]6.^.^5&5@2&4@2&2^2.&7@8G-9]^9].4&2.28]3F7]7&
1780 DATA /9G&3.]#6@4&@&6]5.2^.5&6@&4@7&7@8G-9]^6].2^F4#^29]3F6]^7&
1790 DATA /10G3.3]&4@4&^#7]5.3^3&12@4&10@8G-9]^6]#38]2F5]9&
1800 DATA /10G3.4]&3@3&^2.7]6.2^5&10@4&10@8G-55]2F.2].^F5&^
1810 DATA /10G2.4].&2@3&2^.9]3.2^.2^5&23@8G-55]9F7&V
1820 DATA /10G3.4]^&@2&2^3.5]2.]4.3^6&22@&8G-55]4F&4F&5&#V-71]'
1830 REM --70
1840 DATA /10GL2.4].^2&8.2]3.2]3.3^6&22@9G-10]^43]5F2]2F]2F3&&#'
1850 DATA /11G2.8]10.^2.2]4.2^6&22@9G-53]5F2]2F3]2F2&&
1860 DATA /11G.5]4.2^11.3]4.^6&&21@9G-53]5F3]F2]3F3&
1870 DATA /11G^.].^&@3&5@4&^3.4]4.^4&22@10G-28]^]^22]5F2]F3]^2F2&^
1880 DATA /11GL2]2&3@2&10@^2.5]4.5&22@9G-11]^10].3&4]^22]5F6]S2]&2&
1890 DATA /12G2]^3@8&3@^2'2.5]3.5&23@9G-14]#3&4#30]5F5]SA]3&2&
1900 DATA /12G^]^&10^2&1^2.]3.3]4.5&23@9G-15]^35]6F4].S2]3F&'
1910 DATA /13G]2.&9@4&5.2]5.3&23@#2]8G-51]5F4]S3]4F
1920 DATA /13G.3^9@4&4.2]4.4&22@#4]#7G-16]#]3.2^.26]5F4]^#].3F'4]'
1930 DATA /13GL4^10@2&5.2]2.2&24@#6]7G-13]^5]7&&22]6F'4]S].2F
1940 REM --80
1950 DATA  PAUSE
1960 DATA /14G5^7@5&2^6.3&21@#8]7G-20]2#'2#23]7F4]S#.F'
1970 DATA /14GL4^&3@10&3^2.2@3&18@#9].2&5G-14]^39]'3]S'.10]2^.
1980 DATA /15G5^#^.#2'#4&^6&22@#8]^5M4G-20].2].21]9F3]S]F10]6@
1990 DATA /15GL3^3].5]#'6&22@#7].^8@3G-15]^29]8F3]SF10]8M
2000 DATA /16G.^12]#.^2&22@#7]^11@2G-44]6F]F3].F9]10M^
2010 DATA /17G^3]2.7]3.2&21@#6]^13@2G-37]3F2]7F6]F8]13M^
2020 DATA /17GL2]4.9]^&19@#6]^17@-17]^19]3F2]7F4]F'7]17M
2030 DATA /18G3]4.3]2.3]&19@#5].^18@-36]12F4]F8]18M
2040 DATA /18GL]5.2]4.2&19@#6]20@-18]^19]9F4]F7]^19M
2050 DATA /19G2^2&@&^.3&20@#5].^21@-37]8F13]21M
2060 REM --90
2070 DATA /19GL&27@#6].&22@-19]^14]10F12]^22M
2080 DATA /22G24@#6].^24@-21]#21F12]24M-21]'
2090 DATA /25G20@#6].&25@-23]#'17F11]^25M
2100 DATA /28G14@V#6].^27@-27]2#]6F3]F2]#9]27M
2110 DATA /29G12@#7].29@-36]4F10]29M
2120 DATA /29G10@#7].^30@-29]2&7]#10]30M
2130 DATA /79G/79G/79G/79G/
2140 DATA  FINISH
2150 '
2160 '
2170 REM ------------------------------
2180 REM * DATABASE2 - THE TABBY CAT *
2190 REM ------------------------------
2200 '
2210 DATA "The Tabby Cat"
2220 DATA 80C/80C/80C/80C/80C
2230 DATA -72] 1^ 2&
2240 DATA /71C 3@ 1& 5C-70] 1&-70] 1^
2250 DATA /69C 1& 1# 3] 1' 5C-68] 1. 6] 1.
2260 DATA /68C 1& 1F 2] 2. 1^ 1# 4C-75] 1^
2270 DATA /67C 1& 1# 1] 2. 3^ 1. 1'3C
2280 DATA /2C ^& 62C &# 2.^2.2^.'3C-5] 1.
2290 DATA /3C 1& 2C 2& 57C 1& 1# 1] 2. 4^ 1& 2. 3C-2] 1. 1] 1^ 1.
2300 DATA /3C 5& 56C 1& 1' 1] 1. 1' 1^ 1. 1^ 4& 1^ 1J 2C-2] 1^ 5] 1. 68] 1'
2310 DATA /2C 1L 1] 1^ 1. 2] 1# 1@ 53C 1&  1' 1] 2. 2C 1# 1. 1' 1# 3& 1] 2C-10] 1.
2320 DATA /2C 1@ 1^ 3. 1^ 2] 1# 1& 50C 1& 1# 2] 1^ 2. 1^ 1# 2^ 1. 3& 1] 2C-2] 1&-2] 1S
2330 DATA /2C 2@ 2& 3^ 1. 1] 1# 1& 48C 1& 1# 1] 2. 4^ 1] 1. 1^ 3& 1C 1] 2C-2] 2&-2] 2S
2340 REM --- 16
2350 DATA /2C 2@ 2& 2# 1^ 2. 1] 1# 1& 22C 1& 1C 1& 3@ 3C 1@ 1& 1C 1& 11C 1@ 1# 2. 1^
2360 DATA  2# 1. 2^ 1. 5& 1# 1] 2C
2370 DATA -1] 3& 1S 1] 2. 6] 1. 13] 1. 1] 1^ 3] 1. 2] 1^ 5] 1. 1^ 2] 1. 3] 1^ 1. 6] 1.
2380 DATA 6] 1.-2] 2S
2390 DATA /1C 5@ 1& 1. 1# 1^ 2. 2] 1# 1& 16C 1& 3C 2& 3@ 1& 1C 1@ 1C 5@ 1C 1& 1@ 6C 1@ 1W
2400 DATA 4. 2^ 2# 1. 3& 2@ 1& 1. 1] 2C
2410 DATA -1] 3& 12] 1. 9] 1. 1] 1^ 1. 2& 2] 1^ 2] 1^ 3& 1] 1^ 1] 1^ 5] 1. 2] 1. 4] 1^ 1]
2420 DATA 1#-1] 2S
2430 DATA /1C 5@ 1# 1. 1^ 1. 2^ 1. 2] 1# 1& 10C 2& 1C 1@ 1C 1@ 1& 8@ 1& 2@ 1& 4@ 2& 2@
2440 DATA  3C 2@ 1# 1] 2. 1] 4^ 1# 1. 1# 1& 2@ 1& 1^ 2. 2C
2450 DATA -1] 4& 1# 10] 1T 1. 8] 1. 2] 1^ 1] 1. 2] 1& 2] 4& 5] 1^ 1] 1^ 1& 1T 1] 1^ 1. 1^
2460 DATA 1. 1^ 11] 1. 1] 1.-1] 2S
2470 DATA /1C 7@ 1& 1^ 3# 1. 2] 1' 1V 1& 7C 1& 3@ 1& 1@ 1& 9@ 1& 1@ 1& 6@ 1& 1@ 1& 4@ 1#
2480 DATA 1] 4. 2^ 3& 1^ 1. 2# 2& 2. 1] 2C
2490 DATA -1] 5& 1] 1& 2] 1. 5] 1# 1] 2.  4] 1. 1] 1^ 1. 1^ 3] 2& 3] 3& 7] 2& 4] 1& 1] 2&
2500 DATA 13] 1. 1^-1] 2S
2510 DATA /1C 5@ 3# 1^ 1& 1# 1^ 1# 1^ 1. 2] 1# 2@ 5C 2@ 1& 2@ 1& 1@ 1& 1@ 1& @& 4@ 2& 2@ 1&
2520 DATA 1@ 1& 4@ 1& 3@ 1# 4. 1^ 2# 1] 2. 1^ 1& 2# 2@ 1& 2. 1] 2C
2530 DATA -1] 5& 3. 10] 2& 1. 1] 1. 1] 1^ 1] 1& 1] 2& 3] 1& 3] 2& 7] 1& 1] 3& 2] 3& 13]
2540 DATA 1. 1^-1] 3S 2.
2550 DATA /1C 6@ 1& 1^ 1. 1& 1@ 2# 1^ 3. 1] 1' 3@ 3C 2@ 1& 3@ 1& 2@ 1& 6@ 1& 1@ 1& 2@ 1&
2560 DATA 8@ 1' 3. 1^ 1# 1] 1. 2] 1. 1# 1' 2^ 1# 1& 1@ 1& 1^ 1. 1] 2C
2570 DATA -1] 5& 17] 2^ 2& 2] 2& 6] 4& 9] 2& 1] 3& 15] 1.
2580 DATA -1] 2S 1] 3'
2590 DATA /2C 5@ 1& 1@ 1& 1# 1. 1^ 1# 2& 1# 1^ 1. 2] 1# 6@ 2&   2@ 2& 1@ 1& 7@ 2& 2@ 1&
2600 DATA 1@ 1& 2@ 1& 2@ 1& 3^ 1. 2# 6^ 2. 1# 3@ 1& 2^
2610 DATA -1] 1V 5& 6] 1. 10] 4& 6] 1& 2] 1& 1] 1&  13] 2& 5] 2. 8] 1. 7] 2C
2620 DATA -1] 1' 1S
2630 REM --- 23
2640 DATA /2C 5@ 1& 1^ 3# 1^ 2# 1. 1^ 3. 3] 1# 4@ 2& 2@ 2& 2@ 1& 1@ 1& 5@ 4& 4@
2650 DATA &@&. 3& 3^ 1# 2. 1] 1' 2^ 2& 3@ 1^ 2. 1] 2C
2660 DATA -1] 1' 5& 2] 1. 1] 1. 1] 1. 10] 4& 3] 1& 2] 1& 2] 1& 1] 1& 1] 1& 6] 1& 4] 1&
2670 DATA -2] 1S
2680 DATA /2C 6@ 1& 1^ 2# 1^ 1& 1# 2. 1^ 1] 1. 3& 1] 1# 4@ 1& 3@ 2& 10@ 3& 4@ 1& 1@ 4& 1^
2690 DATA 2& 6. 1' 1^ 1] 1. 1& 1@ 2& 1^ 1. 1] 2C
2700 DATA -2] 6& 2] 2. 13] 3&  3] 2& 2] 1& 1] 3& 9] 1& 5] 1. -2] 2S
2710 DATA /2C 6@ 2& 1@ 1& 1# 1. 1& 1^ 1# 1^ 1& 1. 3& 1. 1] 1# 3@ 2& 3@ 1& 6@ 1& 1@ 1& 1@
2720 DATA 3& 3@ 3& 1@ 6& 1. 1^ 2. 2^ 4& 1@ 3& 2^ 1] 2C
2730 DATA -2] 5& 3] 1& 5] 1^ 10] 1& 4] 1& 3] 2& 1] 1&  8] 2& 1] 1.-2] 1S
2740 DATA /2C 1V 7@ 1# 1. 2^ 1] 1# 1.1# 1] 5& 1. 1^ 1& 1@ 1& 5@ 2& 9@ 2& 5@ 4& 1^ 3& 1^
2750 DATA 1# 1^ 1# 2. 1& 1^ 1# 1& 2@ 2& 2^ 1. 1] 2C
2760 DATA -2] 1^ 7& 11] 1. 9] 3& 2] 2& 1] 1& 2] 1& 5] 3& 2] 1# 14] 1. 1#-6] 3S
2770 DATA /3C 1& 5@ 1& 1@ 1# 2. 1^ 1. 1^ 1& 1^ 2& 1# 4& 3@ 1& 5@ 1& 8@ 3& 4@ 5& 2@
2780 DATA 3& 1. 1] 1. 2^ 2& 4@ 3& 2. 1] 2C
2790 DATA -2] 1# 1] 2& 1] 2& 1^ 1& 8] 1^ 1. 7] 1& 2] 3& 2] 2& 1] 1& 8] 2&-7] 1S
2800 DATA /3C 1^ 1# 5@ 1& 1^ 1. 1^ 1] 2. 1^ 1& 1@ 2& 1# 1& 2@ 1& 2@ 2& 3@ 2& 2@ 1& 3@ 1& 
2810 DATA 1@ 3& 4@ 1^ 9& 1^ 1. 1] 1. 1# 3& 3@ 1& 1# 3. 1] 2C
2820 DATA -4] 1^ 2] 3& 21] 3& 2] 1& 2] 2& 7] 2& 15] 1. 7] 1^ -8] 1S
2830 DATA /3C 1L 1^ 1J 4@ 1^ 1# 1^ 1. 1& 2^ 2& 1. 4& 3@ 1^ 1@ 2& 3@ 2& 3@ 1& 4@ 2& 1^ 4@ 
2840 DATA 3& 1^ 1@ 6& 1^ 1. 1' 1# 1^ 1. 1& 3@ 1# 1^
2850 DATA -6] 3& 1^ 1] 1. 20] 1& 3] 3& 1] 1& 1] 2& 4] 1& 25] 3. 1] 2C
2860 DATA /4C 1^ 1# 4@ 1^ 1. 1& 1@ 1& 1@   1& 1^ 2. 3& 2@ 1&   2@ 2& 3@ 3& 3@ 1# 4@ 3& 4@
2870 DATA 3& 1@ 4& 1@ 3& 2. 1] 2. 1& 3@ 1' 2. 3] 2C
2880 DATA -5] 1. 1& 2] 1& 21] 2& 3] 3& 1] 1& 1] 1& 5] 1&
2890 DATA /4C 1] 1^ 1& 4@ 1& 1^ 1. 1# 1^ 1# 
2900 DATA 1' 1# 1^ 6& 2@ 2& 4@ 2& 3@ 1^ 4@ 2& 5@ 5& 2@ 1& 1^ 2& 3^ 1. 2] 1& 2@ 1& 3. 2] 
2910 DATA 1. 1S 1C-7] 4& 5]  1. 15] 2& 2] 3& 1] 3& 4] 2& -8] 2S
2920 DATA /4C 1] 2' 6@ 2# 2. 1] 1. 1^ 2& 3@ 1^ 5& 8@ 1. 1& 2@ 1& 6@ 1& 1@ 3& 1@ 3& 1@ 4& 4.
2930 DATA 1& 3@ 1. 1& 1# 1. 2] 1S 1C-7] 6& 2. 16] 3& 2] 2& 3] 2& 2] 4& 24] 1^-8] 4S
2940 DATA /4C 1^ 1. 1' 1# 5@ 1& 1^ 4. 1& 3@ 1& 2@ 2& 1@ 1& 4@ 3& 2@ 1C 1& 2@ 1& 3@ 1& 1@
2950 DATA 1& 1@ 3& 1^ 1& 1^ 3& 1^ 1& 1^ 1& 1^ 3. 1& 4@ 1& 1' 3] 1T 1C 
2960 DATA -8] 5& 11] 2& 6] 2& 2] 1# 1& 3] 2& 1] 3&-9] 3S
2970 DATA /4C 1L 1] 1'1]   1# 5@ 1# 1^ 1. 1^ 1& 1@ 1# 1T 1&   4@ 3& 8@ 1& 1^ 2& 4@ 2& 3@
2980 DATA 2& 1@ 1^ 2& 1@ 2& 1^ 2& 2^ 3. 1^ 3@ 1& 2. 2] 1& 1E 1C
2990 DATA -8] 1^ 5& 1. 5] 1. 5] 1& 5] 1& 1] 3& 5] 1& 1] 2& -9] 4S
3000 DATA /4C 1E 3] 1. 1# 3@ 1# 2^ 1. 4@ 3& 4@ 1^ 2& 7@ 1&   1. 1^ 5@ 3& 2@ 3& 1^ 4& 1C 
3010 DATA 2^ 2& 2C 1^ 2. 1& 2@ 1& 3. 1] 1J 2C
3020 DATA -9] 1^ 3& 1^ 3] 2& 1] 1& 5] 2&  3] 2& 1] 3& 5] 4& -10] 3S
3030 DATA /5C 1' 1] 1^ 2& 3@ 1# 1^ 1. 3@ 1& 4@ 1# 1T 3@ 1# 4@ 1& 3@ 1' 2. 1&3@ & 2^ 3& 1^ 1& 
3040 DATA 1^ 4& 1^ 4& 4^ 1. 1^ 2@ 1& 1^ 1.
3050 DATA -10] 3& 1. 2] 3& 1] 3& 1] 1. 1# 1] 1& 1] 1. 2& 1^ 2] 1& 1] 1& 5] 2& 32] 1& 2C
3060 DATA -11] 2S
3070 DATA /5C 1. 1] 2^ 1& 4@ 1# 10@ 1L 2& 3@ 1# 1@ 1^ 1& 3@ 1# 1] 1. 1^ 1& 2@ 1& 1. 1] 1' 
3080 DATA 1^ 1& 1^ 1' 1^ 5& 1@ 4& 2C 1. 3^ 2& 1^ 1. 1] 1. 1^ 1@ 2C
3090 DATA -10] 1^ 3& 1. 3& 2^ 1& 1^ 2& 1] 1' 2] 1& 1] 1& 1. 4~ 2& 5] 2& 13] 1.-11] 3S
3100 DATA /5C 1. 1] 1' 1# 1& 17@ 1& 1# 1& 1C 1@ 1C 1& 1^ 1& 2@ 1' 1] 1. 1' 1& 2@ 1' 1. 1]
3110 DATA 4. 1] 2^ 5& 2^ 2& 4C 1^ 4. 3] 1. 1@ 2C
3120 DATA -11] 4& 2L 1& 1] 5& 1] 1& 2] 1. 1] 1' 1& 1' 10] 1&-12] 2S 3] 1^ 13] 1'
3130 DATA /5C 1L 3] 1' 1@ 1# 8@ 2& 1@ 2# 1& 2@ 1'   1# 1& 2@ 1& 1^ 2C 1^ 3] 1' 1^ 1# 2^ 
3140 DATA 1. 1] 1. 2^ 1] 1. 1C 1& 2@ 6& 6C 1^ 2.
3150 DATA -11] 1. 7& 3] 1^ 2. 1] 1& 2] 1. 1] 2' 10] 1. 30] 2. -12] 1^ 1S 2] S 60] 1E 2C
3160 DATA /6C 3] 1. 1^ 1& 13@ 1. 1# 1& 1^ 1. 2C 1& 1C 1. 1^1C 1. 4] 1. ] 2. 2] 1. 2^ 1. 1]
3170 DATA 1^ 2& 2@ 6& 2C 1^ 2C 3. 1] 1. 1] 1. 1^ 1& 2C-12] 13&-12] 3S 2] 1S
3180 DATA /6C 1L 1. 2] 1. 16@ 1& 2' 1. 1C 2^ 3. 5] 1' 1] 2' 2] 1. 2^ 1. 1] 1C 3& 5C 2& 1^
3190 DATA 1C 2^ 1C 1^ 3. 2] 1. 1] 1E 2C -11] 6& 1] 9&-13] 1S 4] 2S
3200 REM --- 42
3210 DATA /7C 1. 1] 1. 1^ 1& 1@ 1& 13@ 1& 1# 1] 1' 1& 1^ 1C 2. 1^ 1. 6] 1' 1. 3] 2' 2] 2' 
3220 DATA 1^ 2. 4C 2& 3C 1^ 2& 2. 1^ 1' 2] 1.-6] 1& 5] 1& 2] 3& 2] 2& 2] 3& 50] 1& 2C
3230 DATA -13] 1S 4] 2S 5] 1'
3240 DATA /6C 1& 1^ 1. 1] 1^ 7@ 1& 6@ 1& 2@ 1L 1] 1. 1^ 1C 1# 4^ 14] 4^ 2. 1] 1^ 1C 2& 
3250 DATA 4C 4& 1C 1^ 2] 1. 1^ 1E 2C -6] 1T 5] 1& 2] 2& 3] 4& 2] 2& 1. 40] 1'-6] 1L
3260 DATA /6C 2@ 3& 1^ 1S 1& 3@ 3& 4@ 2# 2^ 1. 1# 1& 1. 1& 2C 2^ 1. 13] 1. 1C 5& 6C 2^ 1C 
3270 DATA 5& 2. 1] 1. 2& 1E 1C -6] 1& 1L  6] 3& 3] 4& 2. 3] 1. 22] 1^ 2] 2. 20] 1#-6] 2S
3280 DATA /6C 3@ 1C 2& 3@ 2& 5@ 1& 5^ 1& 1. 1# 1@ 2& 1C 2& 1^ 1. 11] 1J 4@ 2C 1@ 1& 1^ 1.  
3290 DATA 2& 2@ 1& 2@ 4& 4. 3E 1C
3300 DATA -5] 1^ 2& 5] 2&   5] 2&  1^ 5] 1. 1] 1. 1# 1^ 17] 2. 2& 1T 2# 1& 1. 8] 1& 2S 6] 
3310 DATA 2^ 1' -6] 1S 45] 2S 3' 1^ 
3320 DATA /7C 2@ 1C 1& 1C 1& 3@ 4& 3@ 1C 1& 8@ 1# 1. 1# 1& 1C 1. 11] 1@ 3C 2@ 3C 1] 1' 9@
3330 DATA 1& 1C 1^ 2. 1& 1@ 1E 2C
3340 DATA -5] 1^ 3& 4] 2& 6] 2& 1^ 2] 1^ 5& 1^ 1. 16] 1. 1# 1' 1J 2& 1. 1] 1# 3] 3& 1] 3&
3350 DATA 6] 3^ -6] 1^ 1S 19] 1^ 3S 1^ 19] 1' 1] 1^ 2S-53] 1. 2M
3360 DATA /6C 1& 1@  3C 1& 4@ 2& 2C 1& 12@ 1& 2] 1C 1^ 11] 1. 3C 2@ 1# 3C 1. 1] 1^ 8@ 2& 
3370 DATA 1C 2^ 2& 3C
3380 DATA -5] 1^ 1] 1# 5] 3& 6] 1& 1# 9& 1L 16] 1' 2] 2& 1] 1& 5] 8& 6] 1# 1T
3390 DATA -14] 1S 8] 1. 9S 1A 19] 2S 1] 1A-53] 2M 1] 1S 
3400 DATA /6C 1@ 1& 1@ 3& 5@ 1& 13@ 1# 2@ 1. 1] 1' 1C 1. 10] 1J 3C 4@ 2C 1^ 2] 1C 1& 7@ 
3410 DATA 1& 2C 2E 4C 
3420 DATA -5] 1'  6] 4& 4] 11& 1] 2& 15] 1^ 2] 1^ 4& 6] 1# 6& 5] 1^ 1#
3430 DATA -14] 2S 6] 1J 2] 6S 1] 2S 19] 4S -27] 4M 1] 2M 19] 4M
3440 DATA /5C 4& 14@ 1# 1J 2C 4@ 2C 1@ 1L 2] 1C 1. 10] 1J 3C 4@ 2C 1. 2] 3& 6@ 2& 1C 1& 
3450 DATA 1@ 1& 3C
3460 DATA -9] 2& 2] 10& 1] 1V 1' 1# 4& 1^ 1V 1& 1^ 14] 1^ 1. 1] 1' 4& 9] 4& 6] 1' 
3470 DATA -13] 3S 8] 1# 1] 1. 4S 2] 1S 19] 4S-27] 4M 2] 1M 19] 4M
3480 DATA /7C 2& 12@ 1& 2] 1^ 2C 4@ 2C 1@ 1& 2] 1^ 2. 9] 1' 1@ 3C 2@ 2C 1V 1. 2] 1C 3& 2C 
3490 DATA 3@ 4& 1@ 1& 3C 
3500 DATA -6] 1' 3] 11& 1# 3] 2^ 4& 1^ 1. 1& 1L 15] 1& 2] 1# 2& 1# 10] 1' 2&
3510 DATA -12] 4S 11] 4S 2] 1S 1A 15] 1S 2] 1' 2S 1' 
3520 DATA -27] 4M 2] 1M  20] 1^ 1M 
3530 DATA /6C 1& 14@ 1&  2] 1' 2C 4@ 2C 2@ 1. 1] 2. 9] 1. 1^ 1@ 7C 1# 1'  1] 1& 2@ 1& 1C 
3540 DATA 1#  2^ 5@ 1& 1@ 1& 3C
3550 DATA -8] 4& 1^ 7& 5] 1^ 1' 1T 2& 1P 1' 1] 2& 15] 1V 1L 2] 2# 2] 1^
3560 DATA -13] 2S 12] 4S 2] 2S 15] 1' 1^ 17] 3&-27] 4M 2] 2M
3570 DATA /7C 1& 13@  1& 3] 8C 1@ 1F 1. 1] 3. 9] 2. 1# 1V 3C 1# 1^ 1' 2] 1@ 3& 1C 2. 1# 1&
3580 DATA 6@ 1&  3C
3590 DATA -9] 11& 5] 1V 1& 1# 2& 1# 2] 1& 1P 16] 1' 1^ 4. 14] 1& -11] 5S 11] 4' 2] 1S 1V   40] 1&
3600 DATA -33] 1M
3610 REM --- 53
3620 DATA /7C 1& 13@ 2& 2] 1# 7C 2@ 1^ 1] 2. 13] 1' 3# 2' 1] 1. 3@ 2& 1C 3. 1' 3@ 2& 1@
3630 DATA 1E 3C
3640 DATA -9] 2# 9& 6] 1@ 2& 1' 2] 1^ 2& 36] 1& 2#
3650 DATA -11] 5S 10] 1^ 6] 1S
3660 DATA /8C 1& 13@ 1& 1. 2] 2# 1@ 2C 1# 2' 2@ 1] 2. 9] 1^ 7] 2. 1^ 1& 2@ 2& 1C 1^ 2.
3670 DATA 1^^ 1. 1] 1# 1C 2& 1@ 1& 3C
3680 DATA -10] 12& 5] 1' 1S 1L 1^ 1] 1^ 38] 1. 5] 1^ -10] 7S 12] 1^ 1] 1^
3690 DATA /9C 13@ 1& 1C 1. 8] 1^ 1C 1# 1] 1. 10] 2^ 5] 1. 1' 1^ 1C 1& 4@ 1& 1^ 1. 1] 1#
3700 DATA 1^ 1& 5# 1& 3C -9] 13& 39] 2& 8] 5. 1] 1. -11] 6S  1^
3710 DATA /10C 14@ 2& 1. 5] 1. 1^ 2] 2. 2^ 2] 3. 2] 1. 1] 1' 2^ 1. 5] 1' 2& 2@ 1& 2^ 4. 2C
3720 DATA 1& 2C 1@ 1& 1L 2C -9] 1# 13& 51] 1' 2] 1'-9] 1' 1^ 9S
3730 DATA /11C 14@ 2& 2C 1^ 5] 3^ 1. 2] 2. 4] 1^ 1. 1' 3^ 2. 2] 2. 1^ 1C 3@ 1C 5. 2& 2C
3740 DATA 1^ 1& 1@ 1E 2C-10] 1' 13& 37] 2&-11] 10S
3750 DATA /12C 14@ 1& 1^ 1. 6] 1. 1^ 1C 1^ 1. 2] 2. 2] 1^ 1C 1^ 2] 1' 2^ 3] 1' 2# 1^ 1# 
3760 DATA 1^ 2@ 2& 1C 2^ 1C 2^ 1' 1# 1& 1# 3C 
3770 DATA -11] 1J 12& 2^ 32] 1. 2] 1. 1] 1& 12] 1^ 1' -11] 1^ 8S
3780 DATA /12C 13@ 1& 1^ 1. 1' 6] 1' 1^ 2& 2. 1] 2. 2] 2C 1. 8] 1. 1^ 1& 8@ 2& 1C 1. 1^
3790 DATA 1.  2] 1& 1E 2C -12] 12& 1^ 35] 6& -12] 9S
3800 DATA /13C 11@ 5# 1. 5] 1. 1^ 1@ 1& 5. 1] 1. 1^ 1@ 1. 1] 3. 5] 2^ 1# 8@ 1& 1C 1^ 2.
3810 DATA 2] 1# 3C
3820 DATA -12] 1V 11& 3. 1] 1. 8] 1& 1^ 8] 1^  12] 1. 7& 8] 1. 1^
3830 DATA -12] 1' 1S 1] 1# 7S
3840 DATA /14C 14@ 1& 1. 5] 2. 3@ 1& 2C 2& 1^ 1& 1C 2] 2. 6] 3^ 8@ 1& 1C 2. 1' 1# 1& 1@
3850 DATA 3C-13] 1' 9& 1^ 1J 2& 1^ 9] 1& 8] 1. 1^ 13] 7& 9] 1^ 1. -14] 9S
3860 REM --- 62
3870 DATA /15C 13@ 1# 1^ 3] 2. 1^ 1. 6@ 1& 1C 1@ 1& 1# 10] 2^ 1L 2& 5@ 1& 1C 2^ 2. 1& 4@
3880 DATA 1&
3890 DATA -14] 1' 12S 1# 1^ 8] 6& 2. 1& 1J 1^ 12] 1^ 2] 4& 8] 4&
3900 DATA -15] 13# 9] 2S 1^ 5] 1^ 1'-15] 4. 9^ 9] 1C 1A 1^ 5] 1^ 1'
3910 DATA /16C 12@ 1# 6] 1^ 1. 1J 5@ 1& 1@ 1C 1@ 4] 2. 5] 1^ 1C 2& 1. 2# 2& 1C 1^ 2. 3#
3920 DATA 6@ -16] 11& 10] 1' 3& 3] 1# 1] 1^ 15] 1. 1^ 7] 1. 2] 6& -16] 11S 10] 1^ 3S 3] 1'
3930 DATA /17C 11@ 2^ 1] 2. 3] 1. 1^ 6@ 2^ 1. 2] 2. 7] 1^ 2C     4& 1# 1& 1. 1^ 1.
3940 DATA 1^ 2. 1& 6@ -16] 1' 11& 10] 1V 2& 24] 1. 8] 6& -17] 10S 11] 1' 1S 1V
3950 DATA /18C 6@ 2# 1^ 1# 1& 1# 1^ 2& 2C 2^ 1. 1' 1# 4@ 1# 2' 8] 2. 1] 1# 2& 2# 1& 2C 1. 
3960 DATA 1^ 1. 1^ 2& 8@
3970 DATA -17] 1' 6& 2' 1] 2^ 9] 1. 1' 3& 1] 1^ 16] 2. 12] 5& -18] 6S 2. 13] 1. 1'
3980 DATA /18C 4@ 2# 1L 4@ 1& 7^ 1. 3C 1# 2@ 1& 1L 2. 2] 3. 2] 2. 3^ 1C 3& 1C 1^ 2. 1^ 3& 
3990 DATA 2C 6@ -18] 4& 3^ 4& 11] 2' 2& 1] 1^ 28] 6& -18] 4S 3] 1S 1] 1S -18] 1M  
4000 DATA /20C 1@ 1# 2@ 1# 1& 1# 5@ 1& 2C 3^ 2C 2& 3@ 2& 1C 2^ 3. 1^ 1] 1# 1^ 1# 1C 1& 1C 
4010 DATA 3& 2C 4^ 1C 3@ 1& 1@ 1# 3@
4020 DATA -18] 2# 1& 1. 2& 1' 1L 1. 3& 3] 1^ 8] 2& 11] 1. 15] 3& 1] 1& 1. 3&
4030 DATA -18] 2' 1^ 3] 1. 1^ 16] 2^
4040 DATA /18C 1T 1& 2@ 1# 1& 1# 1& 1@ 1# 1@ 1F 1@ 3& 2C 5& 7@ 1C 1& 1C 2^ 1. 1^ 1# 1. 1^ 
4050 DATA 1' 1# 1& 4C 4^ 2C 1& 1@ 1& 3@ 1L 2@ 
4060 DATA -17] 1& 1# 1J 2& 1' 1Y 1' 1^ 1& 1' 1& 1# 10] 1. 6& 27] 3& 1' 2&
4070 DATA -17] 1^ 1. 1^ 2S 1. 1^ 1. 2] 1. 1S 13] 2S 1.
4080 DATA /14C 1' 1^ 1# 1^ 2@ 1# 2@ 1# 2@ 1# 1@ 1# 2& 2# 1& 1# 16@ 1& 2C 1# 1^ 1] 2. 1^
4090 DATA 3C 1& 1# 1C 2^ 2C 1@ 1# 8@
4100 DATA -18] 2& 1' 2& 1. 2& 1. 1& 1' 2^ 1' 1. 2^ 14& 15] 1. 6] 1.
4110 DATA -18] 2S 1. 2S  1] 2S 2] 1. 2] 1. 40] 7&-18] 2M 2] 2M
4120 REM --- 70
4130 DATA /12C 1# 1^ 1C 1# 2C 2# 1@ 1# 1& 2@ 1# 1@ 1# 1^ 1& 1@ 1# 20@ 1# 1^
4140 DATA 6. 2^ 1. 1& 1# 1& 1C 1^ 1C 2& 2@ 1# 6@
4150 DATA -12] 1. 2] 1. 2] 2' 1& 1' 1T 2& 1' 1& 1. 1] 1J 1# 1^ 20& 1^ 11] 1. 6] 2& 1' 3&
4160 DATA 2] 1&
4170 DATA -18] 1. 1] 1S 1. 1^ 2S 1. 1S 2] 1^ 1' 42] 1. -20] 1M  2] 2M 2] 1'
4180 DATA /11C 1# 1C 1# 3C 1# 2@ 1# 3@ 1& 2@ 1^ 1# 1@ 1E 2@ 2J 1# 3@ 9# 4@ 1& 2'1]  3.
4190 DATA 1^ 1. 1^ 5. 3c 3& 7@
4200 DATA -11] 1. 1] 1. 3] 1. 2& 1' 3& 1J 2& 1] 1. 1& 1^ 2& 2# 1. 3& 4^ 1] 1. 2] 1. 3&
4210 DATA 24] 5& -18] 2S 1. 3S 1L 2S 2] 1'-18] 2M 1] 3M 1^ 2M
4220 DATA /9C 1T 1^ 1C 1# 3C 1# 1C 1# 4@ 1& 1@ 1V 1^ 1. 1@ 1& 2@ 1^ 7@ 1^ 1C 5. 1] 1' 2&
4230 DATA 1C 3. 1] 1^ 1. 1& 1. 1] 3. 1^ 15@
4240 DATA -9] 1# 2] 1. 3] 1^ 1] 1' 4& 1J 1& 1' 2] 1& 1# 2& 1] 6& 27] 1& 1] 2& 4] 6&
4250 DATA -18] 1. 6S 3] 1S 1. 2J-19] 4M 1^ 1M 3] 1M
4260 DATA /8C 1# 1J 1# 1J 2C 1# 3C 3@ 1# 3@ 1^ 1# 1@ 1# 1^ 2@ 1^ 1J 8@ 1C 2& 4. 3C 4^ 1C
4270 DATA 1& 1. 2& 1C 1. 1& 3@ 1& 12@
4280 DATA -10] 1. 3] 1. 3] 3& 1' 3& 1] 1. 1& 1. 1] 2& 1] 1. 5& 25] 3& 5] 2& 1] 5&
4290 DATA -18] 3S 1] 3S 2] 1S 2] 2S-18] 3M 1. 3M 2] 1M 2] 2M
4300 DATA /7C 1# 1C 1# 7C 3@ 1# 3@ 2# 1@ 1# 1@ 1V 2@ 1^ 8@ 5& 1U 2& 4C 1^ 2. 1] 2. 1& 2C
4310 DATA 2& 5@ 1& 10@
4320 DATA -7] 1. 1] 1. 7] 3& 1' 3& 2' 1& 1' 1& 1' 2& 1] 5& 26] 5& 1] 1& 2] 1& 1] 5&
4330 DATA -17] 3S 1. 3S 2. 1S 1. 1S 1. 2S 1] 2S -17] 3M 1] 3M 2] 1M 1] 1M 1] 2M 1] 1M 1L
4340 DATA /5C 1E 1J 1P 1# 8C 2@ 1# 3@ 1# 1L 1J 2@ 1E 2@ 1^ 7@ 1& 6@ 1& 1@ 1& 1@ 3& 1C
4350 DATA 1. 3^ 1& 21@
4360 DATA -8] 1. 7] 1^ 2& 1' 3& 1' 1P 1^ 2& 1# 2& 1] 6& 21] 2& 3] 2& 1] 1& 1] 1& 5] 4&
4370 DATA -17] 2S 1. 3S 1. 1] 1' 2S 1' 2S 1] 4S 1L
4380 DATA  -17] 2M 1] 3M 3] 3M 1] 1M 1] 4M
4390 DATA  /4C 1# 1C 1P 1J 9C 1@ 1# 3@ 1# 1L 1J 6@ 1^ 15@ 1& 2@ 1& 2. 1^ 2@ 5& 1@ 1& 17@
4400 DATA  -4] 1. 12] 1& 1' 3& 1' 1# 1^ 6& 1P 1S 6& 1. 26] 6& 5] 3&
4410 DATA -17] 1S 1. 3S 1. 1' 1] 3S 1& 2S 2] 6S-17] 1M 1]  3M 3] 3M 1] 2M 2] 6M
4420 REM --- 77
4430 DATA /3C 1# 1C 1P 1J 10C 1L 1J 2@ 1L 1@ 1# 3@ 1P 3@ 1J 17@ 2& 1C 2^ 2& 1@ 1^ 15@ 1& 6@
4440 DATA -3] 1. 12] 1J 1# 1^ 2& 1# 1& 1. 3& 1# 3& 1^ 17& 11] 1& 1] 10& 5] 3&
4450 DATA -16] 1^ 1' 1. 2S 1' 1S 1] 3S 1' 3S 1] 9S 1L 2] 1^-19] 2M 1] 1M 1] 3M 1] 3M 1] 9M 
4460 DATA /2C 1J 1C 1F 8C 1F 2C 1& 1# 3@ 1J 1L 1J 3@ 1^ 3@ 1A 18@ 1^ 2C 1& 1C 2& 1^ 3@ 2& 
4470 DATA 2@ 1^ 4@ 1^ 2@ 1# 2& 4@
4480 DATA -16] 1@ 1' 3& 1A 1# 1^ 3& 1] 3& 1J 18& 8] 2& 3] 2& 1] 2& 4] 1& 1. 4] 2&
4490 DATA -16] 1S 1. 3S 1^ 1' 1] 3S 1] 3S 1. 16S
4500 DATA -16] 1M 1] 3M 3] 3M 1] 3M 1] 14M 
4510 DATA /16C 1# 3@ 1P 1@ 1# 8@ 1J 18@ 1C 2@ 5& 2@ 1^ 1A 1R 1N 1^ 1C 1@ 3& 4@ 1^ 5@
4520 DATA -16] 1' 3& 1# 1& 1# 4& 1M 3& 1A 17& 1A 8] 2& 13] 1& 1] 5&
4530 DATA -16] 1. 3S 1' 1S 1. 4S 1] 3S 1^ 16S
4540 DATA -17] 3M 3] 4M 1] 3M 1] 12M 
4550 DATA /16C 3@ 1L 2@ 1J 7@ 1L 20@ 1C 8@ 5& 1C 1^ 1& 12@ 
4560 DATA -15] 1. 3& 1# 2& 1A 7& 1# 19& 4] 5& 9] 12&-10] 3S 1' 2S 1^ 7S 1' 15S-16] 3M 1] 2M 1] 7M 1] 14M
4570 REM --- 81
4580 DATA /15C 4@ 1J 1@ 1P 29@  1& 11@ 2& 1@ 1C 1& 4@ 1& 7@
4590 DATA -15] 4& 1' 1& 1' 27& 5] 6&  1] 2& 6] 3& 1] 6& -15] 4S 1] 1S 1# 24S-15] 4M 1] 1M 1] 8M 1] 14M
4600 DATA /15C 3@ 1P 2@ 1J 25@ 1C 3& 9@ 1& 5@ 1& 13@
4610 DATA -15] 3& 1' 2& 1A 8& 1^ 16& 7] 3& 6] 3& 5] 2& 1] 4&
4620 DATA -15] 3S 1] 2S 1^ 8S 1] 14S-15] 3M 1] 2M 1] 8M 1] 13M
4630 DATA /15C 3@ 1J 1@ 1P 26@ 2& 5@ 1& 12@ 1C 2@ 3& 6@ 1&
4640 DATA -15] 2& 1F 1A 1& 1' 26& 5] 2& 2] 11& 1] 1& 4] 5&
4650 DATA -15] 2S 1] 1^ 1S 1] 23S- 15] 2M 2] 1M 1] 22M
4660 DATA /15C 2@ 1E 2@ 1E 23@ 1C 1& 5@ 1C 4& 11@ 1& 7@ 3& 2@
4670 DATA -15] 2& 1] 2& 1' 23& 3] 3& 1] 1V 5] 6& 6] 4& 4] 1&
4680 DATA -15] 2S 1] 2S 1] 21S-15] 2M 1] 2M 1] 19M
4690 DATA /80C/80C/80C/80C/80C/80C/
4700 DATA  FINISH
4710 '
4720 REM -- EXPLANATION OF DATA --
4730 REM / MEANS NEWLINE
4740 REM - MEANS CONTINUATION LINE
4750 REM 29G MEANS PRINT 29 LETTER G'S.
4760 REM @ MEANS PRINT ONE @ CHARACTER.
4770 REM CHARACTERS : " AND 'SPACE'
4780 REM ARE REPRESENTED BY ^ # AND ]
4790 REM IN THE DATA STATEMENTS.
4800 REM ALL OTHER CHARACTERS ARE
4810 REM PRINTED OUT AS THEMSELVES.