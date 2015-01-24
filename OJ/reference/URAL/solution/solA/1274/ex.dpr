program Ural_1274(Input, Output);
type
    TData = Int64;
    TFraction = record
        //numerator ,denominator
        n, d: TData;
    end;
var
    a, b, c: TFraction;
    Oper: Char;

procedure StrToFrac(St: string; var r: TFraction);
var
    IsSign, Code: Integer;
    t: TData;
begin
    IsSign := 1;
    if St[1] = '-' then
    begin
        IsSign := -1;
        Delete(St, 1, 1);
    end;
    r.n := 0;
    r.d := 0;
    if Pos(' ', St) > 0 then
    begin
        Val(Copy(St, 1, Pos(' ', St) - 1), t, Code);
        Delete(St, 1, Pos(' ', St));
        Val(Copy(St, 1, Pos('/', St) - 1), r.n, Code);
        Delete(St, 1, Pos('/', St));
        Val(St, r.d, Code);
        r.n := r.n + r.d * t;
    end
    else
    begin
        if Pos('/', St) > 0 then
        begin
            Val(Copy(St, 1, Pos('/', St) - 1), r.n, Code);
            Delete(St, 1, Pos('/', St));
            Val(St, r.d, Code);
        end
        else
        begin
            Val(St, r.n, Code);
            r.d := 1;
        end;
    end;
    r.n := IsSign * r.n;
end;

function GCD(a, b: TData): TData;
var
    r: TData;
begin
    if a < b then
    begin
        r := a;
        a := b;
        b := r;
    end;
    while b > 0 do
    begin
        r := a mod b;
        a := b;
        b := r;
    end;
    GCD := a;
end;

procedure Operation;
var
    t: TData;
begin
    case Oper of
        '+':
            begin
                c.n := a.n * b.d + a.d * b.n;
                c.d := a.d * b.d;
            end;
        '-':
            begin
                c.n := a.n * b.d - a.d * b.n;
                c.d := a.d * b.d;
            end;
        '*':
            begin
                c.n := a.n * b.n;
                c.d := a.d * b.d;
            end;
        '/':
            begin
                c.n := a.n * b.d;
                c.d := a.d * b.n;
            end;
    end;
    t := GCD(Abs(c.n), Abs(c.d));
    c.n := c.n div t;
    c.d := c.d div t;
end;

procedure Print;
var
    IsSign, IsInt, IsFrac: Boolean;
begin
    IsSign := ((c.n < 0) and (c.d > 0)) or ((c.n > 0) and (c.d < 0));
    if IsSign then
        Write('-');
    c.n := Abs(c.n);
    c.d := Abs(c.d);
    IsInt := (c.n div c.d <> 0);
    IsFrac := (c.n mod c.d <> 0);
    if IsInt and IsFrac then
        Writeln(c.n div c.d, ' ', c.n mod c.d, '/', c.d)
    else if not IsInt and IsFrac then
        Writeln(c.n mod c.d, '/', c.d)
    else if IsInt and not IsFrac then
        Writeln(c.n div c.d)
    else if not IsInt and not IsFrac then
        Writeln('0');
end;

procedure Init;
var
    St: string;
begin
    Readln(St);
    StrToFrac(St, a);
    Readln(Oper);
    Readln(St);
    StrToFrac(St, b);
end;
begin
    Init;
    Operation;
    Print;
end.

