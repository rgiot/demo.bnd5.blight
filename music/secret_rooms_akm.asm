; Truc pour Krusty, Song part, encoded in the AKM (minimalist) format V1.

Start
DisarkGenerateExternalLabel

DisarkPointerRegionStart0
; Index table for the Instruments.
    dw InstrumentIndexes
; Index table for the Arpeggios.
    dw ArpeggioIndexes - 2

; Index table for the Pitches.
DisarkForceNonReferenceDuring21
    dw 0

; The subsongs references.
    dw Subsong0
DisarkPointerRegionEnd0

; The Instrument indexes.
InstrumentIndexes
DisarkPointerRegionStart2
    dw Instrument0
    dw Instrument1
    dw Instrument2
    dw Instrument3
    dw Instrument4
    dw Instrument5
    dw Instrument6
DisarkPointerRegionEnd2

; The Instrument.
DisarkByteRegionStart3
Instrument0
    db 255    ; Speed.
Instrument0Loop
    db 0    ; Volume: 0.

    db 4    ; End the instrument.
DisarkPointerRegionStart4
    dw Instrument0Loop    ; Loops.
DisarkPointerRegionEnd4

Instrument1
    db 0    ; Speed.
    db 189    ; Volume: 15.
    db 1    ; Arpeggio: 0.
    db 1    ; Noise: 1.

    db 57    ; Volume: 14.

    db 53    ; Volume: 13.

    db 49    ; Volume: 12.

    db 45    ; Volume: 11.

    db 41    ; Volume: 10.

    db 37    ; Volume: 9.

    db 33    ; Volume: 8.

    db 29    ; Volume: 7.

    db 25    ; Volume: 6.

    db 21    ; Volume: 5.

    db 17    ; Volume: 4.

    db 13    ; Volume: 3.

    db 9    ; Volume: 2.

Instrument1Loop
    db 5    ; Volume: 1.

    db 4    ; End the instrument.
DisarkPointerRegionStart5
    dw Instrument0Loop    ; Loop to silence.
DisarkPointerRegionEnd5

Instrument2
    db 0    ; Speed.
    db 61    ; Volume: 15.

    db 57    ; Volume: 14.

    db 53    ; Volume: 13.

    db 49    ; Volume: 12.

    db 45    ; Volume: 11.

    db 41    ; Volume: 10.

    db 37    ; Volume: 9.

    db 33    ; Volume: 8.

    db 29    ; Volume: 7.

    db 25    ; Volume: 6.

    db 21    ; Volume: 5.

    db 17    ; Volume: 4.

    db 13    ; Volume: 3.

    db 9    ; Volume: 2.

Instrument2Loop
    db 5    ; Volume: 1.

    db 4    ; End the instrument.
DisarkPointerRegionStart6
    dw Instrument0Loop    ; Loop to silence.
DisarkPointerRegionEnd6

Instrument3
    db 1    ; Speed.
    db 61    ; Volume: 15.

    db 57    ; Volume: 14.

    db 53    ; Volume: 13.

    db 49    ; Volume: 12.

Instrument3Loop
    db 49    ; Volume: 12.

    db 49    ; Volume: 12.

    db 109    ; Volume: 11.
    dw -1    ; Pitch: -1.

    db 109    ; Volume: 11.
    dw -1    ; Pitch: -1.

    db 113    ; Volume: 12.
    dw -1    ; Pitch: -1.

    db 53    ; Volume: 13.

    db 4    ; End the instrument.
DisarkPointerRegionStart7
    dw Instrument3Loop    ; Loops.
DisarkPointerRegionEnd7

Instrument4
    db 1    ; Speed.
    db 61    ; Volume: 15.

    db 57    ; Volume: 14.

    db 53    ; Volume: 13.

Instrument4Loop
    db 49    ; Volume: 12.

    db 4    ; End the instrument.
DisarkPointerRegionStart8
    dw Instrument4Loop    ; Loops.
DisarkPointerRegionEnd8

Instrument5
    db 2    ; Speed.
Instrument5Loop
    db 49    ; Volume: 12.

    db 45    ; Volume: 11.

    db 41    ; Volume: 10.

    db 37    ; Volume: 9.

    db 33    ; Volume: 8.

    db 29    ; Volume: 7.

    db 25    ; Volume: 6.

    db 21    ; Volume: 5.

    db 17    ; Volume: 4.

    db 13    ; Volume: 3.

    db 9    ; Volume: 2.

    db 4    ; End the instrument.
DisarkPointerRegionStart9
    dw Instrument0Loop    ; Loop to silence.
DisarkPointerRegionEnd9

Instrument6
    db 1    ; Speed.
    db 49    ; Volume: 12.

    db 53    ; Volume: 13.

    db 57    ; Volume: 14.

    db 61    ; Volume: 15.

    db 57    ; Volume: 14.

    db 53    ; Volume: 13.

Instrument6Loop
    db 45    ; Volume: 11.

    db 45    ; Volume: 11.

    db 45    ; Volume: 11.

    db 41    ; Volume: 10.

    db 41    ; Volume: 10.

    db 41    ; Volume: 10.

    db 4    ; End the instrument.
DisarkPointerRegionStart10
    dw Instrument6Loop    ; Loops.
DisarkPointerRegionEnd10

DisarkByteRegionEnd3
ArpeggioIndexes
DisarkPointerRegionStart11
    dw Arpeggio1
    dw Arpeggio2
    dw Arpeggio3
    dw Arpeggio4
    dw Arpeggio5
    dw Arpeggio6
    dw Arpeggio7
DisarkPointerRegionEnd11

DisarkByteRegionStart12
Arpeggio1
    db 0    ; Speed

    db 0    ; Value: 0
    db 10    ; Value: 5
    db 18    ; Value: 9
    db 0 * 2 + 1    ; Loops to index 0.
Arpeggio2
    db 0    ; Speed

    db 0    ; Value: 0
    db 8    ; Value: 4
    db 14    ; Value: 7
    db 0 * 2 + 1    ; Loops to index 0.
Arpeggio3
    db 0    ; Speed

    db 0    ; Value: 0
    db 6    ; Value: 3
    db 14    ; Value: 7
    db 0 * 2 + 1    ; Loops to index 0.
Arpeggio4
    db 0    ; Speed

    db 0    ; Value: 0
    db 10    ; Value: 5
    db 0 * 2 + 1    ; Loops to index 0.
Arpeggio5
    db 0    ; Speed

    db 0    ; Value: 0
    db 8    ; Value: 4
    db 0 * 2 + 1    ; Loops to index 0.
Arpeggio6
    db 0    ; Speed

    db 0    ; Value: 0
    db 6    ; Value: 3
    db 0 * 2 + 1    ; Loops to index 0.
Arpeggio7
    db 0    ; Speed

    db 24    ; Value: 12
    db 0    ; Value: 0
    db 1 * 2 + 1    ; Loops to index 1.
DisarkByteRegionEnd12

PitchIndexes
DisarkPointerRegionStart13
DisarkPointerRegionEnd13

DisarkByteRegionStart14
DisarkByteRegionEnd14

; Truc pour Krusty, Subsong 0.
; ----------------------------------

Subsong0
Subsong0_DisarkPointerRegionStart0
    dw Subsong0_NoteIndexes    ; Index table for the notes.
    dw Subsong0_TrackIndexes    ; Index table for the Tracks.
Subsong0_DisarkPointerRegionEnd0

Subsong0_DisarkByteRegionStart1
    db 5    ; Initial speed.

    db 1    ; Most used instrument.
    db 3    ; Second most used instrument.

    db 1    ; Most used wait.
    db 0    ; Second most used wait.

    db 69    ; Default start note in tracks.
    db 4    ; Default start instrument in tracks.
    db 0    ; Default start wait in tracks.

    db 12    ; Are there effects? 12 if yes, 13 if not. Don't ask.
Subsong0_DisarkByteRegionEnd1

; The Linker.
Subsong0_DisarkByteRegionStart2
; Position 0
    db 170    ; State byte.
    db 63    ; New height.
    db 129    ; New track (0) for channel 1, as a reference (index 1).
    db 129    ; New track (0) for channel 2, as a reference (index 1).
    db 130    ; New track (1) for channel 3, as a reference (index 2).

; Position 1
    db 128    ; State byte.
    db 131    ; New track (2) for channel 3, as a reference (index 3).

; Position 2
Subsong0_Loop
    db 168    ; State byte.
    db ((Subsong0_Track3 - ($ + 2)) & #ff00) / 256    ; New track (3) for channel 1, as an offset. Offset MSB, then LSB.
    db ((Subsong0_Track3 - ($ + 1)) & 255)

    db 128    ; New track (4) for channel 2, as a reference (index 0).
    db 130    ; New track (1) for channel 3, as a reference (index 2).

; Position 3
    db 168    ; State byte.
    db ((Subsong0_Track5 - ($ + 2)) & #ff00) / 256    ; New track (5) for channel 1, as an offset. Offset MSB, then LSB.
    db ((Subsong0_Track5 - ($ + 1)) & 255)

    db ((Subsong0_Track6 - ($ + 2)) & #ff00) / 256    ; New track (6) for channel 2, as an offset. Offset MSB, then LSB.
    db ((Subsong0_Track6 - ($ + 1)) & 255)

    db 131    ; New track (2) for channel 3, as a reference (index 3).

; Position 4
    db 168    ; State byte.
    db ((Subsong0_Track7 - ($ + 2)) & #ff00) / 256    ; New track (7) for channel 1, as an offset. Offset MSB, then LSB.
    db ((Subsong0_Track7 - ($ + 1)) & 255)

    db 128    ; New track (4) for channel 2, as a reference (index 0).
    db 130    ; New track (1) for channel 3, as a reference (index 2).

; Position 5
    db 168    ; State byte.
    db ((Subsong0_Track8 - ($ + 2)) & #ff00) / 256    ; New track (8) for channel 1, as an offset. Offset MSB, then LSB.
    db ((Subsong0_Track8 - ($ + 1)) & 255)

    db ((Subsong0_Track9 - ($ + 2)) & #ff00) / 256    ; New track (9) for channel 2, as an offset. Offset MSB, then LSB.
    db ((Subsong0_Track9 - ($ + 1)) & 255)

    db 131    ; New track (2) for channel 3, as a reference (index 3).

; Position 6
    db 168    ; State byte.
    db ((Subsong0_Track3 - ($ + 2)) & #ff00) / 256    ; New track (3) for channel 1, as an offset. Offset MSB, then LSB.
    db ((Subsong0_Track3 - ($ + 1)) & 255)

    db 128    ; New track (4) for channel 2, as a reference (index 0).
    db 130    ; New track (1) for channel 3, as a reference (index 2).

; Position 7
    db 168    ; State byte.
    db ((Subsong0_Track5 - ($ + 2)) & #ff00) / 256    ; New track (5) for channel 1, as an offset. Offset MSB, then LSB.
    db ((Subsong0_Track5 - ($ + 1)) & 255)

    db ((Subsong0_Track6 - ($ + 2)) & #ff00) / 256    ; New track (6) for channel 2, as an offset. Offset MSB, then LSB.
    db ((Subsong0_Track6 - ($ + 1)) & 255)

    db 131    ; New track (2) for channel 3, as a reference (index 3).

; Position 8
    db 168    ; State byte.
    db ((Subsong0_Track10 - ($ + 2)) & #ff00) / 256    ; New track (10) for channel 1, as an offset. Offset MSB, then LSB.
    db ((Subsong0_Track10 - ($ + 1)) & 255)

    db 128    ; New track (4) for channel 2, as a reference (index 0).
    db 130    ; New track (1) for channel 3, as a reference (index 2).

; Position 9
    db 168    ; State byte.
    db ((Subsong0_Track11 - ($ + 2)) & #ff00) / 256    ; New track (11) for channel 1, as an offset. Offset MSB, then LSB.
    db ((Subsong0_Track11 - ($ + 1)) & 255)

    db ((Subsong0_Track9 - ($ + 2)) & #ff00) / 256    ; New track (9) for channel 2, as an offset. Offset MSB, then LSB.
    db ((Subsong0_Track9 - ($ + 1)) & 255)

    db 131    ; New track (2) for channel 3, as a reference (index 3).

; Position 10
    db 168    ; State byte.
    db ((Subsong0_Track12 - ($ + 2)) & #ff00) / 256    ; New track (12) for channel 1, as an offset. Offset MSB, then LSB.
    db ((Subsong0_Track12 - ($ + 1)) & 255)

    db 128    ; New track (4) for channel 2, as a reference (index 0).
    db 132    ; New track (13) for channel 3, as a reference (index 4).

; Position 11
    db 168    ; State byte.
    db ((Subsong0_Track14 - ($ + 2)) & #ff00) / 256    ; New track (14) for channel 1, as an offset. Offset MSB, then LSB.
    db ((Subsong0_Track14 - ($ + 1)) & 255)

    db 133    ; New track (15) for channel 2, as a reference (index 5).
    db 134    ; New track (16) for channel 3, as a reference (index 6).

; Position 12
    db 168    ; State byte.
    db ((Subsong0_Track17 - ($ + 2)) & #ff00) / 256    ; New track (17) for channel 1, as an offset. Offset MSB, then LSB.
    db ((Subsong0_Track17 - ($ + 1)) & 255)

    db 128    ; New track (4) for channel 2, as a reference (index 0).
    db 132    ; New track (13) for channel 3, as a reference (index 4).

; Position 13
    db 168    ; State byte.
    db ((Subsong0_Track18 - ($ + 2)) & #ff00) / 256    ; New track (18) for channel 1, as an offset. Offset MSB, then LSB.
    db ((Subsong0_Track18 - ($ + 1)) & 255)

    db 133    ; New track (15) for channel 2, as a reference (index 5).
    db 134    ; New track (16) for channel 3, as a reference (index 6).

; Position 14
    db 168    ; State byte.
    db ((Subsong0_Track12 - ($ + 2)) & #ff00) / 256    ; New track (12) for channel 1, as an offset. Offset MSB, then LSB.
    db ((Subsong0_Track12 - ($ + 1)) & 255)

    db 128    ; New track (4) for channel 2, as a reference (index 0).
    db 132    ; New track (13) for channel 3, as a reference (index 4).

; Position 15
    db 168    ; State byte.
    db ((Subsong0_Track14 - ($ + 2)) & #ff00) / 256    ; New track (14) for channel 1, as an offset. Offset MSB, then LSB.
    db ((Subsong0_Track14 - ($ + 1)) & 255)

    db 133    ; New track (15) for channel 2, as a reference (index 5).
    db 134    ; New track (16) for channel 3, as a reference (index 6).

; Position 16
    db 168    ; State byte.
    db ((Subsong0_Track19 - ($ + 2)) & #ff00) / 256    ; New track (19) for channel 1, as an offset. Offset MSB, then LSB.
    db ((Subsong0_Track19 - ($ + 1)) & 255)

    db 128    ; New track (4) for channel 2, as a reference (index 0).
    db 132    ; New track (13) for channel 3, as a reference (index 4).

; Position 17
    db 168    ; State byte.
    db ((Subsong0_Track20 - ($ + 2)) & #ff00) / 256    ; New track (20) for channel 1, as an offset. Offset MSB, then LSB.
    db ((Subsong0_Track20 - ($ + 1)) & 255)

    db 133    ; New track (15) for channel 2, as a reference (index 5).
    db 134    ; New track (16) for channel 3, as a reference (index 6).

    db 1    ; End of the Song.
    db 0    ; Speed to 0, meaning "end of song".
Subsong0_DisarkByteRegionEnd2
Subsong0_DisarkPointerRegionStart3
    dw Subsong0_Loop

Subsong0_DisarkPointerRegionEnd3
; The indexes of the tracks.
Subsong0_TrackIndexes
Subsong0_DisarkPointerRegionStart4
    dw Subsong0_Track4    ; Track 4, index 0.
    dw Subsong0_Track0    ; Track 0, index 1.
    dw Subsong0_Track1    ; Track 1, index 2.
    dw Subsong0_Track2    ; Track 2, index 3.
    dw Subsong0_Track13    ; Track 13, index 4.
    dw Subsong0_Track15    ; Track 15, index 5.
    dw Subsong0_Track16    ; Track 16, index 6.
Subsong0_DisarkPointerRegionEnd4

Subsong0_DisarkByteRegionStart5
Subsong0_Track0
    db 205    ; New wait (127).
    db 127    ;   Escape wait value.

Subsong0_Track1
    db 12    ; Note with effects flag.
    db 80    ; Primary instrument (1). Note reference (0). Primary wait (1).
    db 3    ;    Volume effect, with inverted volume: 0.
    db 22    ;    Arpeggio table effect 1.
    db 12    ; Note with effects flag.
    db 80    ; Primary instrument (1). Note reference (0). Primary wait (1).
    db 115    ;    Volume effect, with inverted volume: 7.
    db 6    ;    Arpeggio table effect 0.
    db 12    ; Note with effects flag.
    db 80    ; Primary instrument (1). Note reference (0). Primary wait (1).
    db 67    ;    Volume effect, with inverted volume: 4.
    db 70    ;    Arpeggio table effect 4.
    db 12    ; Note with effects flag.
    db 80    ; Primary instrument (1). Note reference (0). Primary wait (1).
    db 3    ;    Volume effect, with inverted volume: 0.
    db 22    ;    Arpeggio table effect 1.
    db 12    ; Note with effects flag.
    db 80    ; Primary instrument (1). Note reference (0). Primary wait (1).
    db 115    ;    Volume effect, with inverted volume: 7.
    db 6    ;    Arpeggio table effect 0.
    db 12    ; Note with effects flag.
    db 80    ; Primary instrument (1). Note reference (0). Primary wait (1).
    db 67    ;    Volume effect, with inverted volume: 4.
    db 70    ;    Arpeggio table effect 4.
    db 12    ; Note with effects flag.
    db 80    ; Primary instrument (1). Note reference (0). Primary wait (1).
    db 3    ;    Volume effect, with inverted volume: 0.
    db 22    ;    Arpeggio table effect 1.
    db 12    ; Note with effects flag.
    db 80    ; Primary instrument (1). Note reference (0). Primary wait (1).
    db 115    ;    Volume effect, with inverted volume: 7.
    db 6    ;    Arpeggio table effect 0.
    db 12    ; Note with effects flag.
    db 80    ; Primary instrument (1). Note reference (0). Primary wait (1).
    db 3    ;    Volume effect, with inverted volume: 0.
    db 22    ;    Arpeggio table effect 1.
    db 12    ; Note with effects flag.
    db 80    ; Primary instrument (1). Note reference (0). Primary wait (1).
    db 115    ;    Volume effect, with inverted volume: 7.
    db 6    ;    Arpeggio table effect 0.
    db 12    ; Note with effects flag.
    db 80    ; Primary instrument (1). Note reference (0). Primary wait (1).
    db 67    ;    Volume effect, with inverted volume: 4.
    db 70    ;    Arpeggio table effect 4.
    db 12    ; Note with effects flag.
    db 80    ; Primary instrument (1). Note reference (0). Primary wait (1).
    db 3    ;    Volume effect, with inverted volume: 0.
    db 22    ;    Arpeggio table effect 1.
    db 12    ; Note with effects flag.
    db 80    ; Primary instrument (1). Note reference (0). Primary wait (1).
    db 115    ;    Volume effect, with inverted volume: 7.
    db 6    ;    Arpeggio table effect 0.
    db 12    ; Note with effects flag.
    db 80    ; Primary instrument (1). Note reference (0). Primary wait (1).
    db 67    ;    Volume effect, with inverted volume: 4.
    db 70    ;    Arpeggio table effect 4.
    db 12    ; Note with effects flag.
    db 80    ; Primary instrument (1). Note reference (0). Primary wait (1).
    db 3    ;    Volume effect, with inverted volume: 0.
    db 22    ;    Arpeggio table effect 1.
    db 12    ; Note with effects flag.
    db 80    ; Primary instrument (1). Note reference (0). Primary wait (1).
    db 115    ;    Volume effect, with inverted volume: 7.
    db 6    ;    Arpeggio table effect 0.
    db 12    ; Note with effects flag.
    db 80    ; Primary instrument (1). Note reference (0). Primary wait (1).
    db 3    ;    Volume effect, with inverted volume: 0.
    db 38    ;    Arpeggio table effect 2.
    db 12    ; Note with effects flag.
    db 80    ; Primary instrument (1). Note reference (0). Primary wait (1).
    db 115    ;    Volume effect, with inverted volume: 7.
    db 6    ;    Arpeggio table effect 0.
    db 12    ; Note with effects flag.
    db 80    ; Primary instrument (1). Note reference (0). Primary wait (1).
    db 67    ;    Volume effect, with inverted volume: 4.
    db 86    ;    Arpeggio table effect 5.
    db 12    ; Note with effects flag.
    db 80    ; Primary instrument (1). Note reference (0). Primary wait (1).
    db 3    ;    Volume effect, with inverted volume: 0.
    db 38    ;    Arpeggio table effect 2.
    db 12    ; Note with effects flag.
    db 80    ; Primary instrument (1). Note reference (0). Primary wait (1).
    db 115    ;    Volume effect, with inverted volume: 7.
    db 6    ;    Arpeggio table effect 0.
    db 12    ; Note with effects flag.
    db 80    ; Primary instrument (1). Note reference (0). Primary wait (1).
    db 67    ;    Volume effect, with inverted volume: 4.
    db 86    ;    Arpeggio table effect 5.
    db 12    ; Note with effects flag.
    db 80    ; Primary instrument (1). Note reference (0). Primary wait (1).
    db 3    ;    Volume effect, with inverted volume: 0.
    db 38    ;    Arpeggio table effect 2.
    db 12    ; Note with effects flag.
    db 80    ; Primary instrument (1). Note reference (0). Primary wait (1).
    db 115    ;    Volume effect, with inverted volume: 7.
    db 6    ;    Arpeggio table effect 0.
    db 12    ; Note with effects flag.
    db 80    ; Primary instrument (1). Note reference (0). Primary wait (1).
    db 3    ;    Volume effect, with inverted volume: 0.
    db 38    ;    Arpeggio table effect 2.
    db 12    ; Note with effects flag.
    db 80    ; Primary instrument (1). Note reference (0). Primary wait (1).
    db 115    ;    Volume effect, with inverted volume: 7.
    db 6    ;    Arpeggio table effect 0.
    db 12    ; Note with effects flag.
    db 80    ; Primary instrument (1). Note reference (0). Primary wait (1).
    db 67    ;    Volume effect, with inverted volume: 4.
    db 86    ;    Arpeggio table effect 5.
    db 12    ; Note with effects flag.
    db 80    ; Primary instrument (1). Note reference (0). Primary wait (1).
    db 3    ;    Volume effect, with inverted volume: 0.
    db 38    ;    Arpeggio table effect 2.
    db 12    ; Note with effects flag.
    db 80    ; Primary instrument (1). Note reference (0). Primary wait (1).
    db 115    ;    Volume effect, with inverted volume: 7.
    db 6    ;    Arpeggio table effect 0.
    db 12    ; Note with effects flag.
    db 80    ; Primary instrument (1). Note reference (0). Primary wait (1).
    db 67    ;    Volume effect, with inverted volume: 4.
    db 86    ;    Arpeggio table effect 5.
    db 12    ; Note with effects flag.
    db 80    ; Primary instrument (1). Note reference (0). Primary wait (1).
    db 3    ;    Volume effect, with inverted volume: 0.
    db 38    ;    Arpeggio table effect 2.
    db 12    ; Note with effects flag.
    db 208    ; Primary instrument (1). Note reference (0). New wait (127).
    db 127    ;   Escape wait value.
    db 115    ;    Volume effect, with inverted volume: 7.
    db 6    ;    Arpeggio table effect 0.

Subsong0_Track2
    db 12    ; Note with effects flag.
    db 82    ; Primary instrument (1). Note reference (2). Primary wait (1).
    db 3    ;    Volume effect, with inverted volume: 0.
    db 54    ;    Arpeggio table effect 3.
    db 12    ; Note with effects flag.
    db 82    ; Primary instrument (1). Note reference (2). Primary wait (1).
    db 115    ;    Volume effect, with inverted volume: 7.
    db 6    ;    Arpeggio table effect 0.
    db 12    ; Note with effects flag.
    db 82    ; Primary instrument (1). Note reference (2). Primary wait (1).
    db 67    ;    Volume effect, with inverted volume: 4.
    db 102    ;    Arpeggio table effect 6.
    db 12    ; Note with effects flag.
    db 82    ; Primary instrument (1). Note reference (2). Primary wait (1).
    db 3    ;    Volume effect, with inverted volume: 0.
    db 54    ;    Arpeggio table effect 3.
    db 12    ; Note with effects flag.
    db 82    ; Primary instrument (1). Note reference (2). Primary wait (1).
    db 115    ;    Volume effect, with inverted volume: 7.
    db 6    ;    Arpeggio table effect 0.
    db 12    ; Note with effects flag.
    db 82    ; Primary instrument (1). Note reference (2). Primary wait (1).
    db 67    ;    Volume effect, with inverted volume: 4.
    db 102    ;    Arpeggio table effect 6.
    db 12    ; Note with effects flag.
    db 82    ; Primary instrument (1). Note reference (2). Primary wait (1).
    db 3    ;    Volume effect, with inverted volume: 0.
    db 54    ;    Arpeggio table effect 3.
    db 12    ; Note with effects flag.
    db 82    ; Primary instrument (1). Note reference (2). Primary wait (1).
    db 115    ;    Volume effect, with inverted volume: 7.
    db 6    ;    Arpeggio table effect 0.
    db 12    ; Note with effects flag.
    db 82    ; Primary instrument (1). Note reference (2). Primary wait (1).
    db 3    ;    Volume effect, with inverted volume: 0.
    db 54    ;    Arpeggio table effect 3.
    db 12    ; Note with effects flag.
    db 82    ; Primary instrument (1). Note reference (2). Primary wait (1).
    db 115    ;    Volume effect, with inverted volume: 7.
    db 6    ;    Arpeggio table effect 0.
    db 12    ; Note with effects flag.
    db 82    ; Primary instrument (1). Note reference (2). Primary wait (1).
    db 67    ;    Volume effect, with inverted volume: 4.
    db 102    ;    Arpeggio table effect 6.
    db 12    ; Note with effects flag.
    db 82    ; Primary instrument (1). Note reference (2). Primary wait (1).
    db 3    ;    Volume effect, with inverted volume: 0.
    db 54    ;    Arpeggio table effect 3.
    db 12    ; Note with effects flag.
    db 82    ; Primary instrument (1). Note reference (2). Primary wait (1).
    db 115    ;    Volume effect, with inverted volume: 7.
    db 6    ;    Arpeggio table effect 0.
    db 12    ; Note with effects flag.
    db 82    ; Primary instrument (1). Note reference (2). Primary wait (1).
    db 67    ;    Volume effect, with inverted volume: 4.
    db 102    ;    Arpeggio table effect 6.
    db 12    ; Note with effects flag.
    db 82    ; Primary instrument (1). Note reference (2). Primary wait (1).
    db 3    ;    Volume effect, with inverted volume: 0.
    db 54    ;    Arpeggio table effect 3.
    db 12    ; Note with effects flag.
    db 82    ; Primary instrument (1). Note reference (2). Primary wait (1).
    db 115    ;    Volume effect, with inverted volume: 7.
    db 6    ;    Arpeggio table effect 0.
    db 12    ; Note with effects flag.
    db 83    ; Primary instrument (1). Note reference (3). Primary wait (1).
    db 3    ;    Volume effect, with inverted volume: 0.
    db 38    ;    Arpeggio table effect 2.
    db 12    ; Note with effects flag.
    db 83    ; Primary instrument (1). Note reference (3). Primary wait (1).
    db 115    ;    Volume effect, with inverted volume: 7.
    db 6    ;    Arpeggio table effect 0.
    db 12    ; Note with effects flag.
    db 83    ; Primary instrument (1). Note reference (3). Primary wait (1).
    db 67    ;    Volume effect, with inverted volume: 4.
    db 86    ;    Arpeggio table effect 5.
    db 12    ; Note with effects flag.
    db 83    ; Primary instrument (1). Note reference (3). Primary wait (1).
    db 3    ;    Volume effect, with inverted volume: 0.
    db 38    ;    Arpeggio table effect 2.
    db 12    ; Note with effects flag.
    db 83    ; Primary instrument (1). Note reference (3). Primary wait (1).
    db 115    ;    Volume effect, with inverted volume: 7.
    db 6    ;    Arpeggio table effect 0.
    db 12    ; Note with effects flag.
    db 83    ; Primary instrument (1). Note reference (3). Primary wait (1).
    db 67    ;    Volume effect, with inverted volume: 4.
    db 86    ;    Arpeggio table effect 5.
    db 12    ; Note with effects flag.
    db 83    ; Primary instrument (1). Note reference (3). Primary wait (1).
    db 3    ;    Volume effect, with inverted volume: 0.
    db 38    ;    Arpeggio table effect 2.
    db 12    ; Note with effects flag.
    db 83    ; Primary instrument (1). Note reference (3). Primary wait (1).
    db 115    ;    Volume effect, with inverted volume: 7.
    db 6    ;    Arpeggio table effect 0.
    db 12    ; Note with effects flag.
    db 83    ; Primary instrument (1). Note reference (3). Primary wait (1).
    db 3    ;    Volume effect, with inverted volume: 0.
    db 38    ;    Arpeggio table effect 2.
    db 12    ; Note with effects flag.
    db 83    ; Primary instrument (1). Note reference (3). Primary wait (1).
    db 115    ;    Volume effect, with inverted volume: 7.
    db 6    ;    Arpeggio table effect 0.
    db 12    ; Note with effects flag.
    db 83    ; Primary instrument (1). Note reference (3). Primary wait (1).
    db 67    ;    Volume effect, with inverted volume: 4.
    db 86    ;    Arpeggio table effect 5.
    db 12    ; Note with effects flag.
    db 83    ; Primary instrument (1). Note reference (3). Primary wait (1).
    db 3    ;    Volume effect, with inverted volume: 0.
    db 38    ;    Arpeggio table effect 2.
    db 12    ; Note with effects flag.
    db 83    ; Primary instrument (1). Note reference (3). Primary wait (1).
    db 115    ;    Volume effect, with inverted volume: 7.
    db 6    ;    Arpeggio table effect 0.
    db 12    ; Note with effects flag.
    db 83    ; Primary instrument (1). Note reference (3). Primary wait (1).
    db 67    ;    Volume effect, with inverted volume: 4.
    db 86    ;    Arpeggio table effect 5.
    db 12    ; Note with effects flag.
    db 83    ; Primary instrument (1). Note reference (3). Primary wait (1).
    db 3    ;    Volume effect, with inverted volume: 0.
    db 38    ;    Arpeggio table effect 2.
    db 12    ; Note with effects flag.
    db 211    ; Primary instrument (1). Note reference (3). New wait (127).
    db 127    ;   Escape wait value.
    db 115    ;    Volume effect, with inverted volume: 7.
    db 6    ;    Arpeggio table effect 0.

Subsong0_Track3
    db 12    ; Note with effects flag.
    db 225    ; Secondary instrument (3). Note reference (1). New wait (5).
    db 5    ;   Escape wait value.
    db 3    ;    Volume effect, with inverted volume: 0.
    db 6    ;    Arpeggio table effect 0.
    db 12    ; Note with effects flag.
    db 33    ; Secondary instrument (3). Note reference (1). 
    db 18    ;    Volume effect, with inverted volume: 1.
    db 12    ; Note with effects flag.
    db 33    ; Secondary instrument (3). Note reference (1). 
    db 34    ;    Volume effect, with inverted volume: 2.
    db 12    ; Note with effects flag.
    db 225    ; Secondary instrument (3). Note reference (1). New wait (4).
    db 4    ;   Escape wait value.
    db 50    ;    Volume effect, with inverted volume: 3.
    db 12    ; Note with effects flag.
    db 176    ; New instrument (0). Note reference (0). Secondary wait (0).
    db 0    ;   Escape instrument value.
    db 2    ;    Volume effect, with inverted volume: 0.
    db 228    ; Secondary instrument (3). Note reference (4). New wait (5).
    db 5    ;   Escape wait value.
    db 93    ; Effect only. Primary wait (1).
    db 38    ; Secondary instrument (3). Note reference (6). 
    db 12    ; Note with effects flag.
    db 38    ; Secondary instrument (3). Note reference (6). 
    db 18    ;    Volume effect, with inverted volume: 1.
    db 12    ; Note with effects flag.
    db 38    ; Secondary instrument (3). Note reference (6). 
    db 34    ;    Volume effect, with inverted volume: 2.
    db 12    ; Note with effects flag.
    db 230    ; Secondary instrument (3). Note reference (6). New wait (4).
    db 4    ;   Escape wait value.
    db 50    ;    Volume effect, with inverted volume: 3.
    db 12    ; Note with effects flag.
    db 128    ; Note reference (0). Secondary wait (0).
    db 2    ;    Volume effect, with inverted volume: 0.
    db 233    ; Secondary instrument (3). Note reference (9). New wait (127).
    db 127    ;   Escape wait value.

Subsong0_Track4
    db 206    ; New escaped note: 29. New wait (13).
    db 29    ;   Escape note value.
    db 13    ;   Escape wait value.
    db 63    ; New instrument (5). Same escaped note: 29. 
    db 5    ;   Escape instrument value.
    db 254    ; New instrument (4). New escaped note: 36. New wait (2).
    db 36    ;   Escape note value.
    db 4    ;   Escape instrument value.
    db 2    ;   Escape wait value.
    db 191    ; New instrument (5). Same escaped note: 36. Secondary wait (0).
    db 5    ;   Escape instrument value.
    db 254    ; New instrument (4). New escaped note: 24. New wait (13).
    db 24    ;   Escape note value.
    db 4    ;   Escape instrument value.
    db 13    ;   Escape wait value.
    db 255    ; New instrument (5). Same escaped note: 24. New wait (127).
    db 5    ;   Escape instrument value.
    db 127    ;   Escape wait value.

Subsong0_Track5
    db 12    ; Note with effects flag.
    db 234    ; Secondary instrument (3). Note reference (10). New wait (5).
    db 5    ;   Escape wait value.
    db 2    ;    Volume effect, with inverted volume: 0.
    db 12    ; Note with effects flag.
    db 42    ; Secondary instrument (3). Note reference (10). 
    db 18    ;    Volume effect, with inverted volume: 1.
    db 12    ; Note with effects flag.
    db 234    ; Secondary instrument (3). Note reference (10). New wait (3).
    db 3    ;   Escape wait value.
    db 34    ;    Volume effect, with inverted volume: 2.
    db 12    ; Note with effects flag.
    db 225    ; Secondary instrument (3). Note reference (1). New wait (5).
    db 5    ;   Escape wait value.
    db 2    ;    Volume effect, with inverted volume: 0.
    db 12    ; Note with effects flag.
    db 33    ; Secondary instrument (3). Note reference (1). 
    db 18    ;    Volume effect, with inverted volume: 1.
    db 12    ; Note with effects flag.
    db 225    ; Secondary instrument (3). Note reference (1). New wait (3).
    db 3    ;   Escape wait value.
    db 34    ;    Volume effect, with inverted volume: 2.
    db 157    ; Effect only. Secondary wait (0).
    db 50    ;    Volume effect, with inverted volume: 3.
    db 157    ; Effect only. Secondary wait (0).
    db 66    ;    Volume effect, with inverted volume: 4.
    db 157    ; Effect only. Secondary wait (0).
    db 82    ;    Volume effect, with inverted volume: 5.
    db 157    ; Effect only. Secondary wait (0).
    db 98    ;    Volume effect, with inverted volume: 6.
    db 157    ; Effect only. Secondary wait (0).
    db 114    ;    Volume effect, with inverted volume: 7.
    db 240    ; New instrument (0). Note reference (0). New wait (127).
    db 0    ;   Escape instrument value.
    db 127    ;   Escape wait value.

Subsong0_Track6
    db 203    ; Note reference (11). New wait (13).
    db 13    ;   Escape wait value.
    db 251    ; New instrument (5). Note reference (11). New wait (127).
    db 5    ;   Escape instrument value.
    db 127    ;   Escape wait value.

Subsong0_Track7
    db 12    ; Note with effects flag.
    db 225    ; Secondary instrument (3). Note reference (1). New wait (5).
    db 5    ;   Escape wait value.
    db 2    ;    Volume effect, with inverted volume: 0.
    db 12    ; Note with effects flag.
    db 33    ; Secondary instrument (3). Note reference (1). 
    db 18    ;    Volume effect, with inverted volume: 1.
    db 12    ; Note with effects flag.
    db 33    ; Secondary instrument (3). Note reference (1). 
    db 34    ;    Volume effect, with inverted volume: 2.
    db 12    ; Note with effects flag.
    db 225    ; Secondary instrument (3). Note reference (1). New wait (4).
    db 4    ;   Escape wait value.
    db 50    ;    Volume effect, with inverted volume: 3.
    db 12    ; Note with effects flag.
    db 176    ; New instrument (0). Note reference (0). Secondary wait (0).
    db 0    ;   Escape instrument value.
    db 2    ;    Volume effect, with inverted volume: 0.
    db 228    ; Secondary instrument (3). Note reference (4). New wait (5).
    db 5    ;   Escape wait value.
    db 93    ; Effect only. Primary wait (1).
    db 37    ; Secondary instrument (3). Note reference (5). 
    db 12    ; Note with effects flag.
    db 37    ; Secondary instrument (3). Note reference (5). 
    db 18    ;    Volume effect, with inverted volume: 1.
    db 12    ; Note with effects flag.
    db 37    ; Secondary instrument (3). Note reference (5). 
    db 34    ;    Volume effect, with inverted volume: 2.
    db 12    ; Note with effects flag.
    db 229    ; Secondary instrument (3). Note reference (5). New wait (4).
    db 4    ;   Escape wait value.
    db 50    ;    Volume effect, with inverted volume: 3.
    db 12    ; Note with effects flag.
    db 128    ; Note reference (0). Secondary wait (0).
    db 2    ;    Volume effect, with inverted volume: 0.
    db 228    ; Secondary instrument (3). Note reference (4). New wait (127).
    db 127    ;   Escape wait value.

Subsong0_Track8
    db 12    ; Note with effects flag.
    db 231    ; Secondary instrument (3). Note reference (7). New wait (5).
    db 5    ;   Escape wait value.
    db 2    ;    Volume effect, with inverted volume: 0.
    db 12    ; Note with effects flag.
    db 39    ; Secondary instrument (3). Note reference (7). 
    db 18    ;    Volume effect, with inverted volume: 1.
    db 12    ; Note with effects flag.
    db 39    ; Secondary instrument (3). Note reference (7). 
    db 34    ;    Volume effect, with inverted volume: 2.
    db 12    ; Note with effects flag.
    db 39    ; Secondary instrument (3). Note reference (7). 
    db 50    ;    Volume effect, with inverted volume: 3.
    db 12    ; Note with effects flag.
    db 40    ; Secondary instrument (3). Note reference (8). 
    db 2    ;    Volume effect, with inverted volume: 0.
    db 93    ; Effect only. Primary wait (1).
    db 12    ; Note with effects flag.
    db 225    ; Secondary instrument (3). Note reference (1). New wait (12).
    db 12    ;   Escape wait value.
    db 2    ;    Volume effect, with inverted volume: 0.
    db 157    ; Effect only. Secondary wait (0).
    db 18    ;    Volume effect, with inverted volume: 1.
    db 157    ; Effect only. Secondary wait (0).
    db 34    ;    Volume effect, with inverted volume: 2.
    db 157    ; Effect only. Secondary wait (0).
    db 50    ;    Volume effect, with inverted volume: 3.
    db 12    ; Note with effects flag.
    db 233    ; Secondary instrument (3). Note reference (9). New wait (7).
    db 7    ;   Escape wait value.
    db 2    ;    Volume effect, with inverted volume: 0.
    db 234    ; Secondary instrument (3). Note reference (10). New wait (127).
    db 127    ;   Escape wait value.

Subsong0_Track9
    db 203    ; Note reference (11). New wait (13).
    db 13    ;   Escape wait value.
    db 251    ; New instrument (5). Note reference (11). New wait (17).
    db 5    ;   Escape instrument value.
    db 17    ;   Escape wait value.
    db 12    ; Note with effects flag.
    db 233    ; Secondary instrument (3). Note reference (9). New wait (12).
    db 12    ;   Escape wait value.
    db 18    ;    Volume effect, with inverted volume: 1.
    db 157    ; Effect only. Secondary wait (0).
    db 34    ;    Volume effect, with inverted volume: 2.
    db 157    ; Effect only. Secondary wait (0).
    db 50    ;    Volume effect, with inverted volume: 3.
    db 157    ; Effect only. Secondary wait (0).
    db 66    ;    Volume effect, with inverted volume: 4.
    db 12    ; Note with effects flag.
    db 240    ; New instrument (0). Note reference (0). New wait (127).
    db 0    ;   Escape instrument value.
    db 127    ;   Escape wait value.
    db 2    ;    Volume effect, with inverted volume: 0.

Subsong0_Track10
    db 12    ; Note with effects flag.
    db 225    ; Secondary instrument (3). Note reference (1). New wait (5).
    db 5    ;   Escape wait value.
    db 2    ;    Volume effect, with inverted volume: 0.
    db 12    ; Note with effects flag.
    db 33    ; Secondary instrument (3). Note reference (1). 
    db 18    ;    Volume effect, with inverted volume: 1.
    db 12    ; Note with effects flag.
    db 33    ; Secondary instrument (3). Note reference (1). 
    db 34    ;    Volume effect, with inverted volume: 2.
    db 12    ; Note with effects flag.
    db 225    ; Secondary instrument (3). Note reference (1). New wait (4).
    db 4    ;   Escape wait value.
    db 50    ;    Volume effect, with inverted volume: 3.
    db 12    ; Note with effects flag.
    db 176    ; New instrument (0). Note reference (0). Secondary wait (0).
    db 0    ;   Escape instrument value.
    db 2    ;    Volume effect, with inverted volume: 0.
    db 232    ; Secondary instrument (3). Note reference (8). New wait (5).
    db 5    ;   Escape wait value.
    db 93    ; Effect only. Primary wait (1).
    db 37    ; Secondary instrument (3). Note reference (5). 
    db 12    ; Note with effects flag.
    db 37    ; Secondary instrument (3). Note reference (5). 
    db 18    ;    Volume effect, with inverted volume: 1.
    db 12    ; Note with effects flag.
    db 37    ; Secondary instrument (3). Note reference (5). 
    db 34    ;    Volume effect, with inverted volume: 2.
    db 12    ; Note with effects flag.
    db 229    ; Secondary instrument (3). Note reference (5). New wait (4).
    db 4    ;   Escape wait value.
    db 50    ;    Volume effect, with inverted volume: 3.
    db 12    ; Note with effects flag.
    db 128    ; Note reference (0). Secondary wait (0).
    db 2    ;    Volume effect, with inverted volume: 0.
    db 228    ; Secondary instrument (3). Note reference (4). New wait (127).
    db 127    ;   Escape wait value.

Subsong0_Track11
    db 12    ; Note with effects flag.
    db 231    ; Secondary instrument (3). Note reference (7). New wait (5).
    db 5    ;   Escape wait value.
    db 2    ;    Volume effect, with inverted volume: 0.
    db 12    ; Note with effects flag.
    db 39    ; Secondary instrument (3). Note reference (7). 
    db 18    ;    Volume effect, with inverted volume: 1.
    db 12    ; Note with effects flag.
    db 39    ; Secondary instrument (3). Note reference (7). 
    db 34    ;    Volume effect, with inverted volume: 2.
    db 12    ; Note with effects flag.
    db 39    ; Secondary instrument (3). Note reference (7). 
    db 50    ;    Volume effect, with inverted volume: 3.
    db 12    ; Note with effects flag.
    db 40    ; Secondary instrument (3). Note reference (8). 
    db 2    ;    Volume effect, with inverted volume: 0.
    db 93    ; Effect only. Primary wait (1).
    db 12    ; Note with effects flag.
    db 225    ; Secondary instrument (3). Note reference (1). New wait (12).
    db 12    ;   Escape wait value.
    db 2    ;    Volume effect, with inverted volume: 0.
    db 157    ; Effect only. Secondary wait (0).
    db 18    ;    Volume effect, with inverted volume: 1.
    db 157    ; Effect only. Secondary wait (0).
    db 34    ;    Volume effect, with inverted volume: 2.
    db 157    ; Effect only. Secondary wait (0).
    db 50    ;    Volume effect, with inverted volume: 3.
    db 12    ; Note with effects flag.
    db 233    ; Secondary instrument (3). Note reference (9). New wait (7).
    db 7    ;   Escape wait value.
    db 2    ;    Volume effect, with inverted volume: 0.
    db 228    ; Secondary instrument (3). Note reference (4). New wait (127).
    db 127    ;   Escape wait value.

Subsong0_Track12
    db 12    ; Note with effects flag.
    db 224    ; Secondary instrument (3). Note reference (0). New wait (5).
    db 5    ;   Escape wait value.
    db 3    ;    Volume effect, with inverted volume: 0.
    db 22    ;    Arpeggio table effect 1.
    db 12    ; Note with effects flag.
    db 32    ; Secondary instrument (3). Note reference (0). 
    db 18    ;    Volume effect, with inverted volume: 1.
    db 12    ; Note with effects flag.
    db 32    ; Secondary instrument (3). Note reference (0). 
    db 34    ;    Volume effect, with inverted volume: 2.
    db 12    ; Note with effects flag.
    db 224    ; Secondary instrument (3). Note reference (0). New wait (4).
    db 4    ;   Escape wait value.
    db 50    ;    Volume effect, with inverted volume: 3.
    db 12    ; Note with effects flag.
    db 176    ; New instrument (0). Note reference (0). Secondary wait (0).
    db 0    ;   Escape instrument value.
    db 2    ;    Volume effect, with inverted volume: 0.
    db 12    ; Note with effects flag.
    db 228    ; Secondary instrument (3). Note reference (4). New wait (5).
    db 5    ;   Escape wait value.
    db 6    ;    Arpeggio table effect 0.
    db 93    ; Effect only. Primary wait (1).
    db 12    ; Note with effects flag.
    db 32    ; Secondary instrument (3). Note reference (0). 
    db 38    ;    Arpeggio table effect 2.
    db 12    ; Note with effects flag.
    db 32    ; Secondary instrument (3). Note reference (0). 
    db 18    ;    Volume effect, with inverted volume: 1.
    db 12    ; Note with effects flag.
    db 32    ; Secondary instrument (3). Note reference (0). 
    db 34    ;    Volume effect, with inverted volume: 2.
    db 12    ; Note with effects flag.
    db 224    ; Secondary instrument (3). Note reference (0). New wait (4).
    db 4    ;   Escape wait value.
    db 50    ;    Volume effect, with inverted volume: 3.
    db 12    ; Note with effects flag.
    db 128    ; Note reference (0). Secondary wait (0).
    db 2    ;    Volume effect, with inverted volume: 0.
    db 12    ; Note with effects flag.
    db 233    ; Secondary instrument (3). Note reference (9). New wait (127).
    db 127    ;   Escape wait value.
    db 6    ;    Arpeggio table effect 0.

Subsong0_Track13
    db 12    ; Note with effects flag.
    db 80    ; Primary instrument (1). Note reference (0). Primary wait (1).
    db 35    ;    Volume effect, with inverted volume: 2.
    db 118    ;    Arpeggio table effect 7.
    db 12    ; Note with effects flag.
    db 121    ; New instrument (2). Note reference (9). Primary wait (1).
    db 2    ;   Escape instrument value.
    db 34    ;    Volume effect, with inverted volume: 2.
    db 12    ; Note with effects flag.
    db 81    ; Primary instrument (1). Note reference (1). Primary wait (1).
    db 18    ;    Volume effect, with inverted volume: 1.
    db 12    ; Note with effects flag.
    db 84    ; Primary instrument (1). Note reference (4). Primary wait (1).
    db 2    ;    Volume effect, with inverted volume: 0.
    db 12    ; Note with effects flag.
    db 64    ; Note reference (0). Primary wait (1).
    db 34    ;    Volume effect, with inverted volume: 2.
    db 12    ; Note with effects flag.
    db 73    ; Note reference (9). Primary wait (1).
    db 34    ;    Volume effect, with inverted volume: 2.
    db 12    ; Note with effects flag.
    db 81    ; Primary instrument (1). Note reference (1). Primary wait (1).
    db 18    ;    Volume effect, with inverted volume: 1.
    db 12    ; Note with effects flag.
    db 84    ; Primary instrument (1). Note reference (4). Primary wait (1).
    db 2    ;    Volume effect, with inverted volume: 0.
    db 12    ; Note with effects flag.
    db 64    ; Note reference (0). Primary wait (1).
    db 34    ;    Volume effect, with inverted volume: 2.
    db 12    ; Note with effects flag.
    db 73    ; Note reference (9). Primary wait (1).
    db 34    ;    Volume effect, with inverted volume: 2.
    db 12    ; Note with effects flag.
    db 81    ; Primary instrument (1). Note reference (1). Primary wait (1).
    db 18    ;    Volume effect, with inverted volume: 1.
    db 12    ; Note with effects flag.
    db 84    ; Primary instrument (1). Note reference (4). Primary wait (1).
    db 2    ;    Volume effect, with inverted volume: 0.
    db 12    ; Note with effects flag.
    db 64    ; Note reference (0). Primary wait (1).
    db 34    ;    Volume effect, with inverted volume: 2.
    db 12    ; Note with effects flag.
    db 73    ; Note reference (9). Primary wait (1).
    db 34    ;    Volume effect, with inverted volume: 2.
    db 12    ; Note with effects flag.
    db 81    ; Primary instrument (1). Note reference (1). Primary wait (1).
    db 18    ;    Volume effect, with inverted volume: 1.
    db 12    ; Note with effects flag.
    db 84    ; Primary instrument (1). Note reference (4). Primary wait (1).
    db 2    ;    Volume effect, with inverted volume: 0.
    db 12    ; Note with effects flag.
    db 70    ; Note reference (6). Primary wait (1).
    db 34    ;    Volume effect, with inverted volume: 2.
    db 12    ; Note with effects flag.
    db 74    ; Note reference (10). Primary wait (1).
    db 34    ;    Volume effect, with inverted volume: 2.
    db 12    ; Note with effects flag.
    db 84    ; Primary instrument (1). Note reference (4). Primary wait (1).
    db 18    ;    Volume effect, with inverted volume: 1.
    db 12    ; Note with effects flag.
    db 85    ; Primary instrument (1). Note reference (5). Primary wait (1).
    db 2    ;    Volume effect, with inverted volume: 0.
    db 12    ; Note with effects flag.
    db 70    ; Note reference (6). Primary wait (1).
    db 34    ;    Volume effect, with inverted volume: 2.
    db 12    ; Note with effects flag.
    db 74    ; Note reference (10). Primary wait (1).
    db 34    ;    Volume effect, with inverted volume: 2.
    db 12    ; Note with effects flag.
    db 84    ; Primary instrument (1). Note reference (4). Primary wait (1).
    db 18    ;    Volume effect, with inverted volume: 1.
    db 12    ; Note with effects flag.
    db 85    ; Primary instrument (1). Note reference (5). Primary wait (1).
    db 2    ;    Volume effect, with inverted volume: 0.
    db 12    ; Note with effects flag.
    db 70    ; Note reference (6). Primary wait (1).
    db 34    ;    Volume effect, with inverted volume: 2.
    db 12    ; Note with effects flag.
    db 74    ; Note reference (10). Primary wait (1).
    db 34    ;    Volume effect, with inverted volume: 2.
    db 12    ; Note with effects flag.
    db 84    ; Primary instrument (1). Note reference (4). Primary wait (1).
    db 18    ;    Volume effect, with inverted volume: 1.
    db 12    ; Note with effects flag.
    db 85    ; Primary instrument (1). Note reference (5). Primary wait (1).
    db 2    ;    Volume effect, with inverted volume: 0.
    db 12    ; Note with effects flag.
    db 70    ; Note reference (6). Primary wait (1).
    db 34    ;    Volume effect, with inverted volume: 2.
    db 12    ; Note with effects flag.
    db 74    ; Note reference (10). Primary wait (1).
    db 34    ;    Volume effect, with inverted volume: 2.
    db 12    ; Note with effects flag.
    db 84    ; Primary instrument (1). Note reference (4). Primary wait (1).
    db 18    ;    Volume effect, with inverted volume: 1.
    db 12    ; Note with effects flag.
    db 213    ; Primary instrument (1). Note reference (5). New wait (127).
    db 127    ;   Escape wait value.
    db 2    ;    Volume effect, with inverted volume: 0.

Subsong0_Track14
    db 12    ; Note with effects flag.
    db 226    ; Secondary instrument (3). Note reference (2). New wait (5).
    db 5    ;   Escape wait value.
    db 3    ;    Volume effect, with inverted volume: 0.
    db 54    ;    Arpeggio table effect 3.
    db 12    ; Note with effects flag.
    db 34    ; Secondary instrument (3). Note reference (2). 
    db 18    ;    Volume effect, with inverted volume: 1.
    db 12    ; Note with effects flag.
    db 226    ; Secondary instrument (3). Note reference (2). New wait (3).
    db 3    ;   Escape wait value.
    db 34    ;    Volume effect, with inverted volume: 2.
    db 12    ; Note with effects flag.
    db 227    ; Secondary instrument (3). Note reference (3). New wait (5).
    db 5    ;   Escape wait value.
    db 3    ;    Volume effect, with inverted volume: 0.
    db 38    ;    Arpeggio table effect 2.
    db 12    ; Note with effects flag.
    db 35    ; Secondary instrument (3). Note reference (3). 
    db 18    ;    Volume effect, with inverted volume: 1.
    db 12    ; Note with effects flag.
    db 227    ; Secondary instrument (3). Note reference (3). New wait (3).
    db 3    ;   Escape wait value.
    db 34    ;    Volume effect, with inverted volume: 2.
    db 12    ; Note with effects flag.
    db 238    ; Secondary instrument (3). New escaped note: 43. New wait (5).
    db 43    ;   Escape note value.
    db 5    ;   Escape wait value.
    db 3    ;    Volume effect, with inverted volume: 0.
    db 22    ;    Arpeggio table effect 1.
    db 12    ; Note with effects flag.
    db 47    ; Secondary instrument (3). Same escaped note: 43. 
    db 18    ;    Volume effect, with inverted volume: 1.
    db 12    ; Note with effects flag.
    db 47    ; Secondary instrument (3). Same escaped note: 43. 
    db 34    ;    Volume effect, with inverted volume: 2.
    db 12    ; Note with effects flag.
    db 47    ; Secondary instrument (3). Same escaped note: 43. 
    db 50    ;    Volume effect, with inverted volume: 3.
    db 157    ; Effect only. Secondary wait (0).
    db 82    ;    Volume effect, with inverted volume: 5.
    db 157    ; Effect only. Secondary wait (0).
    db 114    ;    Volume effect, with inverted volume: 7.
    db 157    ; Effect only. Secondary wait (0).
    db 178    ;    Volume effect, with inverted volume: 11.
    db 157    ; Effect only. Secondary wait (0).
    db 226    ;    Volume effect, with inverted volume: 14.
    db 12    ; Note with effects flag.
    db 240    ; New instrument (0). Note reference (0). New wait (127).
    db 0    ;   Escape instrument value.
    db 127    ;   Escape wait value.
    db 2    ;    Volume effect, with inverted volume: 0.

Subsong0_Track15
    db 203    ; Note reference (11). New wait (13).
    db 13    ;   Escape wait value.
    db 59    ; New instrument (5). Note reference (11). 
    db 5    ;   Escape instrument value.
    db 251    ; New instrument (4). Note reference (11). New wait (2).
    db 4    ;   Escape instrument value.
    db 2    ;   Escape wait value.
    db 187    ; New instrument (5). Note reference (11). Secondary wait (0).
    db 5    ;   Escape instrument value.
    db 254    ; New instrument (4). New escaped note: 24. New wait (13).
    db 24    ;   Escape note value.
    db 4    ;   Escape instrument value.
    db 13    ;   Escape wait value.
    db 255    ; New instrument (5). Same escaped note: 24. New wait (127).
    db 5    ;   Escape instrument value.
    db 127    ;   Escape wait value.

Subsong0_Track16
    db 12    ; Note with effects flag.
    db 82    ; Primary instrument (1). Note reference (2). Primary wait (1).
    db 35    ;    Volume effect, with inverted volume: 2.
    db 118    ;    Arpeggio table effect 7.
    db 12    ; Note with effects flag.
    db 81    ; Primary instrument (1). Note reference (1). Primary wait (1).
    db 34    ;    Volume effect, with inverted volume: 2.
    db 12    ; Note with effects flag.
    db 87    ; Primary instrument (1). Note reference (7). Primary wait (1).
    db 18    ;    Volume effect, with inverted volume: 1.
    db 12    ; Note with effects flag.
    db 88    ; Primary instrument (1). Note reference (8). Primary wait (1).
    db 2    ;    Volume effect, with inverted volume: 0.
    db 12    ; Note with effects flag.
    db 82    ; Primary instrument (1). Note reference (2). Primary wait (1).
    db 34    ;    Volume effect, with inverted volume: 2.
    db 12    ; Note with effects flag.
    db 81    ; Primary instrument (1). Note reference (1). Primary wait (1).
    db 34    ;    Volume effect, with inverted volume: 2.
    db 12    ; Note with effects flag.
    db 87    ; Primary instrument (1). Note reference (7). Primary wait (1).
    db 18    ;    Volume effect, with inverted volume: 1.
    db 12    ; Note with effects flag.
    db 88    ; Primary instrument (1). Note reference (8). Primary wait (1).
    db 2    ;    Volume effect, with inverted volume: 0.
    db 12    ; Note with effects flag.
    db 82    ; Primary instrument (1). Note reference (2). Primary wait (1).
    db 34    ;    Volume effect, with inverted volume: 2.
    db 12    ; Note with effects flag.
    db 81    ; Primary instrument (1). Note reference (1). Primary wait (1).
    db 34    ;    Volume effect, with inverted volume: 2.
    db 12    ; Note with effects flag.
    db 87    ; Primary instrument (1). Note reference (7). Primary wait (1).
    db 18    ;    Volume effect, with inverted volume: 1.
    db 12    ; Note with effects flag.
    db 88    ; Primary instrument (1). Note reference (8). Primary wait (1).
    db 2    ;    Volume effect, with inverted volume: 0.
    db 12    ; Note with effects flag.
    db 82    ; Primary instrument (1). Note reference (2). Primary wait (1).
    db 34    ;    Volume effect, with inverted volume: 2.
    db 12    ; Note with effects flag.
    db 81    ; Primary instrument (1). Note reference (1). Primary wait (1).
    db 34    ;    Volume effect, with inverted volume: 2.
    db 12    ; Note with effects flag.
    db 87    ; Primary instrument (1). Note reference (7). Primary wait (1).
    db 18    ;    Volume effect, with inverted volume: 1.
    db 12    ; Note with effects flag.
    db 88    ; Primary instrument (1). Note reference (8). Primary wait (1).
    db 2    ;    Volume effect, with inverted volume: 0.
    db 12    ; Note with effects flag.
    db 80    ; Primary instrument (1). Note reference (0). Primary wait (1).
    db 34    ;    Volume effect, with inverted volume: 2.
    db 12    ; Note with effects flag.
    db 86    ; Primary instrument (1). Note reference (6). Primary wait (1).
    db 34    ;    Volume effect, with inverted volume: 2.
    db 12    ; Note with effects flag.
    db 84    ; Primary instrument (1). Note reference (4). Primary wait (1).
    db 18    ;    Volume effect, with inverted volume: 1.
    db 12    ; Note with effects flag.
    db 85    ; Primary instrument (1). Note reference (5). Primary wait (1).
    db 2    ;    Volume effect, with inverted volume: 0.
    db 12    ; Note with effects flag.
    db 80    ; Primary instrument (1). Note reference (0). Primary wait (1).
    db 34    ;    Volume effect, with inverted volume: 2.
    db 12    ; Note with effects flag.
    db 86    ; Primary instrument (1). Note reference (6). Primary wait (1).
    db 34    ;    Volume effect, with inverted volume: 2.
    db 12    ; Note with effects flag.
    db 84    ; Primary instrument (1). Note reference (4). Primary wait (1).
    db 18    ;    Volume effect, with inverted volume: 1.
    db 12    ; Note with effects flag.
    db 85    ; Primary instrument (1). Note reference (5). Primary wait (1).
    db 2    ;    Volume effect, with inverted volume: 0.
    db 12    ; Note with effects flag.
    db 80    ; Primary instrument (1). Note reference (0). Primary wait (1).
    db 34    ;    Volume effect, with inverted volume: 2.
    db 12    ; Note with effects flag.
    db 86    ; Primary instrument (1). Note reference (6). Primary wait (1).
    db 34    ;    Volume effect, with inverted volume: 2.
    db 12    ; Note with effects flag.
    db 84    ; Primary instrument (1). Note reference (4). Primary wait (1).
    db 18    ;    Volume effect, with inverted volume: 1.
    db 12    ; Note with effects flag.
    db 85    ; Primary instrument (1). Note reference (5). Primary wait (1).
    db 2    ;    Volume effect, with inverted volume: 0.
    db 12    ; Note with effects flag.
    db 80    ; Primary instrument (1). Note reference (0). Primary wait (1).
    db 34    ;    Volume effect, with inverted volume: 2.
    db 12    ; Note with effects flag.
    db 86    ; Primary instrument (1). Note reference (6). Primary wait (1).
    db 34    ;    Volume effect, with inverted volume: 2.
    db 12    ; Note with effects flag.
    db 84    ; Primary instrument (1). Note reference (4). Primary wait (1).
    db 18    ;    Volume effect, with inverted volume: 1.
    db 12    ; Note with effects flag.
    db 213    ; Primary instrument (1). Note reference (5). New wait (127).
    db 127    ;   Escape wait value.
    db 2    ;    Volume effect, with inverted volume: 0.

Subsong0_Track17
    db 12    ; Note with effects flag.
    db 255    ; New instrument (6). Same escaped note: 69. New wait (15).
    db 6    ;   Escape instrument value.
    db 15    ;   Escape wait value.
    db 6    ;    Arpeggio table effect 0.
    db 8    ; Note reference (8). 
    db 197    ; Note reference (5). New wait (7).
    db 7    ;   Escape wait value.
    db 206    ; New escaped note: 67. New wait (15).
    db 67    ;   Escape note value.
    db 15    ;   Escape wait value.
    db 197    ; Note reference (5). New wait (127).
    db 127    ;   Escape wait value.

Subsong0_Track18
    db 248    ; New instrument (6). Note reference (8). New wait (5).
    db 6    ;   Escape instrument value.
    db 5    ;   Escape wait value.
    db 93    ; Effect only. Primary wait (1).
    db 207    ; Same escaped note: 69. New wait (23).
    db 23    ;   Escape wait value.
    db 157    ; Effect only. Secondary wait (0).
    db 2    ;    Volume effect, with inverted volume: 0.
    db 157    ; Effect only. Secondary wait (0).
    db 18    ;    Volume effect, with inverted volume: 1.
    db 157    ; Effect only. Secondary wait (0).
    db 34    ;    Volume effect, with inverted volume: 2.
    db 157    ; Effect only. Secondary wait (0).
    db 50    ;    Volume effect, with inverted volume: 3.
    db 157    ; Effect only. Secondary wait (0).
    db 66    ;    Volume effect, with inverted volume: 4.
    db 157    ; Effect only. Secondary wait (0).
    db 82    ;    Volume effect, with inverted volume: 5.
    db 157    ; Effect only. Secondary wait (0).
    db 98    ;    Volume effect, with inverted volume: 6.
    db 157    ; Effect only. Secondary wait (0).
    db 114    ;    Volume effect, with inverted volume: 7.
    db 157    ; Effect only. Secondary wait (0).
    db 130    ;    Volume effect, with inverted volume: 8.
    db 157    ; Effect only. Secondary wait (0).
    db 146    ;    Volume effect, with inverted volume: 9.
    db 157    ; Effect only. Secondary wait (0).
    db 162    ;    Volume effect, with inverted volume: 10.
    db 157    ; Effect only. Secondary wait (0).
    db 178    ;    Volume effect, with inverted volume: 11.
    db 157    ; Effect only. Secondary wait (0).
    db 194    ;    Volume effect, with inverted volume: 12.
    db 157    ; Effect only. Secondary wait (0).
    db 210    ;    Volume effect, with inverted volume: 13.
    db 157    ; Effect only. Secondary wait (0).
    db 226    ;    Volume effect, with inverted volume: 14.
    db 157    ; Effect only. Secondary wait (0).
    db 242    ;    Volume effect, with inverted volume: 15.
    db 12    ; Note with effects flag.
    db 240    ; New instrument (0). Note reference (0). New wait (127).
    db 0    ;   Escape instrument value.
    db 127    ;   Escape wait value.
    db 2    ;    Volume effect, with inverted volume: 0.

Subsong0_Track19
    db 12    ; Note with effects flag.
    db 255    ; New instrument (6). Same escaped note: 69. New wait (15).
    db 6    ;   Escape instrument value.
    db 15    ;   Escape wait value.
    db 6    ;    Arpeggio table effect 0.
    db 8    ; Note reference (8). 
    db 206    ; New escaped note: 72. New wait (5).
    db 72    ;   Escape note value.
    db 5    ;   Escape wait value.
    db 14    ; New escaped note: 74. 
    db 74    ;   Escape note value.
    db 206    ; New escaped note: 76. New wait (127).
    db 76    ;   Escape note value.
    db 127    ;   Escape wait value.

Subsong0_Track20
    db 254    ; New instrument (6). New escaped note: 77. New wait (5).
    db 77    ;   Escape note value.
    db 6    ;   Escape instrument value.
    db 5    ;   Escape wait value.
    db 14    ; New escaped note: 76. 
    db 76    ;   Escape note value.
    db 206    ; New escaped note: 74. New wait (3).
    db 74    ;   Escape note value.
    db 3    ;   Escape wait value.
    db 206    ; New escaped note: 69. New wait (15).
    db 69    ;   Escape note value.
    db 15    ;   Escape wait value.
    db 157    ; Effect only. Secondary wait (0).
    db 2    ;    Volume effect, with inverted volume: 0.
    db 157    ; Effect only. Secondary wait (0).
    db 18    ;    Volume effect, with inverted volume: 1.
    db 157    ; Effect only. Secondary wait (0).
    db 34    ;    Volume effect, with inverted volume: 2.
    db 157    ; Effect only. Secondary wait (0).
    db 50    ;    Volume effect, with inverted volume: 3.
    db 157    ; Effect only. Secondary wait (0).
    db 66    ;    Volume effect, with inverted volume: 4.
    db 157    ; Effect only. Secondary wait (0).
    db 82    ;    Volume effect, with inverted volume: 5.
    db 157    ; Effect only. Secondary wait (0).
    db 98    ;    Volume effect, with inverted volume: 6.
    db 157    ; Effect only. Secondary wait (0).
    db 114    ;    Volume effect, with inverted volume: 7.
    db 157    ; Effect only. Secondary wait (0).
    db 130    ;    Volume effect, with inverted volume: 8.
    db 157    ; Effect only. Secondary wait (0).
    db 146    ;    Volume effect, with inverted volume: 9.
    db 157    ; Effect only. Secondary wait (0).
    db 162    ;    Volume effect, with inverted volume: 10.
    db 157    ; Effect only. Secondary wait (0).
    db 178    ;    Volume effect, with inverted volume: 11.
    db 157    ; Effect only. Secondary wait (0).
    db 194    ;    Volume effect, with inverted volume: 12.
    db 157    ; Effect only. Secondary wait (0).
    db 210    ;    Volume effect, with inverted volume: 13.
    db 157    ; Effect only. Secondary wait (0).
    db 226    ;    Volume effect, with inverted volume: 14.
    db 157    ; Effect only. Secondary wait (0).
    db 242    ;    Volume effect, with inverted volume: 15.
    db 12    ; Note with effects flag.
    db 240    ; New instrument (0). Note reference (0). New wait (127).
    db 0    ;   Escape instrument value.
    db 127    ;   Escape wait value.
    db 2    ;    Volume effect, with inverted volume: 0.

Subsong0_DisarkByteRegionEnd5
; The note indexes.
Subsong0_NoteIndexes
Subsong0_DisarkByteRegionStart6
    db 48    ; Note for index 0.
    db 57    ; Note for index 1.
    db 50    ; Note for index 2.
    db 46    ; Note for index 3.
    db 60    ; Note for index 4.
    db 64    ; Note for index 5.
    db 52    ; Note for index 6.
    db 62    ; Note for index 7.
    db 65    ; Note for index 8.
    db 53    ; Note for index 9.
    db 55    ; Note for index 10.
    db 26    ; Note for index 11.
Subsong0_DisarkByteRegionEnd6

