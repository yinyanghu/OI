program change;
var a,b,c:array[1..110] of longint;
    i,l:longint;

procedure init;
 var m:string;
     i,l1,l2:longint;
 begin
     fillchar(a,sizeof(a),0);
     fillchar(b,sizeof(b),0);
     fillchar(c,sizeof(c),0);
     readln(m); l1:=length(m);
     for i:=1 to l1 do a[i]:=ord(m[l1-i+1])-48;
     readln(m); l2:=length(m);
     for i:=1 to l2 do b[i]:=ord(m[l2-i+1])-48;
     if l1<l2 then l:=l2 else l:=l1;
 end;

begin
    init;
    for i:=1 to l+10 do begin
        c[i]:=a[i]+b[i]+c[i];
        if c[i]=2 then begin
           dec(c[i+1]);
           c[i]:=0;
        end else if c[i]=-1 then begin
            c[i]:=1;
            inc(c[i+1]);
        end;
    end;
    l:=l+10;
    while (c[l]=0) and (l>1) do dec(l);
    for i:=l downto 1 do write(c[i]);
end.