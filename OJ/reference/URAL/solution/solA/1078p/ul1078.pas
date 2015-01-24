PROGRAM UL1078(INPUT,OUTPUT);
 VAR
      N:LONGINT;
      A,B,E,F,G,RE,REC:ARRAY [1..500] OF LONGINT;
 PROCEDURE INIT;
    VAR
      Z:LONGINT;
    BEGIN
      READLN(N);
      FOR Z:=1 TO N DO READ(B[Z],F[Z]);
    END;
 PROCEDURE MAIN;
    VAR
      I,J,K,S,W,O:LONGINT;
    BEGIN
      FOR I:=1 TO N DO
        BEGIN
          K:=-MAXINT;
          FOR J:=1 TO N DO
            IF B[J]>K THEN
              BEGIN
                K:=B[J];
                W:=J;
              END;
          E[I]:=W;
          G[I]:=F[W];
          B[W]:=-MAXINT;
        END;
      A[1]:=1;
      FOR I:=1 TO N DO
        BEGIN
          K:=0;
          FOR J:=1 TO I-1 DO
            IF (A[J]+1>K) AND (G[J]<G[I]) THEN
              BEGIN
                K:=A[J]+1;
                RE[I]:=J;       {记录数组RE}
              END;
          A[I]:=K;
          IF A[I]=0 THEN A[I]:=1;
        END;
      K:=0;
      FOR I:=1 TO N DO
        IF A[I]>K THEN
          BEGIN
            K:=A[I];
            W:=I;
          END;
      WRITELN(K);
      O:=K;
      WHILE K>0 DO        {往回迭代求解}
        BEGIN
          REC[K]:=E[W];
          W:=RE[W];
          DEC(K);
        END;
      FOR I:=1 TO O DO WRITE(REC[I],' ');
      WRITELN;
    END;
 BEGIN
      INIT;
      MAIN;
     END.
