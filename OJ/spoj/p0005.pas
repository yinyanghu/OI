program p0005;
var a,s:array[1..1000000] of byte;
    i,j,k,l1,l2,m,n,p,t:longint;
    c:ansistring;
function compare:boolean;
 var i:longint;
 begin
     for i:=l2 downto 1 do
       if a[i]<s[i] then exit(true)
          else if a[i]>s[i] then exit(false);
     compare:=false;
 end;

begin
    readln(t);
    for n:=1 to t do begin
        fillchar(a,sizeof(a),0);
        fillchar(s,sizeof(s),0);
        readln(c);
        l1:=length(c);
        if l1=1 then begin
            writeln(c);
            continue;
        end;
        for i:=1 to l1 do a[i]:=ord(c[l1-i+1])-48;
        l2:=l1;
        for i:=l2 downto l2 div 2+1 do begin
            s[i]:=a[i];
            s[l2-i+1]:=a[i];
        end;
        if odd(l2) then s[l2 div 2+1]:=a[l2 div 2+1];
        if not compare then begin
            p:=l2 div 2+1;
            inc(s[p]);
            k:=p;
            while s[k]=10 do begin
                s[k]:=0;
                inc(s[k+1]);
                inc(k);
                if k>l2 then l2:=k;
            end;
            for i:=1 to l2 div 2 do s[i]:=s[l2-i+1];
        end;
        for i:=l2 downto 1 do write(s[i]);
        writeln;
    end;
end.