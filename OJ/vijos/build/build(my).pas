program build;
type hp=array[1..1000] of integer;
var
    m,i,j,k:longint;
    a:array[1..500,1..2] of integer;
    ans:hp;
    s:array[0..9] of longint;
    c:char;
    p:string;

procedure ok(a:hp; long:longint; var x:hp);
 var i,k:integer;
     s:longint;
 begin
     fillchar(x,sizeof(x),0);
     k:=0;
     for i:=1 to 1000 do begin
         s:=a[i]*long+k;
         x[i]:=s mod 10;
         k:=s div 10;
     end;
 end;

begin
    assign(input,'build.in'); reset(input);
    assign(output,'build.out'); rewrite(output);
    readln(p);
    readln(m);
    for i:=1 to m do read(a[i,1],a[i,2]);
    for i:=0 to 9 do s[i]:=1;
    for i:=1 to m do begin
       c:=chr(a[i,1]+48);
       if (pos(c,p)<>0) then
           s[a[i,1]]:=s[a[i,1]]+1;
    end;
    for i:=0 to m do
      for j:=i+1 to m do
        if a[i,2]=a[j,1] then inc(s[i]);
    fillchar(ans,sizeof(ans),0);
    ans[1]:=1;
    for i:=0 to 9 do if s[i]<>1 then ok(ans,s[i],ans);
    k:=1000;
    while ans[k]=0 do dec(k);
    for i:=k downto 1 do write(ans[i]);
    close(input);
    close(output);
end.
