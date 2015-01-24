//Joseph Problem: 
//c is constant
//k = 0
//k = (k+c-1) mod i + 1 (each i form 1 to N(Num Node))
//k is index of remained item
//problem sample output is wrong , should be No comments
program Ural_1098(Input, Output);
const
    MaxM = 30000;
    N = 1999;
type
    TIndex = Longint;
    TChar = array[1..MaxM] of Char;
var
    P: TChar;
    M: TIndex;

procedure Main;
var
    Ch: Char;
    i, k: TIndex;
begin
    M := 0;
    while not Eof do
    begin
        Read(Ch);
        if not (Ch in [#13, #10]) then
        begin
            Inc(M);
            P[M] := Ch;
        end;
    end;
    k := 0;
    for i := 1 to M do
        k := (k + N - 1) mod i + 1;
    if P[k] = '?' then
        Writeln('Yes')
    else if P[k] = ' ' then
        Writeln('No')
    else
        Writeln('No comments');
end;
begin
  {   Assign(Input, 'i.txt');
     Reset(Input);
     Assign(Output, 'o.txt');
     Rewrite(Output); }
    Main;
    { Close(Input);
     Close(Output);  }
end.
