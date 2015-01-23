program p1008;
var min:array[0..30,0..9,0..1000] of longint;
    modn:array[0..100,0..9] of longint;
    a,b,c,d,n,m,k:longint;
    ok:boolean;
begin
    fillchar(min,sizeof(min),10);
    readln(k,m);
    n:=1;
    ok:=false;
    for a:=0 to k-1 do begin
        modn[n,a]:=a mod m;
        min[n,a,a mod m]:=0;
        if (a mod m=0) and (a>0) then begin
            ok:=true;
            d:=a; c:=0;
            break;
        end;
    end;
    while not ok do begin
        inc(n);
        for a:=0 to k-1 do begin
            modn[n,a]:=(modn[n-1,a]*10) mod m;
            for b:=0 to m-1 do begin
                d:=(b-modn[n,a]+m) mod m;
                for c:=0 to k-1 do
                  if min[n-1,c,d]<10 then begin
                      min[n,a,b]:=c;
                      break;
                  end;
                if (b=0) and (a>0) then
                  if min[n,a,0]<10 then begin
                      d:=a;
                      c:=0; ok:=true;
                      break;
                  end;
            end;
            if ok then break;
        end;
    end;
    for a:=n downto 1 do begin
        write(d);
        b:=m-modn[a,d];
        d:=min[a,d,c];
        c:=(b+c) mod m;
    end;
    writeln;
end.