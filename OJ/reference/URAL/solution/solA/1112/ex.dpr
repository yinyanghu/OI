program Ural_1112(Input, Output);
const
    MaxN = 100;
type
    TIndex = Byte;
    TCoordinate = Integer;
    TSegment = record S, E: TCoordinate;
    end;
    TSegments = array[1..MaxN] of TSegment;
    TSet = set of 1..MaxN;
var
    i, j, N, Tot: TIndex;
    S: TSet;
    tmpC: TCoordinate;
    tmpS: TSegment;
    Segments: TSegments;
begin
   { assign(input, 'i.txt');
    reset(input);
    assign(output, 'o.txt');
    rewrite(output);   }
    Readln(N);
    for i := 1 to N do
    begin
        Readln(Segments[i].S, Segments[i].E);
        if Segments[i].S > Segments[i].E then
        begin
            tmpC := Segments[i].S;
            Segments[i].S := Segments[i].E;
            Segments[i].E := tmpC;
        end;
    end;
    for i := 1 to N - 1 do
        for j := i + 1 to N do
            if Segments[j].E < Segments[i].E then
            begin
                tmpS := Segments[i];
                Segments[i] := Segments[j];
                Segments[j] := tmpS;
            end;
    S := [1];
    j := 1;
    Tot := 1;
    for i := 2 to N do
        if Segments[i].S >= Segments[j].E then
        begin
            Inc(Tot);
            S := S + [i];
            j := i;
        end;
    Writeln(Tot);
    for i := 1 to N do
        if i in S then
            Writeln(Segments[i].S, ' ', Segments[i].E);
 {   close(input);
    close(output);      }
end.

