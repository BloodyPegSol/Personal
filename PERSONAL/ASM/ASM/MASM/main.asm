.model small
.386
.code

start proc ;Inicio proceso
	mov eax,213;hmm ¿seg?
	add eax,432 ;ds = ax = saludo
	
	ret
start endp ;Termina proceso
end start

