program Ural_1202(Input, Output);
type
    TIndex = Longint;
    TData = Longint;
var
    N: TIndex;

procedure Main;
var
    i: TIndex;
    X1l, Y1l, X1h, Y1h, X2l, Y2l, X2h, Y2h, Yp, Yd: TData;
    S: TData;
begin
    Readln(N);
    S := 0;
    Readln(X1l, Y1l, X1h, Y1h);
    Y2h := Y1h; //when N=1
    Inc(S, Abs(X1l - X1h));
    Yp := 1;
    for i := 2 to N do
    begin
        Readln(X2l, Y2l, X2h, Y2h);
        Inc(S, Abs(X2l - X2h));
        if (Y2l < Yp) and (Yp < Y2h) then
        else if (Yp <= Y2l) then
        begin
            Yd := Abs(Yp - Y2l) + 1;
            if (Y1l < Yp + Yd) and (Yp + Yd < Y1h) then
            begin
                Yp := Yp + Yd;
                Inc(S, Yd);
            end
            else
            begin
                Writeln(-1);
                Exit;
            end;
        end
        else if (Y2h <= Yp) then
        begin
            Yd := Abs(Yp - Y2h) + 1;
            if (Y1l < Yp - Yd) and (Yp - Yd < Y1h) then
            begin
                Yp := Yp - Yd;
                Inc(S, Yd);
            end
            else
            begin
                Writeln(-1);
                Exit;
            end;
        end;
        Y1l := Y2l;
        Y1h := Y2h;
    end;
    Inc(S, Y2h - 1 - Yp);
    Dec(S, 2);
    Writeln(S);
end;
begin
   { Assign(Input, 'i.txt');
    Reset(Input);
    Assign(Output, 'o.txt');
    Rewrite(Output);   }
    Main;
  {  Close(Input);
    Close(Output);   }
end.

