program p0042;
var a,b,c:array[1..10] of longint;
    i,j,k,n,l,t,x,y:longint;
    s1,s2,s:string;
begin
    readln(n);
    for t:=1 to n do begin
        readln(s);
        fillchar(a,sizeof(a),0);
        fillchar(b,sizeof(b),0);
        fillchar(c,sizeof(c),0);
        s1:=copy(s,1,pos(' ',s)-1);
        s2:=copy(s,pos(' ',s)+1,length(s)-pos(' ',s));
        for i:=1 to length(s1) do a[i]:=ord(s1[i])-48;
        for i:=1 to length(s2) do b[i]:=ord(s2[i])-48;
        if length(s1)>length(s2) then l:=length(s1)+1
           else l:=length(s2)+1;
        k:=0;
        for i:=1 to l do begin
            c[i]:=a[i]+b[i]+k;
            k:=c[i] div 10;
            c[i]:=c[i] mod 10;
        end;
        x:=1; y:=10;
        while c[x]=0 do inc(x);
        while c[y]=0 do dec(y);
        for i:=x to y do write(c[i]);
        writeln;
    end;
end.
