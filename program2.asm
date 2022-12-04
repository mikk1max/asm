.386
.model flat, stdcall
option casemap:none

include \masm32\include\windows.inc
include \masm32\include\user32.inc
include \masm32\include\kernel32.inc
includelib \masm32\lib\user32.lib
includelib \masm32\lib\kernel32.lib

.const
;stale

.data
tekst_komunikatu db "Czy zrozumiales zasady tworzenia komunikatorow?",0
tekst_tytulu db "?",0

jezeli_tak db "Mozemy przejsc do nastepnej czesci",0
jezeli_tak_tytulu db "!",0

jezeli_nie db "Szkoda cwicz wiencej",0
jezeli_nie_tytulu db "!",0

jezeli_cancel db "Nie odpowiedziales na pytanie",0
jezeli_cancel_tytulu db "!",0

.code
nasz_program:

invoke MessageBox,0, addr tekst_komunikatu, addr tekst_tytulu, MB_YESNOCANCEL or MB_ICONQUESTION
.IF(EAX==IDYES)
    invoke MessageBox,0, addr jezeli_tak, addr jezeli_tak_tytulu, MB_OK or MB_ICONEXCLAMATION
    invoke ExitProcess,0
.ELSEIF(EAX==IDNO)
    invoke MessageBox,0, addr jezeli_nie, addr jezeli_nie_tytulu, MB_OK or MB_ICONSTOP
    invoke ExitProcess,0
.ELSE
    invoke MessageBox,0, addr jezeli_cancel, addr jezeli_cancel_tytulu, MB_OK or MB_ICONHAND
    invoke ExitProcess,0
.ENDIF
invoke ExitProcess,0

end nasz_program