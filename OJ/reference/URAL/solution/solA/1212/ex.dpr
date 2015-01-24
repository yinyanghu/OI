program Ural_1212(Input, Output);
const
    MaxLen = 2000;  // W*(L*3+K*3+K*L)=1650
    MaxW = 31;
type
    TIndex = Longint;
    TShip = record
        X, Y: TIndex;
        Dir: Char;
        L: TIndex;
    end;
    TShips = array[1..MaxW] of TShip;
    TOpenList = array[1..MaxLen] of record
        X, Y: TIndex;
        V, H: Boolean;
    end;
var
    N, M, W, K: TIndex;
    F: TOpenList;
    D: TShips;
    S, Q: TIndex;

procedure Join(X, Y: TIndex; V, H: Boolean);
var
    i: TIndex;
begin
    if (X > 0) and (X <= M) and (Y > 0) and (Y <= N) then
    begin
        for i := 1 to Q do
            if (F[i].X = X) and (F[i].Y = Y) then
            begin
                F[i].V := F[i].V or (V and (Y + K - 1 <= N));
                F[i].H := F[i].H or (H and (X + K - 1 <= M));
                Exit;
            end;
        Inc(Q);
        F[Q].X := X;
        F[Q].Y := Y;
        F[Q].V := (V and (Y + K - 1 <= N));
        F[Q].H := (H and (X + K - 1 <= M));
    end;
end;

procedure Main;
var
    i, j, p: TIndex;
    V, H: Boolean;
begin
    Readln(N, M, W);
    for i := 1 to W do
    begin
        Read(D[i].X, D[i].Y, D[i].L);
        repeat
            Read(D[i].Dir);
        until D[i].Dir in ['H', 'V'];
        Readln;
    end;
    Readln(K);
    for p := 1 to W do
        with D[p] do
            if Dir = 'V' then
            begin
                V := true;
                H := true;
                for j := Y - 1 to Y + L do
                begin
                    i := X - 1;
                    Join(i, j, V, H);
                    i := X;
                    Join(i, j, V, H);
                    i := X + 1;
                    Join(i, j, V, H);
                end;
                V := true;
                H := false;
                for j := Y - K to Y - 2 do
                begin
                    i := X - 1;
                    Join(i, j, V, H);
                    i := X;
                    Join(i, j, V, H);
                    i := X + 1;
                    Join(i, j, V, H);
                end;
                V := false;
                H := true;
                for i := X - K to X - 2 do
                    for j := Y - 1 to Y + L do
                        Join(i, j, V, H);
            end
            else if Dir = 'H' then
            begin
                V := true;
                H := true;
                for i := X - 1 to X + L do
                begin
                    j := Y - 1;
                    Join(i, j, V, H);
                    j := Y;
                    Join(i, j, V, H);
                    j := Y + 1;
                    Join(i, j, V, H);
                end;
                V := false;
                H := true;
                for i := X - K to X - 2 do
                begin
                    j := Y - 1;
                    Join(i, j, V, H);
                    j := Y;
                    Join(i, j, V, H);
                    j := Y + 1;
                    Join(i, j, V, H);
                end;
                V := true;
                H := false;
                for i := X - 1 to X + L do
                    for j := Y - K to Y - 2 do
                        Join(i, j, V, H);
            end;
    if K = 1 then          // when K=1 H=V!!
    begin
        S := 0;
        for i := 1 to Q do
            Inc(S, Ord(F[i].V or F[i].H));
        Writeln(N * M - S);
    end
    else
    begin
        S := 0;
        for i := 1 to Q do
            Inc(S, Ord(F[i].V) + Ord(F[i].H));
        if N * (M - K + 1) + M * (N - K + 1) - S < 0 then
            Writeln(0)
        else
            Writeln(N * (M - K + 1) + M * (N - K + 1) - S);
    end;
end;
begin
 {  Assign(Input, 'i.txt');
    Reset(Input);
    Assign(Output, 'o.txt');
    Rewrite(Output);    }
    Main;
 {  Close(Input);
    Close(Output);    }
end.

