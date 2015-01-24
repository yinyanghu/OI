{
ID:lijianx1
PROG: ride
LANG: PASCAL
}
program test;
var s1,s2:string;
    a,b,i:longint;
begin
    assign(input,'ride.in'); reset(input);
    readln(s1); readln(s2);
    close(input);
    assign(output,'ride.out'); rewrite(output);
    a:=1;
    for i:=1 to length(s1) do a:=a*(ord(s1[i])-64);
    b:=1;
    for i:=1 to length(s2) do b:=b*(ord(s2[i])-64);
    if (a mod 47)=(b mod 47) then writeln('GO') else writeln('STAY');
    close(output);
end.