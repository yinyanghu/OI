{
Notice! Must  Int64!
                            |  it's mod not minus
                           \/
F(X,K)=C([LogB,X],K)+F[X mod B^[LogB,X],K-1]
}
program Ural_1057(Input, Output);
type
    TData = Int64;
var
    B, S, X, Y: TData;

function Log(X: TData): TData;
var
    i, T: TData;
begin
    T := 1;
    i := 0;
    while T < X do
    begin
        Inc(i);
        T := T * B;
    end;
    if T > X then Dec(i);
    Log := i;
end;

function C(N, R: TData): TData;
var
    i, T: TData;
begin
    if N < R then
        C := 0
    else if R = 0 then
        C := 1
    else
    begin
        T := 1;
        i := 0;
        while i < R do
        begin
            Inc(i);
            T := T * (N - R + i) div i;
        end;
        C := T;
    end;
end;

function Power(X: TData): TData;
var
    i, T: TData;
begin
    T := 1;
    i := 0;
    while i < X do
    begin
        Inc(i);
        T := T * B;
    end;
    Power := T;
end;

function F(X, K: TData): TData;
begin
    if K = 0 then
        F := 1
    else if (X = 0) and (K <> 0) then
        F := 0
    else if Log(X) + 1 < K then
        F := 0
    else
        F := C(Log(X), K) + F(X mod Power(Log(X)), K - 1);
end;
begin
    {  Assign(Input, 'i.txt');
      Reset(Input);
      Assign(Output, 'o.txt');
      Rewrite(Output);   }
    Read(X, Y, S, B);
    Writeln(F(Y, S) - F(X - 1, S));
    { Close(Input);
     Close(Output);}
end.

