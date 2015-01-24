 PROGRAM UL1094(INPUT,OUTPUT);
 VAR
	  A:ARRAY [1..80] OF CHAR;
 PROCEDURE INIT_MAIN;
	VAR
	  I,L:LONGINT;
	  P:CHAR;
	BEGIN
	  L:=1;
	  FOR I:=1 TO 80 DO A[I]:=' ';
	  REPEAT
		READ(P);
		IF P='<'THEN
		  BEGIN
			DEC(L);
			IF L=0 THEN L:=1;
		  END
		  ELSE
			BEGIN
			  IF P<>'>' THEN A[L]:=P;
			  INC(L);
			  IF L=81 THEN L:=1;
			END;
		IF EOLN THEN READLN;
	  UNTIL EOF;
	  FOR I:=1 TO 80 DO WRITE(A[I]);
	  WRITELN;
	END;
 BEGIN
	  INIT_MAIN;
 END.