(*
  think question:.
     |X(AA)|>=|Y(A)| , |X(X(AA))|>=|X(A)| .....  ---[*]
     why?
     if [*] is false then this dp is wrong.
  *******************************************
  O(N^2)*(O(1)+O(N)+O(N^2)) = O(N^4) = O(10^8)!!
  but use 0.078s,397kb!
  test data is so weak.
  Dp
  f(i,j)=minlen{
  d(i,j)
  f(i,k)+f(k+1,j) | i<=k<=j-1
  repeatnum+'(' + f(i,i+k-1) + ')' |  1<=k<=(j-i+1) div 2 for j-i+1 mod k=0 & repeatnum * d(i,i+k-1)= d(i,j)
  }
*)
program Ural_1238(Input, Output);
//20:17  20:58
const
    MaxN = 100;
type
    TIndex = Longint;
    TData = array[1..MaxN] of Char;
    TDp = array[1..MaxN, 1..MaxN] of Shortint;
    TPath = array[1..MaxN, 1..MaxN] of Shortint;
var
    D: TData;
    N: TIndex;
    F: TDp;
    P: TPath;

procedure Buffer(var Temp: string; k: TIndex);
var
    i: TIndex;
begin
    Temp := '';
    for i := 1 to k do
        Temp := Temp + #0;
end;

procedure Print(i, l: TIndex);
var
    Temp: string;
    k: TIndex;
begin
    if P[i, l] = 0 then
    begin
        Buffer(Temp, l);
        Move(D[i], Temp[1], l);
        Write(Temp);
    end
    else if P[i, l] > 0 then
    begin
        k := P[i, l];
        Print(i, k);
        Print(i + k, l - k);
    end
    else if P[i, l] < 0 then
    begin
        k := -P[i, l];
        Write(l div k, '(');
        Print(i, k);
        Write(')');
    end;
end;

procedure Main;
var
    i, j, k, l: TIndex;
    Sour, Comp, Num: string;
    Valid: Boolean;
    Ch: Char;
begin
    N := 0;
    while not Eoln do
    begin
        Read(Ch);
        if Ch in ['A'..'Z'] then
        begin
            Inc(N);
            D[N] := Ch;
        end;
    end;
    FillChar(F, SizeOf(F), 0);
    FillChar(P, SizeOf(P), 0);
    for i := 1 to N do
    begin
        P[i, 1] := 0;
        F[i, 1] := 1;
    end;
    for l := 2 to N do
        for i := 1 to N - l + 1 do
        begin
            P[i, l] := 0;
            F[i, l] := l;
            for k := 1 to l - 1 do
                if F[i, k] + F[i + k, l - k] < F[i, l] then
                begin
                    F[i, l] := F[i, k] + F[i + k, l - k];
                    P[i, l] := k;
                end;
            for k := 1 to l div 2 do
                if l mod k = 0 then
                begin
                    Valid := true;
                    Buffer(Sour, k);
                    Buffer(Comp, k);
                    Move(D[i], Sour[1], k);
                    for j := 1 to l div k - 1 do
                    begin
                        Move(D[i + j * k], Comp[1], k);
                        if Comp <> Sour then
                        begin
                            Valid := false;
                            Break;
                        end;
                    end;
                    if Valid then
                    begin
                        Str(l div k, Num);
                        if Length(Num) + 2 + F[i, k] < F[i, l] then
                        begin
                            F[i, l] := Length(Num) + 2 + F[i, k];
                            P[i, l] := -k;
                        end;
                    end;
                end;
        end;
    Print(1, N);
    Writeln;
end;
begin
    { Assign(Input, 'i.txt');
     Reset(Input);
     Assign(Output, 'o.txt');
     Rewrite(Output); }
    Main;
    { Close(Input);
      Close(Output); }
end.

