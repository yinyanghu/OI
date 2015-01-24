(*
Used time : 0.64s
O(N log N)+O(N)+O(N^2)+O(N)=O(N^2)
            /|\
             |delete repeat (but without it still 0.64s)
???solution 1,used time > solution 2
*)
program Ural_1019(Input, Output);
const
    MaxN = 5000;
type
    TIndex = Longint;
    TSegments = array[0..MaxN] of record
        l, r: TIndex;
        c: Boolean;
    end;
    TPoint = record
        Status: TIndex;
        Point: TIndex;
    end;
    TPoints = array[1..MaxN * 2 + 2] of TPoint;
var
    S: TSegments;
    P: TPoints;
    N, Len: TIndex;

procedure Sift(l, r: TIndex);
var
    i, j: TIndex;
    tmp: TPoint;
begin
    i := l;
    j := i * 2;
    tmp := P[l];
    while j <= r do
    begin
        if (j < r) and (P[j].Point < P[j + 1].Point) then
            Inc(j);
        if tmp.Point >= P[j].Point then
            Break
        else
        begin
            P[i] := P[j];
            i := j;
            j := i * 2;
        end;
    end;
    P[i] := tmp;
end;

procedure HeapSort;
var
    i: TIndex;
    tmp: TPoint;
begin
    for i := Len div 2 downto 1 do
        Sift(i, Len);
    for i := Len downto 1 do
    begin
        tmp := P[1];
        P[1] := P[i];
        P[i] := tmp;
        Sift(1, i - 1);
    end;
end;

procedure Main;
var
    i, j: TIndex;
    Ch: Char;
    Len_, MaxLeft, MaxRight, Max: TIndex;
begin
    FillChar(P, SizeOf(P), 0);
    FillChar(S, SizeOf(S), 0);
    P[1].Point := 0;
    P[2].Point := 1000000000;
    S[0].l := 0;
    S[0].r := 1000000000;
    S[0].c := false;
    Readln(N);
    for i := 1 to N do
    begin
        Read(S[i].l, S[i].r);
        repeat
            Read(Ch);
        until Ch in ['b', 'w'];
        S[i].c := (Ch = 'b');
        Readln;
        P[i * 2 + 1].Point := S[i].l;
        P[i * 2 + 2].Point := S[i].r;
    end;
    Len := 2 * N + 2;
    HeapSort;
    Len_ := Len;
    Len := 0;
    i := 1;
    while i <= Len_ do
    begin
        Inc(Len);
        P[Len] := P[i];
        Inc(i);
        while (P[i].Point = P[Len].Point) and (i <= Len_) do
            Inc(i);
    end;    
    for i := N downto 0 do
        for j := 1 to Len - 1 do
            if (S[i].l <= P[j].Point) and (P[j + 1].Point <= S[i].r) and (P[j].Status = 0) then
                P[j].Status := Ord(S[i].c) + 1;
    MaxLeft := -1;
    MaxRight := -1;
    Max := 0;
    i := 1;
    while i <= Len - 1 do //Len-1
    begin
        j := i;
        while P[i].Status = P[j + 1].Status do //P[Len].status=0
            Inc(j);
        if (P[j + 1].Point - P[i].Point > Max) and (P[i].Status = 1) then
        begin
            MaxLeft := P[i].Point;
            MaxRight := P[j + 1].Point;
            Max := P[j + 1].Point - P[i].Point;
        end;
        i := j + 1;
    end;
    Writeln(MaxLeft, ' ', MaxRight);
end;
begin
   { Assign(Input, 'i.txt');
    Reset(Input);
    Assign(Output, 'o.txt');
    Rewrite(Output); }
    Main;
   { Close(Input);
    Close(Output); }
end.

