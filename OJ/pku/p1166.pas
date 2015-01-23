program p1166;
const ad:array[1..9] of string=('ABDE','ABC','BCEF','ADG','BDEFH','CFI','DEGH','GHI','EFHI');
type arr=array[1..9] of longint;
var i:longint;
    a,s:arr;
procedure make(var a:arr; k:longint);
 var t:string;
     m:longint;
 begin
     t:=ad[k];
     while t<>'' do begin
         m:=ord(t[1])-ord('A')+1;
         a[m]:=(a[m]+1) mod 4;
         delete(t,1,1);
     end;
 end;

procedure dfs(p:longint; a:arr);
 var i,j:longint;
     check:boolean;
 begin
     check:=true;
     for i:=1 to 9 do
       if a[i]>0 then begin
           check:=false;
           break;
       end;
     if check then begin
         for i:=1 to 9 do
           for j:=1 to s[i] do write(i,' ');
           halt;
     end;
     if p>9 then exit;
     dfs(p+1,a);
     for i:=1 to 3 do begin
         s[p]:=i;
         make(a,p);
         dfs(p+1,a)
     end;
     s[p]:=0;
 end;

begin
    for i:=1 to 9 do read(a[i]);
    fillchar(s,sizeof(s),0);
    dfs(1,a);
end.
