program Ural_1296(Input, Output);
type
    TIndex = Longint;
    TData = Longint;
var
    N: TIndex;

procedure Main;
var
    i: TIndex;
    Last, X, Max: TData;
begin
    Readln(N);
    Max := 0;
    Last := 0;
    for i := 1 to N do
    begin
        Readln(X);
        if X + Last > 0 then
            Inc(Last, X)
        else
            Last := 0;
        if Last > Max then
            Max := Last;
    end;
    Writeln(Max);
end;
begin
  {  Assign(Input, 'i.txt');
    Reset(Input);
    Assign(Output, 'o.txt');
    Rewrite(Output);  }
    Main;
   { Close(Input);
    Close(Output);   }
end.

