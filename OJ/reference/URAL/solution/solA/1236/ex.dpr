program Ural_1236(Input, Output);
//22:50
const
    HexChar: string = '0123456789ABCDEF';
    MaxN = 10000;
type
    TIndex = Longint;
    TCode = Byte;
    TCodeArray = array[0..MaxN + 1] of TCode;
var
    E, K, C, Ee: TCodeArray;
var
    N: TIndex;

function HexToDecBit(Ch: Char): TIndex;
begin
    if Ch in ['A'..'F'] then
        HexToDecBit := Ord(Ch) - Ord('A') + 10
    else if Ch in ['0'..'9'] then
        HexToDecBit := Ord(Ch) - Ord('0');
end;

function HexToDec(St: string): TIndex;
begin
    HexToDec := HexToDecBit(St[1]) * 16 + HexToDecBit(St[2]);
end;

function DecToHex(X: TIndex): string;
begin
    DecToHex := HexChar[X div 16 + 1] + HexChar[X mod 16 + 1];
end;

procedure Main;
var
    i: TIndex;
    Ch1, Ch2: Char;
begin
    N := 0;
    while not Eoln do
    begin
        Inc(N);
        Read(Ch1);
        Read(Ch2);
        E[N] := HexToDec(Ch1 + Ch2);
    end;
    Readln;
    for i := 1 to N + 1 do
    begin
        Read(Ch1);
        Read(Ch2);
        Ee[i] := HexToDec(Ch1 + Ch2);
    end;
    Readln;
    C[0] := 32;
    for i := 1 to N + 1 do
    begin
        K[i] := Ee[i] xor C[i - 1];
        C[i] := E[i] xor K[i];
        Write(DecToHex(K[i]));
    end;
    Writeln;
end;
begin
{    Assign(Input, 'i.txt');
    Reset(Input);
    Assign(Output, 'o.txt');
    Rewrite(Output);}
    Main;
{    Close(Input);
    Close(Output);}
end.

