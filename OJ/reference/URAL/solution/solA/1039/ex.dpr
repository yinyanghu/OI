{
 tree dp:
 f(x,1)=d(x)+sum f(x.child,0)
 f(x,0)=sum max f(x.child,0 or 1)
}
program Ural_1039(Input, Output);
const
    MaxN = 6000;
type
    TIndex = Longint;
    TNode = record
        Father: TIndex;
        Select: TIndex;
        Unselect: TIndex;
        FirstChild: TIndex;
        NextSibling: TIndex;
    end;
    TTree = array[0..MaxN] of TNode;
    TQueue = array[1..MaxN] of TIndex;
var
    T: TTree;
    Q: TQueue;
    Count: TIndex;
    N: TIndex;

function FindRoot(x: TIndex): TIndex;
begin
    if T[x].Father = 0 then
        Result := x
    else
        Result := FindRoot(T[x].Father);
end;

procedure PreOrder(x: TIndex);
var
    k: TIndex;
begin
    Inc(Count);
    Q[Count] := x;
    k := T[x].FirstChild;
    while k <> 0 do
    begin
        PreOrder(k);
        k := T[k].NextSibling;
    end;
end;

function Max(A, B: TIndex): TIndex;
begin
    if A > B then
        Max := A
    else
        Max := B;
end;

procedure Main;
var
    i, j, k: TIndex;
begin
    Readln(N);
    for i := 1 to N do
    begin
        Readln(T[i].Select);
        T[i].Unselect := 0;
        T[i].Father := 0;
    end;
    repeat
        Readln(i, j);
        if i * j = 0 then Break;
        T[i].Father := j;
        if T[j].FirstChild <> 0 then T[i].NextSibling := T[j].FirstChild;
        T[j].FirstChild := i;
    until false;
    Count := 0;
    PreOrder(FindRoot(1));
    T[0].Unselect := 0;
    T[0].Select := 0;
    for k := N downto 1 do
    begin
        i := Q[k];
        j := T[i].Father;
        Inc(T[j].Select, T[i].Unselect);
        Inc(T[j].Unselect, Max(T[i].Unselect, T[i].Select));
    end;
    Writeln(Max(T[0].Unselect, T[0].Select));
end;
begin
    {Assign(Input, 'i.txt');
    Reset(Input);
    Assign(Output, 'o.txt');
    Rewrite(Output);  }
    Main;
    {Close(Input);
    Close(Output); }
end.

