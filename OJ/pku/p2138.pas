program p2138;
const maxn=1000;
var s:array[0..maxn] of string;
    flag:array[0..maxn] of boolean;
    a:array[0..maxn,0..maxn] of boolean;
    n,i,j,max,ans:longint;
    ch:char;
function check(a,b:string):boolean;
 var l1,l2,i:longint;
     temp:string;
 begin
     l1:=length(a); l2:=length(b);
     if l1+1<>l2 then exit(false);
     for i:=1 to l2 do begin
         temp:=b;
         delete(temp,i,1);
         if a=temp then exit(true);
     end;
     check:=false;
 end;

procedure dfs(x:longint);
 var i:longint;
 begin
     flag[x]:=false;
     if length(s[x])>max then begin
         max:=length(s[x]);
         ans:=x;
     end;
     for i:=0 to n do
     	if (flag[i]) and (a[x,i]) then dfs(i);
 end;

begin
    read(n);
    read(ch);
    for i:=0 to n do readln(s[i]);
    fillchar(a,sizeof(a),false);
    for i:=0 to n do
    	for j:=0 to n do
             if check(s[i],s[j]) then a[i,j]:=true;
    fillchar(flag,sizeof(flag),true);
    max:=-1;
    dfs(0);
    writeln(s[ans]);
end.