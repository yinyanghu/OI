program Ural_1220(Input, Output);
const
    MaxStack = 1000;
    MaxElement = 100000;
type
    TIndex = Longint;
    TStackTop = array[1..MaxStack] of TIndex;
    TElement = array[1..MaxElement] of record
        Stack: Integer;
        Value: Longint;
    end;
var
    N, M: TIndex;
    T: TStackTop;
    D: TElement;

procedure Main;
var
    i, j, k: TIndex;
    Ch: Char;
begin
    FillChar(D, SizeOf(D), 0);
    FillChar(T, SizeOf(T), 0);
    Readln(N);
    M := 0;
    for i := 1 to N do
    begin
        Read(Ch);
        Read(Ch);
        if Ch = 'U' then
        begin
            Read(Ch);
            Read(Ch);
            Inc(M);
            Readln(D[M].Stack, D[M].Value);
            T[D[M].Stack] := M;
        end
        else if Ch = 'O' then
        begin
            Read(Ch);
            Readln(k);
            if T[k] = 0 then Continue;
            if D[T[k]].Stack = 0 then
                for j := T[k] - 1 downto 1 do
                    if D[j].Stack = k then
                    begin
                        T[k] := j;
                        Break;
                    end;
            D[T[k]].Stack := 0;
            Writeln(D[T[k]].Value);
        end;
    end;
end;
begin
{    Assign(Input, 'i.txt');
    Reset(Input);
    Assign(Output, 'o.txt');
    Rewrite(Output);}
    Main;
{    Close(Input);
    Close(Output);   }
end.

