 PROGRAM UL1070(INPUT,OUTPUT);
 VAR
	  H,M:ARRAY [1..4] OF LONGINT;
 PROCEDURE INIT;
	VAR
	  Z:LONGINT;
	  P1,P2,P:CHAR;
	BEGIN
	  FOR Z:=1 TO 4 DO
		BEGIN
		  READ(P1,P2);
		  IF P2<>'.' THEN
			BEGIN
			  H[Z]:=(ORD(P1)-48)*10+ORD(P2)-48;
			  READ(P);
			END
			ELSE H[Z]:=ORD(P1)-48;
		  READ(P1,P2); 
		  IF P2 IN ['0'..'9'] THEN M[Z]:=(ORD(P1)-48)*10+ORD(P2)-48
			ELSE M[Z]:=ORD(P1)-48;
		  IF (ODD(Z)) AND (P2<>' ') THEN READ(P)
			ELSE IF EOLN THEN READLN;
		END;
	END;
 PROCEDURE MAIN;
	VAR
	  I,K:LONGINT;
	  H1,H2:REAL;
	BEGIN
	  FOR I:=1 TO 2 DO
		BEGIN
		  IF H[I*2-1]>H[I*2] THEN INC(H[I*2],24);
		  IF M[I*2-1]>M[I*2] THEN
			BEGIN
			  INC(M[I*2],60); 
			  DEC(H[I*2]);
			END;
		END;
	  H1:=H[2]-H[1]+(M[2]-M[1])/60;
	  H2:=H[4]-H[3]+(M[4]-M[3])/60;
	  K:=ROUND(ABS(H2-H1)/2);
	  IF K>5 THEN K:=12-K;  
	  WRITELN(K);
	END;
 BEGIN
	  INIT;
	  MAIN;
 END. 