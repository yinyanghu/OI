(*
to understand problem is important
test data explain:

15 4
7 3 13 6

1st stop
robber is here at time 0
and he go out when time 0+7
police is here at time 15
the next tram will come at time 21 (trams come at 7,14,21)

the length of route doesn't matter the time lag at all because their speed
are always equal. so i'll assume that it's 0.
2nd stop
robber arrive at 7
robber go 7+3=10
police arrive 21
police go 22 (10,13,16,19,22)

3rd stop
robber go 10+13 = 23
police come 22 and arrest the robber here before he can go

*)
program Ural_1191(Input, Output);
type
    TIndex = Longint;

procedure Main;
var
    Rob, Cop, K, N: TIndex;
begin
    Readln(Cop, N);
    Rob := 0;
    while N > 0 do
    begin
        Dec(N);
        Read(K);
        Inc(Rob, K);   //rob leaving time
        if Rob > Cop then    //rob leaving time > cop arriving time, not equal!
        begin
            Writeln('YES');
            Exit;
        end
        else
            Cop := Rob + K * ((Cop - Rob) div K + 1); //cop leaving time
          // if Rob leaving time is equal to Cop arriving time then Cop should still wait for K mins
    end;
    Writeln('NO');
end;
begin
{    Assign(Input, 'i.txt');
    Reset(Input);
    Assign(Output, 'o.txt');
    Rewrite(Output);  }
    Main;
     {   Close(Input);
        Close(Output);  }
end.

