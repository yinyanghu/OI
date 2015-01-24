{$N+}
program Ural_1283(Input, Output);
type
    TIndex = Int64;
    TData = Extended;
var
    Total, Limit: TIndex;

procedure Main;
var
    Base, T: TData;
    K: TIndex;
begin
    Readln(Total, Limit, Base);
    Base := (1 - Base / 100);
    T := 1;
    K := 0;
    while T * Total > Limit do
    begin
        Inc(K);
        T := T * Base;
    end;
    Writeln(K);
end;
begin
   { Assign(Input, 'i.txt');
    Reset(Input);
    Assign(Output, 'o.txt');
    Rewrite(Output);   }
    Main;
  {  Close(Input);
    Close(Output);    }
end.

