program jia;
const max=maxint;
var a,b,c:array[0..max] of 0..99;
    n,i,j,k,p, m,k1,h:longint;
    flag:boolean;
begin
  repeat
    readln(n);p:=0;
    for i:=1 to n do begin
      m:=i;
      while  (m mod 10 =0) and (m>=10) do m:=m div 10 ;
      while (m mod 5=0) and (m>=5 ) do begin
         m:=m div 5;h:=i;  flag:=true;
         while  (h>=2) and  (flag) do begin
             if a[h-1] mod 2=0 then begin
                  a[h-1]:=a[h-1] div 2;
                  flag:=false;
             end
             else dec(h);
         end;
      end;
      a[i]:=m mod 100;if a[i]=1 then a[i]:=0;
    end;
    repeat
      j:=1;i:=1; k1:=1;p:=0;
      for k:=1 to n do begin
          if a[k]<>0 then begin c[k1]:=a[k];inc(k1); end
          else inc(p);
      end;
      n:=n-p;
      for k:=1 to n do a[k]:=c[k];
      while (i<n) do begin
        if (a[i]=0) then begin inc(i);dec(n); continue; end;
        b[j]:=a[i]*a[i+1] mod 10;
        if b[j] mod 10<>0 then inc(j);
        inc(i,2);
      end;
      if n mod 2<>0 then begin b[j]:=a[n];n:=n div 2+1; end
                  else n:=n div 2;
      for i:=1 to n do a[i]:=b[i];
    until n=1;
    writeln(b[1]);
  until eof();
end.
