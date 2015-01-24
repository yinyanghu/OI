(*
A B C D
this is circle O
   A____B
  (      )
 (        )
(     O    )
D(        )
  (      )C
    -----
Law of cosines : In triangle ABD: AD^2+DB^2=2AD*DB*Cos /_ADB+AB^2
                 In triangle ABC: AC^2+CB^2=2AC*CB*Cos /_ACB+AB^2
/_ADB=/_ACB
=>Get Value AB

Ptolemy: AC*BD=AD*BC+AB*CD
=>Get Value CD

Notice: when 2AD*DB-2AC*CB=0 then C is just D (superposition)
*)
{$N+}
program Ural_1294(Input, Output);
type
    TData = Extended;

procedure Main;
var
    Cos, AD, AC, BD, BC, CD, AB: TData;
begin
    Readln(AD, AC, BD, BC);
    AD := AD * 1000;
    AC := AC * 1000;
    BD := BD * 1000;
    BC := BC * 1000;
    if AC * BC - AD * BD = 0 then //this has a data point
    begin
        Writeln('Impossible.');
        Exit;
    end;
    Cos := ((Sqr(AC) + Sqr(BC)) - (Sqr(AD) + Sqr(BD))) / 2 / (AC * BC - AD * BD);
    if Sqr(AC) + Sqr(BC) - 2 * AC * BC * Cos < 0 then //this has no data point
    begin
        Writeln('Impossible.');
        Exit;
    end;
    AB := Sqrt(Sqr(AC) + Sqr(BC) - 2 * AC * BC * Cos);
    CD := (AC * BD - AD * BC) / AB;
    if CD < 0 then //this has no data point
    begin
        Writeln('Impossible.');
        Exit;
    end;
    Writeln('Distance is ', CD: 0: 0, ' km.');
end;
begin
    {  Assign(Input, 'i.txt');
      Reset(Input);
      Assign(Output, 'o.txt');
      Rewrite(Output);   }
    Main;
    { Close(Input);
     Close(Output);}
end.

