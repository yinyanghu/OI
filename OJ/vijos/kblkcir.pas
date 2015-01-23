program kblkcir;
var a:array[1..500] of int64;
    i,k,m,n:longint;
    max,min,p:int64;
    ok:boolean;
procedure change(n:int64);
 var i,j,k:longint;
     p:array[1..20] of longint;
 begin
     k:=0;
     while n>0 do begin
         inc(k);
         p[k]:=n mod 10;
         n:=n div 10;
     end;
     for i:=1 to k do
       for j:=i+1 to k do
         if p[i]>p[j] then begin
             n:=p[i]; p[i]:=p[j]; p[j]:=n;
         end;
     max:=0; min:=0;
     for i:=1 to k do begin
         max:=max*10; min:=min*10;
         max:=max+p[k-i+1]; min:=min+p[i];
     end;
 end;

begin
    while not eof do begin
        readln(n);
        fillchar(a,sizeof(a),0);
        ok:=false; k:=1; p:=n; a[1]:=n;
        while not ok do begin
            inc(k); change(p);
            p:=max-min; a[k]:=p;
            for i:=1 to k-1 do
              if a[i]=a[k] then begin
                  m:=i; ok:=true;
                  break;
              end;
        end;
        for i:=m to k-1 do write(a[i],' ');
    end;
end.
