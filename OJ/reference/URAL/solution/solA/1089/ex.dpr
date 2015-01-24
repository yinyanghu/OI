(*
Notice:
if word is already correct,it needn't increase Error Num!
For that,Wa twice.
*)
program Ural_1089(Input, Output);
const
    MaxN = 100;
type
    TIndex = Longint;
    TDictionary = array[1..MaxN] of string;
var
    N, M: TIndex;
    D: TDictionary;

procedure Main;
var
    i, j: TIndex;
    St: string;
    Ch: Char;
    found: Boolean;
begin
    N := 0;
    while true do
    begin
        Readln(St);
        if St = '#' then Break;
        Inc(N);
        D[N] := St;
    end;
    St := '';
    M := 0;
    while not Eof do
    begin
        Read(Ch);
        if Ch in ['a'..'z'] then
            St := St + Ch //end
        else
        begin
            if St <> '' then
            begin
                found := false;
                for i := 1 to N do
                    if Length(St) = Length(D[i]) then
                    begin
                        if St = D[i] then Break;
                        for j := 1 to Length(St) do
                            if (Copy(St, 1, j - 1) = Copy(D[i], 1, j - 1))
                                and (Copy(St, j + 1, Length(St) - j) = Copy(D[i], j + 1, Length(D[i]) - j)) then
                            begin
                                found := true;
                                Inc(M);
                                St := D[i];
                                Break;
                            end;
                        if found then Break;
                    end;
                Write(St);
                St := '';
            end;
            Write(Ch);
        end;
    end;
    if St <> '' then
    begin
        found := false;
        for i := 1 to N do
            if Length(St) = Length(D[i]) then
            begin
                if St = D[i] then Break;
                for j := 1 to Length(St) do
                    if (Copy(St, 1, j - 1) = Copy(D[i], 1, j - 1))
                        and (Copy(St, j + 1, Length(St) - j) = Copy(D[i], j + 1, Length(D[i]) - j)) then
                    begin
                        found := true;
                        Inc(M);
                        St := D[i];
                        Break;
                    end;
                if found then Break;
            end;
        Write(St);
        St := '';
    end;
    Writeln;
    Writeln(M);
end;
begin
    {  Assign(Input, 'i.txt');
      Reset(Input);
      Assign(Output, 'o.txt');
      Rewrite(Output);}
    Main;
    { Close(Input);
     Close(Output);   }
end.

