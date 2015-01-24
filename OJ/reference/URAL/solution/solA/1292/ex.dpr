{
 all K are divisible by 3
 Let a1a2..an for K,e.g. 134=1,3,4
 Define Set S0 (ai mod 3=0) , S1 (ai mod 3=1) , S2 (ai mod 3=2)
 S0: x=x^3=0 (mod 3)
 S1: x=x^3=1 (mod 3)
 S2: x=x^3=2 (mod 3)
 So K mod 3=F[K] mod 3
 Try Some Test
 23->35->152->134->92->737->713->353->179->1073->371....
 123->36->243->99->1458->702->351->153->153->153.....
 7->343->118->514->190->730->370->....
 67->559->979->1801->514->190->730->370->....
 23065->376->586->853->664->496->1009->730->370->...
 We can always find p for F^(p)[K]=F^(p+1)[K]
 And p << MaxN,So O(p) << O(N)
}
program Ural_1292(Input, Output);
type
    TIndex = Longint;
    TStatist = array[0..9] of TIndex;

function SecretFunction(X: TIndex): TIndex;
var
    i: TIndex;
    R: TIndex;
    F: TStatist;
    Valid: Boolean;
begin
    FillChar(F, SizeOf(F), 0);
    while X > 0 do
    begin
        Inc(F[X mod 10]);
        X := X div 10;
    end;
    X := 0;
    for i := 0 to 9 do
        Inc(X, F[i] * i * i * i);
    R := X;
    while R > 0 do
    begin
        Dec(F[R mod 10]);
        R := R div 10;
    end;
    Valid := true;
    for i := 0 to 9 do
        Valid := Valid and (F[i] = 0);
    if Valid then
        SecretFunction := -X
    else
        SecretFunction := X;
end;

procedure Main;
var
    N, K, L: TIndex;
    M: TIndex;
begin
    Readln(M);
    while M > 0 do
    begin
        Dec(M);
        Readln(N, K, L);
        while N > 1 do
        begin
            Dec(N);
            K := SecretFunction(K);
            if K < 0 then
            begin
                K := -K;
                Break;
            end;
        end;
        Writeln(K - L);
    end;
end;

begin
  {  Assign(Input, 'i.txt');
    Reset(Input);
    Assign(Output, 'o.txt');
    Rewrite(Output);}
    Main;
   { Close(Input);
    Close(Output);  }
end.

