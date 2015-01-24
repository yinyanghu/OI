program test;
const n=1000;
var i,k,m,p,s:longint;
    a:array[0..n] of longint;
function find:longint;
 begin
     m:=random(n div 2)+1;
     while (a[m]=0) and (m<n) do inc(m);
     if a[m]=0 then begin
         m:=n;
         while a[m]=0 do dec(m);
     end;
     find:=m;
 end;

begin
    assign(output,'bst.in'); rewrite(output);
    randomize;
    fillchar(a,sizeof(a),0);
    writeln(n); s:=0;
    for i:=1 to n do begin
        k:=random(9)+1;
        if (s<20) and (k<>1) then k:=1;
        if (k<>8) and (k<>9) then begin
            if k=1 then begin
                p:=random(n)+1;
		while a[p]<>0 do p:=random(n)+1;
                inc(a[p]);
                inc(s);
            end;
            if k=2 then begin
                p:=find;
                dec(a[p]);
                dec(s);
            end;
            if k=3 then p:=random(n)+1;
            if k=5 then p:=random(s)+1;
            if (k=4) or (k=6) or (k=7) then p:=find;
            writeln(k,' ',p);
        end else writeln(k);
    end;
    close(output);
end.