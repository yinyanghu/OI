program bag;
var v,w,vw,x:array[1..50] of extended;
    a:array[1..50] of integer;
    i,j,n:integer;
    m,s:extended;

procedure sort(n:integer);
 var i,j:integer;
 begin
     for i:=2 to n do begin
         j:=i-1;
         while (j>0) and (vw[a[j]]<vw[i]) do begin
             a[j+1]:=a[j];
             dec(j);
         end;
         a[j+1]:=i;
     end;
 end;

procedure put;
 var i,k:integer;
     m0:real;
 begin
     i:=1;
     m0:=m;
     repeat
        k:=a[i];
        if m0<w[k] then begin
            x[k]:=m0; m0:=0;
        end else begin
            x[k]:=w[k];
            m0:=m0-w[k];
        end;
        inc(i);
     until (i>n) or (m0<=0);
 end;

begin
    readln(m,n);
    for i:=1 to n do read(w[i],v[i]);
    for i:=1 to n do begin
        a[i]:=i;
        vw[i]:=v[i]/w[i];
    end;
    writeln;
    sort(n);
    put;
    for i:=1 to n do write('x(',a[i],')=',x[a[i]]:4:3,' ');
    writeln;
    s:=0;
    for i:=1 to n do s:=s+vw[i]*x[i];
    writeln('s=',s:4:3);
    readln;
end.
