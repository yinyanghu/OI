 PROGRAM UL1064(INPUT,OUTPUT);
 VAR
	  N,C,D,G:LONGINT;
	  A,B,F:ARRAY [1..10000] OF INTEGER;
 PROCEDURE BINARY(X:LONGINT);
	VAR
	  P,Q,I,L:LONGINT;
	BEGIN
	  P:=0;
	  Q:=N-1;
	  L:=0;
	  WHILE P<=Q DO
		BEGIN
		  I:=(P+Q) DIV 2;
		  INC(L);
		  IF A[I]=X THEN
			BEGIN
			  G:=L;
			  EXIT;
			END;
		  IF X<A[I] THEN Q:=I-1
			ELSE P:=I+1;
		END;
	END;
 PROCEDURE INIT;
	BEGIN
	  READLN(C,D);
	END;
 PROCEDURE MAIN;
	VAR
	  TOT,J,K:LONGINT;
	  TELL:BOOLEAN;
	BEGIN
	  FILLCHAR(A,SIZEOF(A),0);
	  FOR J:=0 TO 9999 DO A[J]:=J;
	  TOT:=0;
	  TELL:=FALSE;
	  FOR K:=0 TO 9999 DO
		BEGIN
		  N:=K;
		  BINARY(C);
		  IF (G=D) AND (NOT TELL) THEN
			BEGIN
			  INC(TOT);
			  B[TOT]:=K;
			END;
		  IF (G<>D) AND (TELL) THEN F[TOT]:=K-1;
		  TELL:=G=D;
		END;
	  IF F[TOT]=0 THEN F[TOT]:=10000;
	  IF TOT>0 THEN
		BEGIN
		  WRITELN(TOT);
		  FOR J:=1 TO TOT DO WRITELN(B[J],' ',F[J]);
		END
		ELSE WRITELN(0);
	END;
 BEGIN
	  INIT;
	  MAIN;
 END.