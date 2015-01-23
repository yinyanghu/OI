program p0054;
type arr=array[1..150] of longint;
var a,b,x,y,c:arr;
    i,j,k,m,n,l1,l2,l,t:longint;
    s:string;
procedure minus(a,b:arr; var c:arr);
 var i,k:longint;
 begin
     fillchar(c,sizeof(c),0);
     k:=0;
     for i:=1 to 150 do begin
         k:=a[i]-b[i]+k+10;
         c[i]:=k mod 10;
         k:=k div 10-1;
     end;
 end;

procedure divide(a:arr; var c:arr);
 var i,k:longint;
 begin
     k:=0;
     fillchar(c,sizeof(c),0);
     for i:=150 downto 1 do begin
         k:=k*10+a[i];
         c[i]:=k div 2;
         k:=k mod 2;
     end;
 end;

begin
    for t:=1 to 10 do begin
        fillchar(a,sizeof(a),0);
        fillchar(b,sizeof(b),0);
        fillchar(c,sizeof(c),0);
        fillchar(x,sizeof(x),0);
        fillchar(y,sizeof(y),0);
        readln(s);
        l1:=length(s);
        for i:=1 to l1 do a[i]:=ord(s[l1-i+1])-48;
        readln(s);
        l2:=length(s);
        for i:=1 to l2 do b[i]:=ord(s[l2-i+1])-48;
        minus(a,b,c);
        divide(c,y);
        minus(a,y,x);
        k:=150;
        while x[k]=0 do dec(k);
        for i:=k downto 1 do write(x[i]);
        writeln;
        k:=150;
        while y[k]=0 do dec(k);
        for i:=k downto 1 do write(y[i]);
        writeln;
    end;
end.
