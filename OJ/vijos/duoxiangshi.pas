program duoxiangshi;
var a:array[1..9] of longint;
    i,k:longint;
begin
    for i:=1 to 9 do read(a[i]);
    k:=0;
    for i:=1 to 8 do if a[i]<>0 then begin
        if k<>0 then
            if ((8-i+1)<>1) then begin
               if (a[i]>0) and (a[i]<>1)  then write('+ ',a[i],'x^',8-i+1,' ');
               if (a[i]<0) and (a[i]<>-1) then write('- ',abs(a[i]),'x^',8-i+1,' ');
               if (a[i]=-1) and (8-i+1<>0) then write('- x^',8-i+1,' ');
               if a[i]=1 then write('+ x^',8-i+1,' ');
            end else begin
                if (a[i]>0) and (a[i]<>1)  then write('+ ',a[i],'x',' ');
                if (a[i]<0) and (a[i]<>-1) then write('- ',abs(a[i]),'x',' ');
                if a[i]=-1  then write('- x',' ');
                if a[i]=1 then write('+ x',' ');
            end;
        if k=0 then begin
            k:=1;
            if ((8-i+1)<>1) then begin
               if a[i]=-1 then write('-x^',8-i+1,' ');
               if a[i]=1 then write('x^',8-i+1,' ');
               if (a[i]<>1) and (a[i]<>-1) then write(a[i],'x^',8-i+1,' ');
            end else begin
                if a[i]=-1 then write('-x',' ');
                if a[i]=1 then write('x',' ');
                if (a[i]<>1) and (a[i]<>-1) then write(a[i],'x',' ');
            end;
        end;
    end;
    if (a[9]<>0)and(k<>0) then
       if a[9]>0 then write('+ ',a[9]) else write('- ',abs(a[9]));
    if k=0 then write(a[9]);
end.