program p231;
const maxn=1000000;
var a:array[1..maxn] of boolean;
    i,j,n,total:longint;
    ok:boolean;
begin
    fillchar(a,sizeof(a),true);
    readln(n); a[1]:=false;
    for i:=2 to n do
       if a[i]=true then begin
           j:=i+i;
           while j<=n do begin
               a[j]:=false;
               j:=j+i;
           end;
       end;
    total:=0;
    for i:=3 to n-2 do
       if a[i] and a[i+2] then inc(total);
    writeln(total);
    if total=0 then halt;
    for i:=3 to n-2 do
       if a[i] and a[i+2] then writeln(2,' ',i);
end.
   { for i:=3 to n do begin
        ok:=true;
        for j:=2 to trunc(sqrt(i)) do
            if (i mod j=0) then begin
                ok:=false;
                break;
            end;
        if ok then a[i]:=true;
    end;}
