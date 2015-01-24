program position;
type sset=set of 1..6;
var a:array[1..6] of 1..6;
    d:array[1..6] of sset;
    i:integer;
procedure print;
 var i:integer;
 begin
     if not ((a[3] in [2,3,4])=(a[4] in [2,3,4])) then begin
         write('Number  :'); for i:=1 to 6 do write(i:8); writeln;
         write('Position:'); for i:=1 to 6 do write(a[i]:8); writeln;
     end;
 end;

procedure try(i:integer;s:sset);
 var j,k:integer;
 begin
     for j:=1 to 6 do
         if (j in d[i]) and not (j in s) then begin
             a[i]:=j;
             if (i<6) then try(i+1,s+[j])
                else print;
         end;
 end;

begin
    for i:=1 to 6 do d[i]:=[1..6]-[i];
    d[1]:=d[1]-[1,5,6];
    d[6]:=d[6]-[1,5,6];
    d[2]:=d[2]-[2,5];
    d[3]:=d[3]-[2,5];
    d[5]:=d[5]-[3,6];
    d[6]:=d[6]-[3,6];
    try(1,[]);
end.