program Ural_1049(Input, Output);
const
    MaxValue = 10000;
    MaxPrimeNumber = 1229; {have 1229 primes in [1..10000]}
type
    TIndex = Integer;
    TData = Integer;
    TFilter = array[1..MaxValue] of Boolean;
    TPrimes = array[1..MaxPrimeNumber] of Longint;
    TExponent = array[1..MaxPrimeNumber] of Longint;
var
    i, j, PrimeNum, CurrentPrime: TIndex;
    T, S: TData;
    Filter: TFilter;
    Primes: TPrimes;
    Exponent: TExponent;
begin
    FillChar(Filter, SizeOf(Filter), true);
    FillChar(Primes, SizeOf(Primes), 0);
    FillChar(Exponent, SizeOf(Exponent), 0);
    Filter[1] := false;
    PrimeNum := 0;
    for i := 2 to MaxValue do
        if Filter[i] then
        begin
            Inc(PrimeNum);
            Primes[PrimeNum] := i;
            for j := 2 to MaxValue div i do
                Filter[i * j] := false;
        end;
    for i := 1 to 10 do
    begin
        Read(T);
        CurrentPrime := 0;
        while (T <> 1) and (CurrentPrime < MaxPrimeNumber) do
        begin
            Inc(CurrentPrime);
            if T mod Primes[CurrentPrime] = 0 then
            begin
                while T mod Primes[CurrentPrime] = 0 do
                begin
                    Inc(Exponent[CurrentPrime]);
                    T := T div Primes[CurrentPrime];
                end;
            end;
        end;
    end;
    S := 1;
    for i := 1 to MaxPrimeNumber do
        S := S * (Exponent[i] + 1) mod 10;
    Writeln(S);
end.

