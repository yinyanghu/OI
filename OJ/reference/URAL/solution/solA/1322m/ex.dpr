(*
see also camp2004\科学委员会讲义\李文新\讲义\binaryCodes-video.ppt
Char={ABCDEFGHIJKLMNOPQRSTUVWXYZ_abcdefghijklmnopqrstuvwxyz}
Code={1..26,27,28..53}
*)
program Ural_1322(Input, Output);
//11:40 12:07
const
    MaxN = 100000;
type
    TIndex = Longint;
    TNumber = array[1..MaxN] of Byte;
    TNextChar = array[1..MaxN] of TIndex;
    TNextLine = array[1..MaxN] of TIndex;
    THash = array[1..26 * 2 + 1] of record
        Count: TIndex;
        First, Last: TIndex;
    end;
var
    F, L: TNumber;
    H: THash;
    NextCh: TNextChar;
    NextLn: TNextLine;
    FirstLn: TIndex;
    N: TIndex;

function EnCode(Ch: Char): Byte;
begin
    if Ch in ['A'..'Z'] then
        EnCode := Ord(Ch) - Ord('A') + 1
    else if Ch = '_' then
        EnCode := 27
    else //if Ch in ['a'..'z'] then
        EnCode := 27 + Ord(Ch) - Ord('a') + 1;
end;

function DeCode(X: Byte): Char;
begin
    if X in [1..26] then
        DeCode := Chr(X + Ord('A') - 1)
    else if X = 27 then
        DeCode := '_'
    else  //if X in [28..53] then
        DeCode := Chr(X + Ord('a') - 28);
end;

procedure Main;
var
    i, j: TIndex;
    Ch: Char;
    X: Byte;
begin
    FillChar(H, SizeOf(H), 0);
    Readln(FirstLn);
    N := 0;
    while not Eof do
    begin
        Read(Ch);
        if Ch in ['A'..'Z', 'a'..'z', '_'] then
        begin
            Inc(N);
            L[N] := EnCode(Ch);
            X := L[N];
            Inc(H[X].Count);
            if H[X].First = 0 then
                H[X].First := N
            else
                NextCh[H[X].Last] := N;
            H[X].Last := N;
            NextCh[N] := 0;
        end;
    end;
    i := 0;
    for X := 1 to 26 * 2 + 1 do
    begin
        j := H[X].First;
        while H[X].Count > 0 do
        begin
            Dec(H[X].Count);
            Inc(i);
            F[i] := X;
            NextLn[i] := j;
            j := NextCh[j];
        end;
    end;
    j := FirstLn;
    Write(DeCode(F[j]));
    for i := 2 to N do
    begin
        j := NextLn[j];
        Write(DeCode(F[j]));
    end;
    Writeln;
end;
begin
     {  Assign(Input, 'i.txt');
       Reset(Input);
       Assign(Output, 'o.txt');
       Rewrite(Output); }
    Main;
   { Close(Input);
    Close(Output);  }
end.

