program pair;
var num,a,c:array[1..500] of longint;
    n,i,j,k,m,p,s:longint;
    ok:boolean;
procedure sort(l,r:longint);
 var i,j,x,y:longint;
 begin
     i:=l; j:=r; x:=a[(l+r) div 2];
     repeat
       while a[i]<x do inc(i);
       while a[j]>x do dec(j);
       if i<=j then begin
           y:=a[i]; a[i]:=a[j]; a[j]:=y;
           inc(i);
           dec(j);
       end;
     until i>j;
     if l<j then sort(l,j);
     if i<r then sort(i,r);
 end;

begin
    assign(input,'pair.in'); reset(input);
    assign(output,'pair.out'); rewrite(output);
    fillchar(a,sizeof(a),0);
    read(n);
    p:=n*(n-1) div 2;
    for i:=1 to p do read(a[i]);
    close(input);
    sort(1,p);
    for i:=1 to 100000 do begin
        fillchar(num,sizeof(num),0);
        fillchar(c,sizeof(c),0);
        num[1]:=i;
        //for j:=1 to p do c[j]:=a[j];
        c:=a;
        for j:=2 to n do begin
            k:=1;
            while c[k]=maxlongint do inc(k);
            num[j]:=c[k]-num[1];
            for m:=1 to j-1 do
               for s:=1 to p do
                 if (num[j]+num[m]=c[s]) then begin
                     c[s]:=maxlongint;
                     break;
                 end;
            ok:=true;
            for m:=1 to p do if c[m]<>maxlongint then begin
                ok:=false;
                break;
            end;
            if (j=n) and (num[n]+num[n-1]=a[p]) and ok then begin
                for m:=1 to n do write(num[m],' ');
                close(output);
                halt;
            end;
        end;
    end;
    writeln('Impossible');
    close(output);
end.
