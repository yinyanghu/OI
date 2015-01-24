{$N+}
program Ural_1306(Input, Output);
//19:05  19:30
const
    MaxN = 250000;
    Buffer = 3; // Even N(+2)+Current Extended(+1)
type
    TIndex = Longint;
    TData = Longword;
    TQueue = array[1..MaxN div 2 + Buffer] of TData;
var
    N: TIndex;
    Q: TQueue;
    Len: TIndex;

procedure DeleteMax;
var
    i, j: TIndex;
    tmp: TData;
begin
    tmp := Q[Len]; // Q[1]=Q[Len]
    Dec(Len);
    i := 1;
    while i * 2 <= Len do
    begin
        j := i * 2;
        if (j + 1 <= Len) and (Q[j] < Q[j + 1]) then Inc(j);
        if Q[j] > tmp then
        begin
            Q[i] := Q[j];
            i := j;
        end
        else
            Break;
    end;
    Q[i] := tmp;
end;

procedure Insert(Value: TData);
var
    i: TIndex;
    tmp: TData;
begin
    Inc(Len);
    tmp := Value; //    D[Len] = Value
    i := Len;
    while i > 1 do
    begin
        if tmp > Q[i div 2] then
        begin
            Q[i] := Q[i div 2];
            i := i div 2;
        end
        else
            Break;
    end;
    Q[i] := tmp;
end;

procedure Maximum(var Value: TData);
begin
    Value := Q[1];
end;

procedure Main;
var
    Value, Value_: TData;
    i: TIndex;
    Sum: Extended; //Overflow  WA 1 times
begin
    FillChar(Q, SizeOf(Q), 0);
    Len := 0;
    Readln(N);
    for i := 1 to N div 2 + 1 do
    begin
        Readln(Value);
        Insert(Value);
    end;
    for i := N div 2 + 2 to N do
    begin
        Readln(Value);
        Insert(Value);
        DeleteMax;
    end;
    if Odd(N) then
    begin
        Maximum(Value);
        Sum := Value;
        Writeln(Sum: 0: 1);
    end
    else
    begin
        Maximum(Value);
        Sum := Value;
        DeleteMax;
        Maximum(Value_);
        Sum := Sum + Value_;
        Writeln(Sum / 2: 0: 1);
    end;
end;
begin
    { Assign(Input, 'i.txt');
     Reset(Input);
     Assign(Output, 'o.txt');
     Rewrite(Output);    }
    Main;
    {   Close(Input);
       Close(Output);    }
end.

