program p1039;
var t,i,j,k,n,p,s,num1,num2,total:longint;
    a:array[1..10] of longint;
begin
    readln(t);
    for p:=1 to t do begin
        readln(n);
        for i:=1 to n do read(a[i]);
        if odd(n) then begin
           for i:=1 to n-1 do
             for j:=i+1 to n do
               if a[i]>a[j] then begin
                   k:=a[i]; a[i]:=a[j]; a[j]:=k;
               end;
           if a[1]=0 then begin
               k:=a[1]; a[1]:=a[2]; a[2]:=k;
           end;
           k:=n div 2+1;
           num1:=0;
           for i:=1 to k do num1:=num1*10+a[i];
           k:=n div 2;
           num2:=0;
           for i:=n downto n-k+1 do num2:=num2*10+a[i];
           if num1>num2 then total:=num1-num2 else total:=num2-num1;
        end else begin
            total:=maxlongint;
            for i:=1 to n-1 do
             for j:=i+1 to n do
               if a[i]>a[j] then begin
                   k:=a[i]; a[i]:=a[j]; a[j]:=k;
               end;
            for i:=1 to n do begin
                if (a[i]=0) and (n<>2) then continue;
                for j:=i+1 to n do begin
                    num1:=a[j];
                    num2:=a[i];
                    k:=n div 2;
                    t:=0; s:=1;
                    while s<k do begin
                        inc(t);
                        if (t<>i) and (t<>j) then begin
                            num1:=num1*10+a[t];
                            inc(s);
                        end;
                    end;
                    t:=n+1; s:=1;
                    while s<k do begin
                        dec(t);
                        if (t<>i) and (t<>j) then begin
                            num2:=num2*10+a[t];
                            inc(s);
                        end;
                    end;
                    if abs(num1-num2)<total then total:=abs(num1-num2);
                end;
            end;
        end;
        writeln(total);
    end;
end.
