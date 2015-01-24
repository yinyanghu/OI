program Ural_1015(Input, Output);
const
    MaxCodeLen = 6;
    MaxHashLen = 720;
    MaxN = 100000;
type
    TIndex = Longint;
    TCode = array[1..MaxCodeLen] of Byte;
    THash = array[0..MaxHashLen - 1] of Byte;
    TType = array[1..MaxN] of Byte;
    TCodeSet = set of 1..MaxCodeLen;
    TTypeSet = set of 1..30;
var
    N: TIndex;
    F: THash;
    P: TType;

function DeCode(X: TIndex): TCode;
var
    i, j, t: TIndex;
    S: TCodeSet;
begin
    S := [];
    for i := MaxCodeLen downto 1 do
    begin
        t := X mod i + 1;
        j := 1;
        while j <= t do
        begin
            if j in S then Inc(t);
            Inc(j);
        end;
        DeCode[i] := t;
        S := S + [t];
        X := X div i;
    end;
end;

function EnCode(X: TCode): TIndex;
var
    i, j, t: TIndex;
begin
    t := 0;
    for i := 1 to MaxCodeLen do
    begin
        t := t * i;
        for j := 1 to i - 1 do
            if X[j] < X[i] then Inc(t);
    end;
    EnCode := t;
end;

function ToCode(C1, C2, C3, C4, C5, C6: Byte): TCode;
begin
    ToCode[1] := C1;
    ToCode[2] := C2;
    ToCode[3] := C3;
    ToCode[4] := C4;
    ToCode[5] := C5;
    ToCode[6] := C6;
end;

procedure Main;
var
    i, j, K: TIndex;
    S: TTypeSet;
    T: TCode;
begin
    FillChar(F, SizeOf(F), 0);
    K := 0;
    for i := 0 to MaxHashLen - 1 do
        if F[i] = 0 then
        begin
            T := DeCode(i);
            Inc(K);
            F[EnCode(ToCode(T[1], T[2], T[3], T[4], T[5], T[6]))] := K;
            F[EnCode(ToCode(T[1], T[2], T[4], T[5], T[6], T[3]))] := K;
            F[EnCode(ToCode(T[1], T[2], T[5], T[6], T[3], T[4]))] := K;
            F[EnCode(ToCode(T[1], T[2], T[6], T[3], T[4], T[5]))] := K;
            F[EnCode(ToCode(T[2], T[1], T[3], T[6], T[5], T[4]))] := K;
            F[EnCode(ToCode(T[2], T[1], T[4], T[3], T[6], T[5]))] := K;
            F[EnCode(ToCode(T[2], T[1], T[5], T[4], T[3], T[6]))] := K;
            F[EnCode(ToCode(T[2], T[1], T[6], T[5], T[4], T[3]))] := K;
            F[EnCode(ToCode(T[3], T[5], T[2], T[4], T[1], T[6]))] := K;
            F[EnCode(ToCode(T[3], T[5], T[6], T[2], T[4], T[1]))] := K;
            F[EnCode(ToCode(T[3], T[5], T[1], T[6], T[2], T[4]))] := K;
            F[EnCode(ToCode(T[3], T[5], T[4], T[1], T[6], T[2]))] := K;
            F[EnCode(ToCode(T[5], T[3], T[1], T[4], T[2], T[6]))] := K;
            F[EnCode(ToCode(T[5], T[3], T[6], T[1], T[4], T[2]))] := K;
            F[EnCode(ToCode(T[5], T[3], T[2], T[6], T[1], T[4]))] := K;
            F[EnCode(ToCode(T[5], T[3], T[4], T[2], T[6], T[1]))] := K;
            F[EnCode(ToCode(T[4], T[6], T[3], T[2], T[5], T[1]))] := K;
            F[EnCode(ToCode(T[4], T[6], T[1], T[3], T[2], T[5]))] := K;
            F[EnCode(ToCode(T[4], T[6], T[5], T[1], T[3], T[2]))] := K;
            F[EnCode(ToCode(T[4], T[6], T[2], T[5], T[1], T[3]))] := K;
            F[EnCode(ToCode(T[6], T[4], T[5], T[2], T[3], T[1]))] := K;
            F[EnCode(ToCode(T[6], T[4], T[1], T[5], T[2], T[3]))] := K;
            F[EnCode(ToCode(T[6], T[4], T[3], T[1], T[5], T[2]))] := K;
            F[EnCode(ToCode(T[6], T[4], T[2], T[3], T[1], T[5]))] := K;
        end;
    Readln(N);
    FillChar(P, SizeOf(P), 0);
    S := [];
    K := 0;
    for i := 1 to N do
    begin
        for j := 1 to MaxCodeLen do
            Read(T[j]);
        Readln;
        P[i] := F[EnCode(T)];
        if not (P[i] in S) then
        begin
            S := S + [P[i]];
            Inc(K);
        end;
    end;
    Writeln(K);
    for i := 1 to N do
        if P[i] in S then
        begin
            Write(i);
            for j := i + 1 to N do
                if P[j] = P[i] then Write(' ', j);
            S := S - [P[i]];
            Writeln;
        end;
end;
begin
    Main;
end.

