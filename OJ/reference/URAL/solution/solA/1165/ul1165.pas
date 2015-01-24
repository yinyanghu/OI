 PROGRAM EX1_2_7(INPUT,OUTPUT);
 VAR
      N:LONGINT;
      A,D,H,C,M:ARRAY [1..300] OF LONGINT;
 PROCEDURE INIT;
    VAR
      P:CHAR;
    BEGIN
      N:=0;
      REPEAT
        READ(P);
        IF P IN ['0'..'9'] THEN
          BEGIN
            INC(N);
            A[N]:=ORD(P)-48;
          END;
      UNTIL EOLN;
    END;
 FUNCTION MIN(AA,BB:LONGINT):LONGINT;
    BEGIN
      IF AA<BB THEN MIN:=AA
        ELSE MIN:=BB;
    END;
 PROCEDURE MAIN;
    VAR
      I,J,K,L,W,SW,V:LONGINT;
      T,SM:BOOLEAN;
    BEGIN
      T:=TRUE;
      FOR I:=1 TO N DO
        IF A[I]<>0 THEN
          BEGIN
            T:=FALSE;
            BREAK;
          END;
      IF T THEN
        BEGIN
          FILLCHAR(C,SIZEOF(C),0);
          FOR I:=1 TO N DO INC(C[I],I*9);
          INC(C[1],2);
          FOR I:=1 TO N+4 DO
            IF C[I]>9 THEN
              BEGIN
                INC(C[I+1],C[I] DIV 10);
                C[I]:=C[I] MOD 10;
              END;
          FOR I:=300 DOWNTO 1 DO
            IF C[I]<>0 THEN
              BEGIN
                FOR J:=I DOWNTO 1 DO WRITE(C[J]);
                WRITELN;
                BREAK;
              END;
          EXIT;
        END;
      FOR I:=1 TO 300 DO M[I]:=9;
      FOR I:=1 TO N DO
        FOR J:=1 TO I DO
          BEGIN
            K:=J;
            FOR L:=1 TO J DO D[L+I-J]:=A[L];
            FOR L:=J+1 TO I DO D[L-J]:=A[L];
			T:=TRUE;
            FOR L:=1 TO J DO
              IF A[L]<>9 THEN
                BEGIN
                  T:=FALSE;
                  BREAK;
                END;
            IF (T) AND (I<>J) THEN
              BEGIN
                DEC(D[I-J]);
                L:=I-J;
                WHILE (D[L]<0) AND (L>1) DO
                  BEGIN
					D[L]:=9;
                    DEC(L);
                    DEC(D[L]);
                  END;
              END;
            IF (D[1]>0) OR (T) THEN
              BEGIN
                H:=D;
                T:=TRUE;
				W:=I;
				SW:=W;
				REPEAT
                  IF K=N THEN BREAK;
				  INC(D[W]);
                  FOR L:=W DOWNTO 2 DO
                    IF D[L]=10 THEN
                      BEGIN
                        D[L]:=0;
                        INC(D[L-1]);
                      END
                      ELSE BREAK;
                  IF D[1]=0 THEN
                    BEGIN
                      DEC(W);
                      FOR L:=1 TO W DO D[L]:=D[L+1];
                    END;
                  IF D[1]=10 THEN
                    BEGIN
                      FOR L:=W+1 DOWNTO 2 DO D[L]:=D[L-1];
                      D[2]:=0;
                      D[1]:=1;
                      INC(W);
                    END;
                  SM:=TRUE;
                  FOR L:=K+1 TO MIN(K+W,N) DO
                    IF A[L]<>D[L-K] THEN
                      BEGIN
                        SM:=FALSE;
                        BREAK;
                      END;
                  IF NOT SM THEN
                    BEGIN
					  T:=FALSE;
					  BREAK;
					END;
				  K:=MIN(K+W,N);
				UNTIL K=N;
				IF T THEN
				  BEGIN
					W:=SW;
					WHILE H[1]=0 DO
					  BEGIN
						FOR L:=1 TO W-1 DO H[L]:=H[L+1];
						DEC(W);
					  END;
					FILLCHAR(C,SIZEOF(C),0);
					FOR L:=1 TO W-1 DO INC(C[L],L*9);
					DEC(H[1]);
					INC(H[W]);
					FOR L:=W DOWNTO 2 DO
					  IF H[L]=10 THEN
						BEGIN
						  H[L]:=0;
						  INC(H[L-1]);
						END
						ELSE BREAK;
					FOR L:=1 TO W DO INC(C[W+1-L],W*H[L]);
					DEC(C[1],J-1);
					L:=1;
					WHILE C[L]<0 DO
                      BEGIN
                        INC(C[L+1],C[L] DIV 10-1);
                        C[L]:=C[L] MOD 10+10;
                      END;
                    FOR L:=1 TO W+4 DO
                      IF C[L]>9 THEN
                        BEGIN
                          INC(C[L+1],C[L] DIV 10);
                          C[L]:=C[L] MOD 10;
                        END;
                    FOR L:=300 DOWNTO 1 DO
                      BEGIN
                        IF C[L]<M[L] THEN M:=C;
                        IF C[L]<>M[L] THEN BREAK;
                      END;
                  END;
              END;
          END;
      FOR I:=300 DOWNTO 1 DO
        IF M[I]<>0 THEN
          BEGIN
            FOR J:=I DOWNTO 1 DO WRITE(M[J]);
            WRITELN;
            BREAK;
          END;
    END;
 BEGIN
	  INIT;
      MAIN;
 END.