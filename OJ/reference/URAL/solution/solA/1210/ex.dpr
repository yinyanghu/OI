program Ural_1210(Input, Output);
const
    MaxM = 30;
type
    TIndex = Byte;
    TData = Longint;
    TDp = array[0..1, 1..MaxM] of TData;
var
    N, M: TIndex;
    F: TDp;

procedure Main;
var
    i, j, T: TIndex;
    Min, W: TData;
    tmp: string;
begin
    FillChar(F, SizeOf(F), 0);
    Readln(N);
    for i := 1 to N do
    begin
        Readln(M);
        for j := 1 to M do
        begin
            Min := MaxLongint;
            while true do
            begin
                Read(T);
                if T = 0 then
                    Break;
                Read(W);
                if F[0, T] + W < Min then
                    Min := F[0, T] + W;
            end;
            Readln;
            F[1, j] := Min;
        end;
        F[0] := F[1];
        if i <> N then
            Readln(tmp);
    end;
    Min := MaxLongint;
    for i := 1 to M do
        if F[1, i] < Min then
            Min := F[1, i];
    Writeln(Min);
end;
begin
    {assign(input, 'i.txt');
    reset(input);
    assign(output, 'o.txt');
    rewrite(output);   }
    Main;
 {   close(input);
    close(output);         }
end.

