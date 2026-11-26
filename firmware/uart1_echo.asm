; Adapted from STC12C5Axx Series MCU UART 1 demo.
; STC12C5A60S2 at 11.0592 MHz. UART1 on P3.0/P3.1, 9600 8N1.

.equ AUXR, 0x8E

.org 0x0000
    ANL AUXR, #0xBE      ; Timer 1 in 12T mode and selected for UART1.
    ANL PCON, #0x7F      ; Normal UART baud rate.
    MOV TMOD, #0x20      ; Timer 1 in 8-bit auto-reload mode.
    MOV TH1, #0xFD
    MOV TL1, #0xFD
    MOV SCON, #0x50      ; UART mode 1, receiver enabled.
    SETB TR1

    MOV DPTR, #banner
send_banner:
    CLR A
    MOVC A, @A+DPTR
    JZ wait_for_rx
    ACALL send_byte
    INC DPTR
    SJMP send_banner

wait_for_rx:
    JNB RI, wait_for_rx
    MOV A, SBUF
    CLR RI
    ACALL send_byte
    SJMP wait_for_rx

send_byte:
    MOV SBUF, A
wait_for_tx:
    JNB TI, wait_for_tx
    CLR TI
    RET

banner:
    .byte "STC12C5A60S2 UART OK", 13, 10, 0
.end
