program p1207;
var a:array[1..10000] of longint;
    x,y,i,j,k,max:longint;
begin
    fillchar(a,sizeof(a),0);
    for j:=1 to 10000 do begin
        i:=j;
        while (i<>1) do begin
            if i mod 2<>0 then i:=i*3+1
              else i:=i div 2;
            inc(a[j]);
        end;
        inc(a[j]);
    end;
    while not eof do begin
        readln(x,y);
        write(x,' ',y,' ');
        if x>y then begin
            k:=x; x:=y; y:=k;
        end;
        max:=0;
        for i:=x to y do
          if a[i]>max then max:=a[i];
        writeln(max);
    end;
end.