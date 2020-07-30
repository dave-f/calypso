; Placeholder assembly file
; 30 July 2020

ORG $900
GUARD &A00

.START:
    RTS

.END:
    PUTFILE "calypso.z5","DATA",&1900,&1900
    SAVE "test",START,END
