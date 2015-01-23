program p1050;
const maxn=100;
type node=array[1..maxn] of longint;
var a:array[1..maxn,1..maxn] of longint;
    temp:node;
    i,j,n,k,max,ans:longint;
function maxsum(s:node):longint;
 var i,k,max:longint;
 begin
     k:=0; max:=0;
     for i:=1 to n do begin
         if k>0 then k:=k+s[i] else k:=s[i];
         if k>max then max:=k;
     end;
     maxsum:=max;
 end;

begin
    readln(n);
    ans:=0;
    for i:=1 to n do
        for j:=1 to n do read(a[i,j]);
    for i:=1 to n do begin
        fillchar(temp,sizeof(temp),0);
        for j:=i to n do begin
            for k:=1 to n do temp[k]:=temp[k]+a[j,k];
            max:=maxsum(temp);
            if max>ans then ans:=max;
        end;
    end;
    writeln(ans);
end.