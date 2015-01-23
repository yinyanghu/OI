program fama;
const l:array[1..6] of integer=(1,2,3,5,10,20);
var a:array[1..6] of integer;
    ok:array[0..1000] of boolean;
    total,i:longint;
procedure try(k,sum:integer);
 var i,j,p,s:integer;
 begin
     for i:=k to 6 do
       for j:=0 to a[i] do begin
           s:=sum+j*l[i];
           ok[s]:=true;
           if i+1<=6 then try(i+1,s);
       end;
 end;
begin
    assign(input,'fama.in'); reset(input);
    assign(output,'fama.out'); rewrite(output);
    fillchar(ok,sizeof(ok),false);
    fillchar(a,sizeof(a),0);
    for i:=1 to 6 do read(a[i]);
    try(1,0);
    total:=0;
    for i:=1 to 1000 do if ok[i] then inc(total);
    writeln('Total=',total);
    close(input);
    close(output);
end.
