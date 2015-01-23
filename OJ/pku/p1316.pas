program p1316;
var i:longint;
    a:array[1..10000] of boolean;
procedure creat;
 var i,j,k:longint;
 begin
     fillchar(a,sizeof(a),true);
     a[2]:=false;
     for i:=2 to 10000 do begin
         k:=i; j:=i;
         while j<>0 do begin
             k:=k+j mod 10;
             j:=j div 10;
         end;
         if k<=10000 then a[k]:=false;
     end;
 end;

begin
    creat;
    for i:=1 to 10000 do
      if a[i] then writeln(i);
end.