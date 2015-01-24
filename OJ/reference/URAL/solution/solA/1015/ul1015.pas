 PROGRAM UL1015;
 VAR
	  N,C1,C2,C3,C4,C5,C6,TOT:LONGINT;
	  A:ARRAY [1..6,1..6,1..6,1..6,1..6,1..6] OF SHORTINT;
	  C:ARRAY [1..720] OF INTEGER;
	  L:ARRAY [1..100000] OF INTEGER;
 FUNCTION CHECK:BOOLEAN;
	VAR
	  P:SET OF 0..6;
	BEGIN
	  FOR C1:=1 TO 6 DO
		FOR C2:=1 TO 6 DO
		  FOR C3:=1 TO 6 DO
			FOR C4:=1 TO 6 DO
			  FOR C5:=1 TO 6 DO
				FOR C6:=1 TO 6 DO
				  BEGIN
					P:=[C1]+[C2]+[C3]+[C4]+[C5]+[C6];
					IF (P=[1..6]) AND (A[C1,C2,C3,C4,C5,C6]=0) THEN
					  BEGIN
						CHECK:=TRUE;
						EXIT;
					  END;
				  END;
	  CHECK:=FALSE;
	END;
 PROCEDURE INIT;
	VAR
	  T:BOOLEAN;
	BEGIN
	  TOT:=0;
	  REPEAT
		T:=CHECK;
		IF T THEN
		  BEGIN
			INC(TOT);
			A[C1,C2,C3,C4,C5,C6]:=TOT;
			A[C1,C2,C4,C5,C6,C3]:=TOT;
			A[C1,C2,C5,C6,C3,C4]:=TOT;
			A[C1,C2,C6,C3,C4,C5]:=TOT;
			A[C2,C1,C3,C6,C5,C4]:=TOT;
			A[C2,C1,C4,C3,C6,C5]:=TOT;
			A[C2,C1,C5,C4,C3,C6]:=TOT;
			A[C2,C1,C6,C5,C4,C3]:=TOT;
			A[C3,C5,C2,C4,C1,C6]:=TOT;
			A[C3,C5,C6,C2,C4,C1]:=TOT;
			A[C3,C5,C1,C6,C2,C4]:=TOT;
			A[C3,C5,C4,C1,C6,C2]:=TOT;
			A[C5,C3,C1,C4,C2,C6]:=TOT;
			A[C5,C3,C6,C1,C4,C2]:=TOT;
			A[C5,C3,C2,C6,C1,C4]:=TOT;
			A[C5,C3,C4,C2,C6,C1]:=TOT;
			A[C4,C6,C3,C2,C5,C1]:=TOT;
			A[C4,C6,C1,C3,C2,C5]:=TOT;
			A[C4,C6,C5,C1,C3,C2]:=TOT;
			A[C4,C6,C2,C5,C1,C3]:=TOT;
			A[C6,C4,C5,C2,C3,C1]:=TOT;
			A[C6,C4,C1,C5,C2,C3]:=TOT;
			A[C6,C4,C3,C1,C5,C2]:=TOT;
			A[C6,C4,C2,C3,C1,C5]:=TOT;
		  END;
	  UNTIL NOT T;
	END;
 PROCEDURE MAIN;
	VAR
	  I,J,K,F,W:LONGINT;
	  S:SET OF 1..100;
	BEGIN
	  READLN(N);
	  K:=0;
	  S:=[];
	  FOR I:=1 TO N DO
		BEGIN
		  FOR J:=1 TO 6 DO READ(C[J]);
		  L[I]:=A[C[1],C[2],C[3],C[4],C[5],C[6]];
		  IF [L[I]]*S=[] THEN
			BEGIN
			  INC(K);
			  S:=S+[L[I]];
			END;
		END;
	  WRITELN(K);
	  FOR I:=1 TO K DO
		BEGIN
		  FOR J:=1 TO N DO
			IF L[J]<>0 THEN BREAK;
		  F:=J;
		  W:=L[F];
		  FOR J:=F TO N DO
			IF L[J]=W THEN
			  BEGIN
				L[J]:=0;
				WRITE(J,' ');
			  END;
		  WRITELN;
		END;
	END;
 BEGIN
	  INIT;
	  MAIN;
 END.