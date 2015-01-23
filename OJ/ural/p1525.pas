program p1525;
var n,m,k,w,h,l,i,p,x,y:longint;
    total:int64;
    s:string;

begin
    readln(n,m,k);
    readln(s);
    p:=length(s);
    x:=1; y:=n;
    for i:=1 to p do begin
        if (s[i]='l') then begin
            if x-1>=1 then dec(x);
            if y-1>=1 then dec(y);
        end;
        if (s[i]='r') then begin
            if x+1<=n then inc(x);
            if y+1<=n then inc(y);
        end;
    end;
    w:=n-(x-1)-(n-y);

    x:=1; y:=m;
    for i:=1 to p do begin
        if (s[i]='d') then begin
            if x-1>=1 then dec(x);
            if y-1>=1 then dec(y);
        end;
        if (s[i]='u') then begin
            if x+1<=m then inc(x);
            if y+1<=m then inc(y);
        end;
    end;
    h:=m-(x-1)-(m-y);

    x:=1; y:=k;
    for i:=1 to p do begin
        if (s[i]='b') then begin
            if x-1>=1 then dec(x);
            if y-1>=1 then dec(y);
        end;
        if (s[i]='f') then begin
            if x+1<=k then inc(x);
            if y+1<=k then inc(y);
        end;
    end;
    l:=k-(x-1)-(k-y);
    total:=w;
    total:=total*h;
    total:=total*l;
    writeln(total);
end.
